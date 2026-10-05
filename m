Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7F6CCA5FF5
	for <buildroot@archiver.kernel.org>; Mon,  5 Oct 2026 13:40:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6ADCC4066E;
	Mon,  5 Oct 2026 13:40:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DCFSVisqX_FI; Mon,  5 Oct 2026 13:40:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 839A24061D
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791207625;
	b=Ez83xoFUKVfA9rk1K0D23RyrP8QrFXc5gRhuUJWL254BVi+Mmf+22I/Jc+CvbjcZwXUP
	 QqI5aMPIWwbc/c8+aOQBIheeEcZpBfxLfSAieLXlrgMTbib7v60N0rRDxAKYkEf1wYns9
	 N6GW4gMxBsghgEbbgHlbJ4MX9QnPf3BepFha1VI1FKa0VrnbduqWMldd0W8feaxmLCcHa
	 VD6Fq3e23m+v1UtjMIMdn6XobQcZauhDSFAcxAqgeKL71zQQqVbtFeWKOLx828n2elYus
	 rzjZx/0AoqLHmYYbyC9rtVc9orlQHB5aWVZMc6bbjfJKG2Ch5PDJzk7juic+6b4A9Tg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791207625;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:X-Google-Original-From:To:Date:Message-Id:X-Mailer:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Yajs0O3NEO/B/4zi5rnrgVbChZ8Vkw2urwOPPikKWiE=;
	b=q6z4pi0LhOxLnuxPk31cyAcQv2HtOmxVToH47UvrmUUHhVMExe7iy0Wex7Fz98jqJeoq
	 K8qeb4nrmpXzVwuFeDH92+bQ4jHc6KtBC97GyPESNJ+SvBVc7CauqgvGQTRWdE8pII6Kn
	 zdCCEDShPkZ3P41wJN7jqVclyZZEOH/SzpbZLxZzfJWw8OE0wfVoF8ug2UsgjenaEPFJ8
	 OWprEXamy5VKvD99oYY4/1DZwdtIDaaJsU8yAMnSEaFAyErKkV8UKfNPecTczU0eaLo6O
	 4WBGPYFpmjI+NQFonEF6Xn1M1rcQxK5cw+ePjaYtXyZ4DwCDLm1utYvCcYKX0p9kYPg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791207625;
	bh=Yajs0O3NEO/B/4zi5rnrgVbChZ8Vkw2urwOPPikKWiE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=ArSoo3By/a7qIMi+9FIYLJ7lBUX+vtDx8i2VYTCmgaobrDKABXjr0REKVNB1ghX4F
	 V6jOAgUp9BSfRDR8AjQXhTxtOp7Gd26PO3h0thxGwnVlQeBOp0JpbTh0EGzVCR+sQy
	 oqJhhBSal7aLfwWeZI4h16k5+nieBatE4mvVZmqFKP626mT5O9JfuNzsmJiyVSAmcL
	 FuU95sD22laYSoufaaKYczI6vTNJpxVIwy16At3fE3f1liwXEFXrJd0js+hxv0ljrs
	 lwjU3JyoEioirIs7N43JCbGLs3lf19tXRHKW8C1Ku1JnmKepsTMDibnXN93eMG7Zlp
	 mIOn5/bw2H85A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 839A24061D;
	Mon,  5 Oct 2026 13:40:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C0F1E1A6
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 13:28:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B220880C66
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 13:28:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fzrt7EsM8N4g for <buildroot@buildroot.org>;
 Mon,  5 Oct 2026 13:28:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org CF32D80C55
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791206922;
 b=dRowHm3EEpm7ihlNM6ucxFotaPiQwxbmfJ589gHqul0J3TTG0uT0C7shwnPMWxPZb6Xd
 5EqQsqE2zvYUGu7Eyfo9zGygW+v86lk/Cb8E4amfk0wCB++MZRQGDZElwF3ZaCTVTFT76
 d14V4GI1WPqWeDz0abaTZifrbuoElSOrRobjwr6R6V85vmjxYm1iY0c+DDoMBeoU6dMJN
 SVFkp2STqw/eK1AvReplVhAujDq9Q/zmhUDSInIGy5C22egOtj6lpx19GoqXdVhehc0k7
 VLcSnXGejj0Sp1trtVYjfhGyiQuuRJfPBkkVpF3v75BQ2ttm1HpzqJjDy2bHBGalfnA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791206922;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
 X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
 MIME-Version:Content-Transfer-Encoding;
 bh=gCthj2Vz1xwm2pESKG2jyevlrxrnGB6h+cKXKlBGkVc=;
 b=Quy/4ahB9HmVZrHPvbpvoedzPeSieggRDhVLioatkrnqQH4h5m1FXwFTVMFxWnAnBUKj
 zLG+TyyiZL0Zf2X9SAeUAv1DSvc+pu14PZSgtn4P3RTBgySOZV6ImeN5ZAqT7bZCnfYHQ
 iRhnS4i2tOZFYpnjmMgPqnpnYzMp5Ss8mJUmfHJVFQ+CXj1zGl7/dLwbHF4gZzDh4+ozl
 f1lNfgXxPJFhTlw6/LqZDdQ7pTKwmk9e+hAwfAMosOESdPP4iIue9/V5XXO/iHQwrQjds
 mnV3HlIBs3YClBFkc4rXrCEJqH63trD0yVKAtS3B16aCdiS9rS6Tbcq+OVP8C1t8SsA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=googlemail.com; 
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=JkzYhUNl; 
 arc=none smtp.remote-ip="2a00:1450:4864:34::d"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:34::d;
 helo=mail-ej2-x0d.google.com; envelope-from=yegorslists@googlemail.com;
 receiver=<UNKNOWN> 
