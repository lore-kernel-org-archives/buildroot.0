Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 730D2C001B0
	for <buildroot@archiver.kernel.org>; Mon,  3 Jul 2023 21:16:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1409A60F1F;
	Mon,  3 Jul 2023 21:16:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1409A60F1F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9a4zBUDKFW-U; Mon,  3 Jul 2023 21:16:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45F7E60EE5;
	Mon,  3 Jul 2023 21:16:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45F7E60EE5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 15D661BF2C7
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 21:16:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E356D60BE9
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 21:16:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E356D60BE9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yuoZlx_Tp-9d for <buildroot@lists.busybox.net>;
 Mon,  3 Jul 2023 21:16:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E396960BCC
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E396960BCC
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 21:16:03 +0000 (UTC)
Received: from mail.qult.net (unknown [78.193.33.39])
 by smtp6-g21.free.fr (Postfix) with ESMTPS id EA1E078032A
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 23:16:00 +0200 (CEST)
Received: from zenon.in.qult.net ([192.168.64.1])
 by mail.qult.net with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <ignacy.gawedzki@green-communications.fr>)
 id 1qGQts-0005cv-GN; Mon, 03 Jul 2023 23:16:00 +0200
Received: from ig by zenon.in.qult.net with local (Exim 4.96)
 (envelope-from <ignacy.gawedzki@green-communications.fr>)
 id 1qGQtr-0007H6-2W; Mon, 03 Jul 2023 23:15:59 +0200
Date: Mon, 3 Jul 2023 23:15:59 +0200
From: Ignacy =?utf-8?B?R2F3xJlkemtp?= <ignacy.gawedzki@green-communications.fr>
To: buildroot@buildroot.org
Message-ID: <20230703211559.qpoachdrbjt43btk@zenon.in.qult.net>
References: <20230703210915.1a409e96@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230703210915.1a409e96@windsurf>
Subject: [Buildroot] [PATCH v2] package/iproute2: add optional dependency on
 libbpf
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The configure script will automatically detect used pkg-config if
libbpf is available.

Signed-off-by: Ignacy Gaw=EAdzki <ignacy.gawedzki@green-communications.fr>
---
v2: Add --libbpf_force to configure, in order to force libbpf support
    depending on BR2_PACKAGE_LIBBPF.

 package/iproute2/iproute2.mk | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 15af076db9..5f1154287d 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -12,6 +12,7 @@ IPROUTE2_DEPENDENCIES =3D host-bison host-flex host-pkgco=
nf \
 IPROUTE2_LICENSE =3D GPL-2.0+
 IPROUTE2_LICENSE_FILES =3D COPYING
 IPROUTE2_CPE_ID_VENDOR =3D iproute2_project
+IPROUTE2_CONFIGURE_OPTS =3D
 =

 ifeq ($(BR2_PACKAGE_ELFUTILS),y)
 IPROUTE2_DEPENDENCIES +=3D elfutils
@@ -38,8 +39,16 @@ ifeq ($(BR2_PACKAGE_BERKELEYDB_COMPAT185),y)
 IPROUTE2_DEPENDENCIES +=3D berkeleydb
 endif
 =

+ifeq ($(BR2_PACKAGE_LIBBPF),y)
+IPROUTE2_DEPENDENCIES +=3D libbpf
+IPROUTE2_CONFIGURE_OPTS +=3D --libbpf_force on
+else
+IPROUTE2_CONFIGURE_OPTS +=3D --libbpf_force off
+endif
+
 define IPROUTE2_CONFIGURE_CMDS
-	cd $(@D) && $(TARGET_CONFIGURE_OPTS) ./configure
+	cd $(@D) && $(TARGET_CONFIGURE_OPTS) ./configure \
+		$(IPROUTE2_CONFIGURE_OPTS)
 	$(IPROUTE2_DISABLE_IPTABLES)
 endef
 =

-- =

2.39.2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
