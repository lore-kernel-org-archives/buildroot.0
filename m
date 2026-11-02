Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E757606A934
	for <buildroot@archiver.kernel.org>; Mon,  2 Nov 2026 14:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ZkWpwGbe
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1497680F65;
	Mon,  2 Nov 2026 14:24:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iloE5vBAPa6a; Mon,  2 Nov 2026 14:24:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org BD01280F4D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793629493;
	b=fO07HJWs3WebEPpsBg0M6DQtkrbH3Y+8YY6gYJQ2xQAPJq3y4w2VkiM6nqbWMy75mucp
	 PQga66yUjemjZX/DaRz31jpebRZZuAVVLD0Wz09H58VmHW4Irek4gV2sR16zwFKeLOAr2
	 uel77sqF1vpE+ENUdx+LQcF5z7Mi3+oxSHyubHONgcBeKQ3/JC/lWsltudhI0+uWdFXz+
	 b6qYhDDv0KD0AzHv9uVmCuLa6hNM7MNvw2s3dVTpxM8LYUK+r79BDaXRxrVqjcxnVEpvM
	 SCst5WyRA8UxzSE5/YBewBfg89Ho/rX6TXuwoxUA1cdyxeTVmCzoShTlyjP0V7kwyqQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793629493;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=p6CTtCUBjlDrCmWUX5unzlCB8LF27eg3WuDv4ZOwmE4=;
	b=iFE0J3v7wuZmNlQFEc5kUHmSeaxNc2+AlVszO+9PLYqxjpZXsn2npXW+Tn21kRnQvufn
	 lDy1oVdjtftz9WrCzzAIx+jWDaoU3uBnRbpxd9c6owXW7U/XZUkBPRuD2YRPVkyoNnhJL
	 Vw9Z8pvIAa1toVtNxsIQa1EBrGSVGId0TaAchNJWsZujHIihIXh8W62b5wq6qY8CaWhhs
	 UcOZfwP4ThYGfy7lmSKfhyiZ3mp0CFOYq2aW4IqPDJ4i1ahcIWE8dvgdCsdJwmLOJA5Hl
	 f3wkl1hcr/4EXvI6hZMzxqe9xBwZSYha8MA1QcZBdrWivN5tw8W3xOPawudgMbA27kA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793629493;
	bh=p6CTtCUBjlDrCmWUX5unzlCB8LF27eg3WuDv4ZOwmE4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZkWpwGbe6IWSjQyTZk2AXEq0s9d18lI6B/5TIwGpEbrocJDTEK7VvQPkhinLdmD8B
	 fV80gdzKBcISlE0MUOQZkQhTGdH1XwEcJBCPR9FK7HmEDSGazjEWv8FfnmYyUdZJ8C
	 21R3DmGpK+2urafHIHjXujgU3VCArDhWyAOYvwwcBBl6RxvRjz6gqnsVmAIxXFWL6k
	 UK8z1j2Vv1uw0KIAONiA44nvpeivytAlo+Mq8t0WsOZ0Y1oW306YQTm18UguisYrHb
	 jD/mX4s2vwZQQwTMhAOC0JhkTFewf+F3VOISiEHzVVIM8skqdOGnbTW1Pi6glWWf0n
	 HeTI5Cz8nQ8pg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD01280F4D;
	Mon,  2 Nov 2026 14:24:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4747D4BC
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 14:24:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 394C780F49
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 14:24:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YzpvP2XmTncs for <buildroot@buildroot.org>;
 Mon,  2 Nov 2026 14:24:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 918B680F28
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793629491;
 b=JqFMuY/z8wQnPUJ5Bd8KPUxJU2S4I/wwELvzT4IeJ5P5XVlAW+fOnddEdr49EGZfmfK0
 7rr1LV2rpqLL+gAIjSCFJ/qIX94VxsbeXMnoicWnhcQ7DDnIZao0JB4au7rX0Yf1Jxjso
 Xxz4KofzQYxpZvYxMznwOQAad4QhVHIqOrZtzkrQpYeSVXgOUD3r/Ks6+7EXWJ6Fh7kif
 Fb3G0DYGT243qZHkeW47Ct8gX+Da+J+g6/LgSeUM1s3Kx7sY4WATyDlZ0t0QuQVB8Oquw
 1x1nUKDwIYIFbULPynJxHODQLgGn+GmSyyoxBgQflnNV5A0Tf5WUdIwsHgJHgBeLE4g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793629491;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=Ic8FLjcuknp9zqy2txp6vPz2ZYTuuGS/kS3/rYGz+BY=;
 b=szY/HqVK0Ln4MGiq146bxFNUvcenfqBJlSieptppXG/KQYwMDBH0A34lMoRFvZ0Q08nZ
 sAYVwCxtnKrkgXoS6+zSKS6tPuTrVXZ5tF/gYFHreG6LXDshLr8mZZPjofzzJfayT8n97
 uFy2S3LvO5UIMrd0vTLZPYPakgQW/8QjUGToXb2DsynLCS5ns/O40NcICxTVFuHSO8CfM
 J1yfkyu2DLwkWD9oivXs37XGPOkyLRvJ5EWEjb1KzDjS9qxBcHAuHuW9u7zULnYSiNOxf
 46Dg+RMkajfyYEL0BB0MJ6AaawNt7DVWFMKpPlNb03ZcfSUAKMxdnqXDEPQ6FFa/RyA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=NfC0p53e; 
 arc=none smtp.remote-ip=212.227.17.20
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 918B680F28
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 14:24:49 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MtwUm-1wVuMd3wOi-00wDdN; Mon, 02
 Nov 2026 15:24:48 +0100
