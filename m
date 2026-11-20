Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88AE606A320
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 13:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=MJa4bOpk;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gJI9vu9q
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE82B60DD5;
	Fri, 20 Nov 2026 13:33:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kCpYu_BinlkE; Fri, 20 Nov 2026 13:33:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B4CC560755
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795181588;
	b=X8IJtfTDcxJr4K12CYrwtinAaVwc0Tem6Qi3qAfXg1oOCymluGjYoj0c2Fj21QrMjjw3
	 38kRIT2tBTXzcsMW31TukJ7dHFIpEQq/XTFOZkjAv+JGOO7SDSsvG9afIZew0v80Q+fto
	 i4h+i+W+LsXqMjsfaUseOz48+wFpPs8DragTqIH3A52IS0puyXe1pUa4KfuciYK7vhPwD
	 soDePOcioJncswigZHn6RpFjWCFSpk6X9828x7pkSTjV0+LKKByF8rwjPdglWA4abH6S0
	 P63JvemnEG8OozEF8fPIOXW3TBuc7fVXM/bq9WFDEBRfjS0JALnJ3jmWgckm7MITxyQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795181588;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ujd7WjvDXg/vlaIjdvlvOwq/iIjVb34eb/qU3DuNReQ=;
	b=JKW6mnxfrc3g3gByCmv6Mdt9djMVXM1zwWkwDx4oQ7nwdR8eDO2gmeXrjn4OMc4f+QiN
	 j2LWRRW9hX3gs7Vz5TMi7c65IW/StfIhjDReUUhAmJiG3hvuV+x07LPAj27Uke3hPqfaU
	 SWZ8tgbiM4dALJrnokpbBPSr4H/CHU/i/YwoNC44TuZ3K70P9oM0IqhXAEMdk40EtRXKq
	 JDG+D5javuNIi9nlyEdunZ3N7L4Av+b2yY51EE80J8GmXszJUl6USRYjcB/Fg1/UUDaL5
	 0shmM6QhHK4U5Gs8Yq0aaMNH3icg1Rwt9yylloRWYAbgo7ntwvjDFjQmu7NZlzhQzFw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795181588;
	bh=ujd7WjvDXg/vlaIjdvlvOwq/iIjVb34eb/qU3DuNReQ=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MJa4bOpkKxOj5dNajtODfjdK+uVGeL3B29ptD1AOV1N3IUY2od+oDZETC+X1Yj1cM
	 wTLLE0LObqFyR3aGp1e6VV29cF8n/xWdNom8LNP44+e/xB+FX2P3RbT2WO+QS/0kTi
	 M62CJ4dZg4D7joKUEk2y77F4aCt10vAZfPhOfLd+g/P+WFQo8lyH+T7uvzQ6Sc0ia2
	 b/p7YshDCsbRVIxqr6LfQPknlQhw6DRfGOLHrK8VU0dK5TZ3rgazUcdU0V6NDCYXEo
	 9ILJUbhaX/2UgUwmblTCKBoHfas9mIcRPeKyY9RrnDn8b7Un5qvR+BtP+Q7Gt8GW0m
	 H8fSvC90BkhjA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4CC560755;
	Fri, 20 Nov 2026 13:33:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 323E91C9
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 13:33:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 235E4812FA
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 13:33:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 54XhdBhDq-Lu for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 13:33:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E867B811AD
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=pieterjanca@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=gJI9vu9q
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E867B811AD
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 13:33:05 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4bb6adaf0f1so7639715e9.0
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 05:33:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795181583; x=1795786383; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=VV1M7Rw5hXzpXgnGCblIukwHvdRbMiRyXDsNs/L8ARQ=;
 b=gJI9vu9qM01I/KQX+hpPeIc+gAFYFWbrz2iZVv394Je4XkD+p+uJEbhKZYMhXGXSHY
 Q5TtEMUZSdhDXl49KyuTHkWpCAzDk99DUpelWczUtrcO+mty9xSLonK7XBSiozX6O+1d
 Qxb16Uk6r24MXjyBvsPr/v20z5GCrkZQJS5rdfeo7a2U6euu8HSJBc2ZMxtsYT0ZN6ue
 AoeG4aAy11CdFy4SXyhTdDEVS4kdpb6h2eBpF9+BEtuc0iBdYf+LYQag6XQHTwvAtvl3
 uni781ONPJYEkJyYBhcjq68S+NDabym0ePx421+zbjP/Pal4LjK4LMGO+TYmIr0whx6h
 c+Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795181583; x=1795786383;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=VV1M7Rw5hXzpXgnGCblIukwHvdRbMiRyXDsNs/L8ARQ=;
 b=iuwr82nmNbqyzBKoz7tU91ke34nn1x1CEOqS89dQhIZB6hI4GX9mzAFxBuWKbSon+z
 UteSDbRWBM1laHkx87lhiK9Pc8oEXL3r9qMUXDk+B+n0ftNeTDuejb/RnaI75IgvDZi2
 ZuD/2pfG9TsaaCHS7qwRNf+/4CEBmdwqe1t0hiq8wzvuHUDAi7OBBjBORRXI24Lj6Ool
 bSoToXWY7PVDmOara1SwIF8PKLf+bv8MGBxl6hxGw6TwMyla8BvmvM5wjwnC6eEAPKyk
 0Pid4HFOMZyfjtzq86E/keNeMurCex/0OARom9GOMPTnW3QR8Kzm0faGJhzZpT7X0c+D
 MOtA==
