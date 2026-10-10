Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F18CCA9EC1
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 15:12:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1489A407E5;
	Sat, 10 Oct 2026 15:12:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CIhSn85i2wkE; Sat, 10 Oct 2026 15:11:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8976040931
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791645118;
	b=knXVtErImT6NZvPpbSG9DBQPJHRlDYsb9TNewSzG9citukX+wt9HqborZTx61vQVF0w3
	 oYgP26AjrW62hVWoX15/kzqKawFxHILJkNR/qWMFXLaGUhs6RXg7ZiXJ5tc7GZNbDKZM9
	 LcUS7FDHoFKyjpM2YxazHDcAgaDwPOukQq5+VKeGIoou8ILpB+E4rT7NTF2mFbV/Fxp35
	 wr6DVNe4Ckr1IeVbxOqFaZAwUmmvp28Ki6N7woDCxFeGub78s2zUs0xr0u6Wp9oCyByhI
	 wVBFbfFTdFWN05fnr0lij73l89HRbiGiBD7dA4CFqlBTyNb9rhomKMP4m1CmdGu822g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791645118;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=kKUgJ5/8XQqV3vd/90+EDNsUAYYiTpI6i7Zotsj69Qo=;
	b=KhdwndET6rv7QekrNUeiKD29mge01q22lmCDxm6Arq7d3jtW0iHZ15k0ITUIadadxS62
	 IZaDXf6HrEpIk9GR+x00kY4CscmgGXXGil9VsixFccyk/92Dy1s4QjP4r0J2a3S3zDJUn
	 LlpUMvZXiDuUounwNBZM8JMklwveodklY2P98HZCCxK0roAH9pxoe5kpltuzRLuvXkcCC
	 eerCWKfzCYZPwAUH7wf79e7ASohvLeysrDtXrt2CzS9ON2bCprKXhS7YhFUuMmEdXzbQh
	 E2A0O3ywaQZdUN7OOGx3ihRTyo9nUab/jQWk6owzRVS/a59KcGFhVxPZJYBytY1x7/w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791645118;
	bh=kKUgJ5/8XQqV3vd/90+EDNsUAYYiTpI6i7Zotsj69Qo=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=XQ0NA+zCTDh0MQLMJZhJ5r33F7xZFAePWzVKjXNiJJKzPRRR38THde5QguZujrazW
	 YbQIxddJd9pGgncKzBJJ//qtmO7E6rfS5pYpZi2mrK1VG5Fxi9WdIpAgblGn1xy0UB
	 xmcpsVt8uqlEFnL6ezZ3ALHNs+Nn09Ey+bLT+ALXYv34jKrNay8Scsa2qXGVxfViWR
	 yp/K+ZCEQvnfCM8ZxcXltsHDoPC7OxkebZ0SOQi15Fivc26Z/01DiYF3tK/5dMae+t
	 lE3YXAWJqwtilBSF9MZfoHSfDsMV1MOJeUzmMpcpBjFKZeFC/hhTiHUxOdkDjVLdQr
	 p+Xj2RQ68s3Cg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8976040931;
	Sat, 10 Oct 2026 15:11:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D0B34105
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:11:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD77A81138
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:11:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nutp3VBL9h4q for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 15:11:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6C8CE81128
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791645112;
 b=MaGUfXcSHnXmZJ0JnOpaXa23/a6DTMxVJmks2rWGieObv3Sz8sbXq9N/CK5B6OEK73u9
 hIkqQgggI1+BUSB3Ulap4lKP/+TUKl34T/3Y+nRbeJEBGDtLwNDzscDQrnWLKfDvaXmwm
 fQdSUiyoup1o45ZDM0vd8+02vXYjFZkaq4JcoNw/KBwTFmIo/LMI2L6e8CfExFdUXBMCr
 8Y8w3A/qe1d8wJDfImvUol4CsQfTf3UxNzhO+kYRjLqZxKo9WInx10wd1aKDPaeP46Wsb
 Dnlr3DK9j6yR54sCzrUaoklk4OrkRnae9AiNyRkE2KhYo2v6jJKinglfE+lYSVJDiSw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791645112;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=+dG2vQb/Rq9qyT2RYVm/tzgu7NrqFGqx8E6nz4zdiqk=;
 b=Z0uOUcAydD2DUkOtQ75YX2d1u7nrxFa6EJ7nS2KSNH/7WJov6R8nyNZym9f2KjWzHxev
 HCwUJcfsk7l9qLCLZiIPZG6tGFAMRC6JzvWDVUrynWHMv2hBkvWGE5kun5YHe69j5qIBB
 nHx/OKG0K8Qqro5iBHyMOeEugRLKmyu42+ayhRvj6FbLmU+m26tiSjseSwdb1R4pEC1Ky
 IL7WWpjLZif0RJmjOQsl9JdG8JZHjr5eRo2y40+HEDrsWWRK4fuX3c/4lSor+ZW47bjTZ
 CevIWkLwsYf/8PpS33d4KAxQZsfKJnIvESmYIYj86X6lMm4WPtDnOpF6X0DVadx64sg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=aevPMthC; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6C8CE81128
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:11:50 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4a1880e1bf1so5985805e9.1
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 08:11:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791645109; x=1792249909;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=+dG2vQb/Rq9qyT2RYVm/tzgu7NrqFGqx8E6nz4zdiqk=;
 b=kCvZW9hiBEij/pnsyczy8TbgqaP2HmJMKOKO64M++E+uQbyKpMM7DHlEUvBElbFI7D
 hgYCoomPjYbKu64US9zcSuofYOfuqJVBeWZfa7Nkvhpfw3sGqj/KskjAuCSW4MofiO9h
 WsNomC0jLMyaqVd9ub49w7D8HqT5s6kk0nLJIyQD4clJ8Ny3JxcalUIuTLKVOn8z5gzO
 8Mk2DnLA4qS/uAIFzkVjtcSByNIPaxglBwx3DW75lpKUQSbEHvWYoW7q55LMnibG9qxi
 pxpJw2bF1LK7fpLbxW3/amjzaA+VxCIfyIyQLzLD7DuwqQ0AS7B10Xn2hvnJE2sTKPqH
 d6Og==
X-Gm-Message-State: AFq9FYKBqTdy5DXxxV0KP436CIRMr/dknQwzuyrs9LqgdKf76XcuKpyl
 BxlRSh15VeHzSZqE0Dqpk+FRA/RaciLwgA5Kjh/WN0LlfZAN1yFpgQaPT0+8PL/Zg7jUlna1jY8
 5zOeVJds=
