Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612BC6072156
	for <buildroot@archiver.kernel.org>; Mon,  2 Nov 2026 14:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=I25rjahK
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E5F240533;
	Mon,  2 Nov 2026 14:24:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UBqZ2Pjfb21h; Mon,  2 Nov 2026 14:24:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 33027405DF
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793629496;
	b=TtSXDwGCwdBYmakNBj/ZiUGrcrfU2WA9I5F1gwLLES5yEqO38b/R51Wv6CRtiDAfRXTB
	 CW8t2u5UZuGHFGONnjhlp9UBsH36cIC2ScSc/afBgWjvwSee2k4MAj8Bi5/Ao6EsfWrOv
	 xSq7ZTA6dutQQLCnMfmTMz3Fh5+YOagFj+1ZQWyK+Y8s6x/eCeMXLcv26h1v0g7FueCh7
	 xu7O3+7CTgF6Oz2c1licKeyKF2uwHS9qpKjq/1EMsAFGfC52aCTuaN1iRU1fO51ZG8EbA
	 21LF94J0XWfqToXJTwycHwvPU14ZuO6hQfel5KtBcX1On/PscAdNeoxjFQqGQQw9bEw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793629496;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=2ouZy0gDzVatIUej2fseG6SxhUYPGIK/pBSPMl4nGDM=;
	b=LOYLz94fA3nwy63yUna2zDnlbgl2eQeKbBQSSuPfRX9YwGLKLqVgwWjZZob8AAbCz6fB
	 UF9BFPqUpCg+4TzX265kwK8XVHLdRxnXn4d+jGi6Uay3T0NEHTLXo4JAzHdSKgHXk6yEE
	 qXHSIwv/feqbWxFYoeSIx4Sy6FymB/RQKatrzQJx7PFQBDSqd06TSKM0Ozz56h3CVFYRf
	 tt1xNLTnCvx1HOH6NLFNPZrs9+RV1Ml6+gUDyCgUMVYwkMMuYtGA9vbWG6h8yDclvoDlh
	 WJcfph+OdGD28Nv5iFq7wS5+sHMTri5I9VPFFoQipmonQUFCI4Uh+u930ixOpNrQCtQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793629496;
	bh=2ouZy0gDzVatIUej2fseG6SxhUYPGIK/pBSPMl4nGDM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=I25rjahKbsZkKzcPT7YplY7BEDrebv0ki0QBbqMTODik5eSs7eKFYJTIUEXyQxgY0
	 HoKOAYXdQNNrmQIouRkvgQW2QvGk1C5cfsrlRb1iDaf9dp337scT/eQa9R6xtKfFxT
	 HApVX7DDGhFzF7Guk8Vresm4EeA2F96zrbfkaoYVXFUGUTatD3tlxPkEqO648kLxVG
	 teUeIklTWIto+EAySU0uFf78RQDA9LgUg7UUM+p4fkkRkkE1f+OOVrxdYPSXSynEfw
	 aDL2yLRTxAzKzTrUTK1S8o8tMxKAK/6o6b8VU0LmIl1TtZPCUkIAkMCSGU/Uvf9bRO
	 3eZNA3N5XRXRQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33027405DF;
	Mon,  2 Nov 2026 14:24:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3369C4BC
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 14:24:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1730E80F6E
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 14:24:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jBZ__tohHNkr for <buildroot@buildroot.org>;
 Mon,  2 Nov 2026 14:24:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 761E480F28
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793629494;
 b=AQAGGB2nXBbwGYpuAifwDDwW0QEqhbCxqeOniXpWWFd4wSpjGiQ2v0VM24QRAAcc2ZCQ
 F5dGqF6pontp5ceF2bWiNfqB4jfF5v4X0yAWSKlcCYfY19B88nJlLTNcMdBI60x6lT9Vq
 gdLjSWwlmmYHDm9y2EqmMU54prsV1RDAXB7ewqUkcdekhCprzmANtQ/Dza/CoGCDKXcZa
 OwdsSlFkyZDL4ugw5TAlZTdW58QPXrbExC2tD58TElUvjj3A843wxHPlMjSTjz/zUNVkP
 gAydmGMcB1A2zBPS/vOD/k+QgJ4rVAwCzFO+NYhv/gqbymxmyMezIZrmj2ta+nSggHA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793629494;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=PvP91RrE0sKp7cAUxTAOR6Eg0qlL6I9X050jPx41/DY=;
 b=ELQlAfH4+SUu+4Sk5sK+WcTqxpUjJDvrpkvlcEsydI8aABU5CpQg4kkaz2JGSEiwLziX
 HqdYR0zn3tSxOnq+/vLxw8epfR7Unv/Vvj7FX+NuWnYbbP2VIS2kcFcyIT/xlwRBU5vKR
 Jf17kzYL7bwd5b5tVeQXr344e2pwqwd1BwrhiZLL5ILtN+zgcifymsAWpxbiQJqwgUYpE
 L7iENnK2w3e3qshp2AyolKHUw4Zi7ip3lcjKNgN7vTYhE1EkkSQTVv/dB5DgdaB/xKicl
 wbOE32ZN4Zv3oAMIlRuMstRzCmsgy0nKDGtcQy4tYnA1wF4o9DXItC01HgKOAkrVi/A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=Yc8eLL6s; 
 arc=none smtp.remote-ip=212.227.17.20
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 761E480F28
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 14:24:52 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MOzOm-1x9cpq3eJw-00ISyL; Mon, 02
 Nov 2026 15:24:51 +0100
