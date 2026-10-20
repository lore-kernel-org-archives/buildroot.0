Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911C260A382A
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 09:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=nl/R+9P3
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6336081053;
	Tue, 20 Oct 2026 09:37:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ATnymzSgd2RD; Tue, 20 Oct 2026 09:37:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7213381066
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792489037;
	b=Czf5JT3mQP2cmtiuS8Bx8VBVOp3xp36sN75NbbYIM1JXjHmMNKgTrgjxsQXOXgW4g77D
	 Qyu3x5j/nZG4GzSNOyuE9woeOc4lPLT3w2qO/IDoSdz0oYdX4sgrL+81jx/yfRjJaaRAT
	 diQ3cP125ZR3baDNE3T2LI3XR39vtn359LaRM4uIf2H756wJjO6C6vOhOxAZfH1Bb4XHC
	 eFm9gk3uoGTCh0v7aTyUIOKKT9TCEmUge7dc5+ZaLe0KfyFrzdjS72d7T9PyyvPIBbOn0
	 F9L5NdMz+f3s6YkC8qO0ujAEkauVyFfuyAYJF8iLj/UWtKgX4lxQ/jbz8ZseUp0KkfQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792489037;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=AL7Nin2rioPtH0I64y8MjQwFt51KKeOyqeeSKEuBQNo=;
	b=DqGFvp9SUIyB9fMe5dVKFS0vY0ka8f1IPANGmOeR6KtsWFef1V6A1q/lAJJj9hb70+rf
	 6C6sJhJp5Oult9KLgtczmAIouXM2kgXFHv9FZJ4SRpyEEo09uzjfL4RCrfYnk9hiC7yes
	 eP+gsfJz0EDd3RvnTsWmA6D0EYS+NOghTIQG1Iw1hVohQi4XxthF6qvZca/v0xjBoSFNW
	 Dy0/WwO2yMoRAhv9SF9VVyVdfD6LscbZf/bF5Isj0tEqzJ3Jqi4sUvR8e+Yqw4L/QpO/u
	 538qiwNSi1cQu2BTZek3XWzMmLOC5A5CazIEMzMtWmL/rARUUXiIwPSKRRisQjjbm+A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792489037;
	bh=AL7Nin2rioPtH0I64y8MjQwFt51KKeOyqeeSKEuBQNo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nl/R+9P3Y1XBOTvKomEOgR49csLZguBmKI+AdlcaX/YsL4LI18G+/S8J/iWx9xJ+C
	 1UACG1sDNqzayHYG2h3cAx8MJMCwLM1VyMqOVhixYjwr+nMu7fsdm/tTAJz6sEcL0q
	 sf58k4Bc/WP0P2ER9fZrJXtGfxqTKJfjnTppPLzKzT4bO7ENV5uGBpm/07u/4/2al0
	 M5q2D/cdWCXDqcN84wLSaqRzA0/9s/G6RlZXlv9apCqsWR84/EihkdujQ2WKc00RSA
	 0HXaMLMFhBTwW1sJ8Yo95OAJFqqn2a38xRtA7IEzuQT/x2VNzOjGPGDK8xqUCk5SNh
	 CYM8rMan8UErg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7213381066;
	Tue, 20 Oct 2026 09:37:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B383465
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 09:37:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F0E7060822
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 09:37:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QJVZKnKClJwa for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 09:37:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 32EF7607F5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792489035;
 b=U6QfSVYpDGEBTB6RMjHN1SYcPWH7LD0+nmDudM0mzmG3Y19ySd31hw5lnQg6qZ5Lc2mn
 Qna3xVYYbspgeEC412oWkkMsgrb6huC6HGjdgzfV0n/9jrtQE7KiSOsOOoh78SghC2D4B
 V+gfVjE8EfoP7AzyICCkPDTbJkiSQMHmpGrHRVmFpXzws6GYSfVYFUAqbaOjkAGnlgjhJ
 DHVZhS15xnq0Z4M9mHiRexVFV/STUUuOoOmfrK1vaPpSkUenuo+FAh5sr96t9juuP+BSW
 78B5P3PYnMu8CrZ1zVN+3S3RlIa65/aLMd0DtLiPD1MzC2pIgOtlPugcIgjEMz3R35Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792489035;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=wpCV96sp5FfzIgzPf/MTGBBfMpreCdMl6uz8R4Nv7aA=;
 b=iOttCyozygoXTBEYaHaBVlLV0Pw0gOX5xSk+/EGGmmep+G0SMUiml/ZCudtZw663HVOp
 4IHD6PtsOENzuswBx/cgud/Hyb4wJ/3BJGt68aTwSI33ep1wj7aGp9miLUnEc/UTjwGP2
 W/k57IAeXQc96GcRMDl0vVhKC0Xup+VOfctQDmidER1KzE6poOXvUiEvpSWKHBn2Ws8F8
 V7sZPJBRMFib3glwQl3H/ongfnfoWRaOguGaJtTOrKH2tuW3r1LMKeMM/o0lDp0VejZ+k
 J3+iiAbvCBpXVDd+UtoPaXjgkTZBhmeVULdd+EeLmhA18om9ejfbuTSiUoxA3+Fyngw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 32EF7607F5
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 09:37:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 323F296D8F; Tue, 20 Oct 2026 09:35:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 20 Oct 2026 11:23:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8a6f6aff73437174ce21d2f8026cbebdb1c8b992
X-Git-Newrev: 81bec84bfce986a49b799384c3d0c540fda5367c
X-Patchwork-Hint: ignore
Message-Id: <20261020093552.323F296D8F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qrtr: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/81bec84bfce986a49b799384c3d0c540fda5367c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Userspace for the Qualcomm IPC Router (QRTR), the transport between
Linux and the remote processors of Qualcomm SoCs: libqrtr plus the
qrtr-cfg and qrtr-lookup tools. rmtfs and tqftpserv, which the modem
needs to boot, are built on it.