To: buildroot@buildroot.org
Cc: Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>,
 Julien Olivain <ju.o@free.fr>,
 "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
Date: Mon,  2 Nov 2026 15:24:16 +0100
Message-ID: <20261102142418.2544020-4-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261102142418.2544020-1-fiona.klute@gmx.de>
References: <20261102142418.2544020-1-fiona.klute@gmx.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:nDGFUhZUEueRPDOaj7R+sVEtqRHotYwVidZFmSD47SQSSH4bVY2
 dql1FmGKUQRgIIiRoVxtAmxTZDv4L6nKo5Wtrmb9i3woQ/rY0AdUjIzG5m0emH8JLc74JYr
 0dN6Qh9o8cD95UcYDScN2OpUS5EVeVihSd/1kgKxAfL+Ojkzys6Sjcdlolaha93loGjwTBA
 e5r8/8B8vDrOrXfVfvXzQ==
UI-OutboundReport: notjunk:1;M01:P0:G3cIygugw58=;nNH2P81yMfw5zf0TQg1d+2aqRzN
 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
Subject: [Buildroot] [PATCH v2 3/5] package/systemd: bump version to 260.6
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>

Changes relevant for packaging:
* SysV init script support has been removed, remove the associated
  options "sysvinit-path" and "sysvrcnd-path" ("rc-local" was never
  set).
* Support for libidn has been removed, IDN functionality now requires
  libidn2. The Meson option "libidn" is deprecated and has no
  effect. Remove the optional dependency and config option.
* Required versions of various dependencies have been raised. The
  respective Buildroot packages meet the version requirements, but
  external toolchains with very old glibc versions might not work any
  more.
    * cryptsetup 2.0.1/2.3.0 -> 2.4.0
    * elfutils 0.158 -> 0.177 (NEWS is missing the "0.")
    * libblkid 2.24 -> 2.37
    * libseccomp 2.3.1 -> 2.4.0
    * glibc 2.31 -> 2.34
    * libxcrypt or libcrypt from glibc -> libxcrypt 4.4.0 only
    * OpenSSL 1.1.0 -> 3.0.0
    * Python 3.7.0 -> 3.9.0
* Linux kernel version requirements have been updated, too. Set
  BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10 accordingly.
    * baseline 5.4 -> 5.10
    * recommended baseline 5.7 -> 5.14
    * 6.6 for full functionality

New options:
* "libcrypt" enables libxcrypt support
* "compat-sysv-interfaces" does two things:
    * restore runlevel[0-6].target units that were removed in v258
    * enable installation of legacy.conf for tmpfiles
  Buildroot has its own legacy.conf in package/skeleton-init-systemd
  and there was no need to restore runlevel targets, so disable
  unconditionally.
* "default-oci-registry", used only with importd

Please see the upstream NEWS file for other changes [1]. Note that the
new "report" and "mstack" features mentioned in NEWS do not have
feature flags.

Due to increased kernel version requirements "systemctl status"
reports "Tainted: old-kernel" with the pre-built 5.10 kernel in
support/testing/tests/init/test_systemd.py. Adjust the code to accept
that as long as it is the only taint flag.

Hash of LICENSES/README.md changed due to removal of a SysV-related
script [2].

