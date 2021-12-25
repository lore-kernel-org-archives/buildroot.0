Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFC4EC433F5
	for <buildroot@archiver.kernel.org>; Sat, 25 Dec 2021 15:06:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 887FD60674;
	Sat, 25 Dec 2021 15:06:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E5z4MeeFUGLR; Sat, 25 Dec 2021 15:06:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6F4D60601;
	Sat, 25 Dec 2021 15:06:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C25531BF32E
 for <buildroot@lists.busybox.net>; Sat, 25 Dec 2021 15:06:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AF2E960601
 for <buildroot@lists.busybox.net>; Sat, 25 Dec 2021 15:06:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9ESJ_vPglUTV for <buildroot@lists.busybox.net>;
 Sat, 25 Dec 2021 15:06:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1674D605A9
 for <buildroot@buildroot.org>; Sat, 25 Dec 2021 15:06:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 4E2EC82AA5; Sat, 25 Dec 2021 15:00:39 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 25 Dec 2021 16:05:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4fa16e51935b7a765228a5fa8667e1cd3237a0af
X-Git-Newrev: 1c4c68b8fbf471919fbbaf4e688a75c4de36a331
X-Patchwork-Hint: ignore
Message-Id: <20211225150039.4E2EC82AA5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/samba4: add optional dependency to
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1c4c68b8fbf471919fbbaf4e688a75c4de36a331
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

icu is used in lib/util/charset/
https://git.samba.org/samba.git/?p=samba.git;a=blob;f=lib/util/charset/wscript_configure;hb=HEAD#l40

libglib2 is used in source3/
https://git.samba.org/samba.git/?p=samba.git;a=blob;f=source3/wscript;hb=HEAD#l1778

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
