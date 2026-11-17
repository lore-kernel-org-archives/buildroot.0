Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E18606A31C
	for <buildroot@archiver.kernel.org>; Tue, 17 Nov 2026 10:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=AvIjioeg;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=armadeus.com header.i=@armadeus.com header.a=rsa-sha256 header.s=ovhmo103079-selector1 header.b=juQbT3yZ
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BCB380D10;
	Tue, 17 Nov 2026 10:03:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G0gEF8BWAp2Q; Tue, 17 Nov 2026 10:03:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 597B480D15
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794909828;
	b=HcHsppfyYsawad2UN65ODn1fCYIc+RRGySPEm4zRgyEq+DandFfgTLwDd7vKJHxXz3WB
	 H8/ENCHL8BcZBQVHHSb+WIrUyUaCMd5bO+jW68pJt/83N8cqbT2JcKMz7Zrp7AYoQ+lgH
	 9o3wRc9q1OkJ/GkDYjyNkzY+Aqo8UendBTAY3cwlbIlF5oQVcNU++GKDehte3VoYuLWkg
	 CIm5hC2VDoBhd+d1qMUBkRg3Jff8pTs0AZbepR+BlgQW8gMhprJbHGJA9+ah8zkuxYeIv
	 YaiKk521LpQFwL9Ew+QSXyBsIvhJvFrO3c7Mci/ro1Ec8wkEvch7KNIy0iCPEow2NRQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794909828;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:X-Greylist:Received-SPF:Received:
	 Received:Received:Received:X-OVh-ClientIp:From:Date:MIME-Version:
	 Message-Id:References:In-Reply-To:To:X-Mailer:x-ovh-tracer-id:
	 X-VR-SPAMSTATE:X-VR-SPAMSCORE:X-VR-SPAMCAUSE:DKIM-Signature:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=8yxelb/fhiXxt0JUAlyOQ6Z4+4wj1Q7lL1WRBr9oQfo=;
	b=IFxZu5GvSM4LCB26kUprW7gAifAoNknU7m3AtXKHxgUwvPsEtSAPUzd9TSMmzyVHqoS1
	 431whQvHMoUVPljbHkbjfjEG1mkpwJGVljcj6enG9hNbqt9aND3dW/9mfiYeFMTGsFQtb
	 6c++SFYwAzFwkBQgVPHHA79iyFLmbwT6w6fwOPbr26c6zPM92e/nPcVeeXVn3ePt921m6
	 9xmhW5DXup4yGT9pGRxve+GrmpWsWMkbHs9jmWzUw+1hiMVSYCP4WYOuyXuCDDM1wxyzi
	 FyGKpGm8+RyqhyxGXDsGMQvKd8A0xKzalfMLypivl/CRM6eQZCIsr4ABTGPmGp+7tBA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794909828;
	bh=8yxelb/fhiXxt0JUAlyOQ6Z4+4wj1Q7lL1WRBr9oQfo=;
	h=From:Date:References:In-Reply-To:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=AvIjioegLDC3gJa9Zole+CZ1IxpUaTKHWE7m/hfqg5BkEyEsE4+ce4MzzqtrytOQg
	 OD2KMKrfJeUcCHLBiI/UwB0vjep6Wo30QlIequCSxTxPMZK8jl3XWfmyJXJluXCvBa
	 x45LsEMPvFqgdUcb3DzJ3dVnBgnrA73nPnBlYARMQejc5iRDPB1ItPUVbgEGry97rT
	 CeCXO+WQsf5+VL42dhrgbuM+he6hs7qKIySUMqhpO+UkbtZu90rI4pGAfCz2BI7gMS
	 MzkMVgUivpPM3orUKjHmG8DlKW5DMWf9bQr4OvrE+iURDfkHg1k/dsNb+Y4o4vHGeH
	 6xyakBG6VeeTA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 597B480D15;
	Tue, 17 Nov 2026 10:03:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8EF891A6
 for <buildroot@buildroot.org>; Tue, 17 Nov 2026 10:03:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6EA9960861
 for <buildroot@buildroot.org>; Tue, 17 Nov 2026 10:03:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RCehhMHKD7Hy for <buildroot@buildroot.org>;
 Tue, 17 Nov 2026 10:03:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 529B16069A
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=188.165.39.218
X-Greylist: delayed 319 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 17 Nov 2026 10:03:41 UTC
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=armadeus.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=armadeus.com header.i=@armadeus.com header.a=rsa-sha256
 header.s=ovhmo103079-selector1 header.b=juQbT3yZ
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=188.165.39.218;
 helo=6.mo581.mail-out.ovh.net; envelope-from=sebastien.szymanski@armadeus.com;
 receiver=<UNKNOWN> 
