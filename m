Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF4E606A31C
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 20:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=qbHIM6b9
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A043D60ABA;
	Fri, 30 Oct 2026 20:06:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wdwj6hjg518m; Fri, 30 Oct 2026 20:06:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D186F60AE6
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793390802;
	b=XdIJDF5DhhsCeM0upeES//xX2olCbB9jKxBKwsJUqY213nrlmQsVtfQ8tFqYhiK8cK87
	 BKFc9qshOU7SEIo+EnoQ0yuoWRgw3/f/Xwdia/Tw5UTosdFg8LKejS54MLfeWP7UnGQeV
	 hpdVQ2CVbBKRc0r3zlpBUsVWMQPEyEfkiZ4okKutXI2ftS90fd3R1rxUjQXkL2UpnNfUI
	 qKiYgr2moqnTppXZSZe+1ud2MOmQExelCxaCNNcwmzRiOXd1jO0eT0yvDr3pccM06Ny2X
	 FSaQiLvKAlttC31mjNfudX9c8qgfnheWVoxG1NbZmXf+WaW7ePhFdToWTGNk/CuzK3Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793390802;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=OiOfxdi4AuB5biZkbMYt/aTeSXsAUNyl3vjfxWxHiPs=;
	b=g0z2v7c0wJAFnWjW7+F4gZZP4K9hGXM0QFNSIry+BmkzTbgLGwklnUe5h2JWj0+nS9ro
	 e/HQ1ZMmmFshfFNn+FwDVA5j2sSUWtTLmo5s3EdXbxRN7wZoHRWVtYpRAi4sTue2lpdip
	 JQPhPJDClSpeFLwvvqAx+2o4jcQkebkxLLLkgv/pvRmvYb1VQXcWP6+naHT1BKvUzF5k+
	 Msm7FFJJVlCWJCnmVHwOARQ8p4QJ1LZS8NNJeQi39mwqaV64Dc1jQSCE+X16Ksq6wHKxA
	 7xo1pqt4t9teBlCv0kfcKHRmrXsBONJAgcRAegabQVS21x7AwkYs3iZAT+/Jl6koqOA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793390802;
	bh=OiOfxdi4AuB5biZkbMYt/aTeSXsAUNyl3vjfxWxHiPs=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qbHIM6b9JqTuef6Dqr7AsRIHt5lhRfXK7bruAFryc/d2bRDCGOR9UiDFWVpWJI9xW
	 yu48DXpdZBBBDrSh4uF4M3EGCB6eVdQBbdLs6EZ9sf4A+vg9ZUPUxF84Vamii5mu8Z
	 eGMxHgKhT2hkePMY3uDQjurVEyr+9dh9B7g2tUwWybsHIRI8yqNJTLsomCKysGCKH5
	 DPtnaWOJN6PMpESwlrtEkLaMe/NVucMEdi6HJ0v3l/n82/IkS1NIbgvXeO5GIRhBhn
	 8w+/sJoqOAb4CgddGpHq1heir8DFIAnMSOAucDdeXgRKYGHaIK292YFcIGpeZKKuKk
	 +Warj1sXEZ5eQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D186F60AE6;
	Fri, 30 Oct 2026 20:06:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C45A4BC
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 20:06:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7DBA281188
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 20:06:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kifh5U-RIa5H for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 20:06:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C81CC81187
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793390795;
 b=WKuqhmUIhY5+La8rpK9e9BbrFnCJgEUXmwF5Tpxy7zEjFS+Pf/CBpp24xVxub47i12XK
 O7XNktSrfTG91zVhDh5BGbS7n4QoxWoAw1+HOqf9WUQ4Cu8VWDyd5uLEPQWGQOD13Bfkm
 fkohRxgkuz+kwGvGAgzBPsNFvbrgUIYjc/zOxXnk4FmFniH4IANNumIHFb0IBnGBYOqEW
 rI3vYEG0+4cJOV2SzSt2MtTw+1SfFqMqniU2Vn83AtJXoVGOplg7z6gVJWx0tHM+TPo3U
 pC9rUx4UhZImNwLzXxe6nqeBGL0Yvoe/wgLo8qw0m+w6E2fb7jB0gjf8TNFfJX+6k5Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793390795;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=ElcREwYV+NiFlEfF+iSXgGuB1sjllr4aXmFzG9oTX8o=;
 b=Tpw3dy6gaPAdcglto+53z5cVMGXFzyoS4dUACczp8691t1an6vJJ7mhP7xjJnSLHhsNz
 9rkOKlAE83iXcpPPNv0I05VwGJqEH0Vl4N21vuwh6QJqcGxdNyuNU5sj+LE9C+6r0dh2x
 sRqWBthkMu9VnoEx6Zbl5mEuyWnAp0QIvWA8JJgBQwBJ/pzmgPzYwfh4IBlskSjYCwz4E
 7whJs1K84xO4Qv1L8YJh8qLg/JfOUGkic7fq4L+4ul3bxC77+qIk3wtvlh1VDEap/tO0y
 MF8oy4okzHGUoGjx0PTmqix8mVIf5tp+CupttQDUXcnY/HUMOqdxEfsvECuNpzaIhfg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=Qouuih3s; 
 arc=none smtp.remote-ip=212.227.15.15
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C81CC81187
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 20:06:32 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MTRR0-1wxThe1lFM-00ToYC; Fri, 30
 Oct 2026 21:06:26 +0100