X-Gm-Gg: AYBFou0m6bhdHDecZTueJiB4zwpnddn7nOjGs+LR/8uVWiVFyplmsJL5/h+I4FK1tkI
 xoSmB0Q36+P5IELrfp8bEgE9cxkJGtbDohPgeneyVpKKmrgh0YSNrsgbZERlH12DzEcwmYAp/JA
 2m2yNYxdgzwkTIUJNLEYu44tS3YvK/2sHAk0n5CuasWvlILQdPTU+n0M+o5YPWe90tavvpCmuxq
 PwDB/yWU412uiSsZPa1RvFAmBezIBeqeejuIMsoXtW0RnvWKNsedjcOo5bj69tq4JiAHHPJSvHN
 sad7BpB7zSV9OKdkOWlIsyXA2eXEY1ZWGOS2l8oKq5tcxvdhP39WV/O2RzRrLvNcZ54ronK/LYs
 TYKGREa9BuhxE9+J6cSLNegSjyWoO2YZZoYmikUFFYm17s/2K5g48UHe2Pg+RNL/spCYPAeDdlw
 Z1Feqb7V+UmPq8ZXGOtC6l9dUSBHQEBH9s/3s3ctD2w3RnIXYApwHnuymcWeakNAyPlzNdxSRKS
 w5QaTNjhGbHYNVj47RxfNKi4YyD5M6ovLwTzAPWBQxpMFYtFeGmWMZnpvJsN8grNZQJ5DNYPaeV
 K66CNXrz
X-Received: by 2002:a05:600c:a00c:b0:49f:fe90:de63 with SMTP id
 5b1f17b1804b1-4a18e4e0a3emr101803055e9.28.1791645108552; 
 Sat, 10 Oct 2026 08:11:48 -0700 (PDT)
Received: from dragon.telekom.ip
 (2001-1aeb-401-dd00-a87-9755-c250-f5ef.ip6.tmcz.cz.
 [2001:1aeb:401:dd00:a87:9755:c250:f5ef])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18bb6b3cbsm115104125e9.0.2026.10.10.08.11.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Oct 2026 08:11:48 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 17:11:14 +0200
Message-ID: <20261010151121.876133-3-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261010151121.876133-1-titouan.christophe@mind.be>
References: <20261010151121.876133-1-titouan.christophe@mind.be>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/7] */Config.in: use the new $(VAR) syntax
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Cc: petr.vorel@gmail.com, ps.report@gmx.net, yann.morin@orange.com,
 thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since upstream Linux commit 104daea149 [1], the syntax for Kconfig variable
references requires to enclose them in $(VAR).

Variables whose expansion should be deferred until makefile evaluation
(such as TOPDIR, BASE_DIR, CONFIG_DIR or ARCH) must now be written as
\$(VAR).

Finally, the `option env=` syntax will no longer be supported.
Environment variables are directly expanded in KConfig files.
Therefore, some intermediate variables that were used as "tricks" can be
removed and their usage subsituted with the actual environment variable
they were derived from. This changes the following:
  BR2_VERSION --> BR2_VERSION_FULL
  BR2_HOSTARCH --> HOSTARCH
  BR2_SKIP_LEGACY --> SKIP_LEGACY
  BR2_BASE_DIR --> BASE_DIR
  BR2_HOST_GCC_VERSION --> HOST_GCC_VERSION
  BR2_DEFCONFIG_FROM_ENV --> BR2_DEFCONFIG

Also update the manual to reflect these new conventions

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=104daea149c45cc84842ce77a9bd6436d19f3dd8

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 Config.in                                     | 63 +++++++------------
 Config.in.legacy                              |  6 +-
 docs/manual/customize-outside-br.adoc         | 12 ++--
 linux/Config.ext.in                           |  2 +-
 package/amlogic-boot-fip/Config.in.host       |  2 +-
 package/arm-gnu-toolchain/Config.in.host      |  4 +-
 package/erlang/Config.in                      |  6 +-
 package/flutter-sdk-bin/Config.in.host        |  2 +-
 package/go/Config.in.host                     |  4 +-
 package/go/go-bin/Config.in.host              | 12 ++--
 package/go/go-bootstrap-stage1/Config.in.host |  6 +-
 package/google-breakpad/Config.in.host        | 12 ++--
 package/jpeg/Config.in                        |  2 +-
 package/kvm-unit-tests/Config.in              |  2 +-
 package/luajit/Config.in                      |  4 +-
 package/mono/Config.in                        |  4 +-
 package/nodejs/Config.in.host                 |  8 +--
 package/openjdk/Config.in                     |  4 +-
 package/openssl/Config.in                     |  2 +-
 package/protobuf/Config.in                    | 22 +++----
 package/qt5/qt5webengine/Config.in            |  2 +-
 package/rustc/Config.in.host                  | 16 ++---
 package/sam-ba/Config.in.host                 |  2 +-
 package/supertuxkart/Config.in                |  4 +-
 package/ti-cgt-pru/Config.in.host             |  2 +-
 package/ti-gfx/Config.in                      |  2 +-
 package/wine/Config.in                        |  6 +-
 support/scripts/gen-bootlin-toolchains        |  2 +-
 .../br2-external/detect-bad-arch/Config.in    |  2 +-
 .../br2-external/flat-stacksize/Config.in     |  2 +-
 .../core/test_selinux/br2_external/Config.in  |  2 +-
 .../br2-external/clang-compiler-rt/Config.in  |  2 +-
 .../br2-external/gumbo-parser/Config.in       |  2 +-
 .../package/br2-external/openjdk/Config.in    |  4 +-
 .../package/br2-external/polkit/Config.in     |  2 +-
 .../br2-external/python-pybind/Config.in      |  2 +-
 system/Config.in                              |  4 +-
 toolchain/toolchain-external/Config.in        |  2 +-
 .../Config.in                                 |  2 +-
 .../toolchain-external-arm-aarch64/Config.in  |  2 +-
 .../toolchain-external-arm-arm/Config.in      |  2 +-
 .../toolchain-external-bootlin/Config.in      |  2 +-
 .../Config.in.options                         |  2 +-
 .../Config.in.options                         |  2 +-
 44 files changed, 113 insertions(+), 138 deletions(-)

