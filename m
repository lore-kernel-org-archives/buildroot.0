Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75029606A31C
	for <buildroot@archiver.kernel.org>; Fri, 13 Nov 2026 12:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=PCZ2yEnL;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=voEmmQa7
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4CFD481770;
	Fri, 13 Nov 2026 12:12:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xdNZqaK_a7h5; Fri, 13 Nov 2026 12:12:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 33E88818AC
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794571973;
	b=MIu0GEXpIXYLwI0Zhi7jHkuPrRetpSTFMkTohoMtdvgJiQc73peZubjx7mIK/f9XyCzb
	 1Ti5boi+8T7BFjsw1qetGfuQpoE8F//JJ50K8fvYpWaV14KjUqGXLQ/cBH8T45oZgOJpY
	 sBgpxP2KmhxTCcg8gbMtJKMZnMv0WZyxpaY+c1hS13PDAdTFzKjqHlNitK7tPJWYJVX9A
	 0cxbgEMmeVPrqSrHCbb+YzmEhwUB8TkBG2J7a4ZoUIUkE4HsEo2qWGGUJuuYKNoMPSPRI
	 1UqAgUzfO/66sHGLw61Htu4pJbTRDkp8YGYTpwOtntSXXlNcT086DVA6Ol3EgHfChVA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794571973;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=awrkA5Q1OL8k0F+On1nBPfS9Rqag8naS+BJZKotJYTs=;
	b=VLRq6TVYru3cIUqHS6dczBFXoqd+Xq1dssqxULvWwjln4lUaxTQh+IuwLlGmvqumN7Ci
	 +EhKBo7RCbGqDvdX+3J2x/5V//ELF8BVVXgPNO/d8TzeOWmsLweE+pi2ZG8RThWwqQBxR
	 TmClC1T1ohXFK8hnCUPfCrG8lBsanU5dsmP6qYARNtQnXtnrN12VtRnX0GE+p9uRoZTv4
	 GSP4xjhNHOIbrKLpFwUb4vuw/o/SumNDJqDy1e6cUuLW/QWKiv96LeDXl8S248QPFxVIs
	 qUm1n73QfOpx6jUxs16vzE9RYKYSqaa6mfmGOxCwsF14qu7uR1j4by5ZVM0omoQAbKg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794571973;
	bh=awrkA5Q1OL8k0F+On1nBPfS9Rqag8naS+BJZKotJYTs=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PCZ2yEnLEDjk3a1AOeOaEl9WPehBcat87rziEodtUDeLod1Dm9bTsCJxQbP4B7cPN
	 rI5fNScmtFHv95+CvAHMjemlnFWvBY/ljNozJJocR+aPLXmeHv9/GH9CotC23Saumr
	 J6xAuqAE4JUXH0LkEh3vfQLty6oeedHA5TlYvxvkjVlhU4TGwp2fjFt2tb0IUYlzi/
	 oBy2On+zdRIhYJyYYGjyxviCKVMl5m5Rw5uwB/9m/wS7S986TE4lImJopFOf0Q4i07
	 lYN2yfbWX5MagLIlQDwUhX2zR1GaMdQTY/Mr5niAdLqYOKcvEtx3Wslxr+KN+NpzG9
	 P+NvFRZP2e6Jw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33E88818AC;
	Fri, 13 Nov 2026 12:12:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A3A2235
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 12:12:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7BF69404EE
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 12:12:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OUkeHIKuIvAR for <buildroot@buildroot.org>;
 Fri, 13 Nov 2026 12:12:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 43D4D404EB
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::42b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=pieterjanca@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=voEmmQa7
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 43D4D404EB
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 12:12:49 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-48e09aa5264so369674f8f.2
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 04:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794571967; x=1795176767; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=wF0qTvbaCHjCqdr892malRi80YjmNPu2QhuyicGGBt0=;
 b=voEmmQa7eBJfy1AOhlHB25I4ZIZbHhlGJeCAGaFadKPeZjNVe0UyMgaSIB72pRCeDT
 XjUvuxEH1/NqZYKCVgnuwDi2RBHAYGzwrcIpufBELQcu0Dy65ndmfrDaRQVOHUXzUCoR
 PiVM17kDj5In5OXPPOuwTz9h6A0De1QWrOj5l+PdiP1CdVdYAptCs6+xlz4SX68AdRu0
 76XkY7Y612JLVPZoWhXuMkoiw+xVpdLyQzBs6B548mirW3dWDf59n8n5SqfqkzrQH8mJ
 hl/5MOaH9s5bLsvtNpZ/P7SzflaoiCVgfaN3iBpJr2kOiukddc8ZPdSQogUDoqsPXHyd
 R4qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794571967; x=1795176767;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=wF0qTvbaCHjCqdr892malRi80YjmNPu2QhuyicGGBt0=;
 b=Xoo4iZzDkRxe3dfD1maCedzkyemchl2ySKXS23BKhcmJ2y3sShU9KJnxBQaLAhZe8Q
 Rn2qalSJwSnOudIiG5zqXVcA7Ze8EuuZTUjuuC3nozebB+WjTWJoW9e46+7G3jy45PVA
 AjL9F3prKKS3YqM/LMiZVTm8Cqb/bpihXaPf7eQIWkTpldZlDK+5Ty6b7zbA+CVPQLsD
 bEB0zTMuiRWKvj44HcjgYHeiXUqK4L6u4HI9doUk2NeSdJqJWSt5XJPPoqAzhQM/+1MP
 7jFfWPux1KKDgqu6DmbbBGI4TAwdzBJDNZ+NWPo524dsBQYIkJDTLksasq7SSZMFxLlC
 ZC8Q==
