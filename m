Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,TVD_SPACE_RATIO autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACCF4C4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 19:35:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6087B60EBC
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 19:35:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6087B60EBC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 27687401E1;
	Sun,  8 Aug 2021 19:35:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K0Ahwi86LR9E; Sun,  8 Aug 2021 19:35:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2B3FE4012D;
	Sun,  8 Aug 2021 19:35:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 85DD31BF3C3
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 19:33:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 74FDF82CC7
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 19:33:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i2xSYduYlwpE for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 19:33:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 58DF282CA3
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 19:33:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 0FE9C8D258; Sun,  8 Aug 2021 19:33:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 8 Aug 2021 21:11:26 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 6a127a9b07807734e803ebd544bc0a3e49122a26
X-Git-Newrev: 5b4698a09490a620d97ef054a3c64b6055fcb3b6
X-Patchwork-Hint: ignore
Message-Id: <20210808193333.0FE9C8D258@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/libqmi: add
 gobject-introspection optional dependency
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=5b4698a09490a620d97ef054a3c64b6055fcb3b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

gobject-introspection is an optional dependency (enabled by default)
since version 1.26.0 and
https://gitlab.freedesktop.org/mobile-broadband/libqmi/-/commit/2aa0badc79595c92981793d18f05c99485156a6b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit af34a67be6ae5d399e6894e7825a30df71365773)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libqmi/libqmi.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
index 6fc6d4a50d..57f070a067 100644
--- a/package/libqmi/libqmi.mk
+++ b/package/libqmi/libqmi.mk
@@ -16,6 +16,13 @@ LIBQMI_DEPENDENCIES = libglib2
 
 LIBQMI_CONF_OPTS = --disable-Werror
 
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+LIBQMI_DEPENDENCIES += gobject-introspection
+LIBQMI_CONF_OPTS += --enable-introspection
+else
+LIBQMI_CONF_OPTS += --disable-introspection
+endif
+
 # if libgudev available, request udev support for a better
 # qmi-firmware-update experience
 ifeq ($(BR2_PACKAGE_LIBGUDEV),y)
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
