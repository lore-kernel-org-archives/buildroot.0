Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE59B60A381D
	for <buildroot@archiver.kernel.org>; Mon,  2 Nov 2026 14:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=SvS3SqqC
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B07140791;
	Mon,  2 Nov 2026 14:25:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ryiI4p0fwD5K; Mon,  2 Nov 2026 14:25:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3389840794
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793629501;
	b=osuelcusjSQlMVl+bkRgk59XglbrX48bKDtSX/23sMREaZl9mjSrLNu/stYfeRm+V/xc
	 ifiJBr4SAKSZRXG31kkZq1jShSsRXykpKngDj2QXvmAcrAYHIncTJVFqAIltL/VJWOB3z
	 smJWDaN7sqr5TAkl/5l3qLmj+98AHqwTIjwPLW3rlUEcyLOHqm/7RMh/pLBfYMZWbbmET
	 GhkpUhSAnAP97E4BKYKbeAWvUpxygNvtY5wbEQw9VKFZoA9sjlC1Zz2b6sNcN7J3jD/JD
	 R28d8MInRQZ6kyQBK19mOFbwcjMX7cgB6abp0dzbax0VvNFRE3UJdgSLC2SYjHY0o+A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793629501;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=CPbUH++tsIxe5hTe6Xpf0lBBlZ9TfuO02Xi8vLzt3jc=;
	b=hYev07VZvcaSzAfiNP2SET9wiKr71IJLpw5sy0rAf0xu2k/H7aQM7wWaB1WfGu3+oR3p
	 VWL5Tig+GMkfIrUYjuN9LzXodN8Jd7Dlb2X7aMXm3v0SNSPvWeq6pIXNAj4i+UOdJEImm
	 Xa/Ias9I/Jm/a8tlnsRc5SVh5+bkWoHS/jf1Tz2YVF405n//qkAMtvKomfZat/NH6ZclI
	 pumw+tkkcy/QIfuWcC2n/z6NF6A5eRLdM10T8XrCl4aCT2rXXt56/PO1k7yOi2rQEoqfy
	 40wFZ3uf8wqOGIZKxLzVSawGwZs3490MPsOr2VEMMwkR0pj3N5LDPJDlAveFQQXSgmw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793629501;
	bh=CPbUH++tsIxe5hTe6Xpf0lBBlZ9TfuO02Xi8vLzt3jc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SvS3SqqCfE3PRW9VKad2+AG0IGIiekCux9A4Ozb7jhL8BIE1O8FsUwMaYcD2jRgHU
	 BeXh53ZacZLmDX5uql2ojwJJ/on8Myhroh2tEeG+RUb+H5fu8uk6BooP6ytu2mKQj1
	 CmsHMv8Xb61IiyN1pBt6YJCesccy1uUeaaxJmQNIP4vQRx4BfvVhIDADkcWGPaa8+3
	 pe9cDzLMuzVLRqeOuvEf0zjQVCFIxNb93OFlBIJrEwrFTjDziHMbCnXmNaS0qRgpmM
	 rEoX23ChbFhwt11FRHswOIOXMtSiWUawuXdNDuUYO8wTV6EU+i31YAwuRi0jc01Og7
	 k6pu3Y884/IkQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3389840794;
	Mon,  2 Nov 2026 14:25:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id ECAEDD3A
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 14:24:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D23AC400D7
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 14:24:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GrX_dh022F9O for <buildroot@buildroot.org>;
 Mon,  2 Nov 2026 14:24:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 5398C400D6
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793629497;
 b=iKrKi9DRB8raW+fubWWLAn0x2RK7+AdnFSBU1RW0ECxcF7R3ABc2BvO6/MCQDfpeTG6g
 GW0qMPj3P0DZNQTB9pbFE3R8YF7wUMNDRMKIMOLkB+MjfTNq7otD3N25RbTWTJ1j/FDcs
 U3UcF8S0SAqRGw678cqTOkZgp4GM14q7RUmzaVyMVqf2aTuBe0RgxkFxOgNSNlPdDE38Q
 DaOcvR+JJbWdcWSDwMPh61lGMl3C2p8LlIXI6ieBMIwyaaWqqfoQUWIpf6QG6gM6kfsVU
 6uAHnT2ZdF7aE/ha+DLjnJu/pAiV/TcNdDCWe75Kvla+EO8tU66VHdkqaB0Y3oCN4pw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793629497;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=YjQx8GnG2KWRrFd8ArDcmDrHhbvZn/tjt3Cz6VZ5eh0=;
 b=ed/YchNYaJtJdsf9sOZSm4Rc8Yo4lTMh4mM5Q1G8uON7C/QId5ii9I5vuFXaHrnxhhGP
 DlVsZjqpDhEnb6AKePUO00VhQtoy7v8dTQJNd+k6cdyYl0C0zMgxHUsCCSkfBtbhVQA4S
 dHZrqZFGMxSe0XeT3TlinKRiGfzfZc5dVbwrmvWzWiV2BEMubVb6FtL8HNd9lhzhFv1H1
 zaLR04yXbhnrcPWz/BK+005qqIKzCQNwWaJh5oP12LFTtYvKg4g17av3UuMYi0gxXMf5z
 IaN33ZhXnksxlpN6018f6NH0Yfn/ZaPdlim9fk6FLPSKSjCnzB4xqf1odwzpVMyggHA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=a5VwidmS; 
 arc=none smtp.remote-ip=212.227.17.20
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5398C400D6
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 14:24:56 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MNsw4-1x8Wu90Vei-00JZQv; Mon, 02
 Nov 2026 15:24:49 +0100
