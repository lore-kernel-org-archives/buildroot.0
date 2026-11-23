Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0335606A32A
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 09:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=jXdicELh
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BDFF80E0F;
	Mon, 23 Nov 2026 09:54:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zLJbLELoMzJ6; Mon, 23 Nov 2026 09:54:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4C3E380DE7
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795427652;
	b=XNEj/UvZ6MFmorkQ3gPzn7P/4fQMwfYyT55ZwgkzPecxulutIoOncXKu01aYysQGjWNc
	 XV5UQS2yOiU4k1iAJLbLFVuSpULvjIKmXd82UdBHUhz/74XSZolWeZgixFaKmHqMrisF5
	 W3Uy71/Lsl4rmI2O7xW6v2OsctW6hdz67+1ZN22P6eJhw0IQZGh1KgfbMkS2swnTPpptO
	 kRtJse/0qKm7+O75ZUV3CaXxorUOm17P1Te6cDQ0K7YHXDCt2phkXqUA7AFW00s34y9Am
	 USmCgs7+ryfP2WGUFiBQYE8C69dcstYAYALwR/gACH48KdAe0d2X4dO2do41DKRR0Gg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795427652;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=B5fHDqKTnPUDb/M0KRjL1lcr2qTgBw7HmjGHL5ptqOc=;
	b=FpaiWhchJX911m2buQA5uCH+OZan/jz7mYIQ4mJWKWLqWvEHLgDU2WhI2qNZqfVdXgA5
	 NjreK8XnJx2QMBFd9Mg2uQdBHdQZuL1Onwa2jAt2/0NE6c0aT5DHhHjYR0QB5cfg9FG7I
	 M175gRDr9Vui9qwJ5Zv7wZxR09EPVslX6WaHJKmUTyLlgciSoH5Y2Uro57ToaE/1jsIp6
	 mU4VnM5qEGJb7CcxJngwF8uf9hjGXZFOR/7YQ+ard3dmbJw7OKp/ZWMtKPFAR2Cq4o81K
	 QlUCIO9Nllwyo/apX3YPQIhwlXUbO/RPDh+QMb6Nekdk/JwBB5Kzy90sgXK/84yIUvA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	dmarc=none header.from=devoogdt.com;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795427652;
	bh=B5fHDqKTnPUDb/M0KRjL1lcr2qTgBw7HmjGHL5ptqOc=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jXdicELhy1tWEiy3OjhaA/4FsYFws2wK1zFG12qiMeo9Iv9YCKeUcW3zzJZFEGxJB
	 gRNdfjF/1HvtzZ/KTTqUulNvrz1qIUlnQKEd3fIjd8V/GqzvqV0P2+HujIdVQD+9P7
	 ozBIf8vUY6BkyjDlRhhg9w2CPCheWNH3bGEKZNb2vvB7Z+tBxlYAzWVdHwzRzIV6kk
	 xqTNBbckVlY/PjXQjAuA+C4YLHF+KG/E3Qzm3SIRS9a/gApeZSywxuzOoaljtVC5kj
	 S7kbnzCgKyZG96pvk6B0x3elMvUAh2iOaRpLtEs1YkIJMGLUtFICbTJJe52mxCZW9I
	 1FYQbe6w0pcwg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C3E380DE7;
	Mon, 23 Nov 2026 09:54:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A1311AB
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 09:54:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 605B780C46
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 09:54:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SZS31nei8N2c for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 09:54:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2F22080C7E
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=209.85.128.47
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.47;
 helo=mail-wm1-f47.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=devoogdt.com
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2F22080C7E
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 09:54:02 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4bb64ef5a00so23471945e9.3
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 01:54:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795427641; x=1796032441;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=AEtGhzAZG8U9RoukLC8y7AiFPfzVn1KdVHXOnS21jMY=;
 b=q3UhBjEKqzhHbVUidTJ8xEy2NddNwGzJSpRTlQ6XaeOyy6KTxBVKeyuL96vdA2dZuS
 fInt748yUJButLz3M5NTb/l0mYBcbN/BljiUVVowwUs1N8WHrMFQ4xr5uwaYqZlYO0/H
 nNw91ty9Z0HhZXHwyIldvggVzh2MaZ/kC1PDN4qX3gyv4wrInBDDUqlPgfO9dT+K0zYF
 mHGDvy/by0dzBrh1DP16L/A4Xw1CLe7RB7G4n79IT1Byeqz1w2HSNhKMPmaDlSUPpDnw
 LGzK/mEWXnFoMAbXDPN0tbaPbLpUj5qf85eVNcWIZmDtor917eJbD1sZ5XQ8Ri+Uu5up
 UGVA==
