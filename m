Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12CF606A31E
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 14:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=rSziJJMB;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=ek4Xgzda
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B2A2D80DDF;
	Tue, 27 Oct 2026 14:42:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ctuHbwzo_Usw; Tue, 27 Oct 2026 14:42:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D1DC480DE3
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793112128;
	b=jNgBfMt0eLTtTJaRIiYxeJe0bjaWQhguaky2v1fOUZy1UhUoQtx6t+qkVjgcFExrrGWy
	 MdPehrk+aPW4S2kg/TG7TxnHybf5DaTzHKwN6QBo9/MBhAjnA5Gt5DVtffOci8w7+LIid
	 ksWxan8QaCHrQhRpgE/a7qP47VC6koCQAYkLDAVObm/iEe/BPsMGytMkOGoAoM3K7ilPF
	 OtjIcyPYG8Pk4pVIAb+5e+a3ZHyzu8Jr0zeD/icnMXErSOI6xhvzyfxgfMsaKwa2t/X3w
	 Fv4ImU0KF5xkZJi0DiwbbVB1wYluUAMkHRa+l5nUlDbSN0wEzXkq8UlBp8ZwHLFcGjw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793112128;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=MjS8HsX95kyLCk2/WVxdK61fxpJaQ8kS2KHIUWtPnik=;
	b=PYsr1gMVTPI8Ea4mBuQPKraKImiqSmQYxWQBCMMYizg8Tl9cpiTJ6D8UJa9PxBt2k7U+
	 3TkGkcMXzAKgwwu0TjYIgHT8EB2/xGg9yR0df/P6RJt9quTk4wIgt9jQAY1miDLFRVId3
	 OE2CX+Ohxnmue2NLM+vgJMYcqHEAM0pcaymlP3m5l5yKSwsWXN32fB/BcDbWzn5rthchr
	 0nnMF4YLf0nfHYGt7qBS3d7t43rKtOkk+j/LkO2YnYWEquPqxN1L3AuVBYQePXW64SQj5
	 WjY4HUMKm2soPdnsx0kz9kFzCfxi7q9MbmQG0vFv+4cah/k//wBYlTCWF6GhQBdGQhw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793112127;
	bh=MjS8HsX95kyLCk2/WVxdK61fxpJaQ8kS2KHIUWtPnik=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rSziJJMBzx18a03MyN+riXQ3+Kcf+JoGDerQEywqMSsOsUPAmTxXnoMnkEiUwH/Sj
	 rwKryHwXEv5T3s3ij2z4FsIug+dncsWQZCMkTzrKmR/beg0tgfrnM4LfNILXBMHLNT
	 ZLdA4hePuZ31voeQpBWe1JZXyShl0GVD4ZUzXqkjkuFEGISeMUOz2CgmsTBX1v7jbN
	 3cT5GaZhNZ+zowroOJ00kJfrUbHlZZ1Z9UzwbrnQyCtMg26hSH+zizsxvQflc+I9qX
	 RWYz1QSnBo/JdjR4GwgH+oaeVCw4qwSdWT1mW+8pWv4QXxiXIX+fuxXndtJI6BXwRM
	 sK9VR2wzlaafw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1DC480DE3;
	Tue, 27 Oct 2026 14:42:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 440A5A32
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 14:42:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 35A8460793
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 14:42:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 86-HlZAUD653 for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 14:42:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 26BF660613
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::435"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793112125;
 b=TqI7lnqlHVcLNfFN7e5kpACGN1hAHcmB+oIA/U6YpViW2WJX0HNO1D/LXK7SkoGaYsaL
 LZFkHGnPCuYlCAdohZyhPuGKIpMLvckTDRlDIwx95mne7EByRKHy3nM/QAd27+cjT0Vny
 Xzkqq0UECPOgLsg8A8z8yhzXRJqwYHfFzS9+5cbnBqsWdnXejbxqz6GxaXucLDKg70L7Q
 Q3EA4FayvpBzCvslKTJ3GfIUpg+zXSHGPhPmJqiwNEJjqml5JVXKQFL6YkktWRF3WhzSJ
 sT0zoZee64ajOoYQTT+0W35UhCsbtzEgm+g39rBNX9hCAqvI9chRELPzPbjtg13yplA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793112125;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=b4HxYWj7YlnSwn3RKBp9WJfzkJ+IvqNqQDOHk2ewZYo=;
 b=oxC/WKx6O1hkiqTYdao6OndLWqtExc49vSr4b4vh2YjhMLWY1CPVXvmtvxYCTNXw+Yid
 CrzSQeWMXdpjhmDS48Pi/GkI+3zmvpBu1CNeashygNsaDhZi1UDIx2tqyRiixq/oGjzLS
 q/mlUoUtFTmEGO9lyBa3v2w22ZgFi36q9qnD/w7YIQgf3QrWGwP5BMLJ6wKrbr1Qo5DWh
 IXjop/1rfu85jkijGpccUrzYPLQftsPW7VKS3BDmQZTjYoUieL8YfkGs5HYot9yFutEY6
 Vnxcm+tz8YcU67qXz5INkAJEA79X1iEBa0C3RMs6eqzK1mf96NCk10+H3ar94E0uJXA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=amarulasolutions.com;
 dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=ek4Xgzda; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::435"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=ek4Xgzda
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 26BF660613
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 14:42:04 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-48afcfc4bf5so3499031f8f.1
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 07:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1793112123; x=1793716923;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=b4HxYWj7YlnSwn3RKBp9WJfzkJ+IvqNqQDOHk2ewZYo=;
 b=ek4Xgzda07JBOPDVjPyCqUjjVTZz9FCEO6H0pRiYAjHJYK8YlAuD6l/lz9+ICoHkue
 0MJr+CJjZO4R7JFO+o5DgGdVjHOxn1krkdcxp2BkToU6tKRHsmhrleASeop6kyOf+KSa
 YLyk1mf+KjjsecR039QAqsl3IAB5Ee41JWUso=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793112123; x=1793716923;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=b4HxYWj7YlnSwn3RKBp9WJfzkJ+IvqNqQDOHk2ewZYo=;
 b=XXG5b+QMnQ5Sg2na2K08kl4Mo6ZT5fsU/QqMEX5xU+yjb39TdL2VUlW95aAISdMFtS
 9vteNP/UK2YW0SYMOD0rpjGqUOxTtjx1DHjmkH3smlP+0gmzmrpXny4ivCgkht4wOQR7
 ijiOdWsK3nQIDu3W55aVgH/Wduz9aH7d03x/H0GBdvyJRUQLjX9xW7d1dcSU0DIZb/xR
 +WM/LRTFcKDrIxxyq/8c6zaPPhBlYY6U/8sFCzmHjqR4ILPVTlCZSt5zTatnmc/MAd1y
 NEp9tZWyjiiu9oks6pzMiIgXyqLXkVNB1uyaXiPPhsz76CwRLLtaJR6A7+6Ekd1UIT2I
 +miA==