diff --git a/Config.in b/Config.in
index ac58c685d1..1fa7ea3ca7 100644
--- a/Config.in
+++ b/Config.in
@@ -1,6 +1,6 @@
 #
 
-mainmenu "Buildroot $BR2_VERSION Configuration"
+mainmenu "Buildroot $(BR2_VERSION_FULL) Configuration"
 
 config BR2_HAVE_DOT_CONFIG
 	bool
@@ -17,85 +17,68 @@ config BR2_BROKEN
 
 config BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	bool
-	option env="BR2_HIDE_SECONDARY_TARGET_OPTIONS"
-
-config BR2_VERSION
-	string
-	option env="BR2_VERSION_FULL"
-
-config BR2_HOSTARCH
-	string
-	option env="HOSTARCH"
-
-config BR2_BASE_DIR
-	string
-	option env="BASE_DIR"
+	default y if "$(BR2_HIDE_SECONDARY_TARGET_OPTIONS)" = "y"
 
 # br2-external paths definitions
-source "$BR2_BASE_DIR/.br2-external.in.paths"
-
-# Hidden config symbols for packages to check system gcc version
-config BR2_HOST_GCC_VERSION
-	string
-	option env="HOST_GCC_VERSION"
+source "$(BASE_DIR)/.br2-external.in.paths"
 
 config BR2_HOST_GCC_AT_LEAST_4_9
 	bool
-	default y if BR2_HOST_GCC_VERSION = "4 9"
+	default y if "$(HOST_GCC_VERSION)" = "4 9"
 
 config BR2_HOST_GCC_AT_LEAST_5
 	bool
-	default y if BR2_HOST_GCC_VERSION = "5"
+	default y if "$(HOST_GCC_VERSION)" = "5"
 	select BR2_HOST_GCC_AT_LEAST_4_9
 
 config BR2_HOST_GCC_AT_LEAST_6
 	bool
-	default y if BR2_HOST_GCC_VERSION = "6"
+	default y if "$(HOST_GCC_VERSION)" = "6"
 	select BR2_HOST_GCC_AT_LEAST_5
 
 config BR2_HOST_GCC_AT_LEAST_7
 	bool
-	default y if BR2_HOST_GCC_VERSION = "7"
+	default y if "$(HOST_GCC_VERSION)" = "7"
 	select BR2_HOST_GCC_AT_LEAST_6
 
 config BR2_HOST_GCC_AT_LEAST_8
 	bool
-	default y if BR2_HOST_GCC_VERSION = "8"
+	default y if "$(HOST_GCC_VERSION)" = "8"
 	select BR2_HOST_GCC_AT_LEAST_7
 
 config BR2_HOST_GCC_AT_LEAST_9
 	bool
-	default y if BR2_HOST_GCC_VERSION = "9"
+	default y if "$(HOST_GCC_VERSION)" = "9"
 	select BR2_HOST_GCC_AT_LEAST_8
 
 config BR2_HOST_GCC_AT_LEAST_10
 	bool
-	default y if BR2_HOST_GCC_VERSION = "10"
+	default y if "$(HOST_GCC_VERSION)" = "10"
 	select BR2_HOST_GCC_AT_LEAST_9
 
 config BR2_HOST_GCC_AT_LEAST_11
 	bool
-	default y if BR2_HOST_GCC_VERSION = "11"
+	default y if "$(HOST_GCC_VERSION)" = "11"
 	select BR2_HOST_GCC_AT_LEAST_10
 
 config BR2_HOST_GCC_AT_LEAST_12
 	bool
-	default y if BR2_HOST_GCC_VERSION = "12"
+	default y if "$(HOST_GCC_VERSION)" = "12"
 	select BR2_HOST_GCC_AT_LEAST_11
 
 config BR2_HOST_GCC_AT_LEAST_13
 	bool
-	default y if BR2_HOST_GCC_VERSION = "13"
+	default y if "$(HOST_GCC_VERSION)" = "13"
 	select BR2_HOST_GCC_AT_LEAST_12
 
 config BR2_HOST_GCC_AT_LEAST_14
 	bool
-	default y if BR2_HOST_GCC_VERSION = "14"
+	default y if "$(HOST_GCC_VERSION)" = "14"
 	select BR2_HOST_GCC_AT_LEAST_13
 
 config BR2_HOST_GCC_AT_LEAST_15
 	bool
-	default y if BR2_HOST_GCC_VERSION = "15"
+	default y if "$(HOST_GCC_VERSION)" = "15"
 	select BR2_HOST_GCC_AT_LEAST_14
 
 # When adding new entries above, be sure to update
@@ -222,21 +205,17 @@ config BR2_TAR_OPTIONS
 
 endmenu
 
-config BR2_DEFCONFIG_FROM_ENV
-	string
-	option env="BR2_DEFCONFIG"
-
 config BR2_DEFCONFIG
 	string "Location to save buildroot config"
-	default BR2_DEFCONFIG_FROM_ENV if BR2_DEFCONFIG_FROM_ENV != ""
-	default "$(CONFIG_DIR)/defconfig"
+	default "$(BR2_DEFCONFIG)" if "$(BR2_DEFCONFIG)" != ""
+	default "\$(CONFIG_DIR)/defconfig"
 	help
 	  When running 'make savedefconfig', the defconfig file will be
 	  saved in this location.
 
 config BR2_DL_DIR
 	string "Download dir"
-	default "$(TOPDIR)/dl"
+	default "\$(TOPDIR)/dl"
 	help
 	  Directory to store all the source files that we need to fetch.
 	  If the Linux shell environment has defined the BR2_DL_DIR
@@ -250,7 +229,7 @@ config BR2_DL_DIR
 
 config BR2_HOST_DIR
 	string "Host dir"
-	default "$(BASE_DIR)/host"
+	default "\$(BASE_DIR)/host"
 	help
 	  Directory to store all the binary files that are built for the
 	  host. This includes the cross compilation toolchain when
@@ -708,7 +687,7 @@ endchoice
 
 config BR2_PACKAGE_OVERRIDE_FILE
 	string "location of a package override file"
-	default "$(CONFIG_DIR)/local.mk"
+	default "\$(CONFIG_DIR)/local.mk"
 	help
 	  A package override file is a short makefile that contains
 	  variable definitions of the form <pkg>_OVERRIDE_SRCDIR, which
