Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC2F606A31C
	for <buildroot@archiver.kernel.org>; Wed, 18 Nov 2026 21:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=sxd6plp1
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75037606A3;
	Wed, 18 Nov 2026 21:22:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jzceHF5t22MM; Wed, 18 Nov 2026 21:22:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 59979606CF
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795036924;
	b=pF6Lt8HwrtyGXou/78oMjyaVhhe8nKyvoeXwgv9kqRyyzcHtuFKwYQnCMGz+XulHlJFT
	 DxJP+1hY35b/NtUSbJ5VUUjWA1A7D3fKNpKPMDdNCQomeNJTGegFJKk0j+iB3FnvksByj
	 2J1DkI6Gs74LMGaf/ROjK1NH597Wr8QbBLi1smQkuC7qcOWMuMre50qKcgyC2T8vH7QRG
	 QS5AggnMNtLEnfR+9B4j7iiH1ueKfAZkmkacjiDH3zCRiGC+5ly+x2Z7Ecq1P/BNMzRZB
	 B3TtG5/TmLaaFegylHVThhejvXhqDeJRIWb6lWV/l6LYmtColFDEQITWTlAXSGp/3AQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795036924;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM2-Signature:Message-Instance:X-UI-Sender-Class:Received:To:Cc:
	 Date:Message-ID:X-Mailer:MIME-Version:X-Provags-ID:UI-OutboundReport:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=BYS1wflohzwCSj9GwWo3yWrhWe0NQhV2ivDGsoYMkvY=;
	b=OYU/tbSapYo1b/aK2DTFh6pTcgg76ChYNgR47MXmRFOJMD10yIKqpQ2aWiOw6J6+sw9W
	 ybXgkM6x18MGQj2TroxAiYR7iMIhrK92pk2Bg0afV4V4bABtXXTC4kPCpz/zVdhifXO9w
	 ihIaRcSQkl5ai+KbTAPJjj4sV3RmmyNKJo+kQN55MygiJtQDgp8gthcopWZkXcHdLeIQx
	 7lPn4hrAHoNxSxHM8peXRqnD9rxao2o3vSIOLV5Jtz/LluNO+z1vt9dU+ormamK6gtH97
	 pKSgj7b9YBQPU5BSfp3sGPI3igd8+MC3kGBDcjEgRMeJ32fN+5W55MV1yZHrNg+z9WQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795036924;
	bh=BYS1wflohzwCSj9GwWo3yWrhWe0NQhV2ivDGsoYMkvY=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=sxd6plp1wJ4/uNf9x9VK4fL114mAaJfJx7HPZHCNf/IBz3jremLT06xxZR1LdAXBY
	 m5Ie2JSV3TJLYrR5KdsdlDQGH12b4HVonPWQrtvJ2MudwzQHCNOBqei9RZMzKIjUMT
	 6oeeN5pRtnrA+aMs7Q7SBGtVEDUcfBx6mV9PhFc9HfSy0BHXGfP1uaQw7kc9Yqkujo
	 Gl93moY9vjh1wUBzq83Quu0o0l6auBS8JaAv4PzM7QHw0IWDKth1FbH0L67yrPujBU
	 sgSFDQa7yGPs1K1UZCvmNd7o0Nw6mERcnub0lFnIYS4xMxzNkU//Y8O/T7zklyP8EW
	 LrCE4vkX4vqbw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59979606CF;
	Wed, 18 Nov 2026 21:22:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id F07D561
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 21:22:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D66AC606CF
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 21:22:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iTSEzlN-XfeX for <buildroot@buildroot.org>;
 Wed, 18 Nov 2026 21:22:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 53080606A3
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 53080606A3
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 21:21:59 +0000 (UTC)
DKIM2-Signature: i=1; m=1; t=1795036917; mf=PHBzLnJlcG9ydEBnbXgubmV0Pg==;
 rt=PGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPg==; d=gmx.net;
 s=s31663417:rsa-sha256:V1ylvtB5G7xLgHIBlFK3TWTfBLg+
 DnoeI6JL24aaGLC3AgJ2nSypWJFCEz+pZZkG2nNfwvkJaHnO30NNwHohpC9Ruvwe0c/FRVJ4UeM
 lGmH1frLwI9onWQsjgcUOmUhOURDKzkd4CDahxgPS+urY6e9BAnHC9O+vePnaILiGy5hjJ020u0
 yo8VUuyHy1jeAGlVc+HrQFEmQQzSdmgvcbDCaEVaJ4fTGt05wTampMCMmS1FbPF8/E9oaUs9MPe
 KH9CMLbEMaaFpB+aNFeRRq0wtgsR977dgiz+SxUr7UDGrt3vCT1aftqNC0TlibUsuoRm9k91PB5
 zNh87EDcz/TpAg==;
Message-Instance: m=1; h=sha256: KYgb/C6luyUuvGn4UlpVClEX+biejhy43oyE02Vd+fs=:
 IxvX79I0daT9+duCsWylu+98jaOjbaGH47QbdMvxLMA=, sha512:
 U3KYHLGAmmDQaaQYGtAouWtgyH3Gl10lsVihmc3TuL1ct6peNbCdk+hAC4CDRY8ALBhgjonpFXCSWMMN6f0Tnw==:
 nsPN3UN47+qrJO0tGvnxx1RaTVu/9ZDqB1UyUbAj0fo1kzeJOODZtnryfvCmb0cST0icw87axEYWC54Uo8kh8Q==;
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MDysg-1xJvCC0twy-00HSAn; Wed, 18
 Nov 2026 22:21:56 +0100
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fiona Klute <fiona.klute@gmx.de>, Peter Seiderer <ps.report@gmx.net>
Date: Wed, 18 Nov 2026 22:21:53 +0100
Message-ID: <20261118212153.37218-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:nvjRzXhuKByMrZ9M/GILzZCmLeJuDXfNGJIQm2JeRnN3IndZDcW
 4c2n8qBOmN5qGNEDdKT3IQooyn/1HKt4yUO9EAgF0rC0Ld0UilMoCcoeTMjHyIQmyPW1Ml/
 1PRdIoWq3Q/EvKqbFuZ3GXTS5qSXteav4Y4mxFkQxhNxdk+NisYerdr46V12fg8iIxRtmi1
 UkvNcg3VWlVWGMhYdzIvg==
