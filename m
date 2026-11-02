Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00E260A2605
	for <buildroot@archiver.kernel.org>; Mon,  2 Nov 2026 08:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=j/kpcAfM
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93F5E60758;
	Mon,  2 Nov 2026 08:21:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n5bZYO8T8e72; Mon,  2 Nov 2026 08:21:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org BB7FB606FF
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793607700;
	b=BYYEx9dknffqoI07tii+AAYHhLbc9ivdYtWLSoFUMB3t7rgK8ZAvjEroanAcWoxVVDFs
	 i1s1tCeLuuIm006vfel66MNyHhdluzZmQoAyYt+Swqmz8eWn03T2hl0wQ3b7HoU1vFsEN
	 jjEuKcU5GORooBL6aYiY4QueBZy6FCRZAkq0HYUO7Si25MrImVcNtkTqvajaaaMpk4oTH
	 1im+E/UKz6RHevrc3ZyrDsUhMx5J2Xjjx7/9jb9s5XABCJXLKymAFAe8oeQgY/YodqlIs
	 iI1DpR92gAxf6gI7uYnQP5q/Ln71aQUnB8uX4F4KGm/o747gi1HPAhdghSIhY1FgmEQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793607700;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=h9bK26fRRk1wDalUWFw3U3hrlsN+DHGmXI5YTO8dcDM=;
	b=oG73dBYZ9ioOsosMftqaN19yudNmJ21TBJaFqRqEEEeNahZA2N66vCxl6nXLdGMUNMab
	 aXOF6AozSHCekACHC1E0iDY+HzyI9KIXeTMPte4VEeHvegi/a9xMyAwFaGSAl7Fxhduqp
	 prTMqBeick+CIF52BFA3S1Q4e1TD9HwxUDlmc0eTEO5FhhrJwB75hQcn6/ENO4TUDyHxp
	 bBkAeSNcWBKog3NK6x1E8Ynkk22hUN2FoWIyFhiaAyhCP6KYYWkEo81q3yHsMXR1MsljM
	 TDTM8JYq4cRIkVpyyI32cLlBbLVwRC1RFDAL9ZONzg5zMd3eCsHCsK52jM7WW18e3+A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793607700;
	bh=h9bK26fRRk1wDalUWFw3U3hrlsN+DHGmXI5YTO8dcDM=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=j/kpcAfMNJGnKxV7/x+3uFB4ZS4d0KWZY2sDy0Yfy2OMSLj5VnNGRiohjMldS8yPG
	 qNDB1r1+d1mPB3WZZLr/GeId3B+pfd/luFiFOuvXzSsFk8lFAHGAIfydLw1X6+2OKU
	 zlnmSHEjyrNUNepF6d53G8eLVOCMeWXUYk+ZMvMQnvd4q1NaRuG2kIdMwPAbObpGFV
	 wqlTpFCfpttt5LnNjF6ytte9J1DX3QR8Ru44k6Y/uuR/GiOI5fuKlAKhuM2crdpWTj
	 kQ9GOSj2o/NdjZDxYm+IHRdGqRldhhFQA0aFknz7v3mIz1qDMjsivPctB16QdtA5Ut
	 Mv0oDbl9Pn1Jg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB7FB606FF;
	Mon,  2 Nov 2026 08:21:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1AC26323
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 08:21:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 00802405DC
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 08:21:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VphiiXYO9ru8 for <buildroot@buildroot.org>;
 Mon,  2 Nov 2026 08:21:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 70AAA406AE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793607698;
 b=I46FHSY20Msl199U/S4jHbjYifrYCMQ89v0N4FJoTL+w26iHvCRpFrPfx91YK97g+wQh
 bnwdBCDhuCSt1c1wyO4D769iGJrtY2S6L6DwQbKFjErCPGWhtFWwI3h2uIfzWSiEL21Xi
 jERhWg9UOEZGOoVdPBLu/bmpnfeuSvmmxthlLNbq2P5RSDuFZT5nuTJFYaBDvsOamfyGh
 p9DYLAgHgnSysEhYS9cHHG0zcG/tK8YXJayGBPU9k1pJn0copaq/ARZgDV/PHaXUWawvE
 r4eNWYrIKZA0eIEMcSQWH/BBUsYR4F7uEbpex+e/+brhe3WT6pcY1HFMJZRkbkzc6hg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793607698;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
 Content-Transfer-Encoding;
 bh=NN3q8CtmgVxkeKqVKg38H2mBhcwYhcAAXJcYmvsCT1k=;
 b=sMeGMR5gTW/S9p5D6kynzoEg9p6hWjLh/kCON0iMrd0VWjMOft5bwTC61TilJbN4UR3Q
 SG2uWHW3ibbR3T8fGBaN7yI0/7aDkc4Gca4kqBFehldYmB9YdoIkzEVe8hrJeFkGz/R7D
 dWjijyUOgT/lXUR5eb73mfa6tHssSL0fMgYWFpLLu4mGGamF+i/Q7o7v8GSiz8OSm/6HH
 t3rdwCfQJqG8wSZUg9U+Ur5djz9U/xeF7FCqmPACreRTXj5855nXk7zAkMXZXxy9urneU
 qIBIvmPVQkyqvhg7AGHVXZVrwoUC3gHbIimShTBK8jIpmhF2pI1pvgylnkuaw0+moHw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=TuCSF8p1; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::434"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 70AAA406AE
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 08:21:36 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-48e1d0e5dafso1935640f8f.1
 for <buildroot@buildroot.org>; Mon, 02 Nov 2026 00:21:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793607694; x=1794212494;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=NN3q8CtmgVxkeKqVKg38H2mBhcwYhcAAXJcYmvsCT1k=;
 b=DCu5lJA7FSAFG/M08ak48vFMrZKbI1egM/6jCWcf43fbEX84lZtrOnOWfd17RPq2OB
 spDoty2nalsmZvNZPe44tlURWWWPQy3k1pHGQzkEq5oAHOPjFRcM+s6XNi+UtKJvx5Jg
 FHmnxjMWy+xct0p44bWpldJ5yq0zV65r4y+pVhxGDA0ymA8bnzcAVuImf1iYwS5bhl+i
 sqPncwTteDO96V8VXpGmfQid951d9fnTDsaedCAtcS8Cg5DFPOvar/XiUSHyb0hcIox9
 i54k8VIzXYMl/55oGVGz365bTEqfWB6mkyCEIn+YsFPDFWiqV3kTJfqf10w3DuMyhsj9
 QKSg==