[1] https://github.com/systemd/systemd/blob/v260.6/NEWS
[2] https://github.com/systemd/systemd/commit/986fee6217051ce1ffdb53de45fdf9d7bae611ce

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
---
v1 -> v2:
* fix hash of LICENSES/README.md

 package/systemd/Config.in                  |  2 +-
 package/systemd/systemd.hash               |  4 ++--
 package/systemd/systemd.mk                 | 22 ++++++++++------------
 support/testing/tests/init/test_systemd.py |  8 ++++++--
 system/Config.in                           | 10 +++++-----
 5 files changed, 24 insertions(+), 22 deletions(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 6b1298069a..7f3958aed8 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -21,7 +21,7 @@ menuconfig BR2_PACKAGE_SYSTEMD
 	depends on !BR2_STATIC_LIBS # kmod
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_TOOLCHAIN_HAS_SSP
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8
 	depends on BR2_HOST_GCC_AT_LEAST_8 # host-systemd
 	select BR2_ROOTFS_MERGED_USR
diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
index 7164af23e5..91ad68017b 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,5 +1,5 @@
 # sha256 locally computed
-sha256  f9a3f1e21e4dd78717bad0888638954467a55d73cab44a2c7a75c5bed47ef814  systemd-259.10.tar.gz
+sha256  46f00bb99c02e295cfda58b2fe9c7eac67a06d2ea5895aa80580c718ca3da71d  systemd-260.6.tar.gz
 sha256  ac4985facb553559981f507982444d779115e3e3a4c8b7847ae956198490c1b3  LICENSE.GPL2
 sha256  6d9bb3b7fc818a8facc4cc296060a0883fef8710d6498f86165335846e82ee9d  LICENSE.LGPL2.1
 sha256  c9e7bf5b7c243c719b8b43c36158effb9b54c5e80abc9d82e4b2d4b2a4aa64ad  LICENSES/alg-sha1-public-domain.txt
@@ -13,4 +13,4 @@ sha256  8a6fc0879cecc0b96bf4c08159b9d733bf0f15fcf32879aec98c4ffd05424554  LICENS
 sha256  b85dcd3e453d05982552c52b5fc9e0bdd6d23c6f8e844b984a88af32570b0cc0  LICENSES/MIT.txt
 sha256  2a98749f6bec00dfaed86fa9c1edea871aaae4f11ee4d100b671aaf4ce353a73  LICENSES/murmurhash2-public-domain.txt
 sha256  1a7adaa2c86cedfd6c7f5c0c7c72fd6d3e02cd0c9593f21fdb53c89bb2b130ec  LICENSES/OFL-1.1.txt
-sha256  bce1d2e9bad517b493168b37604c5d02a7fb638b4d1b9fc730adafa06c603456  LICENSES/README.md
+sha256  769cad6e4cf7548fe86ccd11f16a922aaacaeaaf885af15d13bf0d6946f58cf9  LICENSES/README.md
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 5787decec8..7e95e098ff 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -19,7 +19,7 @@
 # - Diff sysusers.d with the previous version
 # - Diff factory/etc/nsswitch.conf with the previous version
 #   (details are often sprinkled around in README and manpages)
-SYSTEMD_VERSION = 259.10
+SYSTEMD_VERSION = 260.6
 SYSTEMD_SITE = $(call github,systemd,systemd,v$(SYSTEMD_VERSION))
 SYSTEMD_LICENSE = \
 	LGPL-2.1+, \
@@ -66,6 +66,7 @@ SYSTEMD_PROVIDES = libudev udev
 SYSTEMD_CONF_OPTS = \
 	-Dagetty-path=/usr/bin/agetty \
 	-Dbpf-framework=disabled \
+	-Dcompat-sysv-interfaces=false \
 	-Dcreate-log-dirs=false \
 	-Ddbus-interfaces-dir=no \
 	-Ddbus=disabled \
@@ -83,6 +84,7 @@ SYSTEMD_CONF_OPTS = \
 	-Dkmod-path=/usr/bin/kmod \
 	-Dldconfig=false \
 	-Dlibc=glibc \
+	-Dlibcrypt=enabled \
 	-Dlibfido2=disabled \
 	-Dlibmount=enabled \
 	-Dlink-boot-shared=true \
@@ -104,8 +106,6 @@ SYSTEMD_CONF_OPTS = \
 	-Dsystem-gid-max=999 \
 	-Dsystem-uid-max=999 \
 	-Dsysupdated=disabled \
-	-Dsysvinit-path= \
-	-Dsysvrcnd-path= \
 	-Dtests=false \
 	-Dtmpfiles=true \
 	-Dukify=disabled \
@@ -178,15 +178,11 @@ else
 SYSTEMD_CONF_OPTS += -Delfutils=disabled
 endif
 
-# Both options can't be selected at the same time so prefer libidn2
 ifeq ($(BR2_PACKAGE_LIBIDN2),y)
 SYSTEMD_DEPENDENCIES += libidn2
-SYSTEMD_CONF_OPTS += -Dlibidn2=enabled -Dlibidn=disabled
-else ifeq ($(BR2_PACKAGE_LIBIDN),y)
-SYSTEMD_DEPENDENCIES += libidn
-SYSTEMD_CONF_OPTS += -Dlibidn=enabled -Dlibidn2=disabled
+SYSTEMD_CONF_OPTS += -Dlibidn2=enabled
 else
-SYSTEMD_CONF_OPTS += -Dlibidn=disabled -Dlibidn2=disabled
+SYSTEMD_CONF_OPTS += -Dlibidn2=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
@@ -445,7 +441,9 @@ SYSTEMD_CONF_OPTS += -Dmachined=false -Dnss-mymachines=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_IMPORTD),y)
-SYSTEMD_CONF_OPTS += -Dimportd=enabled
+SYSTEMD_CONF_OPTS += \
+	-Dimportd=enabled \
+	-Ddefault-oci-registry=docker.io
 else
 SYSTEMD_CONF_OPTS += -Dimportd=disabled
 endif