X-Gm-Message-State: AFq9FYLB4WN58hOtaWZ/PiXZDgDISxiPLgJq476H9z/4kneIi6gwQ+/H
 +yzaQ9hmdG1JBToh2VjBcBK8o8qV6c7gsAHSxJ3MbLPLTyZhqVTs75gx8adllktGlzr0AekTVz6
 B0glY
X-Gm-Gg: AYBFou2d91tNSxpwmYZ11rpw6MA6Gp9nGhjeRliTStCjlfuuKlNHPSX81t8OP+8vNWF
 nfawz4rPvGVy+9A62gGrc39LBkpbYDsNDOxaT5Gjk7HQkIHnwq6Sa/Xh73m/XZXmAc86qly83Ed
 b8PcSfMObkOakRKrAiGiYa0Tcotdyws6eyeqRP94TNaCk2ZYeTayHs9cwOwJo42LUvYhMXLvlGA
 aG8f92i2s9ag0pacRYbNq5Mxhd+tNilzd15F0ZZmpChOS+nFLgUBxPEqiMEYufi2dSuRInMu0CI
 Sx3cAK5gFLbqJvbyGu4Ttxb1ZGqHqqDGnuTcrOrIf2qI3NbVeFPEWZVN+5+716Wd0cHLet66vca
 r8CDSa+r1OgfGTvIsLfoKDzcx9E6uPQuvufHkpYHFCH/1JNEChGpPBlhrJq7/LpGUGA7U2mKWJa
 iJZp6LVj9UJiIOKZGAjd5SdUharwVnygH/eG7C0btVfeQPFGI58R79YmdR/DkUpBwjCeRMc5aIg
 WbaRd1O/gv8EBahFpp25/tc4qbxAM41QaaiUeuQVXtitU31sQyyopAUAWk6/Lvn+pYScj0vn5KY
 zlVHVAa8QGEkKdAFt4NLTLhLeW1xpCmbbSBjN1sfJGVDUTT00z72WNSNXsEVZhh2vB7AhcSwG4H
 O0IX60ix9ykScIjFckOYaETkRAl3T+zKTeXtnUzcSvAy2af2fyMRb