Received: from 6.mo581.mail-out.ovh.net (6.mo581.mail-out.ovh.net
 [188.165.39.218])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 529B16069A
 for <buildroot@buildroot.org>; Tue, 17 Nov 2026 10:03:40 +0000 (UTC)
Received: from director9.ghost.mail-out.ovh.net (unknown [10.109.231.194])
 by mo581.mail-out.ovh.net (Postfix) with ESMTP id 4jTKtM5zl2z5yr9
 for <buildroot@buildroot.org>; Tue, 17 Nov 2026 09:58:19 +0000 (UTC)
Received: from ghost-submission-7ccd8bbbb6-5vtz7 (unknown [10.110.118.244])
 by director9.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 5C71280F29;
 Tue, 17 Nov 2026 09:58:19 +0000 (UTC)
Received: from armadeus.com ([37.59.142.95])
 by ghost-submission-7ccd8bbbb6-5vtz7 with ESMTPSA
 id +ZCOLzol/GqU0j8AT5flKQ:T3
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Tue, 17 Nov 2026 09:58:19 +0000
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G00186043fd3-9d92-45f5-a176-5fe5b3fc1747,
 E27E9456AC6DD6F5FB3B2C065D8FDFF45D5FC9B1)
 smtp.auth=sebastien.szymanski@armadeus.com
X-OVh-ClientIp: 92.148.202.169
From: =?utf-8?q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Tue, 17 Nov 2026 10:58:12 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261117-imx-fix-ddr-choices-v1-2-609ff9c3afd2@armadeus.com>
References: <20261117-imx-fix-ddr-choices-v1-0-609ff9c3afd2@armadeus.com>
In-Reply-To: <20261117-imx-fix-ddr-choices-v1-0-609ff9c3afd2@armadeus.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.16.0
x-ovh-tracer-id: 2682738005047039693
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTFMCtXwgMRsC6caezWGGwO7PPVgZTGGS2SOKtp6JTGFWBIueYAkyVZWO6I/iuz2Q6Lv6k/XoKxtW1ylB0aFobDQIGytplXP/a+24qLTOz7juyFnGAyGPjgoHYs3D8Kl9Me1aHYu5UnQZkhLOnRspUwFm2UwPhKsQ8ups0cgj+BcPTZQLhSSqqE+Y0doWiu3pF3pqGLZ764BEVGtPohDH+ay6Nvp3XpokVZ4ho+AG87byNIzUxon9fIwwqZsX+XWUxrbYowomgK7d004XkTp43Cvy5ymxJwVpwi3A2SZnde1+ErawIohiWp+fJGpie1dXjxPj9coj6w39TNW1Wp61/LvXmVNeIR+Hcgq9dvRxyTcJ9cugV/pf4fEn3teVw/3tGqr8LGZg0QTnw4LllO4tgPQPcyB5kowKERKVRRYRXdm1uZwskXOp3/DP9dzxFRmTCgD3qUcxotUWY85ORS/yPpAcNy/ohgmq5rJPe1QjVJt+m8NVhT9i5K+lnSMvYiJbjJxSakageQK/htLIQ8wF9KaXaFLLyDIBN+miTZq2iAPcu4t998uASBbJhg159Te/FZ9iDOqTfOunb6QtdCsHZaekL0F3KJ6WlXX5eSKiUJJjlIKIVJBYcXMe3A4f3fjS8HN2DYnciqGuuF1CY5nrkT7h9Zt7Ph5Ui7fouKBGmLySw
DKIM-Signature: a=rsa-sha256; bh=0e5V/hds+o3Kl4CM1BrQqJElTO4NGV5emvRh0uPyRds=; 
 c=relaxed/relaxed; d=armadeus.com; h=From;
 s=ovhmo103079-selector1; t=1794909499; v=1;
 b=juQbT3yZeJgE5BC8xOgE1WTq1kLYTasY1loaxiMeXzYIb2O92hYCFspPZbIhapdCi+j/jFxI
 71pHgADLQ5Yw4zHPtkIW5FtuT0yIlTWlk8In16oqoR2ZUejn9S5VoxcClR1Bjv3e0XzBgNNdXBD
 0Fi3HTlTYn5leUCKwuxRN8S6kIv3/l+L42PSJJ02nT2wqfA3KS8e7tyfpDhRQA5RROinudD/GWY
 75xakJjwcDHTWkG5QIi9O9uCYCYQCWMtw0CojzvKD2mY+msnkQUD2JpG6p+rPSDtsSlwkN8uQ9A
 rHHjyfxiI9yBenNI2ETKBr29Ku2HtAzBTpMXEvpULc6yQ==
