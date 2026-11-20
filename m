Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F89606A320
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 12:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=eU3sA32T;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=avtBdpIl
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4330E607BE;
	Fri, 20 Nov 2026 12:36:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9LWDyJeaSOhV; Fri, 20 Nov 2026 12:36:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 50515606BE
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795178179;
	b=B8eg75XdVIYLQkkBVnlWrubcX0VaHswnHLoUHsB34RI6g7LP8cUVaXLFlKzAvR8ijY3S
	 6fYQxfPkFyMKVty8/fn1yD52sMhpquKZH5eT9zQ3e+tb/P2/QtrP6Y6qm38ONdYFwEsGW
	 PYVtN0c6GVW32YZnoIzfSHnLu/qZQvfhQYWrc8U51uUJ+whfzObUnrGBul6LAf3k6wmLW
	 LOBCaWb4BlXFeQVC933i/WMrJ8Do+3bJfQIx4oqcC7aTRw/wGYsbisck3TybOgrI2NCBQ
	 /80TCqPx8oUGSN3w9lVsYxI4Zle1MsffZg9+/KQJf9vfAiKXcpsU3ra3Celgo/k2/ow==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795178179;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=E8dsS2Bvq8Qg0w85+wg8Md+4EkGmksH77hx27geHflM=;
	b=OiuNNtNGI7IbCAx4KD+cZ6TEIesICeaYINduq/LV+WCIUaXBbqkOcD7bZ080L9yz0xab
	 b6w/ZnDc/fVTcLvkeoLAE6+wC21/iPZgNzE2jMAYntFLo3eOKIu6aI3Ga3o6uoRO1kYnE
	 jskgZZZ6Dz8bXeklw4y8g4GxB19Cg7lN586u2vwaffCRaZtaZFnvS+3Eg7PryJNqTIJbb
	 U9Wp+R3OOzwmULGdoneQgbJl97JFDnsoxGCaGfzaGzICgjUsYv0sUDDeADWJn67zwjrTj
	 HZjfybl3o//nEmOeBpe4QVuxtHKvFgEEO3VQNkWW7IEN8ae/N6t1wA4/1McTsRc/Gcg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	dmarc=fail header.from=leroys.fr;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=avtBdpIl;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795178179;
	bh=E8dsS2Bvq8Qg0w85+wg8Md+4EkGmksH77hx27geHflM=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eU3sA32TONrE6VAq6IV301r/oKiwlGV22GSXP1Ae4ltayyqwLPzNSMFUFo4WlWLA6
	 EcfN1fufNxHYTd93sHjoCPdAFw8c9ijeVaz85sW+s7OvHd3YGXX4RUn9o9/Ddn9aSE
	 TvKe/5snRL6ej0X1CfJQuPUq9OR3FdFP7lTutEDmOj//qDKp1ZhfvgT87P7O4ODPG6
	 lDAnYX62hXm3ioZo+/4LYgoSvG+ZgwfhlZTZP2+Hvqaga6vcQq5k3k5p0lea/b8S1J
	 nUOAG38agAO20IvTOlTvESiaRCDDLBFNvevCfEkULvO4iBnVzg3nbEAaJz+T0qYgcq
	 S+vf63Z8wwKVw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50515606BE;
	Fri, 20 Nov 2026 12:36:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B6873465
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 12:36:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9C805606BE
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 12:36:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Su61kez0a2e for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 12:36:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0EBD66069A
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::42a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=maxime.leroys@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none) header.from=leroys.fr
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=avtBdpIl
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0EBD66069A
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 12:36:15 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-492fcbfaa88so498497f8f.3
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 04:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795178173; x=1795782973; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=govAfRGmw/zVwjFsbH2cXcf1daQ4fX/HFOcf9IS+VEM=;
 b=avtBdpIlw7Tx6eKEvjYeS9O0bvh7TTSwb5Ifi9ACUQDh+BGQnceQwUX12R4ZM2M/ax
 hfi9hGdnT1SebqqAgwIqCkhZo8tcsBiP3+qz97XSKXJUHtWuAt9sWnVa8BGRQ3L6+l3d
 KEOdIncj4uGsE/kA7KzieY8+lIat11pfA6O/vwUyM/xkQ2Wk4L4oSCZPWswUkarsRQSB
 /lmM+P2Z8gKrKA1YjIn2yWPaK16H7ADth2YCyxw41BzrWgBbn+MnDU/obyR+ySxmbL6W
 IW/V+VxY7R2VIuD/21amH8hZMZHTxThAIJcO1VfbQMHDj7rnuRFO5OxlE3IkNFd5Obg5
 9Bcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795178173; x=1795782973;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=govAfRGmw/zVwjFsbH2cXcf1daQ4fX/HFOcf9IS+VEM=;
 b=OGJODkWrNZr1bcejzD9Q3LncOVSxvZ8plKiDJh5voseZa14Bo6qA7ntiXG4W1tDdNj
 Bo27oifsQZH6iHIlBxekS/GJvEaEAeGcc2xBwacbBwExmMoLjn1rRzQbI2YLJ/ehKQ0I
 nFfoL5Dk3QFTirWzwzRnk1dfz4FQb+8KikOKqLJWt8OsBkeKDUAavpdkwuV001n3n0lE
 OlyT+vbW72Vss5bupYjLkF4deBAOYqY63DewtpzWPFcXz1qZkUtLAxDLFjdmXCE5ZQiQ
 lTZ5VsJladjGy+G7yx+461L7ksmQ3yyHe/cM3CjqAj6aXrvazB8GLNcdvLAAu4VBUVBr
 5AcQ==
