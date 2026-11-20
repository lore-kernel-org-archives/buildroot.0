Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB64606A6A4
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 20:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=UkrNWp99;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PrLkjATh
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 612576069A;
	Fri, 20 Nov 2026 20:50:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PJ9UWdGOSFke; Fri, 20 Nov 2026 20:50:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 65BAA606D5
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795207814;
	b=LMtmCfF5vQadeX7AsfXABhn8oSpIQjPrOZXCO1GJPvFmj1etW+M204qj54GwybayBM29
	 uQbABH0MYP5njL8F0L4y9DIN+8+vOBw1JdtKgwAlQDwIbyTnJ7MTb1THfn+Do3bP/oPiT
	 Ai5kJYFPsl7gu5TgychdZHFYddtyRE6wagdgDkMtLJWrxuqACjn8rQ0Vj7M9lujfWP93X
	 zhRaLTQalHw5m9P74tMqMeNaEEybn9q7VAbwTiMEj5Pxwf7EC1C2XKox/OtgYxV/UXwXv
	 zpXy/EiPAcT2M/jiB/XsYks6hSCRfFXixwU3gnzQI3MM1Wnr2wDQDqWkA2445F08UFw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795207814;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=pIWoMFMMMj9VPEj+t9PzQX7eIKKo41TnKcvkTvF0dr0=;
	b=D5JON7/pFGY44GMvvyBafI2yNJfLG0L3uEEPMNtZ99O8Grf6s0e/2Xo6UIn0vRxr61rB
	 0yVzmumqFT5n5v/2qQVT65JnsKMU3ZzSMgNklOnwWKPyqOb3/4vSnj6tdkZYngAX3c8LR
	 5M0JtELhrdZp/+maJmDP2AIreVmlkkOCt7cx3FS8LfbdcsLpVwakfI1fMkmc776mndG7T
	 6QuEGbzAKtyphXNewAz7Vud9Vx82y4ZuOTuDF/+gccGdBRAfBXJOm/nKyX/hHQ3IOMytm
	 TPtYvsXApa2YviyW4OvZroRr1FvIitd7KQpq5SI/kNLu5gt5y8+1N+0KpwCQltsFHJQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795207814;
	bh=pIWoMFMMMj9VPEj+t9PzQX7eIKKo41TnKcvkTvF0dr0=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UkrNWp99nOLaUkqYDWanR8ze/gAcvZL+jlJpBqumN8KQUkahnPYfeJsnkxr3WCFhF
	 4vZtnLYlnQQ2EAmW+apeo/joKfRkJWCjXsHZqgOPkBoq6SXcrDeKMNJSO4il+HIqC3
	 N//Qq0Xh1zJ5vTWxQEinZ17Z1ydsciiHAME6GGfylT6/8RzHJjcYqePUGpy4ICXrSg
	 D4sDwcqG7p5claJbzJl6rVLM2rKDzFeLqy9ZUd//ykoL3Kzq3xvAUYURNYAOuxB68l
	 imKciJtgvtAfliku+PMynE0DXX1yuUQBSyq6IFO6G0cwy6KAJBqb5+DMuNv5c1duXV
	 M6XTkCPxA/ToA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 65BAA606D5;
	Fri, 20 Nov 2026 20:50:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C52A3971
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 20:50:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB20381693
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 20:50:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p3Q5hwUWdAiD for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 20:50:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7C5EC8168B
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=PrLkjATh
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7C5EC8168B
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 20:50:10 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4bb70074ab2so14059855e9.0
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 12:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795207808; x=1795812608; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=tc/StyLIlSSvQFiOWN6JR3bctJLb+4EWYfEJEVnZ+sA=;
 b=PrLkjATh9pgeiExLcrj0dWs4/eVL2XnFDX/u/ZzrJE2sm8E6ISwjRUWzmPc9pUCoaV
 8eVI6XPb2kXm9+GmZwSROl7CE1l/1TbRncfHpwy6Lrn3AmdbvzorD3lxwG9YgutcnriQ
 WehTeCMSv5DpfHSbwXPvxiZG6MngE+qoNUAXdkpig+2s7xtjERM41crg8n6LjdqBUVpq
 /B9fz1hmPKj0YVFVId7WM5zhFVV9OFJMSNRFFnEeiAgePO6knbUZvZqeG10NtYK+oVzK
 Dkz22zQ0bk1OJL2H82ObCE66Iyu1svL6Xr3n3wl7Y8fqSoqGb1QMQVlz4VOvNKpv7e/j
 dK+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795207808; x=1795812608;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=tc/StyLIlSSvQFiOWN6JR3bctJLb+4EWYfEJEVnZ+sA=;
 b=d3XyNLoU5P2JAIbdUi8daceOiJInI7f+ZW3K7er5gRriVovfOOp/Xxo/xGsN4JSZKq
 XVioUNGt1MfdsOfMQNmqVN/ksjUcSUq1vX6Wit8fcf0SGfoD+9bTY4XZXBr2AfQOpbuD
 pANIodBCeUjC4161okNzMXgawRl0Lam8l/zjWz2UWxRxTdf6XDP+xzmMyu1RB9mkC0dF
 2lJ1tt9OlH0ZhKb9bpFF1S0DgxUovQjv6D5JlZ3QK1kPdIYo8AN+3RCpUQEvNzDi4v4v
 xazaXwfJsps4SVGlEbZHspMXvswk33VviXOZEptMCCFeSMDf3Wa6CjkK1/PHa8wnJ3TV
 ydWw==
X-Gm-Message-State: APuU4Z/L1hYKDZq2jMHnMQxGd7Z94WsYXJnvSs9FTZzpvcM2d9g4GAEq
 BL0F8lK8m4ZuVq2pRi528qnz2Q1tw5AQywKwamNlVySMX4g6jhNCCPYfcioEgg==