The name service has been part of the kernel since Linux 5.7, so the
userspace qrtr-ns daemon (and its systemd unit) is not built.

lib/qmi.c, built into libqrtr, carries its own BSD-3-Clause notice
(The Linux Foundation, Linaro), so it is listed as a license file next
to LICENSE. The GPL-2.0 SPDX tags in the tree are on CI scripts only.

Tested on an Arduino UNO Q (Qualcomm QRB2210): qrtr-lookup lists the
modem's services after it boots.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS             |  3 +++
 package/Config.in      |  1 +
 package/qrtr/Config.in | 16 ++++++++++++++++
 package/qrtr/qrtr.hash |  3 +++
 package/qrtr/qrtr.mk   | 14 ++++++++++++++
 5 files changed, 37 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 95499bbf0c..2152dddb92 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1495,6 +1495,9 @@ F:	package/gcc-bare-metal/
 F:	package/newlib-bare-metal/
 F:	toolchain/toolchain-bare-metal-buildroot/
 
+N:	Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
+F:	package/qrtr/
+
 N:	Ilias Apalodimas <apalos@gmail.com>
 F:	package/keepalived/
 
diff --git a/package/Config.in b/package/Config.in
index 1741e74ac5..6353c17b7e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -589,6 +589,7 @@ endmenu
 	source "package/pru-software-support/Config.in"
 	source "package/pulseview/Config.in"
 	source "package/qoriq-cadence-dp-firmware/Config.in"
+	source "package/qrtr/Config.in"
 	source "package/rasdaemon/Config.in"
 	source "package/raspi-gpio/Config.in"
 	source "package/rdma-core/Config.in"
diff --git a/package/qrtr/Config.in b/package/qrtr/Config.in
new file mode 100644
index 0000000000..9f7584f6e4
--- /dev/null
+++ b/package/qrtr/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_QRTR
+	bool "qrtr"
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15 # linux/qrtr.h control packets
+	help
+	  Userspace for the Qualcomm IPC Router (QRTR), the transport
+	  used to talk to the remote processors (modem, ADSP, ...) of
+	  Qualcomm SoCs: the libqrtr library and the qrtr-cfg and
+	  qrtr-lookup tools.
+
+	  The QRTR name service runs in the kernel since Linux 5.7,
+	  so the userspace qrtr-ns daemon is not installed.
+
+	  https://github.com/linux-msm/qrtr
+
+comment "qrtr needs a toolchain w/ headers >= 4.15"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15
diff --git a/package/qrtr/qrtr.hash b/package/qrtr/qrtr.hash
new file mode 100644
index 0000000000..de79dd5061
--- /dev/null
+++ b/package/qrtr/qrtr.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  7a82bf80246fe71287b13c66c0466208822e8337fcd4aaf302eee6c5fcb48a52  qrtr-1.2.tar.gz
+sha256  e04f492e71bc5cfe131942eb127c7906d2627831ab910bb894402b476b5d7488  LICENSE
diff --git a/package/qrtr/qrtr.mk b/package/qrtr/qrtr.mk
new file mode 100644
index 0000000000..c0d3fb3d56
--- /dev/null
+++ b/package/qrtr/qrtr.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# qrtr
+#
+################################################################################
+
+QRTR_VERSION = 1.2
+QRTR_SITE = $(call github,linux-msm,qrtr,v$(QRTR_VERSION))
+QRTR_LICENSE = BSD-3-Clause
+QRTR_LICENSE_FILES = LICENSE
+QRTR_INSTALL_STAGING = YES
+QRTR_CONF_OPTS = -Dqrtr-ns=disabled -Dsystemd-service=disabled
+
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