Subject: [Buildroot] [PATCH 2/2] package/freescale-imx: suggest LPPDR4X DDR
 binaries only for i.MX95
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

aS5NWDk1IFNvQ3MgY2FuIG9ubHkgdXNlIExQRERSNFggRERSIGJpbmFyaWVzIChhcyBMUEREUjUg
bm90IHN1cHBvcnRlZCBhdAp0aGUgbW9tZW50KS4gRG9uJ3Qgc3VnZ2VzdCBvdGhlciBiaW5hcmll
cyBmb3IgaS5NWDk1LgoKRml4ZXM6IGMzNTQ3ODZjNTVjMSAoInBhY2thZ2UvZnJlZXNjYWxlLWlt
eC9maXJtd2FyZS1pbXg6IHN1cHBvcnQgaS5NWDk1J3MgTFBERFI0eCBGVyIpClNpZ25lZC1vZmYt
Ynk6IFPDqWJhc3RpZW4gU3p5bWFuc2tpIDxzZWJhc3RpZW4uc3p5bWFuc2tpQGFybWFkZXVzLmNv
bT4KLS0tCiBwYWNrYWdlL2ZyZWVzY2FsZS1pbXgvZmlybXdhcmUtaW14L0NvbmZpZy5pbiB8IDUg
KysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRp
ZmYgLS1naXQgYS9wYWNrYWdlL2ZyZWVzY2FsZS1pbXgvZmlybXdhcmUtaW14L0NvbmZpZy5pbiBi
L3BhY2thZ2UvZnJlZXNjYWxlLWlteC9maXJtd2FyZS1pbXgvQ29uZmlnLmluCmluZGV4IDcxOWFm
ZjBlNzA5Ny4uM2UwZjBiOWY1ZDNkIDEwMDY0NAotLS0gYS9wYWNrYWdlL2ZyZWVzY2FsZS1pbXgv
ZmlybXdhcmUtaW14L0NvbmZpZy5pbgorKysgYi9wYWNrYWdlL2ZyZWVzY2FsZS1pbXgvZmlybXdh
cmUtaW14L0NvbmZpZy5pbgpAQCAtODAsOSArODAsMTEgQEAgY2hvaWNlCiAKIGNvbmZpZyBCUjJf
UEFDS0FHRV9GSVJNV0FSRV9JTVhfTFBERFI0WAogCWJvb2wgImxwZGRyNHgiCisJZGVwZW5kcyBv
biBCUjJfUEFDS0FHRV9GSVJNV0FSRV9JTVhfTkVFRFNfRERSX0ZXX0lNWDk1CiAJaGVscAogCSAg
VXNlIExQRERSNHggYmluYXJpZXMuCiAKK2lmICFCUjJfUEFDS0FHRV9GSVJNV0FSRV9JTVhfTkVF
RFNfRERSX0ZXX0lNWDk1CiBjb25maWcgQlIyX1BBQ0tBR0VfRklSTVdBUkVfSU1YX0xQRERSNAog
CWJvb2wgImxwZGRyNCIKIAloZWxwCkBAIC0xMDAsNyArMTAyLDggQEAgY29uZmlnIEJSMl9QQUNL
QUdFX0ZJUk1XQVJFX0lNWF9ERFIzCiAJaGVscAogCSAgVXNlIEREUjMgYmluYXJpZXMgKGkuZS46
IGRkcjNfKl8yMDE4MTAuYmluKS4KIAotZW5kaWYKK2VuZGlmICMgIUJSMl9QQUNLQUdFX0ZJUk1X
QVJFX0lNWF9ORUVEU19ERFJfRldfSU1YOQorZW5kaWYgIyAhQlIyX1BBQ0tBR0VfRklSTVdBUkVf
SU1YX05FRURTX0REUl9GV19JTVg5NQogZW5kY2hvaWNlICMgRERSIHRyYWluaW5nIEZXCiAKIGNv
bmZpZyBCUjJfUEFDS0FHRV9GSVJNV0FSRV9JTVhfRERSX1ZFUlNJT04KCi0tIAoyLjU2LjAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
