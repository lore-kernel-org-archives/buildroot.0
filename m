Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F03AC982D0
	for <buildroot@archiver.kernel.org>; Thu, 17 Sep 2026 19:17:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8379980906;
	Thu, 17 Sep 2026 19:17:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 98_vSucZ6QnF; Thu, 17 Sep 2026 19:17:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org A36E480962
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789672650;
	b=GWdqcbPo1yLRnVhhQFT2GE1MCj/Z3eLEoxzWJTHsljfMmDqdoX5XBdDTzP84sto4ll7b
	 sVzF//qujN/q20oTdD32hPWF7YekA6rf1btoZCYGIeKbmOBZm99YI87svuX++aWavONXx
	 RF1Si3zyTU4MlInls8TMqFc8KdPfvTvC60pqAXR+UJA2DsQNqJblbStYUGDj2iIi2uc0P
	 Mltb/c4cLgaGjv+D29Ak/Nano9SuQNmIR7k+sCkd+C9j8KaJh1CFLGs+MjFi8MpieROdO
	 JZvAwcaJvd3oFO6ZzOtIjAbexdPzS4Sv4RqNJbV64uIWxt92cicgAth7uYujtT8G/kA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789672650;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=7QCKIroQetzSNHpiDDBrpzqLapmZNnmQdrCC0iPE9ck=;
	b=a4eRHvr28zIy95PHNFuB79lHcFoq/M8dawnvVzzqwrCSwLFkOfxc+FwcU16J9E4PtZaS
	 al6LohULguBhBQbjv03U5ezZ7WRKbYuWOMQjbqlIOy+aro2u+grFw/HhW2Gbg8tIbgX80
	 JJUGipkG93Crh9ay55EtYEE5ej9OGK/qE74An+6NQin99J3iLRkoFL7YYltMUgzipqbDB
	 nbK9Z1i7hTZkjeqjvc0jiU3RyYs+dPyDIaccGQ0bCm2+tHqcbofn0GUBdrLxNY4LdpHCI
	 0J/4wiWGBv5HihtiHt2pvoNnheZANi3NGFZeA3wHdvJN8EhZqiEHqgq6qvkiAWBOQEw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789672650;
	bh=7QCKIroQetzSNHpiDDBrpzqLapmZNnmQdrCC0iPE9ck=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=raN6+mnvmjP37k4FjoYKU2dojg2hAMz+EmkJ6O027UH4PctDzbTln2iYGPVFMrUNH
	 icmLNeqbO79ZihlEs09iZduRnmwKpZvLmHdVBf6sAUHwBggJBmI+0yWvm9Y7VSxR59
	 HeSeoeij4dQTY7GlXB+DWOmygOXmbp5LpJPudfjO8UESu72e3hDblr+OOUjnka7S4m
	 GAow+vmOqSMXm2YEXSS6xd289C6aJDkJN1J6a/dvQUWnpAfI1VrgUeO8idE1S7Ewuu
	 JODJAOO8048vpog8mPsP1ThsUs7E+T7mdLNcRK4LY6GT+sLiDibL5XRELa7BYAzlxV
	 bTHzBpOqzF7dA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A36E480962;
	Thu, 17 Sep 2026 19:17:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 70ACE362
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 19:17:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E0D6605DE
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 19:17:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wut_in5bHlPv for <buildroot@buildroot.org>;
 Thu, 17 Sep 2026 19:17:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 27BCD605CF
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789672648;
 b=jsezRk3Mz6FdbqQpOCb/e9CnQD8qQ81nnRW3OmFfd7iwBEj9m+CCC5nRo5qsJM9r/piK
 ZC8aArjN6gbRD58snvNNv4EWgmrQTmGRQzIldD7RvaLm7LlPKgZffLb7Y3jF6WoYAcSNL
 eofLJJyuiD3zuTVRPS9xpBps13j27Vrnk29Wrpg5/9yqqeJR42qqKw4MgqXcE79L3y9zH
 jF+jdhwxuA2Jp3zVlgI5eU/lBboJboWYyJT6ZRNkip5pF+8mxGZu1nh877NxLc/Nkf4VI
 a4H3IFC4IG2YuYKXHowhuYayEJ2e8gouY7SRP30gUYKNMl+auJhPZaekq1nhoSA7JTg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789672648;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=lgILPFKS5bMH4LZCoJoB++0kWU6rlAhtZ92I9gUSuZo=;
 b=DJw5UnljD/dHrUrTy+H2WrkDAP3sSoLFlT6v2skVADW4xiiHBdxkNlQbnDUDUHsrO6jo
 cuT3U98TiSA7WbGluw0hDrrnBvZBxdAxfPSo1zoZHyloDrDN5SkEiznymeB9O4svZ/hUf
 239tII/mcgXdVTPWOLmZpReinRvWZ9x7ibEXUCxav6KQ5s5Dknqmd7YzTDtbAjXm+s4yF
 f5eAn7wgdmE9d3d/w5h9IDWnNZU4sLyPRg7KN2+Pb3Tx5L9h2MbuQEp9rCpT75MdR+6sw
 7R9M288ZuzNoDSrKgRZJtQbeEIpJxtsGRanjkQy0HhmIVVIjEJoT4HAInhXexXDSn7Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=IdN5yEN1; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::11; helo=mail-wm2-x11.google.com;
 envelope-from=fractalclone@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=IdN5yEN1