@@ -1025,4 +1004,4 @@ source "package/Config.in.host"
 source "Config.in.legacy"
 
 # br2-external menus definitions
-source "$BR2_BASE_DIR/.br2-external.in.menus"
+source "$(BASE_DIR)/.br2-external.in.menus"
diff --git a/Config.in.legacy b/Config.in.legacy
index 9ba6ab243e..0e4fb469b2 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -90,11 +90,7 @@
 #
 # [End of example]
 
-config BR2_SKIP_LEGACY
-	bool
-	option env="SKIP_LEGACY"
-
-if !BR2_SKIP_LEGACY
+if "$(SKIP_LEGACY)" = ""
 
 config BR2_LEGACY
 	bool
diff --git a/docs/manual/customize-outside-br.adoc b/docs/manual/customize-outside-br.adoc
index 8a76f3a998..ab9557923b 100644
--- a/docs/manual/customize-outside-br.adoc
+++ b/docs/manual/customize-outside-br.adoc
@@ -154,8 +154,8 @@ The main usage of this is to store package recipes. The recommended way
 to do this is to write a +Config.in+ file that looks like:
 
 ----
-source "$BR2_EXTERNAL_BAR_42_PATH/package/package1/Config.in"
-source "$BR2_EXTERNAL_BAR_42_PATH/package/package2/Config.in"
+source "$(BR2_EXTERNAL_BAR_42_PATH)/package/package1/Config.in"
+source "$(BR2_EXTERNAL_BAR_42_PATH)/package/package2/Config.in"
 ----
 
 Then, have an +external.mk+ file that looks like:
@@ -244,10 +244,10 @@ illustration, of course):
   |     `----
   |
   |- Config.in
-  |     |source "$BR2_EXTERNAL_BAR_42_PATH/toolchain/toolchain-external-mine/Config.in.options"
-  |     |source "$BR2_EXTERNAL_BAR_42_PATH/package/pkg-1/Config.in"
-  |     |source "$BR2_EXTERNAL_BAR_42_PATH/package/pkg-2/Config.in"
-  |     |source "$BR2_EXTERNAL_BAR_42_PATH/package/my-jpeg/Config.in"
+  |     |source "$(BR2_EXTERNAL_BAR_42_PATH)/toolchain/toolchain-external-mine/Config.in.options"
+  |     |source "$(BR2_EXTERNAL_BAR_42_PATH)/package/pkg-1/Config.in"
+  |     |source "$(BR2_EXTERNAL_BAR_42_PATH)/package/pkg-2/Config.in"
+  |     |source "$(BR2_EXTERNAL_BAR_42_PATH)/package/my-jpeg/Config.in"
   |     |
   |     |config BAR_42_FLASH_ADDR
   |     |    hex "my-board flash address"
diff --git a/linux/Config.ext.in b/linux/Config.ext.in
index 3b72d3cf60..adc9c5c5a4 100644
--- a/linux/Config.ext.in
+++ b/linux/Config.ext.in
@@ -56,6 +56,6 @@ config BR2_LINUX_KERNEL_EXT_RTAI
 	  RTAI Kernel part.
 
 # kernel extensions from br2-external trees, if any
-source "$BR2_BASE_DIR/.br2-external.in.linux"
+source "$(BASE_DIR)/.br2-external.in.linux"
 
 endmenu
diff --git a/package/amlogic-boot-fip/Config.in.host b/package/amlogic-boot-fip/Config.in.host
index bccc6296d1..54f4075f27 100644
--- a/package/amlogic-boot-fip/Config.in.host
+++ b/package/amlogic-boot-fip/Config.in.host
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_HOST_AMLOGIC_BOOT_FIP
 	bool "host amlogic-boot-fip"
-	depends on BR2_HOSTARCH = "x86_64"
+	depends on "$(HOSTARCH)" = "x86_64"
 	help
 	  Firmware Image Package (FIP) sources used to sign Amlogic
 	  u-boot binaries in LibreELEC images
diff --git a/package/arm-gnu-toolchain/Config.in.host b/package/arm-gnu-toolchain/Config.in.host
index de8ff8c005..7afb5c4873 100644
--- a/package/arm-gnu-toolchain/Config.in.host
+++ b/package/arm-gnu-toolchain/Config.in.host
@@ -1,4 +1,4 @@
 config BR2_PACKAGE_HOST_ARM_GNU_TOOLCHAIN_SUPPORTS
 	bool
-	default y if BR2_HOSTARCH = "aarch64"
-	default y if BR2_HOSTARCH = "x86_64"
+	default y if "$(HOSTARCH)" = "aarch64"
+	default y if "$(HOSTARCH)" = "x86_64"
diff --git a/package/erlang/Config.in b/package/erlang/Config.in
index 724f91123b..f3830cefad 100644
--- a/package/erlang/Config.in
+++ b/package/erlang/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_HOST_ERLANG_ARCH_SUPPORTS
 	bool
-	default y if BR2_HOSTARCH = "aarch64"
-	default y if BR2_HOSTARCH = "x86_64"
-	default y if BR2_HOSTARCH = "x86"
+	default y if "$(HOSTARCH)" = "aarch64"
+	default y if "$(HOSTARCH)" = "x86_64"
+	default y if "$(HOSTARCH)" = "x86"
 
 config BR2_PACKAGE_ERLANG_ARCH_SUPPORTS
 	bool
diff --git a/package/flutter-sdk-bin/Config.in.host b/package/flutter-sdk-bin/Config.in.host
index 181a2ee6e5..c1c97e2ca8 100644
--- a/package/flutter-sdk-bin/Config.in.host
+++ b/package/flutter-sdk-bin/Config.in.host
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_ARCH_SUPPORTS
 	bool
-	default y if BR2_HOSTARCH = "x86_64"
+	default y if "$(HOSTARCH)" = "x86_64"
 
 config BR2_PACKAGE_HOST_FLUTTER_SDK_BIN
 	bool "host flutter-sdk-bin"
diff --git a/package/go/Config.in.host b/package/go/Config.in.host
index 47c7e5d075..fa991f3a91 100644
--- a/package/go/Config.in.host
+++ b/package/go/Config.in.host
@@ -45,8 +45,8 @@ config BR2_PACKAGE_HOST_GO_HOST_CGO_LINKING_SUPPORTS
 	default y if BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	default y if !BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
-	depends on BR2_HOSTARCH != "mips64"
-	depends on BR2_HOSTARCH != "mips64el"
+	depends on "$(HOSTARCH)" != "mips64"
+	depends on "$(HOSTARCH)" != "mips64el"
 
 # Go packages should select BR2_PACKAGE_HOST_GO
 config BR2_PACKAGE_HOST_GO
diff --git a/package/go/go-bin/Config.in.host b/package/go/go-bin/Config.in.host
index 6312c1b950..3e842e0ff7 100644
--- a/package/go/go-bin/Config.in.host
+++ b/package/go/go-bin/Config.in.host
@@ -1,12 +1,12 @@
 # Translate the HOSTARCH into the architecture name used by the Go compiler
 config BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH
 	string
-	default "armv6l" if BR2_HOSTARCH = "arm"
-	default "arm64" if BR2_HOSTARCH = "aarch64"
-	default "ppc64le" if BR2_HOSTARCH = "powerpc64le"
-	default "s390x" if BR2_HOSTARCH = "s390x"
-	default "386" if BR2_HOSTARCH = "x86"
-	default "amd64" if BR2_HOSTARCH = "x86_64"
+	default "armv6l" if "$(HOSTARCH)" = "arm"
+	default "arm64" if "$(HOSTARCH)" = "aarch64"
+	default "ppc64le" if "$(HOSTARCH)" = "powerpc64le"
+	default "s390x" if "$(HOSTARCH)" = "s390x"
+	default "386" if "$(HOSTARCH)" = "x86"
+	default "amd64" if "$(HOSTARCH)" = "x86_64"
 
 config BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH_SUPPORTS
 	bool
diff --git a/package/go/go-bootstrap-stage1/Config.in.host b/package/go/go-bootstrap-stage1/Config.in.host
index 56a743caf9..50caad0a8b 100644
--- a/package/go/go-bootstrap-stage1/Config.in.host
+++ b/package/go/go-bootstrap-stage1/Config.in.host
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE1_ARCH_SUPPORTS
 	bool
 	# See src/cmd/dist/unix.c for the list of supported architectures
-	default y if BR2_HOSTARCH = "x86"
-	default y if BR2_HOSTARCH = "x86_64"
-	default y if BR2_HOSTARCH = "arm"
+	default y if "$(HOSTARCH)" = "x86"
+	default y if "$(HOSTARCH)" = "x86_64"
+	default y if "$(HOSTARCH)" = "arm"
diff --git a/package/google-breakpad/Config.in.host b/package/google-breakpad/Config.in.host
index 28d304766a..84e95957b2 100644
--- a/package/google-breakpad/Config.in.host
+++ b/package/google-breakpad/Config.in.host
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_HOST_GOOGLE_BREAKPAD_ARCH_SUPPORTS
 	bool
-	default y if BR2_HOSTARCH = "x86_64"
-	default y if BR2_HOSTARCH = "x86"
-	default y if BR2_HOSTARCH = "arm"
-	default y if BR2_HOSTARCH = "aarch64"
-	default y if BR2_HOSTARCH = "mips"
-	default y if BR2_HOSTARCH = "mipsel"
+	default y if "$(HOSTARCH)" = "x86_64"
+	default y if "$(HOSTARCH)" = "x86"
+	default y if "$(HOSTARCH)" = "arm"
+	default y if "$(HOSTARCH)" = "aarch64"
+	default y if "$(HOSTARCH)" = "mips"
+	default y if "$(HOSTARCH)" = "mipsel"
diff --git a/package/jpeg/Config.in b/package/jpeg/Config.in
index 371f89aa49..0a7e01d28b 100644
--- a/package/jpeg/Config.in
+++ b/package/jpeg/Config.in
@@ -40,7 +40,7 @@ config BR2_PACKAGE_JPEG_TURBO
 	  http://www.libjpeg-turbo.org
 
 # libjpeg from br2-external trees, if any
-source "$BR2_BASE_DIR/.br2-external.in.jpeg"
+source "$(BASE_DIR)/.br2-external.in.jpeg"
 
 endchoice
 
diff --git a/package/kvm-unit-tests/Config.in b/package/kvm-unit-tests/Config.in
index 817d3c4a8f..87e7125313 100644
--- a/package/kvm-unit-tests/Config.in
+++ b/package/kvm-unit-tests/Config.in
@@ -20,7 +20,7 @@ config BR2_PACKAGE_KVM_UNIT_TESTS
 	# gcc 4.5 at least. on i386, we use the target gcc, while on
 	# x86-64 we use the host gcc (see .mk file for details)
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_5 || !BR2_i386
-	depends on BR2_HOSTARCH = "x86_64" || !BR2_x86_64
+	depends on "$(HOSTARCH)" = "x86_64" || !BR2_x86_64
 	select BR2_HOSTARCH_NEEDS_IA32_COMPILER if BR2_x86_64
 	help
 	  kvm-unit-tests is a project as old as KVM. As its name
diff --git a/package/luajit/Config.in b/package/luajit/Config.in
index 31e9e0243e..408032c7e8 100644
--- a/package/luajit/Config.in
+++ b/package/luajit/Config.in
@@ -7,9 +7,9 @@ config BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
 	default y if BR2_powerpc
 	# -m32 flag is used for 32bit builds and host-luajit has
 	# limited architecture support
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on "$(HOSTARCH)" = "x86_64" || "$(HOSTARCH)" = "x86"
 	# Building for 64-bit target requires a 64-bit host
-	depends on !BR2_ARCH_IS_64 || BR2_HOSTARCH = "x86_64"
+	depends on !BR2_ARCH_IS_64 || "$(HOSTARCH)" = "x86_64"
 
 config BR2_PACKAGE_LUAJIT
 	bool "luajit"
diff --git a/package/mono/Config.in b/package/mono/Config.in
index 0152df8268..354dc56d24 100644
--- a/package/mono/Config.in
+++ b/package/mono/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_HOST_MONO_ARCH_SUPPORTS
 	bool
-	default y if BR2_HOSTARCH = "x86_64"
-	default y if BR2_HOSTARCH = "x86"
+	default y if "$(HOSTARCH)" = "x86_64"
+	default y if "$(HOSTARCH)" = "x86"
 
 config BR2_PACKAGE_MONO_ARCH_SUPPORTS
 	bool
diff --git a/package/nodejs/Config.in.host b/package/nodejs/Config.in.host
index a8ab89176c..a8b0f3997d 100644
--- a/package/nodejs/Config.in.host
+++ b/package/nodejs/Config.in.host
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_HOST_NODEJS_BIN_ARCH_SUPPORTS
 	bool
-	default y if BR2_HOSTARCH = "aarch64"
-	default y if BR2_HOSTARCH = "arm"
-	default y if BR2_HOSTARCH = "ppc64le"
-	default y if BR2_HOSTARCH = "x86_64"
+	default y if "$(HOSTARCH)" = "aarch64"
+	default y if "$(HOSTARCH)" = "arm"
+	default y if "$(HOSTARCH)" = "ppc64le"
+	default y if "$(HOSTARCH)" = "x86_64"
 
 comment "host nodejs needs a host gcc >= 8"
 	depends on !BR2_PACKAGE_HOST_NODEJS_BIN_ARCH_SUPPORTS
diff --git a/package/openjdk/Config.in b/package/openjdk/Config.in
index 022ded8dbb..bac5d6d986 100644
--- a/package/openjdk/Config.in
+++ b/package/openjdk/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_HOST_OPENJDK_BIN_ARCH_SUPPORTS
 	bool
-	default y if BR2_HOSTARCH = "x86_64"
-	default y if BR2_HOSTARCH = "aarch64"
+	default y if "$(HOSTARCH)" = "x86_64"
+	default y if "$(HOSTARCH)" = "aarch64"
 
 # Taken from make/autoconf/platform.m4
 config BR2_PACKAGE_OPENJDK_ARCH_SUPPORTS
diff --git a/package/openssl/Config.in b/package/openssl/Config.in
index d255a05596..ca9d1a7e50 100644
--- a/package/openssl/Config.in
+++ b/package/openssl/Config.in
@@ -59,7 +59,7 @@ config BR2_PACKAGE_LIBRESSL
 source "package/libressl/Config.in"
 
 # openssl from br2-external trees, if any
-source "$BR2_BASE_DIR/.br2-external.in.openssl"
+source "$(BASE_DIR)/.br2-external.in.openssl"
 
 endchoice
 
diff --git a/package/protobuf/Config.in b/package/protobuf/Config.in
index ae4044ea32..89d94d73c6 100644
--- a/package/protobuf/Config.in
+++ b/package/protobuf/Config.in
@@ -16,17 +16,17 @@
 # host-protobuf only builds on certain architectures
 config BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS
 	bool
-	default y if BR2_HOSTARCH = "aarch64"
-	default y if BR2_HOSTARCH = "arm"
-	default y if BR2_HOSTARCH = "mips"
-	default y if BR2_HOSTARCH = "mipsel"
-	default y if BR2_HOSTARCH = "powerpc"
-	default y if BR2_HOSTARCH = "powerpc64"
-	default y if BR2_HOSTARCH = "powerpc64le"
-	default y if BR2_HOSTARCH = "sparc"
-	default y if BR2_HOSTARCH = "sparc64"
-	default y if BR2_HOSTARCH = "x86"
-	default y if BR2_HOSTARCH = "x86_64"
+	default y if "$(HOSTARCH)" = "aarch64"
+	default y if "$(HOSTARCH)" = "arm"
+	default y if "$(HOSTARCH)" = "mips"
+	default y if "$(HOSTARCH)" = "mipsel"
+	default y if "$(HOSTARCH)" = "powerpc"
+	default y if "$(HOSTARCH)" = "powerpc64"
+	default y if "$(HOSTARCH)" = "powerpc64le"
+	default y if "$(HOSTARCH)" = "sparc"
+	default y if "$(HOSTARCH)" = "sparc64"
+	default y if "$(HOSTARCH)" = "x86"
+	default y if "$(HOSTARCH)" = "x86_64"
 
 config BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 	bool
diff --git a/package/qt5/qt5webengine/Config.in b/package/qt5/qt5webengine/Config.in
index 2c16d819d2..d40d007ed4 100644
--- a/package/qt5/qt5webengine/Config.in
+++ b/package/qt5/qt5webengine/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_QT5WEBENGINE_ARCH_SUPPORTS
 		BR2_mips || BR2_mips64
 	# -m32 flag is used for 32bit builds and host tools have
 	# limited architecture support
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on "$(HOSTARCH)" = "x86_64" || "$(HOSTARCH)" = "x86"
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE # qt5declarative
 	depends on !BR2_BINFMT_FLAT # qt5base-icu
 	depends on BR2_USE_MMU # libglib2, qt5base-dbus
diff --git a/package/rustc/Config.in.host b/package/rustc/Config.in.host
index 6130b73921..4fd6e1979d 100644
--- a/package/rustc/Config.in.host
+++ b/package/rustc/Config.in.host
@@ -2,14 +2,14 @@
 # When adding new entries below, update RUST_HOSTS in utils/update-rust
 config BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 	bool
-	default y if BR2_HOSTARCH = "aarch64"
-	default y if BR2_HOSTARCH = "powerpc"
-	default y if BR2_HOSTARCH = "powerpc64"
-	default y if BR2_HOSTARCH = "powerpc64le"
-	default y if BR2_HOSTARCH = "riscv64"
-	default y if BR2_HOSTARCH = "s390x"
-	default y if BR2_HOSTARCH = "x86"
-	default y if BR2_HOSTARCH = "x86_64"
+	default y if "$(HOSTARCH)" = "aarch64"
+	default y if "$(HOSTARCH)" = "powerpc"
+	default y if "$(HOSTARCH)" = "powerpc64"
+	default y if "$(HOSTARCH)" = "powerpc64le"
+	default y if "$(HOSTARCH)" = "riscv64"
+	default y if "$(HOSTARCH)" = "s390x"
+	default y if "$(HOSTARCH)" = "x86"
+	default y if "$(HOSTARCH)" = "x86_64"
 
 # The pre-built Rust standard library is only available for a number
 # of architectures/C libraries combinations, with different levels of
diff --git a/package/sam-ba/Config.in.host b/package/sam-ba/Config.in.host
index cd11e8633e..9b2e2afb75 100644
--- a/package/sam-ba/Config.in.host
+++ b/package/sam-ba/Config.in.host
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_HOST_SAM_BA
 	bool "host sam-ba"
-	depends on BR2_HOSTARCH = "x86_64"
+	depends on "$(HOSTARCH)" = "x86_64"
 	help
 	  Atmel SAM-BA software provides an open set of tools for
 	  programming the Atmel SAM3, SAM7 and SAM9 ARM-based
diff --git a/package/supertuxkart/Config.in b/package/supertuxkart/Config.in
index 0f6c244058..0aab4f9e9c 100644
--- a/package/supertuxkart/Config.in
+++ b/package/supertuxkart/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_SUPERTUXKART
 	bool "supertuxkart"
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on "$(HOSTARCH)" = "x86_64" || "$(HOSTARCH)" = "x86"
 	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_INSTALL_LIBSTDCPP # openal
@@ -34,7 +34,7 @@ config BR2_PACKAGE_SUPERTUXKART
 	  http://supertuxkart.sourceforge.net/Main_Page
 
 comment "supertuxkart needs an OpenGL backend, a uClibc or glibc toolchain w/ NPTL, C++, gcc >= 9"
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on "$(HOSTARCH)" = "x86_64" || "$(HOSTARCH)" = "x86"
 	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
diff --git a/package/ti-cgt-pru/Config.in.host b/package/ti-cgt-pru/Config.in.host
index eab3cd72d5..cf56854dd1 100644
--- a/package/ti-cgt-pru/Config.in.host
+++ b/package/ti-cgt-pru/Config.in.host
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_HOST_TI_CGT_PRU_ARCH_SUPPORTS
 	bool
 	default y
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on "$(HOSTARCH)" = "x86_64" || "$(HOSTARCH)" = "x86"
 	depends on BR2_arm
 
 config BR2_PACKAGE_HOST_TI_CGT_PRU
diff --git a/package/ti-gfx/Config.in b/package/ti-gfx/Config.in
index 40f46335a3..093417fa21 100644
--- a/package/ti-gfx/Config.in
+++ b/package/ti-gfx/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_TI_GFX
 	bool "ti-gfx"
 	depends on BR2_LINUX_KERNEL && BR2_TOOLCHAIN_USES_GLIBC && BR2_arm
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on "$(HOSTARCH)" = "x86_64" || "$(HOSTARCH)" = "x86"
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	select BR2_PACKAGE_HAS_LIBEGL
 	select BR2_PACKAGE_HAS_LIBGLES
diff --git a/package/wine/Config.in b/package/wine/Config.in
index 7a01ef6f7c..1fc760982e 100644
--- a/package/wine/Config.in
+++ b/package/wine/Config.in
@@ -2,9 +2,9 @@ config BR2_PACKAGE_WINE_ARCH_SUPPORTS
 	bool
 	default y
 	# Wine only builds on certain architectures
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86" || \
-	           BR2_HOSTARCH = "powerpc" || BR2_HOSTARCH = "arm" || \
-	           BR2_HOSTARCH = "aarch64"
+	depends on "$(HOSTARCH)" = "x86_64" || "$(HOSTARCH)" = "x86" || \
+	           "$(HOSTARCH)" = "powerpc" || "$(HOSTARCH)" = "arm" || \
+	           "$(HOSTARCH)" = "aarch64"
 	# Wine has much CPU specific code and mostly makes sense on x86
 	depends on BR2_i386
 
diff --git a/support/scripts/gen-bootlin-toolchains b/support/scripts/gen-bootlin-toolchains
index ee64a86902..0fc87ed29d 100755
--- a/support/scripts/gen-bootlin-toolchains
+++ b/support/scripts/gen-bootlin-toolchains
@@ -505,7 +505,7 @@ def gen_config_in_options(toolchains, fpath):
         f.write("if BR2_TOOLCHAIN_EXTERNAL_BOOTLIN\n\n")
 
         f.write("config BR2_TOOLCHAIN_EXTERNAL_PREFIX\n")
-        f.write("\tdefault \"$(ARCH)-linux\"\n")
+        f.write("\tdefault \"\\$(ARCH)-linux\"\n")
 
         f.write("\n")
 
diff --git a/support/testing/tests/core/br2-external/detect-bad-arch/Config.in b/support/testing/tests/core/br2-external/detect-bad-arch/Config.in
index 530c077bbe..579cbfa67d 100644
--- a/support/testing/tests/core/br2-external/detect-bad-arch/Config.in
+++ b/support/testing/tests/core/br2-external/detect-bad-arch/Config.in
@@ -1 +1 @@
-source "$BR2_EXTERNAL_DETECT_BAD_ARCH_PATH/package/detect-bad-arch/Config.in"
+source "$(BR2_EXTERNAL_DETECT_BAD_ARCH_PATH)/package/detect-bad-arch/Config.in"
diff --git a/support/testing/tests/core/br2-external/flat-stacksize/Config.in b/support/testing/tests/core/br2-external/flat-stacksize/Config.in
index cdb4e9f057..e629b87cd7 100644
--- a/support/testing/tests/core/br2-external/flat-stacksize/Config.in
+++ b/support/testing/tests/core/br2-external/flat-stacksize/Config.in
@@ -1 +1 @@
-source "$BR2_EXTERNAL_FLAT_STACKSIZE_PATH/package/flat-stacksize-test/Config.in"
+source "$(BR2_EXTERNAL_FLAT_STACKSIZE_PATH)/package/flat-stacksize-test/Config.in"
diff --git a/support/testing/tests/core/test_selinux/br2_external/Config.in b/support/testing/tests/core/test_selinux/br2_external/Config.in
index 9d9c84ee3c..bddbcb4938 100644
--- a/support/testing/tests/core/test_selinux/br2_external/Config.in
+++ b/support/testing/tests/core/test_selinux/br2_external/Config.in
@@ -1 +1 @@
-source "$BR2_EXTERNAL_SELINUX_PATH/package/selinux-test/Config.in"
+source "$(BR2_EXTERNAL_SELINUX_PATH)/package/selinux-test/Config.in"
diff --git a/support/testing/tests/package/br2-external/clang-compiler-rt/Config.in b/support/testing/tests/package/br2-external/clang-compiler-rt/Config.in
index e1f9f8c598..e578a4c9c8 100644
--- a/support/testing/tests/package/br2-external/clang-compiler-rt/Config.in
+++ b/support/testing/tests/package/br2-external/clang-compiler-rt/Config.in
@@ -1 +1 @@
-source "$BR2_EXTERNAL_CLANG_COMPILER_RT_PATH/package/libfuzzer/Config.in"
+source "$(BR2_EXTERNAL_CLANG_COMPILER_RT_PATH)/package/libfuzzer/Config.in"
diff --git a/support/testing/tests/package/br2-external/gumbo-parser/Config.in b/support/testing/tests/package/br2-external/gumbo-parser/Config.in
index 28a97c1dfe..63a4a301e3 100644
--- a/support/testing/tests/package/br2-external/gumbo-parser/Config.in
+++ b/support/testing/tests/package/br2-external/gumbo-parser/Config.in
@@ -1 +1 @@
-source "$BR2_EXTERNAL_GUMBO_PARSER_PATH/package/gumbo-parser-test/Config.in"
+source "$(BR2_EXTERNAL_GUMBO_PARSER_PATH)/package/gumbo-parser-test/Config.in"
diff --git a/support/testing/tests/package/br2-external/openjdk/Config.in b/support/testing/tests/package/br2-external/openjdk/Config.in
index 2588b34054..cad25f7804 100644
--- a/support/testing/tests/package/br2-external/openjdk/Config.in
+++ b/support/testing/tests/package/br2-external/openjdk/Config.in
@@ -1,2 +1,2 @@
-source "$BR2_EXTERNAL_OPENJDK_PATH/package/openjdk-hello-world/Config.in"
-source "$BR2_EXTERNAL_OPENJDK_PATH/package/openjdk-jni-test/Config.in"
+source "$(BR2_EXTERNAL_OPENJDK_PATH)/package/openjdk-hello-world/Config.in"
+source "$(BR2_EXTERNAL_OPENJDK_PATH)/package/openjdk-jni-test/Config.in"
diff --git a/support/testing/tests/package/br2-external/polkit/Config.in b/support/testing/tests/package/br2-external/polkit/Config.in
index 2d11756193..1b4e421d1e 100644
--- a/support/testing/tests/package/br2-external/polkit/Config.in
+++ b/support/testing/tests/package/br2-external/polkit/Config.in
@@ -1 +1 @@
-source "$BR2_EXTERNAL_POLKIT_PATH/package/polkit-rules-test/Config.in"
+source "$(BR2_EXTERNAL_POLKIT_PATH)/package/polkit-rules-test/Config.in"
diff --git a/support/testing/tests/package/br2-external/python-pybind/Config.in b/support/testing/tests/package/br2-external/python-pybind/Config.in
index 70c77157b3..f0cef44369 100644
--- a/support/testing/tests/package/br2-external/python-pybind/Config.in
+++ b/support/testing/tests/package/br2-external/python-pybind/Config.in
@@ -1 +1 @@
-source "$BR2_EXTERNAL_PYTHON_PYBIND_PATH/package/python-pybind-example/Config.in"
+source "$(BR2_EXTERNAL_PYTHON_PYBIND_PATH)/package/python-pybind-example/Config.in"
diff --git a/system/Config.in b/system/Config.in
index f4788cd72e..46a1cf5d59 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -20,7 +20,7 @@ config BR2_ROOTFS_SKELETON_CUSTOM
 	  Use custom target skeleton.
 
 # skeleton from br2-external trees, if any
-source "$BR2_BASE_DIR/.br2-external.in.skeleton"
+source "$(BASE_DIR)/.br2-external.in.skeleton"
 
 endchoice
 
@@ -189,7 +189,7 @@ config BR2_INIT_NONE
 	  or with a rootfs-overlay.
 
 # Init systems from br2-external trees, if any
-source "$BR2_BASE_DIR/.br2-external.in.init"
+source "$(BASE_DIR)/.br2-external.in.init"
 
 endchoice
 
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 9d8c815438..56c2ea7a3e 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -26,7 +26,7 @@ source "toolchain/toolchain-external/toolchain-external-bootlin/Config.in"
 source "toolchain/toolchain-external/toolchain-external-custom/Config.in"
 
 # Toolchains from br2-external trees, if any
-source "$BR2_BASE_DIR/.br2-external.in.toolchains"
+source "$(BASE_DIR)/.br2-external.in.toolchains"
 
 endchoice
 
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in
index c3592b9d20..ec489adac8 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in
@@ -1,7 +1,7 @@
 config BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE
 	bool "Arm AArch64 BE 15.2.rel1"
 	depends on BR2_aarch64_be
-	depends on BR2_HOSTARCH = "x86_64"
+	depends on "$(HOSTARCH)" = "x86_64"
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_SSP
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in b/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
index ae1298bfe2..ac60c57aa6 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
@@ -1,7 +1,7 @@
 config BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64
 	bool "Arm AArch64 15.2.rel1"
 	depends on BR2_aarch64
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "aarch64"
+	depends on "$(HOSTARCH)" = "x86_64" || "$(HOSTARCH)" = "aarch64"
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_SSP
diff --git a/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in b/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
index 992ba09518..982654ffa0 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
@@ -7,7 +7,7 @@ config BR2_TOOLCHAIN_EXTERNAL_ARM_ARM
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A
 	depends on BR2_ARM_CPU_HAS_NEON
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "aarch64"
+	depends on "$(HOSTARCH)" = "x86_64" || "$(HOSTARCH)" = "aarch64"
 	depends on BR2_ARM_EABIHF
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
diff --git a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in
index 6552da9a84..1fa4fccb0f 100644
--- a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in
@@ -1,7 +1,7 @@
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN
 	bool "Bootlin toolchains"
 	depends on BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCH_SUPPORTS
-	depends on BR2_HOSTARCH = "x86_64"
+	depends on "$(HOSTARCH)" = "x86_64"
 	help
 	  Bootlin toolchains are built using Buildroot for a large
 	  number of architectures and C libraries configurations.
diff --git a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
index 81cb3f0a05..8dcb627956 100644
--- a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
@@ -49,7 +49,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCH_SUPPORTS
 if BR2_TOOLCHAIN_EXTERNAL_BOOTLIN
 
 config BR2_TOOLCHAIN_EXTERNAL_PREFIX
-	default "$(ARCH)-linux"
+	default "\$(ARCH)-linux"
 
 config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
 	default "toolchain-external-bootlin"
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 721fd272e0..92c1d6a37d 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -23,7 +23,7 @@ config BR2_TOOLCHAIN_EXTERNAL_REL_BIN_PATH
 
 config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX
 	string "Toolchain prefix"
-	default "$(ARCH)-linux"
+	default "\$(ARCH)-linux"
 	help
 	  Component name prefix used by your external toolchain.
 
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
