Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17F68C2BD09
	for <buildroot@archiver.kernel.org>; Wed,  3 Jul 2024 14:01:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4984E41809;
	Wed,  3 Jul 2024 14:01:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XXMcv8AjSVHb; Wed,  3 Jul 2024 14:01:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D503417FB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D503417FB;
	Wed,  3 Jul 2024 14:01:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8C9711BF302
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 14:01:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A1AF6084E
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 14:01:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id htlXeZIxY-J7 for <buildroot@lists.busybox.net>;
 Wed,  3 Jul 2024 14:01:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8C5AC6077D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C5AC6077D
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8C5AC6077D
 for <buildroot@buildroot.org>; Wed,  3 Jul 2024 14:01:09 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a70c0349b64so711653366b.1
 for <buildroot@buildroot.org>; Wed, 03 Jul 2024 07:01:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720015267; x=1720620067;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bcuS6PQiiJgQlJcBIKccj8o9HWt9vCy4h4o718A3UQs=;
 b=EoyldQ91m9SFijurd6vei1bgvXqErLt8VrNCswkXuNW/BAYr1Q+JsUZXSuzeVRk0eo
 Vm3jq/8XN7H1wXugbOKFLc6kJkyeep9noMeDFQTx2n6k4upiJzFpOqQmUqGJODMPISvB
 zXYcEUJVLIYY5EjHjZyHyY1Rb3E31s3HcRUD1ZFoc77opcSyiCDb9u8NH5t2ppT2sVqc
 i57W40HLjtvHG+wBxrW/Ds6GvxlstTQutl7l6CGrfLR48n9tRFDsRKw2SJnutWRURG/I
 MPRZChaiqLKuo+ZCmHw2xjJ5DFrqU+8wkrFMyGKjfJLVUfUQp4emrm1Q0EyLITNAuqrK
 Rnyg==
X-Gm-Message-State: AOJu0Yz7iOtXPke08I+PkediljBphyWd3vCyQOVJGBEPO9vNmRqCdCWL
 Qh+5s+tV3DhBUVbRmDNVn9Ls7HIbEnFDOHGda+gOVEBOEJ6x/lJPcNcq0A==
X-Google-Smtp-Source: AGHT+IGwC7JtrYBQhqxaj27kglh06MaZBUve5jfPjgoIKhND22skmEjRdDgUQIhZEtl65yeAc9UV8g==
X-Received: by 2002:a17:906:c798:b0:a72:5967:b3a with SMTP id
 a640c23a62f3a-a751441ea13mr640817666b.22.1720015266506; 
 Wed, 03 Jul 2024 07:01:06 -0700 (PDT)
Received: from hthiery.kontron.local ([213.135.10.150])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a752008272esm314671766b.175.2024.07.03.07.01.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 07:01:05 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Arnout Vandecappelle <arnout@mind.be>, Peter Seiderer <ps.report@gmx.net>,
 Lance Fredrickson <lancethepants@gmail.com>
Date: Wed,  3 Jul 2024 16:00:53 +0200
Message-Id: <20240703140054.3224869-2-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240703140054.3224869-1-heiko.thiery@gmail.com>
References: <20240703140054.3224869-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720015267; x=1720620067; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bcuS6PQiiJgQlJcBIKccj8o9HWt9vCy4h4o718A3UQs=;
 b=gBLro+B6C0b14XSS3PEKBhUjYyEiO1YzIj2WY0PjNsj+1Fe3Ot0IYDFJ57WJEuwK6F
 tMty1RiXGqv5z9KlCqM8wJ1mA6fou5ZWryCMtwq7g0K45llRNkfBz7brK3QncE7pDZj6
 3SKiHjpF/1H06A9o14ukU72rqnQ6Hyz8BmjGJlSeip5g0TJ4OYEMULTZrPq1boLzXpPv
 xFtZ8iQw68kNvTQ9Ms8G4C8MnliYMiai60WRS4ZAhwAUuLLWFbS8pSwrDnfVgiYx+jtZ
 xO6IAIP2M0hg0mhlK55zRQQwM851UKqwSV2rhsku0JPvnTD6WfaoS3YNFarKzHJkJCTz
 gs8Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=gBLro+B6
Subject: [Buildroot] [PATCH 1/3] package/blake3: add new host package
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This package is used and required for ccache update.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 DEVELOPERS                 |  1 +
 package/blake3/blake3.hash |  5 +++++
 package/blake3/blake3.mk   | 20 ++++++++++++++++++++
 3 files changed, 26 insertions(+)
 create mode 100644 package/blake3/blake3.hash
 create mode 100644 package/blake3/blake3.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 6d9fcd97df..0a6a4b9de6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1359,6 +1359,7 @@ F:	configs/kontron_bl_imx8mm_defconfig
 F:	configs/kontron_smarc_sal28_defconfig
 F:	configs/kontron_pitx_imx8m_defconfig
 F:	package/altera-stapl/
+F:	package/blake3/
 F:	package/ipmitool/
 F:	package/libnetconf2/
 F:	package/libyang/
diff --git a/package/blake3/blake3.hash b/package/blake3/blake3.hash
new file mode 100644
index 0000000000..a3ec44a804
--- /dev/null
+++ b/package/blake3/blake3.hash
@@ -0,0 +1,5 @@
+# sha256 computed locally
+sha256  822cd37f70152e5985433d2c50c8f6b2ec83aaf11aa31be9fe71486a91744f37  blake3-1.5.1.tar.gz
+sha256  a6aea7358a30ded3f8abbff979219bdbe7b7a9aa489a8c70030afd96a83caf84  LICENSE_A2
+sha256  80b5112739a423dfac7bed1ca8a1df3cccda3d794425441997d4462b83db4dd5  LICENSE_A2LLVM
+sha256  80b5112739a423dfac7bed1ca8a1df3cccda3d794425441997d4462b83db4dd5  LICENSE_CC0
diff --git a/package/blake3/blake3.mk b/package/blake3/blake3.mk
new file mode 100644
index 0000000000..e94397a0a7
--- /dev/null
+++ b/package/blake3/blake3.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# blake3
+#
+################################################################################
+
+BLAKE3_VERSION = 1.5.1
+BLAKE3_SITE = $(call github,BLAKE3-team,BLAKE3,refs/tags/$(BLAKE3_VERSION))
+BLAKE3_SUBDIR = c
+BLAKE3_LICENSE = Apache-2.0, CC0-1.0
+BLAKE3_LICENSE_FILES = LICENSE_A2 LICENSE_A2LLVM LICENSE_CC0
+
+# We may be a ccache dependency, so we can't use ccache; reset the
+# options set by the cmake infra.
+HOST_BLAKE3_CONF_OPTS += \
+	-DCMAKE_ASM_COMPILER="$(CMAKE_HOST_C_COMPILER)" \
+	-UCMAKE_C_COMPILER_LAUNCHER \
+	-UCMAKE_CXX_COMPILER_LAUNCHER
+
+$(eval $(host-cmake-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
