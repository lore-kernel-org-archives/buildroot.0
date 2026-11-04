Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A547D606A32F
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 14:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=A2A6QpIo;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BpoZJQCB
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 730C0606CB;
	Wed,  4 Nov 2026 14:09:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MGrhrRhOw9-U; Wed,  4 Nov 2026 14:09:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 69EB06062C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793801390;
	b=booZKUkp9X07rGHsi1yERBeOCNUfm/pDmGhMKn68DDCd1lLXr0giix7SL4T3rM8TkD8L
	 tnv6M7ZM4ZtoZJX1ARYYQU3JU+MJq63O7MEk9kaajwhRsplI5Bv/p2Yky3a5CmNuiPvDe
	 R8G1LcaUT9QI5mRVmIObFcbrh3Hys/usOrgLtPIm8fG+c+cqCKUA+hhqJEykuhei+Mlpq
	 VP4jm1vGfdKGmURpQ9ceALKQIIA9C3qcEOr7XMlSzBBg1f0pydl5ZxYbFZAvmuvEWqHnB
	 4uPbzvfPYO+LM/q/hOhlp1dmN6geFJij++Z++V5ixY/ttnHOWaKKFcE03UxdCF0jm5g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793801390;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=TL2R4Mv7KTbLI3SO+PhTDKykcRz/jRVBpn2lCXlkRis=;
	b=HRKLENu+VLMae0TaJl/0M/t7DoA0VESqiOiIjZ4weNXAG7eLQpCdQ+R+i/VTBLImT06o
	 Fq/1K6/V4jFzCQBuy2mzBFSMgwBAqkCMcL3+2sFUIQ6UlRnrLSnnNC+YnISzXQEjhgRLj
	 j+pn+qlJ7VkeUprJgigDSTq4Ujq/dEMckJ272w5i/lEi/kqy8Snyipis4VAULpZwOOFgo
	 Y80lk9/taCi0HXTARa9jB6leTiv+Xr+93f9oPzoBFCjN8tKfFtbeyboU9R0twfyGx2cMQ
	 z+0q5ta4uDm+OeWWz6OttqXHeUFeuofmWPtBpC9Zz36RqyDE1O2OQdQVM3u/ru0vnjg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793801390;
	bh=TL2R4Mv7KTbLI3SO+PhTDKykcRz/jRVBpn2lCXlkRis=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A2A6QpIoMXaEDMZnaz5v/d8QCw5V9zHpoArmrq5+Gicu6GI5LOCYYdAXx1khVKIDW
	 KX9LQjl1sdzaWRGoCvFuA9ZkwLiRn2iTDg1ZDU0lvIb7YnRaQwbJPkF+SiCPQhTLM0
	 SymN0lEEHOjnRH1BG3CQr4ETlVRtx2v8yD0jD4yXAMSF+XoxvYsfmF8oVBxH+xX8Vp
	 ZadK5/CcWdUMQr04MKwgCsWrtenZT5rhbxdZWa4cnUhiJx943IcPT9HxkPYRsfjJZQ
	 Z/UxD8tRCm6MHpS9f0lOGkV8m8uD/Ldw1KuHExzKRAreaqoZbc/MLIpI8RbcVOZFI/
	 cYr+m5MHi7rYg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69EB06062C;
	Wed,  4 Nov 2026 14:09:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3994134D
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 14:09:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2A5C740519
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 14:09:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cU3fkgOLr1aC for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 14:09:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B586340515
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32b"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793801388;
 b=cC2Jt9964uphx7KJbhuKzL8wDAqy8AsAgjI+88euBnq0BDD4KBsb0jxj4ndTQaCOlCyo
 iX9CsD72xCK2z4fiAP54amTXC9TezMmG8o2Z+1RK3iyzUoao1bulj4k5UqDD1ewruRbWL
 tcOgcFrrqs/hj7TL9wV/V0A68vz7xMR9FcSgWU0e+IpeX1wRqOMU5NPTaDPwJVMnvofL4
 bgwLE+eIzRVu7fWRtVgcVcP+ZSUfFq6mdefy94lzvu7rrUNyDVx9B1TkFIwecFUXu+8Pj
 NUG9wC8YRBhAhtsmJ1ly455hrJZaccjMwQVb8NVNqco9b4qFHztBAAUDSsVHC0sL+uA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793801388;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=J0i3sVzJciYGLEhv+RPzlMhoDnVeDboPxJGA5ShEbMI=;
 b=n5WqrD1eL2pTI8QTueg51XQKbokNH7gWctu4lJrbWoVUSXELBIe6HQ+SExoXZxNtfGsU
 MrgrW43F6dhg66PjTrBtlXdxdZVJpj0zrU/wIGRgxwkvGQdSAHr71GdLsG1OSSIBIoYlQ
 0p5cw8wqcdn2pdLWJO0Cu3GSvTFrWsf+yDsP5TZjadSQi8pDw6o8ewgJTfejYXoZQFFRu
 A1dtLICBSd4utXjETFQ+EY5kJm6QzHfly+KNpAjz+kBGJDxK55FmU6OqZoVUg0YaXxGr4
 vMX5c6wWG7khI8x2O/UzA7F0VZjjIYiHgCcLiRVLhzIZNfILl4vu/4t42CBgL7RrLbg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=BpoZJQCB; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=BpoZJQCB
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B586340515
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 14:09:47 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4a2167bd087so6320825e9.3
 for <buildroot@buildroot.org>; Wed, 04 Nov 2026 06:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793801385; x=1794406185; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=J0i3sVzJciYGLEhv+RPzlMhoDnVeDboPxJGA5ShEbMI=;
 b=BpoZJQCBlkr3lgQYPoNNHYK561djVW7zFF2BAXEhuW6CrhhDPoC3pChKK/aezrOIgb
 FgF1/AQgs63i0Da3uVuRCqcNNUJJaw2a272q3QmgPcy5o31qmU7RZANaZtON1tu4tX6H
 /xa1eueL0afoSFL7ZJuvO7BwGEiHRCLmKDnZAAwefw7TBzcOKgO6YLc9S+K/5LB0QaAW
 +Y0A6q3IonluNC1LYRRT/dW0mAqVfoOAainiLCVb75vDGfvwUiafCZpXHPJ2pCyby+Gj
 VH8367YtKDAp3ik/94rKazM2fBWO/K4siR3sM/Dc8U8b9lyul2HDE+ho79OsXbOBKb7R
 gf/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793801385; x=1794406185;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=J0i3sVzJciYGLEhv+RPzlMhoDnVeDboPxJGA5ShEbMI=;
 b=PnLbZkje7B034tHegIYLn51tpwZdyvA7/Thv7NtCEVyO7mkCCpbCCMkr/k78PUrhzH
 i0Kgu02BMcAE8T1STfkLRkJNRFekH8wlxEs3YMwl/gCdYrSkd9lfeXOsZoEg896znaHC
 Mqj76MdTD5n+JPOynGaYiZuGlgLyLMXFhuc6kVFkPH4p4RARmVC1J6yKtWW2PDIymq3c
 205jidiYzc1W3J0g3hRKw8o9sFWImcBxnW40vXmdtdYkJ1e9KzGQS49XRESakTxjYwLM
 bcNKGeQXqAfquGuQEL/wmcL1HhP3vFlYwf3acsNZyNRHMLaQOIdu3r92X+xcyVlZnqr0
 nr+w==
