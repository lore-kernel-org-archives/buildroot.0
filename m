Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D137C606A326
	for <buildroot@archiver.kernel.org>; Sat,  7 Nov 2026 16:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=SOupdaII;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yKRiZfVw
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0325811C9;
	Sat,  7 Nov 2026 16:34:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wcq2_VIsY_OP; Sat,  7 Nov 2026 16:34:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org AEE23811AA
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794069291;
	b=jXmMxNPonEBMfGkBCWIF3Zo8JaY/CP5ROjaL5ohybMQJUg0onDLe1MWUuvVvmL5zLMIi
	 sgbYqkyolrm980y5Dqf77MpZqscZOzy3x7eSmVUy4DvHfuGEwkOaORm12HpZa2sCP/pJT
	 7ertqUVN1FOnxRODVAHSYz70P2mdfd1F5E/cL1H4oaf1N6AQjhV7kOi8YYqqSZWTQW6MM
	 NFtcXeRlZQ/6TZtJP9jLD2qGvvUQTiIELx7eMX4IG5uYpWG3Wn8stB3N+5qSGAdY8+3uK
	 vOaDGCbvEF8Xjn8bbGgzR506qqZDV5ZUQVTPMHN6CSL4fAiIMvRksDJ+6GeJyzZNOXw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794069291;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=Qkwm+iKayFsSQB0GSHOIHryviUjaOf5asUM439B+WDE=;
	b=JS/NFmB+duz6LcAtSk4RPKxrJv6ftoNrIUQzjSuYWHUhDZzVIzTr6x/P5nx1uAKGLhL5
	 xW14rYf+kNqxWh4PADkRb+e14XvSb2noP+f3HVOuTzbz904Ga8CVNq9tmq2+mYO+qA1Il
	 IGnnThas6zcezRQ2Ic2paPdHAd3vTjsML+NzZm0iW3jpaclU45lCWabpRkqLue4BpapcS
	 NQSSsFtXLY8vtHDVY0FEZvI48SQWMuR1SrzSMIXIm9YoaIxv3WJjRCr6uswQq3EIPj/Yb
	 CDu3sO6zaRK4H6Askaqv2A5ATijLoxl7MX0kFBkEw2BK5Ex9Hqi3iC41hU5H0UdJN3w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794069291;
	bh=Qkwm+iKayFsSQB0GSHOIHryviUjaOf5asUM439B+WDE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=SOupdaIIR4B0miqpfv0il9pSDS/HH0D+7HKTC1Tx5KJVgaVAXVfL8BVS1reFQprVp
	 BL+zmO8yQ6IUM7bvXUq9fzz8T2yqS+mPmy9iuRus5OFkEN5PQqwjNORZwArrRaJWVl
	 OQWtD3pC65irZ7r4nYIfSZt9ucvNcjhCrkJPG5KLJv1SouJ/R7EzrQ0yy44Zi114d9
	 b+4xMQ+CZJqZbkzgIYYlDyt/+11+RCY14P5Dhwz5SBurLxw75pw0TxFoUcfYKtnz05
	 P+M+huP3nGP4JDHaALtxmAvqy6iRqznjJNOs0uOUQ2McLB7UOc0gMQxuLMhg46GwMa
	 mrQQw3wuHgpww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AEE23811AA;
	Sat,  7 Nov 2026 16:34:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 19C8434D
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 16:34:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F36AB605EA
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 16:34:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v4vekGV3QAqU for <buildroot@buildroot.org>;
 Sat,  7 Nov 2026 16:34:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org CC6EA605E0
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::332"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=yKRiZfVw
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CC6EA605E0
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 16:34:46 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4afe2d546f9so21173155e9.3
 for <buildroot@buildroot.org>; Sat, 07 Nov 2026 08:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794069284; x=1794674084; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=h+1fnAfCFQTVxKJqvZ8aQfuG24APTP2gQ9vsy8E0/50=;
 b=yKRiZfVwbLSG0W5iY8LZpbx3Tpu9/+wOyB3ndbNDexxpenz5YT44FzoBzKzgynbF/p
 HnloP7PMpe50rcrbuqaNm5W2ez2gLHOFJAMBBCYcgq8U+cFKjrBaxXRu4EIpdNmggsO3
 FmJJPrMe8TE+KpGbLsxAp4hhe9YAXpP803A5AIJCS8f+Qydr45oNWBx0GPFQT7YPLgYG
 NoVKEX6lSQK8jiDx2XmAylJy3UmGssuCwxy3C0kwpa7HM0QxXZj4ZzLkQuhG+FwYpPKm
 uSX65c6LdAkQrXkYBASxjxCOUEQbWpXzBhh1qvGaLGQnj7S61CvTJVHfptgLLxj1XMFh
 CKmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794069284; x=1794674084;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=h+1fnAfCFQTVxKJqvZ8aQfuG24APTP2gQ9vsy8E0/50=;
 b=AOJ3Gn/ZVc9yApgnrXlK0XU1oFGbroqoIjMrYX72y0kg8kWH9UgRCTUNb1Dqmiz8j1
 bfNc3vfI5Dz0212n1b5wIwNic6KHjd7Qe0vR5x3aoVv8HZTfBOp+D9XnfK62pHukByKJ
 4ekTtDx4+rzJa2tugrxdGwXo+9fW0fb0CEtPKd5uajWILNJAU5UfWl7Nj0/twBB6ty52
 IVDzLjr5fLylpySX47/HL/KkDOOPU/s56wbE6QVloXgQOSHw/nDZkUV0a0OOc8LsBB3b
 hTzL5CVHPaE5xiY9DvsvEiTkcHJFnRiJwkm91eMHyVZkJSxmlNWFpY+YaUwZSKDyumPU
 3x+g==
