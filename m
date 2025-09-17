Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D13FCAC59A
	for <buildroot@archiver.kernel.org>; Wed, 17 Sep 2025 17:33:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 520F6413E1;
	Wed, 17 Sep 2025 17:33:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K7Mg172KIrVz; Wed, 17 Sep 2025 17:33:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 951AF412D8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 951AF412D8;
	Wed, 17 Sep 2025 17:33:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C9A2DAF1
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 17:33:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 36FE4425AE
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 17:33:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4_hjZvkgS7ho for <buildroot@buildroot.org>;
 Wed, 17 Sep 2025 17:33:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA0A042658
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA0A042658
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 17:33:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B7AA2856A9; Wed, 17 Sep 2025 17:33:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 17 Sep 2025 19:32:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 85c71fee3fd30f310f3890db24efd52fc9119f60
X-Git-Newrev: c9d185e1823ea4a1c1dad761ac56d3bd9859302f
X-Patchwork-Hint: ignore
Message-Id: <20250917173332.B7AA2856A9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zziplib: fix deprecated CPE
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c9d185e1823ea4a1c1dad761ac56d3bd9859302f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The CPE 'zziplib_project:zziplib' is deprecated in favour of
'gdraheim:zziplib'.

See https://nvd.nist.gov/products/cpe/detail/FB4124F9-087E-454D-B5D4-642FF08B23A8

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/zziplib/zziplib.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/zziplib/zziplib.mk b/package/zziplib/zziplib.mk
index 0ef53436d2..ba902b84fd 100644
--- a/package/zziplib/zziplib.mk
+++ b/package/zziplib/zziplib.mk
@@ -8,7 +8,7 @@ ZZIPLIB_VERSION = 0.13.74
 ZZIPLIB_SITE = $(call github,gdraheim,zziplib,v$(ZZIPLIB_VERSION))
 ZZIPLIB_LICENSE = LGPL-2.0+ or MPL-1.1
 ZZIPLIB_LICENSE_FILES = docs/COPYING.LIB docs/COPYING.MPL docs/copying.htm.md
-ZZIPLIB_CPE_ID_VALID = YES
+ZZIPLIB_CPE_ID_VENDOR = gdraheim
 ZZIPLIB_INSTALL_STAGING = YES
 ZZIPLIB_CONF_OPTS += \
 	-DZZIPDOCS=OFF \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