Received: from mail-ej2-x0d.google.com (mail-ej2-x0d.google.com
 [IPv6:2a00:1450:4864:34::d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CF32D80C55
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 13:28:41 +0000 (UTC)
Received: by mail-ej2-x0d.google.com with SMTP id
 a640c23a62f3a-c2e3453dd0dso310138666b.0
 for <buildroot@buildroot.org>; Mon, 05 Oct 2026 06:28:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791206919; x=1791811719;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=gCthj2Vz1xwm2pESKG2jyevlrxrnGB6h+cKXKlBGkVc=;
 b=P1KAfoaSC1NJ9Tpnv//SlTrX7gwBl4BwQfEo6m3qfrKvNB5/yX6P1L6i1vEFoOKxwR
 EHbtxl1R0Rqzd2oEo17B6jI7OgBT81GF6Vqppm+b8HHxS1LdmgecM6StjeZ7cQadhIF/
 hUuk5Ubjr8eks5HEMAC210WFzoBWulTwqhZxs9PCUi+HCpOgL7S1xzZ7txMRVYmbgc/R
 pGU3BsPB5UmvVWZaGspsfYAtIGnUlrED/lK6Q4tdrs6N9fVe6Zx7Fw71OO1Ouv016Qk7
 Hw9DSnjmcW3wl8TkcpW3sBvr5v6PabeenU18miyCV5l7dvrJJmCNN/0BSd6jjdyR8TUp
 BkpA==
X-Gm-Message-State: AFuF++lUHMDSsIXTIbHLK80LKe5lVI4VWqFLOnqySbTs3PVKJZX4dvJo
 lDh6zLzvP3RucuHp0t8JEA8gxl2j4JpMhCITj0sWLIZ06sb+kMONFiE+1/rTyg==
X-Gm-Gg: AYBFou0wF2sapfJDXk2Hg0Rb38Ov6yoV0KRdX00V+5wk/XvKRpxZx14riqUle0WgKpY
 sAzEzys0MnoVzFRv6jIBADPdCi1TiqwWTv+a+5+waA22DLgGwXAgQRJ+21GVPoS/TH3aS94ToB2
 7HfcevMopLN9gZO9irNdjIxMFDJup+2ffMlqcKNCaxzGEeHxWAycyiKzQzFJbnEFbrmayzQO9ah
 TiVbGtECb7MDRmQo/kOCkFdm9w19u6o51oqgQebQnxRnhJvA7INoMq9ijuXirlQJjTP/ARyGXNK
 GDLoHKEk5Hrf4LLnMLxlSVigVChpbvNI8X4UwshCFelTSQYgPcmaNhmwTJhcuVBTqFSI30ZIE+J
 ZKy/6Nk03XvHfcnTV33Bjb5oA6d5PwbGPFkJQaY7SPU990pyZ1mET1A4NLmi+ZHJhdndZjv2k32
 EmpBsVRPYCAVZO4Ru3XhT3K8ELxU+tE363c4cUJ0Wt1cbA5cyHZH5ljXx/+ynBsDsGOE/gXXo7W
 2b3iXz4otXfKEc/xCGRWiKVTKho01vAU8ccIS1Dmk9adG4=
X-Received: by 2002:a17:907:3fa4:b0:c2e:2b9b:f16a with SMTP id
 a640c23a62f3a-c2e4ae0270bmr1001086966b.39.1791206919224; 
 Mon, 05 Oct 2026 06:28:39 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c3156331e16sm78834466b.57.2026.10.05.06.28.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2026 06:28:38 -0700 (PDT)
X-Google-Original-From: Yegor Yefremov <yegorslists@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  5 Oct 2026 15:28:32 +0200
Message-Id: <20261005132832.203227-1-yegorslists@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/inadyn: fix mbedtls support
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Joachim Wiberg <troglobit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

Since commit 6bab22ca41 ("package/inadyn: bump to v2.10.0"), the
mbedtls condition is written as "$BR2_PACKAGE_MBEDTLS", which make
expands as the variable $B followed by "R2_PACKAGE_MBEDTLS", so the
condition is never true. Without OpenSSL and GnuTLS, inadyn was built
with --disable-ssl even when mbedtls was enabled.

In addition, inadyn uses GnuTLS by default and needs --enable-mbedtls
to use mbedtls, which was never passed.

Fix the condition and pass --enable-mbedtls.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5
---

 package/inadyn/inadyn.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/inadyn/inadyn.mk b/package/inadyn/inadyn.mk
index a8891debb3..68a28eabfa 100644
--- a/package/inadyn/inadyn.mk
+++ b/package/inadyn/inadyn.mk
@@ -15,7 +15,8 @@ INADYN_CONF_OPTS += --enable-openssl
 INADYN_DEPENDENCIES += openssl
 else ifeq ($(BR2_PACKAGE_GNUTLS),y)
 INADYN_DEPENDENCIES += gnutls
-else ifeq ($BR2_PACKAGE_MBEDTLS, y)
+else ifeq ($(BR2_PACKAGE_MBEDTLS),y)
+INADYN_CONF_OPTS += --enable-mbedtls
 INADYN_DEPENDENCIES += mbedtls
 else
 INADYN_CONF_OPTS += --disable-ssl
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