@@ -905,6 +903,7 @@ HOST_SYSTEMD_CONF_OPTS = \
 	-Dbootloader=disabled \
 	-Dbpf-framework=disabled \
 	-Dbzip2=disabled \
+	-Dcompat-sysv-interfaces=false \
 	-Dcoredump=false \
 	-Dcreate-log-dirs=false \
 	-Dcreate-log-dirs=false \
@@ -935,12 +934,12 @@ HOST_SYSTEMD_CONF_OPTS = \
 	-Dldconfig=false \
 	-Dlibarchive=disabled \
 	-Dlibc=glibc \
+	-Dlibcrypt=enabled \
 	-Dlibcryptsetup-plugins=disabled \
 	-Dlibcryptsetup=disabled \
 	-Dlibcurl=disabled \
 	-Dlibfido2=disabled \
 	-Dlibidn2=disabled \
-	-Dlibidn=disabled \
 	-Dlibmount=enabled \
 	-Dlocaled=false \
 	-Dlog-message-verification=disabled \
@@ -983,7 +982,6 @@ HOST_SYSTEMD_CONF_OPTS = \
 	-Dsysupdate=disabled \
 	-Dsysupdated=disabled \
 	-Dsysusers=false \
-	-Dsysvinit-path='' \
 	-Dtests=false \
 	-Dtimedated=false \
 	-Dtimesyncd=false \
diff --git a/support/testing/tests/init/test_systemd.py b/support/testing/tests/init/test_systemd.py
index 60b9c3d032..1112d5e269 100644
--- a/support/testing/tests/init/test_systemd.py
+++ b/support/testing/tests/init/test_systemd.py
@@ -32,7 +32,7 @@ class InitSystemSystemdBase(InitSystemBase):
         self.check_init("/lib/systemd/systemd")
 
         # Test there is no tainted flag.
-        output, ret = self.emulator.run("systemctl --no-pager status")
+        output, ret = self.emulator.run("NO_COLOR=1 systemctl --no-pager status")
         self.assertEqual(ret, 0, f"'systemctl status' failed with exit code {ret}, with:\n{output}")
         try:
             # 'support-ended' tainted flag is only set based on the
@@ -45,7 +45,11 @@ class InitSystemSystemdBase(InitSystemBase):
                 for line in output
                 if line.strip().startswith("Tainted: ")
             ][0]
-            raise RuntimeError(f"Tainted flags: {tainted_flags}")
+            # The prebuilt kernel is version 5.10, which is the lower
+            # bound for systemd support as of v260. Ignore
+            # "old-kernel" taint as long as it is the only flag.
+            if tainted_flags != "old-kernel":
+                raise RuntimeError(f"Tainted flags: {tainted_flags}")
         except IndexError:
             # No tainted flag \o/
             pass
diff --git a/system/Config.in b/system/Config.in
index f4788cd72e..8d80d04d97 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -123,24 +123,24 @@ config BR2_INIT_SYSTEMD
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_TOOLCHAIN_HAS_SSP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8
 	depends on BR2_HOST_GCC_AT_LEAST_8
 	select BR2_PACKAGE_SYSTEMD
 	select BR2_PACKAGE_SKELETON_INIT_SYSTEMD if BR2_ROOTFS_SKELETON_DEFAULT
 
-comment "systemd needs a glibc toolchain w/ SSP, headers >= 5.4, host and target gcc >= 8"
+comment "systemd needs a glibc toolchain w/ SSP, headers >= 5.10, host and target gcc >= 8"
 	depends on BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_USES_GLIBC || \
 		!BR2_TOOLCHAIN_HAS_SSP || \
-		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4 || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10 || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_8 || \
 		!BR2_HOST_GCC_AT_LEAST_8
 
-comment "systemd highly recommends Linux >= 5.7"
+comment "systemd highly recommends Linux >= 5.14"
 	depends on BR2_INIT_SYSTEMD
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_7
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_14
 
 comment "Special purpose (read help)"
 
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
