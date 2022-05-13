Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4855C433EF
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 07:11:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5AD5782505;
	Fri, 13 May 2022 07:11:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KYRx2ZtLDyAq; Fri, 13 May 2022 07:11:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B4DA82690;
	Fri, 13 May 2022 07:11:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DEE0C1BF357
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 07:11:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD1A7405BD
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 07:11:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G2HF4ZZ2Kddo for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 07:11:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 11E6A40141
 for <buildroot@buildroot.org>; Fri, 13 May 2022 07:11:21 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id j6so14402151ejc.13
 for <buildroot@buildroot.org>; Fri, 13 May 2022 00:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7f6YO2qOFppQl4VMwoLfqX0LM3Hy8Ve9fWQK7VLCGv4=;
 b=BZk/yT52ie5MdClkdFpP1k3867s9zCZtkZZhWxH+ax+Qhr6wNBivYs6E0MGKRoDfGF
 R3+Uy3cCR7UlDJy28jpVy5GJU7JzYKAWBudGshD95AlpptvXswF4IhOEe9lRkEov9vvI
 V/hLY0CZTZo7ntnEvqe4THzobhOfp4OQrnyNHtNpyw9p8wkUPafSrLVEiwGKEQ5htDkn
 S11BkNsdHnnGOLcJhVPF5TFUUFWZure4snFUcYVHXJlddWDb5/yyJtBtDZzjHChl7oJr
 pZnyq3rWnIqCLF66ZUzlSz0uW5PtNYeqj4/CxWPd2h1Q7Q/EjSxLKD6nEo2uBIoV7iZO
 4HcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7f6YO2qOFppQl4VMwoLfqX0LM3Hy8Ve9fWQK7VLCGv4=;
 b=2kVtAunnGI30m0Fsf7lhhop2BNOVElHR+gTZoolJyIPyY6CMvKwToPQxVv7VO2DEHI
 nqtiq7NdG4ck+Fd58TrOZle3XVOQFxXfzkfqO7vJkJCaggSEqvS6ryMFoN6sf+lNpebC
 gXDRTxRxcCNI8KGovoD3DBEHoPI87zhx99k3GAPcT/b9idOpsDbwda4DV/pQ6CBIodVn
 K4pF8IIo+M63GhqVPzJ9jvvhseyqG0jLryBYmTvKnFTRiE8j/zQg2hq6QawOBV83Egt0
 TgTNj2fSLRQMVZKso5fsHGMR9mwE+/GNDRSMX4Hqw81u7itUe5jmkPtPAZaDO4gP82Uu
 1yCQ==
X-Gm-Message-State: AOAM5323mU7zPrvm1OYJOiwcqDb/NFC3eF+2VWZwJRESaN6j/Gv6eEUE
 F1/uK8pxczGj0fXtn9vhoLox10kGaVRUxg==
X-Google-Smtp-Source: ABdhPJw/wNIkp5ZhGc4MkNm0UT5jYEB72jIXCI8fqoPU8EWlmHTPZOPWV9UbVZk0S9v4ZhrPJRyglA==
X-Received: by 2002:a17:907:9709:b0:6fd:c0e1:c86b with SMTP id
 jg9-20020a170907970900b006fdc0e1c86bmr2916023ejc.600.1652425880013; 
 Fri, 13 May 2022 00:11:20 -0700 (PDT)
Received: from t450s.fritz.box (ip4d15a215.dynamic.kabel-deutschland.de.
 [77.21.162.21]) by smtp.gmail.com with ESMTPSA id
 ml13-20020a170906cc0d00b006f3ef214e63sm443183ejb.201.2022.05.13.00.11.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 00:11:19 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 13 May 2022 09:10:49 +0200
Message-Id: <20220513071046.18618-4-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220513071046.18618-1-heiko.thiery@gmail.com>
References: <20220513071046.18618-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/4] package/libnetconf2: bump version to 2.1.7
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Heiko Thiery <heiko.thiery@gmail.com>,
 =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RHJvcCBwYXRjaCB0aGF0IGlzIG5vdyBmaXhlZCB1cHN0cmVhbS4KClNpZ25lZC1vZmYtYnk6IEhl