To: buildroot@buildroot.org
Cc: Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>,
 Julien Olivain <ju.o@free.fr>,
 "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
Date: Mon,  2 Nov 2026 15:24:18 +0100
Message-ID: <20261102142418.2544020-6-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261102142418.2544020-1-fiona.klute@gmx.de>
References: <20261102142418.2544020-1-fiona.klute@gmx.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:eELr3jwxrdxt8wQOUK7xbguNdwVQOm6Dtd/ajBBJ/gLQcsGPk07
 m9mcQ8Zgxi7hSPYX4Lk3yG77k/iHoe5NQwJhjF26ujEJtR7MScCf7QrDJLVqahizO3ZJO1Y
 AjQPIv6Vpd85Wpyt6M5ZRFJsHvgQqU24WHBXRStE3Ju90tG4c0fT1FBuwpzhF7WE8zBxCxe
 4Jb0dUMPHPkfeP4OnCdIQ==
UI-OutboundReport: notjunk:1;M01:P0:NZm6GKLd8RI=;UQWrv98awvUO9fKuI6SQtkEPPj3
 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
Subject: [Buildroot] [PATCH v2 5/5] package/systemd: bump version to 262.1
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
* Systemd now requires binutils >= 2.35 to build. All versions
  packaged in Buildroot meet this requirement, but external toolchains
  with very old binutils might not work any more.
* Meson options for static/multicall builds have changed. Buildroot
  does not support static builds of systemd, so the options are
  disabled.
* systemd-tmpfiles now rejects lines with non-empty arguments if the
  type does not use any
  argument. package/skeleton-init-systemd/legacy.conf follows the
  requirement.

New/changed options:
* "build-static" is disabled, see above
* "dlopen-tests" is disabled
* "fallback-default-target" set to default
* "hostname-wordlist" set to false to disable installing word lists
  for autogenerated hostnames
* "standalone-binaries" changed from boolean to string (list of
  binaries), set to empty
* "systemd-multicall-binary" is disabled, see above
* "var-log-mode" (permissions for /var/log) set to default

Please see the upstream NEWS file for other changes [1].

Hash of LICENSES/README.md changed due to addition of the word lists
mentioned above [2].

[1] https://github.com/systemd/systemd/blob/v262.1/NEWS
[2] https://github.com/systemd/systemd/commit/3b4c759a07a7646fbed50ff9ac8cce35c3b79843

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
---
v1 -> v2:
* fix hash of LICENSES/README.md

 package/systemd/systemd.hash |  4 ++--
 package/systemd/systemd.mk   | 16 +++++++++++++++-
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
index 16dab511d2..047cfac3c4 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,5 +1,5 @@
 # sha256 locally computed
-sha256  2f78c37c6592dd34b95cca86793f1b8c5b073db35681ef80ea16a73c0c297a9e  systemd-261.4.tar.gz
+sha256  100fc873b848b9b0297d8a705e8e2ed326256c8483d9960ee1ffe264c8a5c3e3  systemd-262.1.tar.gz
 sha256  ac4985facb553559981f507982444d779115e3e3a4c8b7847ae956198490c1b3  LICENSE.GPL2
 sha256  6d9bb3b7fc818a8facc4cc296060a0883fef8710d6498f86165335846e82ee9d  LICENSE.LGPL2.1
 sha256  c9e7bf5b7c243c719b8b43c36158effb9b54c5e80abc9d82e4b2d4b2a4aa64ad  LICENSES/alg-sha1-public-domain.txt
@@ -13,4 +13,4 @@ sha256  8a6fc0879cecc0b96bf4c08159b9d733bf0f15fcf32879aec98c4ffd05424554  LICENS
 sha256  b85dcd3e453d05982552c52b5fc9e0bdd6d23c6f8e844b984a88af32570b0cc0  LICENSES/MIT.txt
 sha256  2a98749f6bec00dfaed86fa9c1edea871aaae4f11ee4d100b671aaf4ce353a73  LICENSES/murmurhash2-public-domain.txt
 sha256  1a7adaa2c86cedfd6c7f5c0c7c72fd6d3e02cd0c9593f21fdb53c89bb2b130ec  LICENSES/OFL-1.1.txt