X-Gm-Message-State: APuU4Z/FtW48gmCqARgvG+PXJBuLWtjwRVktZzdlzIkaWNtyFoTNji3M
 uYGj7zOthIoDGE/j6+ZIcIHoBHsYsaDJ95teBvjXQX4VzgmWRja79IV2C6kHzAClALqnGD06iyr
 E2wWXjqo=
X-Gm-Gg: AYBFou3A22NETkr6xhepG4XM5ZGxDV+hYr6NveMi4j4I4GeoeZZasaex/8WvuCGX3/7
 vKeG3gSja7L2Q9VftwMnkiD5xroNEPaYRStK0WVwjNv7awyStn2h0s141zItUUOIvcf6waiK0JT
 SwvOhC5s+mvMeyzUZVHAZW6ml1xbxgljalsGrDtOh9T2cDShxeA9AUIAKOdIXrNNO9RullIHp0h
 XYlJTdFujngaCrZ+ilIcf8KHDjiwlDnBO3cvyQ/pxmxh0ADdLrdQiqn2v5kHb4If5SUIEkp30r4
 XNJlwmIKq/mwYDWsM0NmHtIOS+g3zZUb/aq3VBbUD4UsI8DHe4HJsRBrN25mwXDWAtigQnqfzYn
 rGRAp5FESVT+YgLRfU2cVJSNBE4xHIEmLMTvgzM0Gcccfhnyw8SMKTtjryXm6pYF/ZF62qJpjKs
 TkU2+2VhX2e3S2XViT6A93qUXK6+l0frci3Y5HIo9evTrIvENlopGamudwc2ktSIJHb4kS40aBh
 cTbsz4dHV2MwkQdrZsJBP7zUoK7YB+1oQSCKk4w6Hf54aPTFYf869Sd+ppYsUoPfeMILgfeEdrU
 bfH5wkiLjZwgtzOftMwpRQwEbtwYrnbfTLpPIcyqCgFCxOx2h9+k
