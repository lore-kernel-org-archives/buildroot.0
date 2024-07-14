Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49B57C3DA42
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 15:08:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08CEC6082C;
	Sun, 14 Jul 2024 15:08:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B3cxTNOsIvUV; Sun, 14 Jul 2024 15:08:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C7EE06074C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7EE06074C;
	Sun, 14 Jul 2024 15:08:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3D61F1BF44A
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 15:08:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 17A92811D4
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 15:07:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mmq-PZuWxZic for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 15:07:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2ECBC8123C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2ECBC8123C
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 15:07:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E271386819; Sun, 14 Jul 2024 15:07:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Jul 2024 17:06:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9c9fb320d09b7533cac1e243cba15f26783dcdf7
X-Git-Newrev: 34b8cb403314e91d83a74f4a6af9b0f8cde25345
X-Patchwork-Hint: ignore
Message-Id: <20240714150756.E271386819@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libavif: add LIBAVIF_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=34b8cb403314e91d83a74f4a6af9b0f8cde25345
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:aomedia:libavif is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/detail/5F25E3BB-870F-4513-96DB-34FF4FCF156C

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libavif/libavif.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libavif/libavif.mk b/package/libavif/libavif.mk
index b87597995a..1ca3add82b 100644
--- a/package/libavif/libavif.mk
+++ b/package/libavif/libavif.mk
@@ -8,6 +8,7 @@ LIBAVIF_VERSION = 1.0.4
 LIBAVIF_SITE = $(call github,AOMediaCodec,libavif,v$(LIBAVIF_VERSION))
 LIBAVIF_LICENSE = BSD-2-Clause, IJG, Apache-2.0
 LIBAVIF_LICENSE_FILES = LICENSE
+LIBAVIF_CPE_ID_VENDOR = aomedia
 LIBAVIF_INSTALL_STAGING = YES
 
 # Only the dav1d decoder is packaged at the moment.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
