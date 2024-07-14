Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5967C3DA42
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 15:08:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CC2B607D8;
	Sun, 14 Jul 2024 15:08:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ljcL5OZJLE2J; Sun, 14 Jul 2024 15:08:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40FFB60801
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40FFB60801;
	Sun, 14 Jul 2024 15:08:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 11C261BF954
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 15:07:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F2D7881240
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 15:07:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W8ucmr_gYw8J for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 15:07:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F884811D6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0F884811D6
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 15:07:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EDA258681A; Sun, 14 Jul 2024 15:07:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Jul 2024 17:06:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 34b8cb403314e91d83a74f4a6af9b0f8cde25345
X-Git-Newrev: e5e2dd5f1ca0a7d65486ad03aaa3b40087170950
X-Patchwork-Hint: ignore
Message-Id: <20240714150756.EDA258681A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cloudflared: set
 CLOUDFLARED_CPE_ID_VENDOR
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e5e2dd5f1ca0a7d65486ad03aaa3b40087170950
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:cloudflare:cloudflared is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/detail/83298F83-C1E0-4BAC-8FFC-90FDEDFD95D8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cloudflared/cloudflared.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/cloudflared/cloudflared.mk b/package/cloudflared/cloudflared.mk
index 1796972be6..a243686441 100644
--- a/package/cloudflared/cloudflared.mk
+++ b/package/cloudflared/cloudflared.mk
@@ -8,6 +8,7 @@ CLOUDFLARED_VERSION = 2024.6.1
 CLOUDFLARED_SITE = $(call github,cloudflare,cloudflared,$(CLOUDFLARED_VERSION))
 CLOUDFLARED_LICENSE = Apache-2.0
 CLOUDFLARED_LICENSE_FILES = LICENSE
+CLOUDFLARED_CPE_ID_VENDOR = cloudflare
 CLOUDFLARED_BUILD_TARGETS = cmd/cloudflared
 CLOUDFLARED_LDFLAGS = -X main.Version=$(CLOUDFLARED_VERSION)
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