-sha256  a3be270384280249880bd69cab48de68f3e9906b975fb172bc2b83657c43d9a0  LICENSES/README.md
+sha256  a817486a61df66ef79f96032763c861abd0edf4199cf39a7b1515a7e29f6e6d0  LICENSES/README.md
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index e9e3abf26b..05aefb40cc 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -21,7 +21,7 @@
 # - Diff sysusers.d with the previous version
 # - Diff factory/etc/nsswitch.conf with the previous version
 #   (details are often sprinkled around in README and manpages)
-SYSTEMD_VERSION = 261.4
+SYSTEMD_VERSION = 262.1
 SYSTEMD_SITE = $(call github,systemd,systemd,v$(SYSTEMD_VERSION))
 SYSTEMD_LICENSE = \
 	LGPL-2.1+, \
@@ -68,6 +68,7 @@ SYSTEMD_PROVIDES = libudev udev
 SYSTEMD_CONF_OPTS = \
 	-Dagetty-path=/usr/bin/agetty \
 	-Dbpf-framework=disabled \
+	-Dbuild-static=false \
 	-Dcompat-sysv-interfaces=false \
 	-Dcreate-log-dirs=false \
 	-Ddbus-interfaces-dir=no \
@@ -75,8 +76,11 @@ SYSTEMD_CONF_OPTS = \
 	-Ddefault-compression='auto' \
 	-Ddefault-locale='C.UTF-8' \
 	-Ddefault-user-shell=/bin/sh \
+	-Ddlopen-tests=false \
+	-Dfallback-default-target=graphical.target \
 	-Dfirst-boot-full-preset=false \
 	-Dfuzz-tests=false \
+	-Dhostname-wordlist=false \
 	-Didn=true \
 	-Dima=false \
 	-Dimds=disabled \
@@ -103,17 +107,20 @@ SYSTEMD_CONF_OPTS = \
 	-Dquotaon-path=/usr/sbin/quotaon \
 	-Dsetfont-path=/usr/bin/setfont \
 	-Dsplit-bin=true \
+	-Dstandalone-binaries= \
 	-Dsulogin-path=/usr/sbin/sulogin \
 	-Dswapoff-path=/usr/sbin/swapoff \
 	-Dswapon-path=/usr/sbin/swapon \
 	-Dsysinstall=false \
 	-Dsystem-gid-max=999 \
 	-Dsystem-uid-max=999 \
+	-Dsystemd-multicall-binary=false \
 	-Dsysupdated=disabled \
 	-Dtests=false \
 	-Dtmpfiles=true \
 	-Dukify=disabled \
 	-Dumount-path=/usr/bin/umount \
+	-Dvar-log-mode=0755 \
 	-Dvcs-tag=false \
 	-Dvmlinux-h=disabled \
 	-Dxenctrl=disabled
@@ -906,6 +913,7 @@ HOST_SYSTEMD_CONF_OPTS = \
 	-Dbinfmt=false \
 	-Dbootloader=disabled \
 	-Dbpf-framework=disabled \
+	-Dbuild-static=false \
 	-Dbzip2=disabled \
 	-Dcompat-sysv-interfaces=false \
 	-Dcoredump=false \
@@ -913,9 +921,11 @@ HOST_SYSTEMD_CONF_OPTS = \
 	-Dcreate-log-dirs=false \
 	-Ddbus-interfaces-dir=no \
 	-Ddbus=disabled \
+	-Ddlopen-tests=false \
 	-Defi=false \
 	-Delfutils=disabled \
 	-Denvironment-d=false \
+	-Dfallback-default-target=graphical.target \
 	-Dfdisk=disabled \
 	-Dfirstboot=false \
 	-Dfuzz-tests=false \
@@ -925,6 +935,7 @@ HOST_SYSTEMD_CONF_OPTS = \
 	-Dgshadow=false \
 	-Dhibernate=false \
 	-Dhomed=disabled \
+	-Dhostname-wordlist=false \
 	-Dhostnamed=false \
 	-Dhtml=disabled \
 	-Dhwdb=true \
@@ -982,9 +993,11 @@ HOST_SYSTEMD_CONF_OPTS = \
 	-Dselinux=disabled \
 	-Dsmack=false \
 	-Dsplit-bin=true \
+	-Dstandalone-binaries= \
 	-Dstoragetm=false \
 	-Dsysext=false \
 	-Dsysinstall=false \
+	-Dsystemd-multicall-binary=false \
 	-Dsysupdate=disabled \
 	-Dsysupdated=disabled \
 	-Dsysusers=false \
@@ -996,6 +1009,7 @@ HOST_SYSTEMD_CONF_OPTS = \
 	-Dukify=enabled \
 	-Duserdb=false \
 	-Dutmp=false \
+	-Dvar-log-mode=0755 \
 	-Dvconsole=false \
 	-Dvcs-tag=false \
 	-Dvmlinux-h=disabled \
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