X-Gm-Message-State: APuU4Z9AQmc7Qut2jC8JDZawSPFdoDfR2CguD2ifqu0wyBV8URBnpqyU
 0HokyC9L+bvmN7ti4SWl2zNB/gfjrXJYSkHTffVca98921/TBz/SdEcxHDRNLmHE
X-Gm-Gg: AZFdTZcJAC7fysonDXGSnpYO/O4tDYa4krLiIHGrUE4C95NM6DTnTXO/j9Z8faSQYoY
 FWHClTt3i0YDvcitCYvQQ793DktQxXJL2GfES/bvi+LoVn6m2UDbQ3LDbFreJ/FJFa9a3VdyNiw
 6Aj1EQu1zm5FMr4AaizRwaiu++Z6qofGyM7vhSiPOT7tqHnxZNo9qTwB/5XSIfQSjYUC5rXn14L
 psBoKXMEBrwmZQBMOXPRnZXX7KZDAZXLX8mJFRqC0I7w7rBvL/Sk0ickP0SFJ2Sh+CukFDE5wPW
 3sIvCfbx6yyBwG5Gg2R1tkV4g2R8jMLhuN92YkrVljcKEGt6eNGBs4dB2RzZ/nUmrlc/6iOfDXX
 4E5WCa6kfT3zGS6ZfAS/XkdZMNAHfDW5qT8xZ5zrqhmjwVJI7kag2FeAVrkFwGrK89aCqYNgNcz
 PfrDgvoosP4nJ0gBtZT4DJtH0doeXnoQho4zvjSdbO7liFW2Ebgpxh+Rh24lWa/vIVIRTGmfuSr
 tojH5YRCLnky+jpBMfoZDkYwqLhzt+CEHK/Edn6ed2OoR+w/IxvBXh5LfnwZfmGlMOqOIV7af9F
 AOv7rTu65r9n3j9eq9gedtZ16ZhPLJCW7MV+1QdG4hvPLO0B+18K1uctiHlWsh8Nj0Geo4i5DQ3
 6VWilozTDg42P2XtYkLR1dcu2Qgdy8lZTJgZdYfPB/l/407GEjhPNZbvoLnJ8bsQcqS5/Z8z9IA
 u6MST8VFV14A==
X-Received: by 2002:a05:600c:3b8a:b0:4a3:59c9:a754 with SMTP id
 5b1f17b1804b1-4bb8892da25mr224113715e9.22.1795427640862; 
 Mon, 23 Nov 2026 01:54:00 -0800 (PST)
Received: from KORLIN44614.barco.com (d528f5fde.static.telenet.be.
 [82.143.95.222]) by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-4bb9067846esm186202105e9.4.2026.11.23.01.54.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2026 01:54:00 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Chris Packham <judge.packham@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>,
 Joseph Kogut <joseph.kogut@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 23 Nov 2026 10:53:35 +0100
Message-ID: <20261123095339.1566394-7-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261123095339.1566394-1-thomas@devoogdt.com>
References: <20261123095339.1566394-1-thomas@devoogdt.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v1 07/11] package/seatd: bump to version 0.9.3
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Release tag:
https://git.sr.ht/~kennylevinsen/seatd/refs/0.9.3