Received: from mail-wm2-x11.google.com (mail-wm2-x11.google.com
 [IPv6:2a00:1450:4864:31::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 27BCD605CF
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 19:17:27 +0000 (UTC)
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49e620fa473so7331345e9.1
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 12:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789672646; x=1790277446; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=lgILPFKS5bMH4LZCoJoB++0kWU6rlAhtZ92I9gUSuZo=;
 b=IdN5yEN1qBcE1GtTJNayN31JjRf8iE7DTl9KX9fLqjuqRJ6teMAUagXr5egwstz81y
 sPope+o/+ph/uH8a4xIPY/gKJbsVYhMbKqNdOgSp0JtUiL8+5IgT2KFFt4TvzdY1ToMy
 +EGYrHS6SPAfwg0s01a+K0PXlCIqur0NlLXqZNqgkc2MkWEYj6ZDLREceWW8f4RhHMEx
 XB4tuGiQ7LLQ3TVNsBk8fhEczsk196EhJtqmayXHXPGcoQA1UVmHNJh0bTSgUgsxyqnY
 1M4ivJhlNivp3lHbfF4E/0IShPn5SXSIfqpnrwbkVqzvBfqZhcswOGu2sFQIYZPLPKuk
 YeZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789672646; x=1790277446;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=lgILPFKS5bMH4LZCoJoB++0kWU6rlAhtZ92I9gUSuZo=;
 b=J4SESs6OCyOtpaGarhbHHuyUyFF+hHMXvbtn7RclGbS9wSDjBQSgpdQMoISMFcHTOR
 BLLLZcbpxj0UNCqa2wjQiSMxET10alJv3fbqmZ20TlyidseESvcWuLoHETRuS89GlTOP
 dPlmYVNxoDuEpYJqk1keyZXZ2yTRyQFLbbbEKPVSG8Bcq8pMM9dMKq+yMKOcKC28c0On
 fl/PnoMVVwmUAk5RA4RkoAzgKf9TIfW/fzdWgG7k3xWnm+R5ydeulA5BC5GUHJp2snlg
 jrWqBE2BhOPH4WcMbJCblb8C7dXf7x6SO+fMeli88walfPX5mIP7Uo6d8f+/4+q1Y2fg
 OtYA==
X-Gm-Message-State: AFuF++n6VWQM9UL19G/6PqvOZFKEv2PgI04h+fGhpBMuh92tKCqqT7TN
 oqXuhSWtqB3JvcJAmTFPYcIXx17hzKrWwJZTcFi2oiU39U/1RAAznmlw31VTKHsL
X-Gm-Gg: AYBFou2T6PsR/fKtu9mWBCcGZtdzk6WidKo9/IRJyMb19utq/9L1xG9YUge4Iii/i3D
 f1PUHsUNV3S05IJXUy+dltS0CJJ2x9+pyNtQ2+IPf5p0QkHOlAEG93ra52UhBY5CHTR7LX1YWbG
 1E2CTIE4YMWcI5fj50MUv2Ycy6vwGBbgTP5w13OWmtDvuQtqKO7hTHniwL5KN0DrADejV5ysH31
 BmfglPL/jebo9YYVxNZDbKg+enIuwpx2DqQVHFBl2soFnaqJTrnalXVApHOH50uWd0+k0sV/jgP
 bHpF9CyiEAUga0//rOljgY+vDlopMgqBVYC12mZvPNwolri28uuvMwtPrEssmbM9Rj/hfTw9j4H
 RvbY3CZ+MqbqVdVRIwMmDiw7/UKA1YImHAO4VFz0bJV0wGESX/bHS3Qe7Y2H494Q6f/mGVcBv2c
 GTrbklLsBRXn0APKvUYWkplBSmJwwN+8DrnnTnLCUaSL1bi4PuHJre7h0M+B+EQXNv6Q==
X-Received: by 2002:a05:600c:1c1d:b0:49c:fc6c:be08 with SMTP id
 5b1f17b1804b1-49eb733de1emr122115025e9.31.1789672645369; 
 Thu, 17 Sep 2026 12:17:25 -0700 (PDT)
Received: from fedora ([139.47.34.204]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fbd23a815sm107083065e9.14.2026.09.17.12.17.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2026 12:17:24 -0700 (PDT)
From: Jean-Paul Etienne <fractalclone@gmail.com>
To: buildroot@buildroot.org
Cc: Jean-Paul Etienne <fractalclone@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 17 Sep 2026 21:17:15 +0200
Message-ID: <20260917191717.2471859-1-fractalclone@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/3] package/rockchip-rkdeveloptool: new host
 package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

rkdeveloptool is an open-source command-line tool
used to communicate with Rockchip devices over USB
for flashing firmware, reading and writing flash storage
and debugging.

Signed-off-by: Jean-Paul Etienne <fractalclone@gmail.com>
---
 DEVELOPERS                                      |  3 +++
 package/Config.in.host                          |  1 +
 package/rockchip-rkdeveloptool/Config.in.host   |  9 +++++++++
 .../rockchip-rkdeveloptool.hash                 |  5 +++++
 .../rockchip-rkdeveloptool.mk                   | 17 +++++++++++++++++
 5 files changed, 35 insertions(+)
 create mode 100644 package/rockchip-rkdeveloptool/Config.in.host
 create mode 100644 package/rockchip-rkdeveloptool/rockchip-rkdeveloptool.hash
 create mode 100644 package/rockchip-rkdeveloptool/rockchip-rkdeveloptool.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 0a6d4e455e..6d69fd4663 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1616,6 +1616,9 @@ F:	configs/orangepi_pc2_defconfig
 N:	Jean Burgat <jeanburgat33@gmail.com>
 F:	package/openfpgaloader/
 
+N:	Jean-Paul Etienne <fractalclone@gmail.com>
+F:	package/rockchip-rkdeveloptool
+
 N:	Jens Kleintje <scooby22@web.de>
 F:	package/gcnano-binaries/
 
diff --git a/package/Config.in.host b/package/Config.in.host
index 595caf9e7f..9b4b6172db 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -105,6 +105,7 @@ menu "Host utilities"
 	source "package/raspberrypi-usbboot/Config.in.host"
 	source "package/rauc/Config.in.host"
 	source "package/riscv-isa-sim/Config.in.host"
+	source "package/rockchip-rkdeveloptool/Config.in.host"
 	source "package/runc/Config.in.host"
 	source "package/rustc/Config.in.host"
 	source "package/s6-rc/Config.in.host"
diff --git a/package/rockchip-rkdeveloptool/Config.in.host b/package/rockchip-rkdeveloptool/Config.in.host
new file mode 100644
index 0000000000..5f8029bc7d
--- /dev/null
+++ b/package/rockchip-rkdeveloptool/Config.in.host
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_HOST_ROCKCHIP_RKDEVELOPTOOL
+	bool "host rockchip-rkdeveloptool"
+	help
+	  This package contains the Command-line utility used to
+	  communicate with Rockchip devices over USB for
+	  flashing firmware, reading and writing flash storage,
+	  and debugging.
+
+	  https://github.com/rockchip-linux/rkdeveloptool
diff --git a/package/rockchip-rkdeveloptool/rockchip-rkdeveloptool.hash b/package/rockchip-rkdeveloptool/rockchip-rkdeveloptool.hash
new file mode 100644
index 0000000000..6dfec07958
--- /dev/null
+++ b/package/rockchip-rkdeveloptool/rockchip-rkdeveloptool.hash
@@ -0,0 +1,5 @@
+# Locally computed
+sha256  84f6e7876f1ea3c8d9dcb905a50a48d6d83439439898d06b054d2e8752de1456  rockchip-rkdeveloptool-304f073752fd25c854e1bcf05d8e7f925b1f4e14-git4.tar.gz
+
+# License file
+sha256  1be990a929b50ca91d815cea1cd3cebb5c49e86076ade82b1103f2b9cd71a3af  license.txt
diff --git a/package/rockchip-rkdeveloptool/rockchip-rkdeveloptool.mk b/package/rockchip-rkdeveloptool/rockchip-rkdeveloptool.mk
new file mode 100644
index 0000000000..c33b4dcf06
--- /dev/null
+++ b/package/rockchip-rkdeveloptool/rockchip-rkdeveloptool.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# rockchip-rkdeveloptool
+#
+################################################################################
+
+ROCKCHIP_RKDEVELOPTOOL_VERSION = 304f073752fd25c854e1bcf05d8e7f925b1f4e14
+ROCKCHIP_RKDEVELOPTOOL_SITE = https://github.com/rockchip-linux/rkdeveloptool.git
+ROCKCHIP_RKDEVELOPTOOL_SITE_METHOD = git
+ROCKCHIP_RKDEVELOPTOOL_LICENSE = GPL-2.0
+ROCKCHIP_RKDEVELOPTOOL_LICENSE_FILES = COPYING
+
+HOST_ROCKCHIP_RKDEVELOPTOOL_DEPENDENCIES = host-libusb host-pkgconf
+
+HOST_ROCKCHIP_RKDEVELOPTOOL_AUTORECONF = YES
+
+$(eval $(host-autotools-package))
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