UI-OutboundReport: notjunk:1;M01:P0:gScYu5rRtKs=;Qjj54TamvOnUj4LSOV3uVJOSubZ
 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
 MxoJEwEkSWqnP+Ejjeg==
Subject: [Buildroot] [PATCH v3] package/eudev: bump version to 3.3.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

- bump version to 3.3.0 (for details see [1] and [2])
- disable new/optional systemd-hwdb (not needed on target/host)
- add '--enable-tpm2' for target and '--disable-tpm2' for host compile
- move group 'clock' from systemd to common udev package as it is now
  although needed by eudev (see [3], [4])

[1] https://github.com/eudev-project/eudev/releases/tag/v3.3.0
[2] https://github.com/eudev-project/eudev/blob/v3.3.0/NEWS.md
[3] https://github.com/eudev-project/eudev/commit/bce05987bfea5cda8060f59159becb7de7353a46
[4] https://github.com/eudev-project/eudev/commit/82956a47e9191f4c1d8a8ceacaeaf1a9d7581847

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
 - disable systemd-hwdb
 - add '--enable-tpm2' for target and '--disable-tpm2' for host compile
   (as suggested by Fiona Klute)
 - add new group 'clock' to common udev package
   (as suggested by Fiona Klute)

Changes v2 -> v3:
 - remove existing group 'clock' from systemd
   (as suggested by Fiona Klute)

Notes:
 - This version bump increases the target install size from 11.8 MB to
   14.0 MB (according to graph-size). See following (uncomplete) list of
   installed file size values:

   eudev-3.2.15                        eudev-3.3.0

   /lib/libudev.so.1.6.4  199K         /lib/libudev.so.1.7.15  339K
   /sbin/udevd            435K         /sbin/udevd             927K
   /usr/bin/udevadm       459K         /usr/bin/udevadm        979K
   /lib/udev/scsi_id      139K         /lib/udev/scsi_id       275K
   /lib/udev/cdrom_id     139K         /lib/udev/cdrom_id      271K
---
 package/eudev/eudev.hash   |  2 +-
 package/eudev/eudev.mk     | 10 +++++++---
 package/systemd/systemd.mk |  2 --
 package/udev/udev.mk       |  1 +
 4 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/package/eudev/eudev.hash b/package/eudev/eudev.hash
index 0e24957621..58aa19b695 100644
--- a/package/eudev/eudev.hash
+++ b/package/eudev/eudev.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  eb69809fc0d1187f2463ab2149c53aa9f42a78e59f14ebea68eae6cb6b4fc1c3  eudev-3.2.15.tar.gz
+sha256  8fba6e4f49ea4b1938828a3c2e7cc48874816c68621386e527076b6477f5d6ef  eudev-3.3.0.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index 0deb0e53c6..94634f4405 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EUDEV_VERSION = 3.2.15
+EUDEV_VERSION = 3.3.0
 EUDEV_SITE = https://github.com/eudev-project/eudev/releases/download/v$(EUDEV_VERSION)
 EUDEV_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
 EUDEV_LICENSE_FILES = COPYING
@@ -14,7 +14,9 @@ EUDEV_CONF_OPTS = \
 	--disable-manpages \
 	--libexecdir=/lib \
 	--enable-kmod \
-	--enable-blkid
+	--enable-blkid \
+	--disable-systemd-hwdb \
+	--enable-tpm2
 
 # eudev requires only the util-linux libraries at build time
 EUDEV_DEPENDENCIES = host-gperf host-pkgconf util-linux-libs
@@ -79,7 +81,9 @@ HOST_EUDEV_CONF_OPTS = \
 	--disable-manpages \
 	--disable-rule-generator \
 	--disable-selinux \
-	--enable-hwdb
+	--enable-hwdb \
+	--disable-systemd-hwdb \
+	--disable-tpm2
 
 define HOST_EUDEV_INSTALL_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/src/udev/udevadm \
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index f5fa0920ef..937c419227 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -703,8 +703,6 @@ define SYSTEMD_PERMISSIONS
 endef
 
 define SYSTEMD_USERS
-	# udev user groups
-	- - clock -1 * - - - PTP and RTC device group
 	# systemd user groups
 	- - systemd-journal -1 * - - - Journal
 	$(SYSTEMD_REMOTE_USER)
diff --git a/package/udev/udev.mk b/package/udev/udev.mk
index 3518e874a5..507c1b8022 100644
--- a/package/udev/udev.mk
+++ b/package/udev/udev.mk
@@ -6,6 +6,7 @@
 
 # Required by default rules
 define UDEV_USERS
+	- - clock -1 * - - - RTC/PTP device group
 	- - input -1 * - - - Input device group
 	- - kvm -1 * - - - kvm nodes
 	- - render -1 * - - - DRI rendering nodes
-- 
2.56.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