X-Gm-Message-State: APuU4Z8qqLP4Gb2etFeT/sHm2f3OAidEcH0KEgyngsjdWyA/ywWk2TFw
 +gJz9adXD5F/PQNvYini6UpMC1hM/fgcUrMfDQ4fIiWbVNRpuYSYb6PZ+S3K
X-Gm-Gg: AYBFou127T3686YuEQjQgWDyU87/8MSKDLA/XcpNJ2N+ZElSp/P95aC/+1kXRrp6kLY
 rzQG5Yispye/DvBdBuySvkWkz3Fl4s6zCfRdIEMlDF6DROBc2NZAZSYJohKF9NWfGorHA+pETji
 NpPx2iqoz3NSplmEuqJwus3RM2N4ebsSX9jVhY+p4LFQGbrXWBNTMCwvN2ocXpibAKbEk1D81Ge
 HLJNirg5cHCYQ2Z8tTziY4vq43nxnT7Mc3hay8hI2wt33o5QzKvwa67O6ybNLp4TTBy57mNpV3e
 8z1zcJaeiupRymPxkDCrk2PeB/Fi6f3Kd9r9TbaS3LXQCIJE3SFSbcvkO7lJpY4wFMHKHwkwJYF
 OOk9xLpu9X8tw2fLnryEWJZPD/2PBJlrv+U0nrp5Pjxdm27xlAeWVPUC1u9GFZ4sWZX/q/wQzQ1
 b8tFL4EweSoryySRmlc/3u1AcMlZ/p9fV/lCyWLojjUS/eRcdSiLcNRQcNX0m3jR2HeADmYHPPR
 sP+WjKF+qfF27xYB4kpfmkbfUQQ4kFQbBuZptxjamiUqBGXlpwie33sdn3jLU9l5dKj+Gsm0osp
 FruesUrOC7Sl79nxTD9J
X-Received: by 2002:a05:6000:455c:b0:48f:bcf0:2026 with SMTP id
 ffacd0b85a97d-49c73259e6bmr3452152f8f.13.1794571967280; 
 Fri, 13 Nov 2026 04:12:47 -0800 (PST)
