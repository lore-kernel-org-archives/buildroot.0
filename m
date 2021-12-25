Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C418C433F5
	for <buildroot@archiver.kernel.org>; Sat, 25 Dec 2021 10:59:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B90F82BEB;
	Sat, 25 Dec 2021 10:59:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qkT0rQgjIKCd; Sat, 25 Dec 2021 10:59:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F1C18176E;
	Sat, 25 Dec 2021 10:59:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8B3601BF239
 for <buildroot@lists.busybox.net>; Sat, 25 Dec 2021 10:59:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 71FD3607A4
 for <buildroot@lists.busybox.net>; Sat, 25 Dec 2021 10:59:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s-DQ5JSE9QbY for <buildroot@lists.busybox.net>;
 Sat, 25 Dec 2021 10:59:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2A42E60745
 for <buildroot@buildroot.org>; Sat, 25 Dec 2021 10:59:00 +0000 (UTC)
Received: from fwd89.dcpf.telekom.de (fwd89.aul.t-online.de [10.223.144.115])
 by mailout08.t-online.de (Postfix) with SMTP id 0EA211859A
 for <buildroot@buildroot.org>; Sat, 25 Dec 2021 11:57:40 +0100 (CET)
Received: from fli4l.lan.fli4l ([91.58.8.125]) by fwd89.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1n14k6-1PCyfJ0; Sat, 25 Dec 2021 11:57:38 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:39260)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1n14k6-0007Uz-De
 for buildroot@buildroot.org; Sat, 25 Dec 2021 11:57:38 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat, 25 Dec 2021 11:57:38 +0100
Message-Id: <20211225105738.4716-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1640429858-0000F5B3-DB5A8F39/0/0 CLEAN NORMAL
X-TOI-MSGID: b04d7f6a-2a0f-4c75-adf4-0ea1372a7ca1
Subject: [Buildroot] [PATCH 1/1] package/samba4: add optional dependency to
 icu & libglib2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

icu is used in lib/util/charset/
https://git.samba.org/samba.git/?p=samba.git;a=blob;f=lib/util/charset/wscript_configure;hb=HEAD#l40

libglib2 is used in source3/
https://git.samba.org/samba.git/?p=samba.git;a=blob;f=source3/wscript;hb=HEAD#l1778

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/samba4/samba4.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 8fa8b53399..14f9302e21 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -17,8 +17,10 @@ SAMBA4_DEPENDENCIES = \
 	host-e2fsprogs host-flex host-heimdal host-nfs-utils \
 	host-perl host-perl-parse-yapp host-python3 \
 	cmocka e2fsprogs gnutls popt zlib \
+	$(if $(BR2_PACKAGE_ICU),icu) \
 	$(if $(BR2_PACKAGE_LIBAIO),libaio) \
 	$(if $(BR2_PACKAGE_LIBCAP),libcap) \
+	$(if $(BR2_PACKAGE_LIBGLIB2),libglib2) \
 	$(if $(BR2_PACKAGE_READLINE),readline) \
 	$(TARGET_NLS_DEPENDENCIES)
 SAMBA4_CFLAGS = $(TARGET_CFLAGS)
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