aWtvIFRoaWVyeSA8aGVpa28udGhpZXJ5QGdtYWlsLmNvbT4KLS0tCiAuLi5JWC1uZXRvcGVlcjIt
YnVpbGQtZmFpbHMtd2hlbi1idWlsZGkucGF0Y2ggfCAzNCAtLS0tLS0tLS0tLS0tLS0tLS0tCiBw
YWNrYWdlL2xpYm5ldGNvbmYyL2xpYm5ldGNvbmYyLmhhc2ggICAgICAgICAgfCAgMiArLQogcGFj
a2FnZS9saWJuZXRjb25mMi9saWJuZXRjb25mMi5tayAgICAgICAgICAgIHwgIDIgKy0KIDMgZmls
ZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAzNiBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2Rl
IDEwMDY0NCBwYWNrYWdlL2xpYm5ldGNvbmYyLzAwMDEtbGlibmV0Y29uZjItQlVHRklYLW5ldG9w
ZWVyMi1idWlsZC1mYWlscy13aGVuLWJ1aWxkaS5wYXRjaAoKZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
bGlibmV0Y29uZjIvMDAwMS1saWJuZXRjb25mMi1CVUdGSVgtbmV0b3BlZXIyLWJ1aWxkLWZhaWxz
LXdoZW4tYnVpbGRpLnBhdGNoIGIvcGFja2FnZS9saWJuZXRjb25mMi8wMDAxLWxpYm5ldGNvbmYy
LUJVR0ZJWC1uZXRvcGVlcjItYnVpbGQtZmFpbHMtd2hlbi1idWlsZGkucGF0Y2gKZGVsZXRlZCBm
aWxlIG1vZGUgMTAwNjQ0CmluZGV4IGMwM2ZkYzk5OTkuLjAwMDAwMDAwMDAKLS0tIGEvcGFja2Fn
ZS9saWJuZXRjb25mMi8wMDAxLWxpYm5ldGNvbmYyLUJVR0ZJWC1uZXRvcGVlcjItYnVpbGQtZmFp
bHMtd2hlbi1idWlsZGkucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSwzNCArMCwwIEBACi1Gcm9t
IGUwNmYyOTFjYzM2YzllOWEzYzljMjI0ZTIzMTA5YWM2ZGFkNGViMWMgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCi1Gcm9tOiBIZWlrbyBUaGllcnkgPGhlaWtvLnRoaWVyeUBnbWFpbC5jb20+Ci1E
YXRlOiBUaHUsIDI1IE5vdiAyMDIxIDEyOjI5OjQ3ICswMTAwCi1TdWJqZWN0OiBbUEFUQ0hdIGxp
Ym5ldGNvbmYyIEJVR0ZJWCBuZXRvcGVlcjIgYnVpbGQgZmFpbHMgd2hlbiBidWlsZGluZyB3aXRo
Ci0gbXVzbCBsaWJjCi1NSU1FLVZlcnNpb246IDEuMAotQ29udGVudC1UeXBlOiB0ZXh0L3BsYWlu
OyBjaGFyc2V0PVVURi04Ci1Db250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0Ci0KLS9ob21l
L2h0aGllcnkvc291cmNlcy9tYWlubGluZS9idWlsZHJvb3Qvb3V0cHV0L2hvc3QveDg2XzY0LWJ1
aWxkcm9vdC1saW51eC1tdXNsL3N5c3Jvb3QvdXNyL2luY2x1ZGUvbGlibmV0Y29uZjIvc2Vzc2lv
bl9zZXJ2ZXIuaDo0Mzk6NTU6IGVycm9yOiB1bmtub3duIHR5cGUgbmFtZSDigJhtb2RlX3TigJkK
LSAgNDM5IHwgaW50IG5jX3NlcnZlcl9lbmRwdF9zZXRfcGVybXMoY29uc3QgY2hhciAqZW5kcHRf
bmFtZSwgbW9kZV90IG1vZGUsIHVpZF90IHVpZCwgZ2lkX3QgZ2lkKTsKLQotRm9yIG11c2wgbGli
YyB0aGUgaW5jbHVkZSAic3lzL3R5cGVzLmgiIGlzIHJlcXVpcmVkLgotCi1TaWduZWQtb2ZmLWJ5
OiBIZWlrbyBUaGllcnkgPGhlaWtvLnRoaWVyeUBnbWFpbC5jb20+Ci0tLS0KLSBzcmMvc2Vzc2lv
bl9zZXJ2ZXIuaCB8IDEgKwotIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQotCi1kaWZm
IC0tZ2l0IGEvc3JjL3Nlc3Npb25fc2VydmVyLmggYi9zcmMvc2Vzc2lvbl9zZXJ2ZXIuaAotaW5k
ZXggNDUwN2VlYS4uNDc3OTExOSAxMDA2NDQKLS0tLSBhL3NyYy9zZXNzaW9uX3NlcnZlci5oCi0r
KysgYi9zcmMvc2Vzc2lvbl9zZXJ2ZXIuaAotQEAgLTE5LDYgKzE5LDcgQEAKLSBleHRlcm4gIkMi
IHsKLSAjZW5kaWYKLSAKLSsjaW5jbHVkZSA8c3lzL3R5cGVzLmg+Ci0gI2luY2x1ZGUgPGxpYnlh
bmcvbGlieWFuZy5oPgotICNpbmNsdWRlIDxzdGRpbnQuaD4KLSAKLS0tIAotMi4zMC4yCi0KZGlm
ZiAtLWdpdCBhL3BhY2thZ2UvbGlibmV0Y29uZjIvbGlibmV0Y29uZjIuaGFzaCBiL3BhY2thZ2Uv
bGlibmV0Y29uZjIvbGlibmV0Y29uZjIuaGFzaAppbmRleCAyZGVlOTNjYzRjLi4xZDQ3MDdmNDRi
IDEwMDY0NAotLS0gYS9wYWNrYWdlL2xpYm5ldGNvbmYyL2xpYm5ldGNvbmYyLmhhc2gKKysrIGIv
cGFja2FnZS9saWJuZXRjb25mMi9saWJuZXRjb25mMi5oYXNoCkBAIC0xLDMgKzEsMyBAQAogIyBM
b2NhbGx5IGNhbGN1bGF0ZWQKLXNoYTI1NiAgNzhmZmEwYmQ4NTgyM2FiZDMyMWExZGJiMDljMWVh
ZDM2NjEyZjJhMTIwNDk2MzhhMTRiYjA4MTU2N2Y4NmFkZSAgbGlibmV0Y29uZjItMi4wLjI0LnRh
ci5negorc2hhMjU2ICAzMDQ0ZjM2YzExN2E1ZWFhZDAxNDgyZDBjYWZmYzMwY2IyYTg3YzY2MDkw
ZDNjZDljOTQ2ZmVmODViOGEyMzk0ICBsaWJuZXRjb25mMi0yLjEuNy50YXIuZ3oKIHNoYTI1NiAg
YmQ5NjJhYjQ1N2M4YThjYjhmYWFhYTM2YzExNDg0NjgwZjNjOWE0N2RiYzMzNjUwNzgxN2FlODkz
NTM4NDA2NCAgTElDRU5TRQpkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJuZXRjb25mMi9saWJuZXRj
b25mMi5tayBiL3BhY2thZ2UvbGlibmV0Y29uZjIvbGlibmV0Y29uZjIubWsKaW5kZXggZGRiYjk5
YjdlZC4uMTFhMTk5NWVhMSAxMDA2NDQKLS0tIGEvcGFja2FnZS9saWJuZXRjb25mMi9saWJuZXRj
b25mMi5taworKysgYi9wYWNrYWdlL2xpYm5ldGNvbmYyL2xpYm5ldGNvbmYyLm1rCkBAIC00LDcg
KzQsNyBAQAogIwogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIAotTElCTkVUQ09ORjJfVkVSU0lP
TiA9IDIuMC4yNAorTElCTkVUQ09ORjJfVkVSU0lPTiA9IDIuMS43CiBMSUJORVRDT05GMl9TSVRF
ID0gJChjYWxsIGdpdGh1YixDRVNORVQsbGlibmV0Y29uZjIsdiQoTElCTkVUQ09ORjJfVkVSU0lP
TikpCiBMSUJORVRDT05GMl9JTlNUQUxMX1NUQUdJTkcgPSBZRVMKIExJQk5FVENPTkYyX0xJQ0VO
U0UgPSBCU0QtMy1DbGF1c2UKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
