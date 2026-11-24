Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BEE7606A321
	for <buildroot@archiver.kernel.org>; Tue, 24 Nov 2026 17:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=rfah56me;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=hEzK/zwP
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C9F2680E71;
	Tue, 24 Nov 2026 17:24:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mHfmhbsTDXLO; Tue, 24 Nov 2026 17:24:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5FAF680E5B
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795541057;
	b=gopiEG6LlnmJ1xSvD+P5xVtJhX57zM4REN3WEUrqa4T92VuZ6wA0QeXPtSifs8X+itkf
	 vZKqS5GOOCCrTDGgRiG9R2qyCosyWfrLOQKaIF9BjuYSg2DuhVOFuFcISusEizL6jsxyV
	 FZxkNbC5Nv77ZvULm9g/xk36IeUuG5m/235BZREB0L0Q93WuMuWGdAAkH/9y5iiakp8yD
	 T3k5kv/AlEWnlyQhDbbJ7FYEWBW3JlQ3S5lKQ1qRIBuTGuF/kwmzv4rzpAIFamAyKCBTa
	 AvlouI497xVbbyBrwok8eCvHbNlqkpuNkpmgdqhxNLBx8r9JwQaTqmRpUm6HI5gTw0Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795541057;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-CMAE-Envelope:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=tN8FFjnBPJTMURhYOooDB+Xw5GszFQT7UDrPGBi2FA0=;
	b=oQd5AuGu+tZDRgEUTC3nZrwGudXGKFg53SGebUnRwJBE5tEdKgoxtVFkcDYGdyGIk5lL
	 TSRHFYe7K3moJ2GILFrk2iAMEEhed9NDR4LN3BQsN/MKJ5K9sNopo1KrA0ILLEEdO1Dik
	 8kas/8MwDDanbDeKt1/zyaVCFNTRoVl4RrW8nXjmj2BeHv9rxjrmDkMGrvbFOScv7F6V+
	 xkFKUG/zSZ0w9Z5jQrgmkhJINd3CFjGuJBN/0yDsB+sPq/ZkH32INmYBNeLuf5rO1Axi8
	 kl2MFEEobDfqHHnX9pfaKYzfN53SVkJTQcTNWRcr8OkHinlCPjs9Hv+rQfLT4MwwdKg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795541057;
	bh=tN8FFjnBPJTMURhYOooDB+Xw5GszFQT7UDrPGBi2FA0=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rfah56meEyTRXUWIY3i8hh3yYAgZQNYii+2fWMdT4rT+sjtBpG/9twfOI8bHT3d8N
	 ayX024bSVFGwlOEzbBCR/qYHRZxocq4ZNEWzYGJzD/q1QKuVAMqdwrySeeih2/LNX0
	 5jFkpNCyum9kissWcfGqyJ2dbC3PWqus8BTzQHlNjNy68bi77grVjwbFtNVxW/sFRB
	 NokFW+Zuh/t+Ohbg7d9+O+x5CBza5BL08YoH2ftre8uZF19vTPPu6hLdhvfQ50/2fG
	 sAUtznPOu4dxADlKA0OUl8fL87U2IM9xy+v4BoemCRtN0vurYH/mFgn9Y7WcMtEtQb
	 7NTPqQuCL1nVQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5FAF680E5B;
	Tue, 24 Nov 2026 17:24:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1077479D
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 17:24:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 02B8960744
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 17:24:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S3hrxBCCO2jZ for <buildroot@buildroot.org>;
 Tue, 24 Nov 2026 17:24:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org DDFF560670
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=62.149.156.132
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.132;
 helo=smtpcmd12132.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=hEzK/zwP