X-Gm-Message-State: APuU4Z99tcPgCiX0Uj6yCTXCBw85J43byi/lBWmss3ULneWEdeOQkmGs
 sHBthgzrqLggCE/Zndz2pVv8elt1J+bVxZKrLiKG/b+pbrRevUv22or5uFpL8g==
X-Gm-Gg: AZFdTZdICPbB0d8WD1XXxaMY78hVQGNvMUX9RQQDYe8IeZQLWgPgJ/BG2gNKf4nwm+N
 5xSyogBBhfh0fFTWzvCP4pw8LrkoKuA3qToCJyhumnHG3vDfG+LswIX2buRAMb9AKJqNxH3COe/
 gdqGMRUf55SPCyntbkjs4f8+NWRcmcB3TZShjbQzsA7FEs8Q/HRbHNmH/Pea1okn4Yti0sBgx0+
 4qjmcYYKJOAa8IegPGFugvPMzNJ9psLkJc+bX5/dfue+a7rDWHbaZVL5DgxBWKnzZp1JLQh7wfb
 CrQqp92ZKd23rU2aoBUzqMAC9UAVxBZuvkRmgpajNtslG3ADjfveSLFQfQ0wGRk0hO6GPRbdEmb
 7nZFdoeEuxn3HmSNKKtZnApyC1EAkzGaw9v1NHRLgk/XeRqmLsCEU4akfFQPduBr/KCXkN6WlRL
 81+SXn51Ly9J3Z/JCoNwKFw86XT+TKaeBBQBNmOY3hcxTVwrpBMBCK37xacO8WXs4rmbIi58N0j
 kACekA11zpBeIVde12xU51epAb4uvBcEwX1iN9S+igX+4XlxHGCTfymWSYeqkdglzrpY+VEsHad
 T0m8/o/frM8S/9/jsAdevI/fhFOG0DV33YsFgj5S3yySk/K1iJdxBF+Me1s=
X-Received: by 2002:a05:6000:2c0a:b0:498:1a65:50ce with SMTP id
 ffacd0b85a97d-4abb1ab5d1amr6064605f8f.22.1795178173294; 
 Fri, 20 Nov 2026 04:36:13 -0800 (PST)
Received: from freepad.home ([2a01:e0a:1248:bd70:fc20:93c0:238:ce86])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab9cf005f2sm3910139f8f.45.2026.11.20.04.36.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2026 04:36:12 -0800 (PST)
From: Maxime Leroy <maxime@leroys.fr>
To: buildroot@buildroot.org
Cc: Maxime Leroy <maxime@leroys.fr>
Date: Fri, 20 Nov 2026 13:36:07 +0100
Message-ID: <20261120123607.734460-1-maxime@leroys.fr>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/grout: bump version to 0.20.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add libpcap dependency, needed for the new packet capture feature.