The new libseat backend calls fork(), so the package now needs an MMU.

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
 package/seatd/Config.in   | 4 ++++
 package/seatd/seatd.hash  | 2 +-
 package/seatd/seatd.mk    | 2 +-
 package/weston/Config.in  | 5 +++--
 package/wlroots/Config.in | 5 +++--
 5 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/package/seatd/Config.in b/package/seatd/Config.in
index 5473b237cef..c7ea750f377 100644
--- a/package/seatd/Config.in
+++ b/package/seatd/Config.in
@@ -1,5 +1,6 @@
 menuconfig BR2_PACKAGE_SEATD
 	bool "seatd"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_SEATD_BUILTIN \
 		if !BR2_PACKAGE_SYSTEMD_LOGIND && !BR2_PACKAGE_SEATD_DAEMON
 	help
@@ -21,3 +22,6 @@ config BR2_PACKAGE_SEATD_DAEMON
 	  Build the seatd daemon and support for it inside libseat.
 
 endif
+
+comment "seatd needs a toolchain w/ MMU"
+	depends on !BR2_USE_MMU
diff --git a/package/seatd/seatd.hash b/package/seatd/seatd.hash
index ce70480d502..0df25d347fd 100644
--- a/package/seatd/seatd.hash
+++ b/package/seatd/seatd.hash
@@ -1,5 +1,5 @@
 # Calculated locally
-sha256  819979c922a0be258aed133d93920bce6a3d3565a60588d6d372ce9db2712cd3  0.9.1.tar.gz
+sha256  302564d54d8e28191fadfd734f2675ecb0c9e0615a58011b89ef15dfa4dbaa96  0.9.3.tar.gz
 
 # License files
 sha256  282a494803d666616bd726e0279636b5f6a31387ae19a707459074050f2600d3  LICENSE
diff --git a/package/seatd/seatd.mk b/package/seatd/seatd.mk
index 69be691cf67..b9989a660ef 100644
--- a/package/seatd/seatd.mk
+++ b/package/seatd/seatd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SEATD_VERSION = 0.9.1
+SEATD_VERSION = 0.9.3
 SEATD_SOURCE = $(SEATD_VERSION).tar.gz
 SEATD_SITE = https://git.sr.ht/~kennylevinsen/seatd/archive
 SEATD_LICENSE = MIT
diff --git a/package/weston/Config.in b/package/weston/Config.in
index decabcfc76e..126a9df4cea 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -1,10 +1,11 @@
-comment "weston needs udev and a toolchain w/ locale, threads, dynamic library, headers >= 3.0"
+comment "weston needs udev and a toolchain w/ locale, threads, dynamic library, MMU, headers >= 3.0"
 	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 || BR2_STATIC_LIBS || \
-		!BR2_ENABLE_LOCALE
+		!BR2_ENABLE_LOCALE || !BR2_USE_MMU
 
 config BR2_PACKAGE_WESTON
 	bool "weston"
+	depends on BR2_USE_MMU # seatd
 	depends on BR2_PACKAGE_HAS_UDEV
 	depends on !BR2_STATIC_LIBS # wayland
 	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland
diff --git a/package/wlroots/Config.in b/package/wlroots/Config.in
index 6d2992cf2c6..302b2e2f650 100644
--- a/package/wlroots/Config.in
+++ b/package/wlroots/Config.in
@@ -4,12 +4,13 @@ comment "wlroots needs udev, EGL, OpenGL ES and GBM support"
 		!BR2_PACKAGE_HAS_LIBGLES || \
 		!BR2_PACKAGE_HAS_UDEV
 
-comment "wlroots needs a toolchain w/ threads, dynamic library"
+comment "wlroots needs a toolchain w/ MMU, threads, dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
-		BR2_STATIC_LIBS
+		BR2_STATIC_LIBS || !BR2_USE_MMU
 
 config BR2_PACKAGE_WLROOTS
 	bool "wlroots"
+	depends on BR2_USE_MMU # seatd
 	depends on !BR2_STATIC_LIBS # wayland
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm, wayland
 	depends on BR2_PACKAGE_HAS_UDEV # libinput
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