To: buildroot@buildroot.org
Cc: Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>,
 "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
Date: Fri, 30 Oct 2026 21:05:50 +0100
Message-ID: <20261030200552.779306-4-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261030200552.779306-1-fiona.klute@gmx.de>
References: <20261030200552.779306-1-fiona.klute@gmx.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:vMWpk2EDOFWNBpoX6z15qHdpViDuPXV7qQcVfazfMZ0kKtSWdgh
 ZgT0ABNNocgVET3MSQNU8ALWIdpkUZbqp6JEfxFJqA68tnEQAy63S1cJTNImfkhug4vhZzm
 25+F3w1dApwdbt5Bw8LiZm4rib+KN7wDedfNTat41G4S3teZZzOmgc3R07yJeWGcvvRqxBB
 eD+2HCzEx2GqdhO65Z6Fg==
UI-OutboundReport: notjunk:1;M01:P0:klukbTNlHCY=;q4zHbOLBrxg/uDFEnM8enzmvt8t
 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
Subject: [Buildroot] [PATCH 3/5] package/systemd: bump version to 260.6
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
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

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
---
 package/systemd/Config.in                  |  2 +-
 package/systemd/systemd.hash               |  2 +-
 package/systemd/systemd.mk                 | 22 ++++++++++------------
 support/testing/tests/init/test_systemd.py |  8 ++++++--
 system/Config.in                           | 10 +++++-----
 5 files changed, 23 insertions(+), 21 deletions(-)

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
index 7164af23e5..76825c36d5 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,5 +1,5 @@
 # sha256 locally computed
-sha256  f9a3f1e21e4dd78717bad0888638954467a55d73cab44a2c7a75c5bed47ef814  systemd-259.10.tar.gz
+sha256  46f00bb99c02e295cfda58b2fe9c7eac67a06d2ea5895aa80580c718ca3da71d  systemd-260.6.tar.gz
 sha256  ac4985facb553559981f507982444d779115e3e3a4c8b7847ae956198490c1b3  LICENSE.GPL2
 sha256  6d9bb3b7fc818a8facc4cc296060a0883fef8710d6498f86165335846e82ee9d  LICENSE.LGPL2.1
 sha256  c9e7bf5b7c243c719b8b43c36158effb9b54c5e80abc9d82e4b2d4b2a4aa64ad  LICENSES/alg-sha1-public-domain.txt
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