To: buildroot@buildroot.org
Cc: Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>,
 Julien Olivain <ju.o@free.fr>,
 "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
Date: Mon,  2 Nov 2026 15:24:17 +0100
Message-ID: <20261102142418.2544020-5-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261102142418.2544020-1-fiona.klute@gmx.de>
References: <20261102142418.2544020-1-fiona.klute@gmx.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:obG8xwzrr1AwnpK0pt3xSkk2/GNJefO/kU6KVgXFkFYP1fYQZY/
 2q6gjDHTlKIGeE8M8AvLt2P7ec0YJY+nJ1Mb0F/M/jUkV8KAW3W2yoTD5oJX5DJwhrJWgP+
 tP7b8Mf7u3+QoL+CYlN724l3KmKAqSFBZPa+jInc7y9VlTeF4WrA7ik3BZu7Tj/4d46sCT4
 v+O9bN28HH2dQNJ+u+ShQ==
UI-OutboundReport: notjunk:1;M01:P0:fEHB/iIlwQo=;OwZpz459oRnOHHEDVpT1tlitZsx
 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
 G82T6abxTc67HBsyf5A81L9+smg==
Subject: [Buildroot] [PATCH v2 4/5] package/systemd: bump version to 261.4
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

This version adds an IMDS (Cloud "Instance Metadata Service")
subsystem, to recognize running in VMs provided by certain cloud
providers and provide information on the instance. This is left
disabled. The user "systemd-imds" defined in the new
sysusers.d/systemd-imds.conf.in source file is only needed if IMDS is
enabled.

Excerpts from NEWS possibly relevant for other package builds and post
scripts:
* "libsystemd is no longer guaranteed to be linked against libm. [...]
  Consumers that rely on libsystemd transitively pulling in libm
  should link against it themselves." [1]