X-Received: by 2002:a5d:6f0b:0:b0:48d:f488:f32a with SMTP id
 ffacd0b85a97d-48e3eb8e5f6mr19559136f8f.56.1793112122643; 
 Tue, 27 Oct 2026 07:42:02 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ebc39a8sm24204014f8f.11.2026.10.27.07.42.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2026 07:42:01 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Tue, 27 Oct 2026 15:41:57 +0100
Message-ID: <20261027144159.1097876-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/drogon: fix optional TLS dependency
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

The trantor library bundled in drogon looks for a TLS library at
configure time, and uses OpenSSL or Botan if it finds one. Since
drogon.mk does not declare any dependency on them, TLS support ends up
depending on whether OpenSSL or Botan happens to be built before
drogon.

Select the TLS library explicitly, following the same order as trantor,
so that OpenSSL is preferred over Botan.

host-drogon only provides drogon_ctl, which does not need TLS, so
disable it there to avoid picking up the TLS libraries of the build
machine.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/drogon/drogon.mk | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/package/drogon/drogon.mk b/package/drogon/drogon.mk
index 03cba45ceb34..8c51d16ac0d7 100644
--- a/package/drogon/drogon.mk
+++ b/package/drogon/drogon.mk
@@ -21,7 +21,8 @@ DROGON_CONF_OPTS = \
 HOST_DROGON_CONF_OPTS = \
 	-DBUILD_CTL=ON \
 	-DBUILD_EXAMPLES=OFF \
-	-DBUILD_TESTS=OFF
+	-DBUILD_TESTS=OFF \
+	-DTRANTOR_USE_TLS=none
 
 ifeq ($(BR2_PACKAGE_DROGON_BROTLI),y)
 DROGON_DEPENDENCIES += brotli
@@ -57,6 +58,16 @@ else
 DROGON_CONF_OPTS += -DBUILD_ORM=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+DROGON_DEPENDENCIES += openssl
+DROGON_CONF_OPTS += -DTRANTOR_USE_TLS=openssl
+else ifeq ($(BR2_PACKAGE_BOTAN),y)
+DROGON_DEPENDENCIES += botan
+DROGON_CONF_OPTS += -DTRANTOR_USE_TLS=botan
+else
+DROGON_CONF_OPTS += -DTRANTOR_USE_TLS=none
+endif
+
 ifeq ($(BR2_PACKAGE_DROGON_YAML_CONFIG),y)
 DROGON_DEPENDENCIES += yaml-cpp
 DROGON_CONF_OPTS += -DBUILD_YAML_CONFIG=ON
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