X-Gm-Message-State: APuU4Z831Du1y1d9A2FEJJ7OTPmr6alkSDVHd+tK8iGVm7xaRWIp62BE
 uXbM/MOkKioppvlzfE91dbDIa8Iw5Q8kiJvfE3YjM1ccnBy4WCO/iIwHKHHZAWlq
X-Gm-Gg: AYBFou3vfoIkXpBWjbk1dfQXjt3WGmSrGsfwnHais4mkiliC7+6MaEPrYxjjmcfJRSf
 WlRupY9M3k5zS76C7nNWtNFAbfSjibaulQbqdlSp5xB9X3FBlCjgHlefHm4okZrDR2ENh3ydAYc
 HcF8TZu2Q5+bZtMFkyoUeMNounEOsQdAeoe8EzNgBUZWDItk8p5k68zEXXjvIx/O2NlJPU5LxRM
 ZbO/pUiVXUBqT8RaFCSRx/AvblPgWSWI/LQQ9Rcm35VMgruYMFTLW/9Ciuy4YBlmTjGvttvinPU
 klwa6S2/brD/hqiSbi4BeGqenLy/z1kG602QJrVrylE1SPD+iM/q/rQwSuDgNw1ipFgSlue0oiF
 3xSyWufiEPlvC2EszcBxJtuFJg+elRs0ckKTl+zC+2XHNtsbaBjJXj58bwIo8rL7L4Q3iFChnO3
 ygDVW/nubdsV2x//yiJfbeyiP2n/HXWD++koHtixMZIMobqIqjXRdKXC67Kw2FIrvFlARAUn/hw
 19/xN2Y8C1E317A4PToNqYPuFbxqNR26XfE+2twCOSp72Rohf4lLXkBKtDzz6anUpKkecEOROZL
 QhVbDXr9UQe3lBw6yHSs5CXTzZIQNzaayhK3Tqpi0OhMT1rQ0ZTq
X-Received: by 2002:a05:600c:6211:b0:4a0:1c94:7042 with SMTP id
 5b1f17b1804b1-4b6de4a5d5cmr106054575e9.8.1794069284436; 
 Sat, 07 Nov 2026 08:34:44 -0800 (PST)
Received: from angelo-Precision-7550 ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b7e6eca30asm82268255e9.7.2026.11.07.08.34.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Nov 2026 08:34:43 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  7 Nov 2026 17:34:12 +0100
Message-ID: <20261107163414.560896-14-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261107163414.560896-1-angelo.compagnucci@gmail.com>
References: <20230903163509.614740-1-ricardo.martincoski@gmail.com>
 <20261107163414.560896-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v4 13/15] package/linux-pam: fix linking with
 the NLS and atomic libraries
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Leo Yu-Chi Liang <ycliang@andestech.com>,
 Romain Naour <romain.naour@gmail.com>, Antoine Tenart <atenart@kernel.org>,
 =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?= <salvador.joseluis@gmail.com>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Maxim Kochetkov <fido_max@inbox.ru>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 James Knight <james.d.knight@live.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Bernd Kuhls <bernd@kuhls.net>
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

Since the move to meson in 30e38505e4 ("package/linux-pam: security
bump to version 1.7.2"), LINUX_PAM_LIBS is passed through
LINUX_PAM_MAKE_OPTS, which the meson infra does not use. So linux-pam
is linked neither with $(TARGET_NLS_LIBS), when the gettext functions
come from an external libintl, nor with -latomic, added in f1a47904b6
("package/linux-pam: link with -latomic when needed") for pam_keyinit.

This breaks the build when libintl is external, for example on musl
with NLS:

  ld: libpam_misc/libpam_misc.so.0.82.1.p/misc_conv.c.o: in function `misc_conv':
  misc_conv.c:(.text+0xa40): undefined reference to `libintl_dgettext'

Pass the libraries through LINUX_PAM_LDFLAGS, which the meson infra
puts in the cross-compilation file, as done for example by gcr.

The meson build of linux-pam is also in 2026.02.x, so the problem
affects 2026.02.x and later.

Fixes:
https://autobuild.buildroot.net/results/455/455da16d91d6f87a1a7d412c4b1e0de403c5cbcf/

Fixes: 30e38505e4bc6f8313509bdee2418024693088fa ("package/linux-pam: security bump to version 1.7.2")
Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changes v3 -> v4:
  - new patch: fix a file warned about by the package infra checks
    added at the end of the series.

 package/linux-pam/linux-pam.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-pam/linux-pam.mk b/package/linux-pam/linux-pam.mk
index a4be4fa3b6..844ca2a1fe 100644
--- a/package/linux-pam/linux-pam.mk
+++ b/package/linux-pam/linux-pam.mk
@@ -19,7 +19,7 @@ LINUX_PAM_DEPENDENCIES = host-flex host-pkgconf \
 LINUX_PAM_LICENSE = BSD-3-Clause
 LINUX_PAM_LICENSE_FILES = Copyright
 LINUX_PAM_LIBS = $(TARGET_NLS_LIBS)
-LINUX_PAM_MAKE_OPTS += LIBS="$(LINUX_PAM_LIBS)"
+LINUX_PAM_LDFLAGS = $(TARGET_LDFLAGS) $(LINUX_PAM_LIBS)
 LINUX_PAM_CPE_ID_VENDOR = linux-pam
 
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