X-Gm-Message-State: APuU4Z/i6lSno5H4L3iPweM1kFsEBDeqtxqHPmAUBq0axjZiiVjUO20w
 1amcMnGM8GNwfcoxZ7a/QVGGaBFI2i/TBQ2IFY0g+el5XFp/TbWoIIl0Nh5zDQ==
X-Gm-Gg: AYBFou2idDzZnyPCACGj41AKawsodUXJyfp/ST7iPSc6PyHApQusofDkFygx6yQG9u/
 69MXwy8Aj7eucdcnMIN07xCMgBUj40NpVF4qpqnVHamvxPQe6U2NDFyI4xVcaeToiYuOCWqbB5F
 FjTQ8MgJV8ofvwFh6CX6h/LDSKZ/iEqOgPN9Cty6gt5XwcZp65C6fsRpu1cK1u2Iy6hXXmi3a9g
 JwgwiFqsG/afwRsPy/zdBn1VzBevgo7mFxiUHZsZXTFEzdvbAkfiHq15yKIeqy8EuZnjQb2PZzm
 43LSjdcMTkyDszZXie0N7t9+0F3xBD3X7/FnUW0NUiDHj9G5yBJE5AQ5iZo3vzleGcgxymjfbhk
 ZsBtC+xvJJcGIFFNtLqy7LBw/nuqPJJZznivPa4ePIZ77Tk8pkHIfMN+VLmR3UQLEQS5Lq5Yszb
 wV6SzBqdOJiQhkIcp+PB+PqGwplBguh79nYV07cThoQPVTHDA5AL70KQpEbskjAnjJIaFbqmdQo
 tHeXxHnmQTgVKqtRfc6Kze63NGZDCxFXuewZ0MOIQpIByteCsajQrZFeNC/3VL9dawpRu0nGbfz
 IYCeLs+VLuWcV8KkeQIs4PM+F7ubIIi/ToCT0xw9U0Qaxi+sOO6m2A==