X-Gm-Message-State: APuU4Z9rCm1KhzfS4UCGRXfyZfP6gR1PN6kw5q1bJsejORGfitLhAU10
 jSOQcBCyAfLftenWlSZL9xQpI6m7kayU14Hy16i0urWP/UjnL31D4ttH+mXt
X-Gm-Gg: AYBFou2NoO3YAKCjyCVUIDSfgWV5Y0GDHSlHPacaCj1wR7aj22AfyKMY0s9xJxS3JDx
 IWbttxQ8QCvgdLOBCGfMQ+IW/O2/OTE+EEH5J6a34FQKFt0Tfs9WaDQ/gGq+ZJsQXtDLNwHxAkZ
 5tMHXzwV7Ia6ZMwrkXStDnsmbjEQ4zDfrpAcYPLQxmIEzc/pvRtl3drRkHA6F1F5UGlWhlNrqgg
 Z1XV4ywMKk8MlYG9Ynp/qdxglOaNZcztJCRSyMmp3/lRgRq4hH1rLub0ptCbK3bv141RZ6xCPnS
 60b2aqscV/aABcdLvPAFvCi1BWDEbmlc00T/NAC8r5gm65AXh7AdtK75nsrcECamUVmJl5Oni+J
 HIjLV4YVL3ljHVFe0/WYSifMBntr3biR23vF+KWb3T6X/Nw8QA688ED3B7HhUuvy3+f2ESaVbcx
 hIju3h1yDO1QWbRPVwIPVHljC21a4ycJObDtWLISjobrTBLy1zlpCZxf/1G1OF2vqGcE+uXeIgm
 BBirFjuBQEZxseney5Qixf+2KjQ6xrteTHG879hsfdx2kv/Y0SfPoIiVAKd6xHsEHDHn63dBlDJ
 Lie83LX1r6I9Z2sTf0rc
X-Received: by 2002:a05:600c:3b8a:b0:4bb:76d9:f81a with SMTP id
 5b1f17b1804b1-4bb88824fc8mr73166715e9.34.1795181583103; 
 Fri, 20 Nov 2026 05:33:03 -0800 (PST)