Add a sub-option for the new grtcpdump wrapper script, a tcpdump(8)
front-end for grout interfaces. It is a bash script which needs jq and
tcpdump at runtime, so its installation is controlled with the
grtcpdump meson option, available since 0.20.1.

See the release notes of the new versions:
https://github.com/DPDK/grout/releases/tag/v0.17.0
https://github.com/DPDK/grout/releases/tag/v0.17.1
https://github.com/DPDK/grout/releases/tag/v0.18.0
https://github.com/DPDK/grout/releases/tag/v0.19.0
https://github.com/DPDK/grout/releases/tag/v0.19.1
https://github.com/DPDK/grout/releases/tag/v0.19.2
https://github.com/DPDK/grout/releases/tag/v0.19.3
https://github.com/DPDK/grout/releases/tag/v0.20.0
https://github.com/DPDK/grout/releases/tag/v0.20.1

Signed-off-by: Maxime Leroy <maxime@leroys.fr>
---
Tested in GitLab CI (all jobs passed):
  https://gitlab.com/maxime-leroy/buildroot/-/pipelines/3088003829

 package/grout/Config.in  | 15 +++++++++++++++
 package/grout/grout.hash |  2 +-
 package/grout/grout.mk   |  9 ++++++++-
 3 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/package/grout/Config.in b/package/grout/Config.in
index c57937dc18..2c5f382c26 100644
--- a/package/grout/Config.in
+++ b/package/grout/Config.in
@@ -14,9 +14,24 @@ config BR2_PACKAGE_GROUT
 	select BR2_PACKAGE_NUMACTL
 	select BR2_PACKAGE_LIBECOLI
 	select BR2_PACKAGE_LIBMNL
+	select BR2_PACKAGE_LIBPCAP
 	help
 	  Graph router based on DPDK
 
+if BR2_PACKAGE_GROUT
+
+config BR2_PACKAGE_GROUT_GRTCPDUMP
+	bool "grtcpdump"
+	select BR2_PACKAGE_BASH # runtime
+	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # bash
+	select BR2_PACKAGE_JQ # runtime
+	select BR2_PACKAGE_TCPDUMP # runtime
+	help
+	  Install grtcpdump, a tcpdump wrapper for grout
+	  interfaces. It needs bash, jq and tcpdump at runtime.
+
+endif
+
 comment "grout needs a glibc toolchain w/ dynamic library, threads, wchar, gcc >= 13, headers >= 4.19"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_DPDK_ARCH_SUPPORTS
diff --git a/package/grout/grout.hash b/package/grout/grout.hash
index b195157024..b1cd901d4c 100644
--- a/package/grout/grout.hash
+++ b/package/grout/grout.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  cdec124614f50cbeb8f9b8ab51ac7a3f6f9153cdc3a95ec8a870fcb2fd533a64  grout-0.16.2.tar.gz
+sha256  845d116b2f5bc3f025dac4f4610049e74fb5d444902aa97fafe80d95e70cf42d  grout-0.20.1.tar.gz
 sha256  1e412aae8da58b718c78b3d7a52eb547004384d4347e4746a22ca6af7522930c  licenses/BSD-3-clause.txt
diff --git a/package/grout/grout.mk b/package/grout/grout.mk
index 41b623f1d7..a59ff46bbe 100644
--- a/package/grout/grout.mk
+++ b/package/grout/grout.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GROUT_VERSION = 0.16.2
+GROUT_VERSION = 0.20.1
 GROUT_SITE = $(call github,DPDK,grout,v$(GROUT_VERSION))
 GROUT_LICENSE = BSD-3-Clause
 GROUT_LICENSE_FILES = licenses/BSD-3-clause.txt
@@ -17,6 +17,7 @@ GROUT_DEPENDENCIES = \
 	dpdk \
 	libevent \
 	libmnl \
+	libpcap \
 	numactl \
 	libecoli
 
@@ -26,4 +27,10 @@ define GROUT_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_VRF)
 endef
 
+ifeq ($(BR2_PACKAGE_GROUT_GRTCPDUMP),y)
+GROUT_CONF_OPTS += -Dgrtcpdump=enabled
+else
+GROUT_CONF_OPTS += -Dgrtcpdump=disabled
+endif
+
 $(eval $(meson-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
