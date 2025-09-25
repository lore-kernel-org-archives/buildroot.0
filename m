Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E55E4CAC5B9
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 20:20:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B511B61652;
	Thu, 25 Sep 2025 20:20:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WERAHfOjxbQn; Thu, 25 Sep 2025 20:20:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0AF1361646
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0AF1361646;
	Thu, 25 Sep 2025 20:20:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D8FC1EB
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:19:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA57E41505
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:19:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zCTnFYMb2r2Y for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 20:19:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 354DA41525
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 354DA41525
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:19:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 337B986418; Thu, 25 Sep 2025 20:19:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Sep 2025 22:07:21 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 0e4a951c67ca15cfbadb810f4bac97d97317aa06
X-Git-Newrev: e14ecaf42d190970be2cfa8c5a4385babe3cacf7
X-Patchwork-Hint: ignore
Message-Id: <20250925201942.337B986418@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/pango: fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=e14ecaf42d190970be2cfa8c5a4385babe3cacf7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

The CPE 'pango:pango' has been deprecated in favour of 'gnome:pango'.

See https://nvd.nist.gov/products/cpe/detail/19B77822-6C34-41C8-8160-367D56AD1569

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 6c5f1b6414ecf6fa77472f5f657d5ddcea419168)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/pango/pango.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index df82b456fb..11c049c746 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -11,7 +11,7 @@ PANGO_SITE = https://download.gnome.org/sources/pango/$(PANGO_VERSION_MAJOR)
 PANGO_INSTALL_STAGING = YES
 PANGO_LICENSE = LGPL-2.0+
 PANGO_LICENSE_FILES = COPYING
-PANGO_CPE_ID_VENDOR = pango
+PANGO_CPE_ID_VENDOR = gnome
 
 PANGO_CONF_OPTS = -Dfontconfig=enabled
 HOST_PANGO_CONF_OPTS = -Dfontconfig=enabled -Dintrospection=disabled
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