Received: from smtpcmd12132.aruba.it (smtpcmd12132.aruba.it [62.149.156.132])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DDFF560670
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 17:24:13 +0000 (UTC)
Received: from localhost.localdomain ([95.249.82.110])
 by Aruba SMTP with ESMTPSA
 id VuFXxJwyPV5J9VuFXx2gL0; Tue, 24 Nov 2026 18:24:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1795541051; bh=Aj2IUtRNYRQOUh1np446GHlNk9c29xgCXpYw5EYJEvo=;
 h=From:To:Subject:Date:MIME-Version;
 b=hEzK/zwPDEhY0Z9F/SFWAImtAbaSpX/uFDX5oY2fzLc4WuFmA/Rypcc/sCTWVUUq7
 LG/VtHl3sWWz9UoKUF9y3zcODDLwU+nCaXPE/wxD2/e42RXnz2yqiohs4vtyeET38Y
 5sil3kpKujXvpyaDNKuz7P47dCOGFul/qOJwAF6Rj+GltedEDnIv4x/5rUkwruF1jC
 OG6BoCTeVpC8u3RVLp0yhhRk7lKEaB4aVe4LnJsBNVaMvFeUQV/GmVGucGrEYSiAIA
 5LPx/VB/gARDhWHwGG1PrJ/Xrx+yzYBDhX2QwEbVJDDdB6w2NpGKxVa7fRsAiVTJ8t
 sEB38nG5cnGdg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Thomas Devoogdt <thomas@devoogdt.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Tue, 24 Nov 2026 18:24:10 +0100
Message-ID: <20261124172410.1613827-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfJYKw7FL2TSKPvRH1znQeVSr/Z5feD9EFAUKOYR3opfM3iUYf/EvXbJ5Qsao2I9mlNz9NCR+GQLhqu964/jylCLyAVMJNLnsnUOGgfZTfC/7NDtNbMYP
 aC9rCnCqxk7Dw1foIzEaLZpsyued6z1kCpvRST8ple3cMgdNYAmSehEb0Wa0MGQNG94j2Yaeeg1s7TQm2X56gEtB7MUT5HFsS0a9GTVwY682dRCQQid+zqFO
 HcGGSW7kJ0oT+69R7cDWnVGgW7e5/ttL+rEE1DTUqFcdcihB3b3SUxg/g8PEC8vY1FPTQ5aHLpW5CrhuL6a0jg==
Subject: [Buildroot] [PATCH] package/librdkafka: fix build with LibreSSL
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
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

librdkafka doesn't support LibreSSL, since it uses OpenSSL functions that
LibreSSL doesn't provide, so the build fails with:

src/rdrand.c:81:23: error: implicit declaration of function 'RAND_priv_bytes'; did you mean 'RAND_pseudo_bytes'? [-Wimplicit-function-declaration]
src/rdkafka_ssl.c:1269:9: error: implicit declaration of function 'SSL_certs_clear' [-Wimplicit-function-declaration]
src/rdkafka_ssl.c:1679:21: error: implicit declaration of function 'SSL_CTX_use_cert_and_key'; did you mean 'SSL_CTX_use_certificate'? [-Wimplicit-function-declaration]
src/rdkafka_ssl.c:1773:9: error: implicit declaration of function 'SSL_CTX_set_cert_cb'; did you mean 'SSL_CTX_set_verify'? [-Wimplicit-function-declaration]

So let's enable SSL support only when BR2_PACKAGE_LIBOPENSSL is selected.

Fixes:
https://autobuild.buildroot.org/results/fb7/fb71058572ec270c46ff5de542c186c73bc06ceb/

Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/librdkafka/librdkafka.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/librdkafka/librdkafka.mk b/package/librdkafka/librdkafka.mk
index 636765b3f5..a68f5e9523 100644
--- a/package/librdkafka/librdkafka.mk
+++ b/package/librdkafka/librdkafka.mk
@@ -41,7 +41,7 @@ else
 LIBRDKAFKA_CONF_OPTS += -DWITH_ZSTD=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
+ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
 LIBRDKAFKA_CONF_OPTS += -DWITH_SSL=ON
 LIBRDKAFKA_DEPENDENCIES += openssl
 else
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