* "Individual binaries now also embed the dlopen ELF metadata note
  (https://uapi-group.org/specifications/specs/elf_dlopen_metadata/)
  for their dlopen() dependencies, which allows packaging tools to
  reliably discover the set of optional dependencies of a binary,
  [...]" [2]

New options:
* "sysinstall" enables a textual installer/setup tool, disabled
* "imds" enables/disables the new IMDS subsystem, disabled
* "imds-network" has no effect with imds disabled, leave unset
* "systemd-imds-uid" is left unset like other fixed uid options

Building with kernel headers <5.12 fails because the epoll_pwait2 and
mount_setattr syscalls are undefined (either may appear in the error
message depending on build order). Upstream has rejected an issue
about the latter [3] without changing the "minimum baseline", so we
have to conclude only the "recommended baseline" is supported for
building. Update our header requirements accordingly, drop the config
comment about the recommended version because it is now required, and
note it in the update instructions in package/systemd/systemd.mk.

Please see the upstream NEWS file for other changes [4].

Hash of LICENSES/README.md changed due to licence changes (to MIT-0)
[5,6] and renaming [7] of listed files.

[1] https://github.com/systemd/systemd/blob/v261.4/NEWS#L100-L110
[2] https://github.com/systemd/systemd/blob/v261.4/NEWS#L604-L608
[3] https://github.com/systemd/systemd/issues/43575
[4] https://github.com/systemd/systemd/blob/v261.4/NEWS
[5] https://github.com/systemd/systemd/commit/919b8c7c92b120ba986a28882c151777661e97d6
[6] https://github.com/systemd/systemd/commit/b5ee53b6c8235289a9fe2a9223aa6cb99734ce20
[7] https://github.com/systemd/systemd/commit/74d392ed1bab578e901699ee272faa0c8b922128

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
---
v1 -> v2:
* fix hash of LICENSES/README.md
* require kernel headers according to "recommended baseline", upstream
  does not fix build errors with "minimum baseline" versions

 package/systemd/Config.in    |  2 +-
 package/systemd/systemd.hash |  4 ++--
 package/systemd/systemd.mk   | 10 ++++++++--
 system/Config.in             | 10 +++-------
 4 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 7f3958aed8..7fd05be41b 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -21,7 +21,7 @@ menuconfig BR2_PACKAGE_SYSTEMD
 	depends on !BR2_STATIC_LIBS # kmod
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_TOOLCHAIN_HAS_SSP
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_14
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8
 	depends on BR2_HOST_GCC_AT_LEAST_8 # host-systemd
 	select BR2_ROOTFS_MERGED_USR
diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
index 91ad68017b..16dab511d2 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,5 +1,5 @@
 # sha256 locally computed
-sha256  46f00bb99c02e295cfda58b2fe9c7eac67a06d2ea5895aa80580c718ca3da71d  systemd-260.6.tar.gz
+sha256  2f78c37c6592dd34b95cca86793f1b8c5b073db35681ef80ea16a73c0c297a9e  systemd-261.4.tar.gz
 sha256  ac4985facb553559981f507982444d779115e3e3a4c8b7847ae956198490c1b3  LICENSE.GPL2
 sha256  6d9bb3b7fc818a8facc4cc296060a0883fef8710d6498f86165335846e82ee9d  LICENSE.LGPL2.1
 sha256  c9e7bf5b7c243c719b8b43c36158effb9b54c5e80abc9d82e4b2d4b2a4aa64ad  LICENSES/alg-sha1-public-domain.txt
@@ -13,4 +13,4 @@ sha256  8a6fc0879cecc0b96bf4c08159b9d733bf0f15fcf32879aec98c4ffd05424554  LICENS
 sha256  b85dcd3e453d05982552c52b5fc9e0bdd6d23c6f8e844b984a88af32570b0cc0  LICENSES/MIT.txt
 sha256  2a98749f6bec00dfaed86fa9c1edea871aaae4f11ee4d100b671aaf4ce353a73  LICENSES/murmurhash2-public-domain.txt
 sha256  1a7adaa2c86cedfd6c7f5c0c7c72fd6d3e02cd0c9593f21fdb53c89bb2b130ec  LICENSES/OFL-1.1.txt
-sha256  769cad6e4cf7548fe86ccd11f16a922aaacaeaaf885af15d13bf0d6946f58cf9  LICENSES/README.md
+sha256  a3be270384280249880bd69cab48de68f3e9906b975fb172bc2b83657c43d9a0  LICENSES/README.md
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 7e95e098ff..e9e3abf26b 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -6,7 +6,9 @@
 
 # When updating systemd, take care of the following:
 # - Check if the requirements have changed (see README), in particular
-#   arch and headers
+#   arch and headers. Use the "recommended baseline" to choose
+#   BR2_TOOLCHAIN_HEADERS_AT_LEAST_..., upstream rejects issues about
+#   build failures with older versions.
 # - If yes, propagate the dependencies to BR2_INIT_SYSTEMD
 # - If the required kernel options have changed, update the Config.in
 #   help text and the list of KCONFIG_ENABLE_OPT.
@@ -19,7 +21,7 @@
 # - Diff sysusers.d with the previous version
 # - Diff factory/etc/nsswitch.conf with the previous version
 #   (details are often sprinkled around in README and manpages)
-SYSTEMD_VERSION = 260.6
+SYSTEMD_VERSION = 261.4
 SYSTEMD_SITE = $(call github,systemd,systemd,v$(SYSTEMD_VERSION))
 SYSTEMD_LICENSE = \
 	LGPL-2.1+, \
@@ -77,6 +79,7 @@ SYSTEMD_CONF_OPTS = \
 	-Dfuzz-tests=false \
 	-Didn=true \
 	-Dima=false \
+	-Dimds=disabled \
 	-Dinstall-tests=false \
 	-Dipe=false \
 	-Djournal-storage-default=persistent \
@@ -103,6 +106,7 @@ SYSTEMD_CONF_OPTS = \
 	-Dsulogin-path=/usr/sbin/sulogin \
 	-Dswapoff-path=/usr/sbin/swapoff \
 	-Dswapon-path=/usr/sbin/swapon \
+	-Dsysinstall=false \
 	-Dsystem-gid-max=999 \
 	-Dsystem-uid-max=999 \
 	-Dsysupdated=disabled \
@@ -926,6 +930,7 @@ HOST_SYSTEMD_CONF_OPTS = \
 	-Dhwdb=true \
 	-Didn=false \
 	-Dima=false \
+	-Dimds=disabled \
 	-Dimportd=disabled \
 	-Dinitrd=false \
 	-Dinstall-tests=false \
@@ -979,6 +984,7 @@ HOST_SYSTEMD_CONF_OPTS = \
 	-Dsplit-bin=true \
 	-Dstoragetm=false \
 	-Dsysext=false \
+	-Dsysinstall=false \
 	-Dsysupdate=disabled \
 	-Dsysupdated=disabled \
 	-Dsysusers=false \
diff --git a/system/Config.in b/system/Config.in
index 8d80d04d97..baac35be14 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -123,25 +123,21 @@ config BR2_INIT_SYSTEMD
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_TOOLCHAIN_HAS_SSP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_14
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8
 	depends on BR2_HOST_GCC_AT_LEAST_8
 	select BR2_PACKAGE_SYSTEMD
 	select BR2_PACKAGE_SKELETON_INIT_SYSTEMD if BR2_ROOTFS_SKELETON_DEFAULT
 
-comment "systemd needs a glibc toolchain w/ SSP, headers >= 5.10, host and target gcc >= 8"
+comment "systemd needs a glibc toolchain w/ SSP, headers >= 5.14, host and target gcc >= 8"
 	depends on BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_USES_GLIBC || \
 		!BR2_TOOLCHAIN_HAS_SSP || \
-		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10 || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_14 || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_8 || \
 		!BR2_HOST_GCC_AT_LEAST_8
 
-comment "systemd highly recommends Linux >= 5.14"
-	depends on BR2_INIT_SYSTEMD
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_14
-
 comment "Special purpose (read help)"
 
 config BR2_INIT_CATATONIT
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
