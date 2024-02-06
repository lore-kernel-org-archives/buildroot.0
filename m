Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB57EC48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 17:19:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE9AD81E7F;
	Tue,  6 Feb 2024 17:19:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TdA2KpCMOg1z; Tue,  6 Feb 2024 17:19:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DDBE781EF4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDBE781EF4;
	Tue,  6 Feb 2024 17:19:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B561B1BF33B
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 17:19:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9AF6E408BC
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 17:19:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9AF6E408BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LofrKvYpdzPc for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 17:19:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 05FE240B67
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 17:19:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 05FE240B67
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E85F1872E8; Tue,  6 Feb 2024 17:19:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 6 Feb 2024 18:17:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e06febce59f9e9a387e663e79d7f46771eee3de4
X-Git-Newrev: 854ea58174b38f7556fbc4891d7512c2512a8327
X-Patchwork-Hint: ignore
Message-Id: <20240206171938.E85F1872E8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libheif: add jpeg-turbo support
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=854ea58174b38f7556fbc4891d7512c2512a8327
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

jpeg support is not limited to libjpeg

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Antoine Coutant <antoine.coutant@smile.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libheif/libheif.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libheif/libheif.mk b/package/libheif/libheif.mk
index bd307deb7b..908e2ce068 100644
--- a/package/libheif/libheif.mk
+++ b/package/libheif/libheif.mk
@@ -51,9 +51,9 @@ else
 LIBHEIF_CONF_OPTS += -DWITH_LIBDE265=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_LIBJPEG),y)
+ifeq ($(BR2_PACKAGE_JPEG),y)
 LIBHEIF_CONF_OPTS += -DWITH_JPEG_DECODER=ON -DWITH_JPEG_ENCODER=ON
-LIBHEIF_DEPENDENCIES += libjpeg
+LIBHEIF_DEPENDENCIES += jpeg
 else
 LIBHEIF_CONF_OPTS += -DWITH_JPEG_DECODER=OFF -DWITH_JPEG_ENCODER=OFF
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