Received: from case ([84.199.255.188]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb884a3a3dsm78285585e9.10.2026.11.20.05.33.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2026 05:33:02 -0800 (PST)
From: Pieterjan Camerlynck <pieterjanca@gmail.com>
To: buildroot@buildroot.org
Cc: Pieterjan Camerlynck <p.camerlynck@televic.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Fri, 20 Nov 2026 14:31:30 +0100
Message-ID: <20261120133132.2258440-1-pieterjanca@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/libliftoff: new package
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Pieterjan Camerlynck <p.camerlynck@televic.com>

libliftoff eases the use of KMS planes from userspace: users create
"virtual planes" called layers, set KMS properties on them, and
libliftoff picks hardware planes for these layers if possible. It can
be used by the DRM backend of wlroots.

Its tests are always built and include a mock libdrm made with
shared_library(), which fails on toolchains without dynamic library
support, so depend on !BR2_STATIC_LIBS.

https://gitlab.freedesktop.org/emersion/libliftoff

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Pieterjan Camerlynck <p.camerlynck@televic.com>
---
 DEVELOPERS                         |  1 +
 package/Config.in                  |  1 +
 package/libliftoff/Config.in       | 15 +++++++++++++++
 package/libliftoff/libliftoff.hash |  7 +++++++
 package/libliftoff/libliftoff.mk   | 15 +++++++++++++++
 5 files changed, 39 insertions(+)
 create mode 100644 package/libliftoff/Config.in
 create mode 100644 package/libliftoff/libliftoff.hash
 create mode 100644 package/libliftoff/libliftoff.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index e0a08ac155..4ab49871fe 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2849,6 +2849,7 @@ F:	package/libvips/
 
 N:	Pieterjan Camerlynck <pieterjanca@gmail.com>
 F:	package/libdvbpsi/
+F:	package/libliftoff/
 F:	package/mraa/
 F:	package/synergy/
 
diff --git a/package/Config.in b/package/Config.in
index 3d7c601df2..ef2988eec1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1806,6 +1806,7 @@ menu "Graphics"
 	source "package/libgtk3/Config.in"
 	source "package/libgtk4/Config.in"
 	source "package/libjxl/Config.in"
+	source "package/libliftoff/Config.in"
 	source "package/libmediaart/Config.in"
 	source "package/libmng/Config.in"
 	source "package/libpng/Config.in"
diff --git a/package/libliftoff/Config.in b/package/libliftoff/Config.in
new file mode 100644
index 0000000000..c5e0d82427
--- /dev/null
+++ b/package/libliftoff/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_LIBLIFTOFF
+	bool "libliftoff"
+	depends on !BR2_STATIC_LIBS # test/libdrm_mock shared library
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm
+	select BR2_PACKAGE_LIBDRM
+	help
+	  libliftoff eases the use of KMS planes from userspace.
+	  Users create "virtual planes" called layers, set KMS
+	  properties on them, and libliftoff picks hardware planes for
+	  these layers if possible.
+
+	  https://gitlab.freedesktop.org/emersion/libliftoff
+
+comment "libliftoff needs a toolchain w/ threads, dynamic library"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/libliftoff/libliftoff.hash b/package/libliftoff/libliftoff.hash
new file mode 100644
index 0000000000..09a3020b84
--- /dev/null
+++ b/package/libliftoff/libliftoff.hash
@@ -0,0 +1,7 @@
+# Locally calculated after checking pgp signature
+# https://gitlab.freedesktop.org/emersion/libliftoff/-/releases/v0.5.0/downloads/libliftoff-0.5.0.tar.gz.sig
+# with key 34FF9526CFEF0E97A340E2E40FDE7BE0E88F5E48 "Simon Ser <contact@emersion.fr>"
+sha256  e29af0c9dc765916c1f192f118efffc947af6600178b04d5bccca1901246f83b  libliftoff-0.5.0.tar.gz
+
+# Hashes for license files:
+sha256  9b230152f28fc7898665f40da7c311a1bf238a68b12cc39d9c83bbfc117a7b6b  LICENSE
diff --git a/package/libliftoff/libliftoff.mk b/package/libliftoff/libliftoff.mk
new file mode 100644
index 0000000000..621b2aa8af
--- /dev/null
+++ b/package/libliftoff/libliftoff.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# libliftoff
+#
+################################################################################
+
+LIBLIFTOFF_VERSION = 0.5.0
+LIBLIFTOFF_SITE = https://gitlab.freedesktop.org/emersion/libliftoff/-/releases/v$(LIBLIFTOFF_VERSION)/downloads
+LIBLIFTOFF_LICENSE = MIT
+LIBLIFTOFF_LICENSE_FILES = LICENSE
+LIBLIFTOFF_INSTALL_STAGING = YES
+LIBLIFTOFF_DEPENDENCIES = host-pkgconf libdrm
+LIBLIFTOFF_CONF_OPTS = -Dwerror=false
+
+$(eval $(meson-package))
-- 
2.56.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