Received: from case ([84.199.255.188]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c605e4a2asm5111493f8f.39.2026.11.13.04.12.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 04:12:46 -0800 (PST)
From: Pieterjan Camerlynck <pieterjanca@gmail.com>
To: buildroot@buildroot.org
Cc: Pieterjan Camerlynck <p.camerlynck@televic.com>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Date: Fri, 13 Nov 2026 13:12:42 +0100
Message-ID: <20261113121243.1249931-1-pieterjanca@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/thermald: bump to version 2.5.13
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Pieterjan Camerlynck <p.camerlynck@televic.com>

- xz is not needed since version 2.5.7
- dbus-glib is not needed since version 2.5.8, so add libglib2, which
  is now used directly

Add a backported upstream patch to fix the build on 32-bit with a
64-bit time_t (e.g. i686 musl), where -Werror turns a printf format
warning introduced after 2.5.6 into an error.

https://github.com/intel/thermal_daemon/blob/v2.5.13/README.txt

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Pieterjan Camerlynck <p.camerlynck@televic.com>
---
 ...ring-formatting-for-state_entry_time.patch | 34 +++++++++++++++++++
 package/thermald/Config.in                    |  7 ++--
 package/thermald/thermald.hash                |  2 +-
 package/thermald/thermald.mk                  |  7 ++--
 4 files changed, 41 insertions(+), 9 deletions(-)
 create mode 100644 package/thermald/0001-Fix-string-formatting-for-state_entry_time.patch

diff --git a/package/thermald/0001-Fix-string-formatting-for-state_entry_time.patch b/package/thermald/0001-Fix-string-formatting-for-state_entry_time.patch
new file mode 100644
index 0000000000..1548d56210
--- /dev/null
+++ b/package/thermald/0001-Fix-string-formatting-for-state_entry_time.patch
@@ -0,0 +1,34 @@
+From 506dcaf8d5ca99b626ea7ddf35f4a5f0ff71ff4c Mon Sep 17 00:00:00 2001
+From: Lucas de Castro Borges <lucas@gnuabordo.com.br>
+Date: Tue, 22 Sep 2026 18:01:06 -0300
+Subject: [PATCH] Fix string formatting for state_entry_time
+
+state_entry_time is time_t data type, time_t has changed the
+data size to 64bits due to year 2038 problem, then to avoid string format
+issue the type had been casted to intmax_t and switch from long(l) to
+intmax_t(j) because long has the minimum size of 32bits and the mininum size
+for time_t is 64bits.
+
+Signed-off-by: Lucas de Castro Borges <lucas@gnuabordo.com.br>
+Upstream: https://github.com/intel/thermal_daemon/commit/506dcaf8d5ca99b626ea7ddf35f4a5f0ff71ff4c
+Signed-off-by: Pieterjan Camerlynck <p.camerlynck@televic.com>
+---
+ src/thd_gddv.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/thd_gddv.cpp b/src/thd_gddv.cpp
+index dc82eb3..303f786 100644
+--- a/src/thd_gddv.cpp
++++ b/src/thd_gddv.cpp
+@@ -1738,7 +1738,7 @@ int cthd_gddv::evaluate_condition(struct condition& condition) {
+ 			return ret;
+ 
+ 		if (condition.time) {
+-			thd_log_debug("time condition matched %ld \n", condition.state_entry_time);
++			thd_log_debug("time condition matched %jd\n", (intmax_t)condition.state_entry_time);
+ 			if (condition.state_entry_time == 0) {
+ 				condition.state_entry_time = time(nullptr);
+ 				return THD_ERROR;
+-- 
+2.56.0
+
diff --git a/package/thermald/Config.in b/package/thermald/Config.in
index 353ce31a7a..19cf7cde0d 100644
--- a/package/thermald/Config.in
+++ b/package/thermald/Config.in
@@ -4,15 +4,14 @@ config BR2_PACKAGE_THERMALD
 	depends on BR2_USE_MMU # uses fork()
 	depends on BR2_USE_WCHAR # upower -> libgudev
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus-glib -> glib2, dbus, upower
-	depends on BR2_USE_WCHAR # dbus-glib -> glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2, dbus, upower
+	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_PACKAGE_HAS_UDEV # upower
 	select BR2_PACKAGE_DBUS
-	select BR2_PACKAGE_DBUS_GLIB
 	select BR2_PACKAGE_LIBEVDEV
+	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_UPOWER
-	select BR2_PACKAGE_XZ
 	help
 	  Thermal Daemon is a Linux daemon for monitoring and
 	  controlling platform temperatures. Once the system temperature
diff --git a/package/thermald/thermald.hash b/package/thermald/thermald.hash
index fff5ae6284..a158cc8365 100644
--- a/package/thermald/thermald.hash
+++ b/package/thermald/thermald.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  e5a452624f133d71f4aff0bd0c8f8258399a5ae1a7d5aea177fa6a6e33dad1fd  thermald-2.5.6.tar.gz
+sha256  5456f60aed52e9a14f88dde9b2e2875e5e3d0cc3d1e7bf742d7ea4b22ff6a995  thermald-2.5.13.tar.gz
 sha256  e98be8bc482e038a14bfbc01caf800bbd0024fff275ef14cd999db6560254a8d  COPYING
diff --git a/package/thermald/thermald.mk b/package/thermald/thermald.mk
index 4e3d897bf3..f06271c850 100644
--- a/package/thermald/thermald.mk
+++ b/package/thermald/thermald.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-THERMALD_VERSION = 2.5.6
+THERMALD_VERSION = 2.5.13
 THERMALD_SITE = $(call github,intel,thermal_daemon,v$(THERMALD_VERSION))
 # fetched from Github, with no configure script
 THERMALD_AUTORECONF = YES
@@ -13,11 +13,10 @@ THERMALD_DEPENDENCIES = \
 	$(TARGET_NLS_DEPENDENCIES) \
 	host-autoconf-archive \
 	dbus \
-	dbus-glib \
 	libevdev \
+	libglib2 \
 	libxml2 \
-	upower \
-	xz
+	upower
 # tools are GPL-3.0+ but are not added to the target
 THERMALD_LICENSE = GPL-2.0+
 THERMALD_LICENSE_FILES = COPYING
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