X-Received: by 2002:a05:600c:34d1:b0:4a2:526b:d3fd with SMTP id
 5b1f17b1804b1-4ac1793fb5emr379631315e9.15.1793801384931; 
 Wed, 04 Nov 2026 06:09:44 -0800 (PST)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b2aa953d35sm145523125e9.9.2026.11.04.06.09.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2026 06:09:44 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed,  4 Nov 2026 15:09:41 +0100
Message-Id: <20261104140941.2752868-2-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261104140941.2752868-1-angelo.compagnucci@gmail.com>
References: <20261104140941.2752868-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/htpdate: remove package
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

htpdate is in maintenance mode upstream: 2.1.x is its final release
line, which only gets critical bug fixes, and its users and package
maintainers are advised to migrate to its successor, httpdate, that
delegates the network transport to libcurl.

Remove htpdate in favor of httpdate: its legacy option selects httpdate
instead.

https://github.com/twekkel/htpdate

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 Config.in.legacy                |  9 ++++++
 DEVELOPERS                      |  1 -
 package/Config.in               |  1 -
 package/htpdate/Config.in       |  8 -----
 package/htpdate/S43htpdate      | 53 ---------------------------------
 package/htpdate/htpdate.hash    |  3 --
 package/htpdate/htpdate.mk      | 38 -----------------------
 package/htpdate/htpdate.service | 13 --------
 8 files changed, 9 insertions(+), 117 deletions(-)
 delete mode 100644 package/htpdate/Config.in
 delete mode 100644 package/htpdate/S43htpdate
 delete mode 100644 package/htpdate/htpdate.hash
 delete mode 100644 package/htpdate/htpdate.mk
 delete mode 100644 package/htpdate/htpdate.service

diff --git a/Config.in.legacy b/Config.in.legacy
index 29c9b7f9e7..4835a23d07 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,15 @@ endif
 
 comment "Legacy options removed in 2026.11"
 
+config BR2_PACKAGE_HTPDATE
+	bool "htpdate has been removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_HTTPDATE if BR2_USE_MMU
+	help
+	  htpdate is in maintenance mode upstream, and its users are
+	  advised to migrate to its successor, httpdate, which is
+	  selected instead.
+
 config BR2_PACKAGE_MESA3D_OPENCL
 	bool "Mesa3D OpenCL support is now provided by RustiCL"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 21b5700dc9..7eaad5d2f5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -233,7 +233,6 @@ F:	package/cutekeyboard/
 F:	package/fail2ban/
 F:	package/grep/
 F:	package/gtkiostream/
-F:	package/htpdate/
 F:	package/httpdate/
 F:	package/i2c-tools/
 F:	package/jq/
diff --git a/package/Config.in b/package/Config.in
index 089860e7ec..b79f4dcca1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2508,7 +2508,6 @@ endif
 	source "package/haproxy/Config.in"
 	source "package/hostapd/Config.in"
 	source "package/hplip/Config.in"
-	source "package/htpdate/Config.in"
 	source "package/httpdate/Config.in"
 	source "package/httping/Config.in"
 	source "package/i2pd/Config.in"
