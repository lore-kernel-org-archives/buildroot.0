Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35F90CAC5BB
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 20:20:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9ADF616AA;
	Thu, 25 Sep 2025 20:20:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eBhi2B0z3x5D; Thu, 25 Sep 2025 20:20:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B4B70616D3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4B70616D3;
	Thu, 25 Sep 2025 20:20:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5598612D
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:19:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E1E32412B0
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:19:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id skpxzrdam8kH for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 20:19:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 87AB140066
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 87AB140066
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:19:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 84EAE86449; Thu, 25 Sep 2025 20:19:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Sep 2025 22:07:29 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 0a15759d87e23d88ee0d426abcea9e0b76945b59
X-Git-Newrev: 268cdbdf1913d7d7a1ca9d843f896cd741fc7dca
X-Patchwork-Hint: ignore
Message-Id: <20250925201942.84EAE86449@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/zziplib: fix
 deprecated CPE
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=268cdbdf1913d7d7a1ca9d843f896cd741fc7dca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

The CPE 'zziplib_project:zziplib' is deprecated in favour of
'gdraheim:zziplib'.

See https://nvd.nist.gov/products/cpe/detail/FB4124F9-087E-454D-B5D4-642FF08B23A8

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit c9d185e1823ea4a1c1dad761ac56d3bd9859302f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