X-Received: by 2002:a05:6000:420c:b0:48e:6264:c371 with SMTP id
 ffacd0b85a97d-48e6e2cb57dmr22189592f8f.9.1793607694620; 
 Mon, 02 Nov 2026 00:21:34 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b80333sm19822804f8f.32.2026.11.02.00.21.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2026 00:21:34 -0800 (PST)
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Adrian Perez de Castro <aperez@igalia.com>
Date: Mon,  2 Nov 2026 09:21:11 +0100
Message-ID: <20261102082113.2138351-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2025.02.x] package/brotli: fix hash of
 brotli-1.1.1.tar.gz
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Q29tbWl0IDU4ZTg1YWNkNDQgKCJwYWNrYWdlL2Jyb3RsaTogdXNlIGdpdGh1YiBtYWNybyIpIHdh
cyBhIGJhY2twb3J0CndpdGggY29uZmxpY3RzLiBUaGUgY29uZmxpY3QgcmVzb2x1dGlvbiB0b29r
IHRoZSAxLjEuMSB2ZXJzaW9uIGludG8KYWNjb3VudCBmb3IgdGhlIGZpbGVuYW1lLCBidXQga2Vw
dCB0aGUgaGFzaCBvZiBicm90bGktMS4yLjEudGFyLmd6CmZyb20gbWFzdGVyIGJ5IG1pc3Rha2Uu
CgpVc2UgdGhlIGNvcnJlY3QgaGFzaCBvZiB0aGUgMS4xLjEgdGFyYmFsbCBhZ2Fpbi4gVGhlIGdp
dGh1YiBtYWNybwpVUkwgZ2l2ZXMgdGhlIHNhbWUgYXJjaGl2ZSBhcyB0aGUgb2xkIGFyY2hpdmUv
djEuMS4xLnRhci5neiBVUkwsIHNvCnRoZSBoYXNoIGlzIHRoZSBzYW1lIGFzIGJlZm9yZSA1OGU4
NWFjZDQ0LgoKU2lnbmVkLW9mZi1ieTogUmFwaGHDq2wgTcOpbG90dGUgPHJhcGhhZWwubWVsb3R0
ZUBtaW5kLmJlPgotLS0KIHBhY2thZ2UvYnJvdGxpL2Jyb3RsaS5oYXNoIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvcGFj
a2FnZS9icm90bGkvYnJvdGxpLmhhc2ggYi9wYWNrYWdlL2Jyb3RsaS9icm90bGkuaGFzaAppbmRl
eCA4ZGIzNDJlYmYwLi5iODBiMDA4ZTQyIDEwMDY0NAotLS0gYS9wYWNrYWdlL2Jyb3RsaS9icm90
bGkuaGFzaAorKysgYi9wYWNrYWdlL2Jyb3RsaS9icm90bGkuaGFzaApAQCAtMSw1ICsxLDUgQEAK
ICMgTG9jYWxseSBnZW5lcmF0ZWQ6Ci1zaGE1MTIgIDQ2MDU5MTI4N2Q0MjhjOGI1YThhMjc2NmI1
YjQyNGQxNDUwMWZjZGExMmM3MTE4YjhmM2NjNGJmYWU0NGI5MGFjNzVjYTE1NjU1N2YwN2I2ZTIy
NTQyNjEyNzI0ZDkwNDUzM2U1ZjcwMDE5YmUwN2RiYmI2MDRjNDZmMDNhYjY5ICBicm90bGktMS4x
LjEudGFyLmd6CitzaGE1MTIgIGY3ZjNhN2U0NjIwNDAzYWEyNmQ2OTQ1OGUwYmI4ODZkMzIyZjc2
Nzc2ODVjNTU3MTdmYWM4MjRmMGI3ODllMGMyNWNmNGZmN2Q4ZDQ1NWQ3MGE4NTI2ZDAxNTBkN2Ew
OWI5ZGYyOTJhMTFmOWVmNWQzYmY2MjU4NzhjYjUxMzY4ICBicm90bGktMS4xLjEudGFyLmd6CiAK
ICMgSGFzaCBmb3IgbGljZW5zZSBmaWxlczoKIHNoYTUxMiAgYmFlNzgxODRjMmY1MGY4NmQ4Yzcy
NzgyNmQzOTgyYzQ2OTQ1NGM0MmI5YWY4MWY0ZWYwMDdlMzkwMzY0MzRmYTg5NGNmNWJlM2JmNWZj
NjViN2RlMjMwMWYwYTcyZDA2N2E4MTg2ZTMwMzMyN2RiOGE5NmJkMTQ4NjdlMGEzYTggIExJQ0VO
U0UKLS0gCjIuNTQuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