diff --git a/package/htpdate/Config.in b/package/htpdate/Config.in
deleted file mode 100644
index d2a71fb696..0000000000
--- a/package/htpdate/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_HTPDATE
-	bool "htpdate"
-	depends on BR2_USE_MMU # fork()
-	help
-	  The HTTP Time Protocol (HTP) is used to synchronize a
-	  computer's time with web servers as reference time source.
-
-	  https://github.com/twekkel/htpdate
diff --git a/package/htpdate/S43htpdate b/package/htpdate/S43htpdate
deleted file mode 100644
index 22e5e6c803..0000000000
--- a/package/htpdate/S43htpdate
+++ /dev/null
@@ -1,53 +0,0 @@
-#!/bin/sh
-
-DAEMON="htpdate"
-PIDFILE="/var/run/$DAEMON.pid"
-
-HTPDATE_ARGS="-a -s -t https://google.com"
-
-# shellcheck source=/dev/null
-test -r "/etc/default/$DAEMON" && . "/etc/default/$DAEMON"
-
-start() {
-	printf 'Starting %s: ' "$DAEMON"
-	# shellcheck disable=SC2086 # we need the word splitting
-	start-stop-daemon -S -q -x "/usr/sbin/$DAEMON" \
-		-- -D -i "$PIDFILE" $HTPDATE_ARGS
-	status=$?
-	if [ "$status" -eq 0 ]; then
-		echo "OK"
-	else
-		echo "FAIL"
-	fi
-	return "$status"
-}
-
-stop() {
-	printf 'Stopping %s: ' "$DAEMON"
-	start-stop-daemon -K -q -p "$PIDFILE"
-	status=$?
-	if [ "$status" -eq 0 ]; then
-		rm -f "$PIDFILE"
-		echo "OK"
-	else
-		echo "FAIL"
-	fi
-	return "$status"
-}
-
-restart() {
-	stop
-	sleep 1
-	start
-}
-
-case "$1" in
-	start|stop|restart)
-		"$1";;
-	reload)
-		# Restart, since there is no true "reload" feature.
-		restart;;
-	*)
-		echo "Usage: $0 {start|stop|restart|reload}"
-		exit 1
-esac
diff --git a/package/htpdate/htpdate.hash b/package/htpdate/htpdate.hash
deleted file mode 100644
index 44d73fbe2f..0000000000
--- a/package/htpdate/htpdate.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated:
-sha256  4c771fe3fc5c4ab5f9393dd501bdc51e4c067297cf304ad1e74e1965ac1c066f  htpdate-2.0.1.tar.gz
-sha256  74096c67e102bb6545b84487b5e7f18edd038fd5fc0199c8a0b25efb3c522f06  LICENSE
diff --git a/package/htpdate/htpdate.mk b/package/htpdate/htpdate.mk
deleted file mode 100644
index 8d4b1e073c..0000000000
--- a/package/htpdate/htpdate.mk
+++ /dev/null
@@ -1,38 +0,0 @@
-################################################################################
-#
-# htpdate
-#
-################################################################################
-
-HTPDATE_VERSION = 2.0.1
-HTPDATE_SITE = $(call github,twekkel,htpdate,v$(HTPDATE_VERSION))
-HTPDATE_LICENSE = GPL-2.0+
-HTPDATE_LICENSE_FILES = LICENSE
-
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-HTPDATE_BUILD_OPTS = \
-	https \
-	SSL_LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs openssl`"
-HTPDATE_DEPENDENCIES += openssl host-pkgconf
-endif
-
-define HTPDATE_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) $(HTPDATE_BUILD_OPTS)
-endef
-
-define HTPDATE_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
-		DESTDIR=$(TARGET_DIR) install
-endef
-
-define HTPDATE_INSTALL_INIT_SYSV
-	$(INSTALL) -D -m 0755 package/htpdate/S43htpdate \
-		$(TARGET_DIR)/etc/init.d/S43htpdate
-endef
-
-define HTPDATE_INSTALL_INIT_SYSTEMD
-	$(INSTALL) -D -m 0644 package/htpdate/htpdate.service \
-		$(TARGET_DIR)/usr/lib/systemd/system/htpdate.service
-endef
-
-$(eval $(generic-package))
diff --git a/package/htpdate/htpdate.service b/package/htpdate/htpdate.service
deleted file mode 100644
index 95220581d4..0000000000
--- a/package/htpdate/htpdate.service
+++ /dev/null
@@ -1,13 +0,0 @@
-[Unit]
-Description=htpdate daemon
-After=network.target
-
-[Service]
-Type=forking
-PIDFile=/run/htpdate.pid
-Environment=HTPDATE_ARGS="-a -s -t https://www.google.com"
-EnvironmentFile=-/etc/default/htpdate
-ExecStart=/usr/sbin/htpdate -D -i /run/htpdate.pid $HTPDATE_ARGS
-
-[Install]
-WantedBy=multi-user.target
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