X-Gm-Gg: AYBFou31nKvw17P99BbWjlpZa47SVZzYxCP+3FWZ7Q1Rco1VjOcMXUDkGOVVAvAwP9J
 cdnfgqWZXKwffRTws1NeZNCCiizO82q6pQEL1jBP2Z836hDuGK2c0FCWGYrks0DDQQ8ndbo7wO+
 CJiC0kzujMYSUn8gP12ou8LHxWV7mYVie1lkrvKOwBaf9wQj0ZAx3XSv5kotnxMA3NA36WgPsDF
 x3m3StvSzCp02LrRTPpFFAr8/Av7ggfX5dUBjxUcyY889+zP/HrKRZuGy5kJrqTqG4Wb01ZhGas
 xEipOEg7+n9Pn4U/KGG6SkoLbUUOCDzNraDZkxRLruZSUGwuYZNTHvkIevaLxmMgZOgGQ7DCUbE
 w46jAGwIf4OsnJPNch3jkwkCZe+yzvGvRjf3W3wGCshsV5eDwqlhZDEhNdwt7rIg7+2dAlVqf1O
 eNv1Zd/pEdH0Og/uaim0LK9qFpTrHmNH4nds6JT+rm5t/7n+Jc8JuEqGXufxm0P0ZPAj6u8NsTg
 nyXWlipjtatyhKkojA7hv3IfRrLFtL1eq04RqmFg+mogRGqpjL7RHXy7Iv7WWa9GQSYuF2GNkf4
 utZb8CPBn7pTFUHVsaP+Hb/rU5Y4mu13Q3/JBOooE74ehfip0Zg=
X-Received: by 2002:a05:600c:5246:b0:4bb:6de4:2f7c with SMTP id
 5b1f17b1804b1-4bb8881c5bdmr103654325e9.20.1795207808627; 
 Fri, 20 Nov 2026 12:50:08 -0800 (PST)
Received: from angelo-Precision-7550 ([2.58.136.216])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb8849e598sm102082455e9.8.2026.11.20.12.50.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2026 12:50:08 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 20 Nov 2026 21:50:06 +0100
Message-ID: <20261120205006.4022078-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/httpdate: bump to version 1.0.2
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Upstream now installs the binary to /usr/sbin instead of /usr/bin:
update the paths in the SysV init script and in the systemd unit.

httpdate does not use libm anymore, so stop linking with -lm.

Release notes:
https://github.com/twekkel/httpdate/releases/tag/v1.0.2

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/httpdate/S43httpdate      | 2 +-
 package/httpdate/httpdate.hash    | 2 +-
 package/httpdate/httpdate.mk      | 4 ++--
 package/httpdate/httpdate.service | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/httpdate/S43httpdate b/package/httpdate/S43httpdate
index aff7a00eb9..dc87bd0a24 100644
--- a/package/httpdate/S43httpdate
+++ b/package/httpdate/S43httpdate
@@ -13,7 +13,7 @@ start() {
 	# httpdate does not write a pidfile, so run it in the foreground
 	# and let start-stop-daemon background it and write it.
 	# shellcheck disable=SC2086 # we need the word splitting
-	start-stop-daemon -S -q -b -m -p "$PIDFILE" -x "/usr/bin/$DAEMON" \
+	start-stop-daemon -S -q -b -m -p "$PIDFILE" -x "/usr/sbin/$DAEMON" \
 		-- -F $HTTPDATE_ARGS
 	status=$?
 	if [ "$status" -eq 0 ]; then
diff --git a/package/httpdate/httpdate.hash b/package/httpdate/httpdate.hash
index 31c6d80868..10d524cba5 100644
--- a/package/httpdate/httpdate.hash
+++ b/package/httpdate/httpdate.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c7a13e693de32e48fc374f36598390eece04e4c26f21b1e7d67cdc680d60236b  httpdate-1.0.1.tar.gz
+sha256  bd1f07616c3c41a1c9b014a23b9cf0c8e2c38902a8a75fd7576e556b9edbb6b1  httpdate-1.0.2.tar.gz
 sha256  cb7177d68741cb08ed1fade01b9f9cc7d1c56c0e96f3f6ab86f5b455cf99e44f  LICENSE
diff --git a/package/httpdate/httpdate.mk b/package/httpdate/httpdate.mk
index 6a21f0fccc..5c5af7d100 100644
--- a/package/httpdate/httpdate.mk
+++ b/package/httpdate/httpdate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HTTPDATE_VERSION = 1.0.1
+HTTPDATE_VERSION = 1.0.2
 HTTPDATE_SITE = $(call github,twekkel,httpdate,v$(HTTPDATE_VERSION))
 HTTPDATE_LICENSE = GPL-2.0+
 HTTPDATE_LICENSE_FILES = LICENSE
@@ -12,7 +12,7 @@ HTTPDATE_DEPENDENCIES = host-pkgconf libcurl
 
 define HTTPDATE_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
-		LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs libcurl` -lm"
+		LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs libcurl`"
 endef
 
 define HTTPDATE_INSTALL_TARGET_CMDS
diff --git a/package/httpdate/httpdate.service b/package/httpdate/httpdate.service
index adce46d929..efacbadf22 100644
--- a/package/httpdate/httpdate.service
+++ b/package/httpdate/httpdate.service
@@ -6,7 +6,7 @@ After=network.target
 Type=simple
 Environment=HTTPDATE_ARGS="-s https://www.google.com"
 EnvironmentFile=-/etc/default/httpdate
-ExecStart=/usr/bin/httpdate -F $HTTPDATE_ARGS
+ExecStart=/usr/sbin/httpdate -F $HTTPDATE_ARGS
 
 [Install]
 WantedBy=multi-user.target
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
