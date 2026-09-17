Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D596C88E72
	for <buildroot@archiver.kernel.org>; Thu, 17 Sep 2026 09:20:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49D0D407B3;
	Thu, 17 Sep 2026 09:20:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iJM_bFtQpEOT; Thu, 17 Sep 2026 09:20:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org BFE06406A7
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789636825;
	b=D6YsjQRiW1kvYJo77kIwpSmnwUzzw+S7m/TxzrEzg3KnZpHERijdOKZ8UeCzTyL21NiU
	 7KPeiTzq1ZSMvNk9H8fIsZYYVqfzHQssp2wiBdLg50HvKtqu/sV4nE5nozHifpmCu3M1C
	 5vxMLfb0+k/mRIVJzOPWhJfeaqCv1AXFsFph4b8zrRAfHtMIJs8d66vmxJ+z03yl62AeA
	 YSVgwl7jKRPFRveKrxlywfBUi79hFbZ25HWX4fnZ3h1TBiOwoNzhp2x0qlcm4BEhvGQyT
	 6w/6DqC0+rahdotyEt5zCMR4UH2/gYrZx73mac1k5FqFVTp9kkTNLIPKzEZveWYvaHQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789636825;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=OcSapmxeF5Kn7+Ze7UDsKEukCmpd2l7F5IbfU43MG60=;
	b=OHNowujNeOOirK8JHwVPd8rT+rh7hHMf9gT0tcd9iUUx9S7r/KnZIxhZcAXwJsCO83Be
	 T+WrDKkJ3KgCtaRBa+egbgQao8Eedu8OyNBKm8Y/XQNEwmTr7miMPGMdpfKZtMl2VXSJx
	 IjLmAGE5mx2Mc7YhpOVYL4F7TwlOtOZB7JkxmSLOSbYPuxoaJ20Doy5yeAQPr3S/Xiekq
	 fjQJgqJjYvFsWq8a2QNz2bxiNxK2BESVnS3pqUE9EylG3N00s+lz3s6b+c9CGSt6Fprxf
	 2m5Fq/vzEbV5gBW7g4N7ra+166xbo2JJQ0VA4iX3Npd9oIt4kOSc7CZG8q33V5IAlEQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789636825;
	bh=OcSapmxeF5Kn7+Ze7UDsKEukCmpd2l7F5IbfU43MG60=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=pW7ifAkdkTolGsK/owOqHwTfEU1QnHX00wPN44+7KhZDfTR88Izgo6fj35uOc4EM0
	 dWsFdi7h49cPsRSAs0ojNYuXEyhd35+Cb5knbg5VC7KkpusteMfllXpZib50PIZPu2
	 zkW8DqelP02Cl32ud+ettLADveNP5u8efLHAZezaCHiKHxSiI9grO26kL9SqreRkwS
	 P+KnHDlaq88HhO+/PPZJgFA5gAmis/S78XqBIg/+fpsvUg8zxUbTpHD3wRznT2yrbt
	 SNh9xIs3y7q2AzTWkQz5XwhN7XdmepTn1ySZyP8Qu75O3zSZ0Xungg/tnIqU2gdreS
	 122ohVjCmlpwA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFE06406A7;
	Thu, 17 Sep 2026 09:20:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E003B29B
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 09:20:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C52BC80EEE
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 09:20:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bzGdmYsvEP1C for <buildroot@buildroot.org>;
 Thu, 17 Sep 2026 09:20:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 2659A80DAE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789636823;
 b=mCd86jnSQJn+w8XOlldbJeHwVqnJDQ5zeSAcVPBoPsEAJEKKhoyNT7pqjfPEOWKnG6u1
 2HzONwzDinihDxrXEOojJ2ss1nfVd3d7W5nssAzDLmwda7CdnDyOKxPYiRjwC0lA/4Lj5
 LDf/xXtZneiyoJkYkM7k6ZACxV3SITXLAxiYAomJaB8TmzA4Ozmlnrqk6+4ZGS93enTRx
 cjR8V3DUv8B94IyMymSlaAgKHWTEnSdxMdZfCWfIbUgJeJbnQh4AQTNLQ8zji0ytWBU1A
 0PuJGhBw7zr0iFsjiArbRjIfaZleF0jT/tMTcJZ9nqz/5xX6+8YCKtBrP8KtBj+ZB2w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789636823;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
 Content-Transfer-Encoding;
 bh=li2q0piGAHWrjycIUWSjYI413cOVRy5aXZpfFMejpnI=;
 b=hYxMY2Y1Xqq7BYOlHhrWQGb7SBXYdPC2CwU9fJzJzl0J518hgmNGtz0aQj2RAhBqhnyZ
 kUFZ9h4Ns9Khekh0oDNlYbeVBuzHpEjGTZFGhb1DvFuU2niDcPIeiU6ZPpPf1aNd6yLcR
 r7EQagIWZso+nKEDirtY0LsrlzGUE1/LLXlhLSpuiUshAAi6uuOu0iPjFF2B4a70ItsPd
 ZvrQaoyCGwuZilqtgWkDeHRAfuJOJ/fKuQkeIVyK8XhSkeyEXZ2iJT4EM0qx1esFEifVJ
 6XqwF0kH0Nvb2Y7pnBTJKYR0IU8uHi2FAMe6H0zK7Drsj+2ptQpYOGVABHvmKT4fNjQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=M2SPwUYX; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::11; helo=mail-wm2-x11.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm2-x11.google.com (mail-wm2-x11.google.com
 [IPv6:2a00:1450:4864:31::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2659A80DAE
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 09:20:22 +0000 (UTC)
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49e6c0fce17so3573355e9.1
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 02:20:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789636820; x=1790241620;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=li2q0piGAHWrjycIUWSjYI413cOVRy5aXZpfFMejpnI=;
 b=ETP8TPGjrTz4m+9WLQdlJhnk7XO/FrbN9KCS7iqbIkOnYFi4DDy0oOZdG4RHyR7K2P
 1wN6zZjyQFl3hxG14Z+vJ3//xBI59T3JBGeWF2FXSPNcw9ZEK/oqHo/Lo8uKfvhjkvBq
 1w5zgP9cO2BAyIzoHaJM0UDjEgUzoQ3bzXsV7ejwkn0TYWbepn3V1aVS1hFex4C6Wrij
 CAJzDtZ2F7ydnMcI0cBedsDrOGB41NTPl4TAWR2atW2EgxRDZj/29An78GFF+XTjUsn7
 5+wNpqHVAucDdyURE0jARfoMUa665RuY3nMpeHCKXIGPgLjd7k6RP8rltQcelLCMZQrO
 mwjA==
X-Gm-Message-State: AFuF++nqq/un7olfUc47j/UVIOmGsZQUIVTBcx/ozSOuHHbbXRMMrzv7
 n14glusvPxVbnIeDYkZX0xozP5n6VxsghXKJxhJfab86RZ1uzQM9b1QvPFLJh0OwN37EvzeLJws
 PyxBmprM=
X-Gm-Gg: AYBFou3xaaBHq4Ol4BfR4WFNetvtYWJwkK1Z8KGDO2Nf0NGs4C3j5sveuemuH4tyFkM
 XNWB70x/LPj3nAPt5xi0u/cH5NyM0wP09bBbX0NtCOpASO1WXPNOMDQ5FxjlOpVkBIq/YXWgBpZ
 alNe5uf/73aDahJpwydukNb77qLmwDzgzvfUGnPM3vN/cab73PFI3RSCd4SnDbYns/wv8K8JxIf
 X/00pqjpMcd2npH1oUxoCPmQUeFgu6DaoUHhD42DLkm3L8Dph8VmZi51KRgEVvdjBdGXguAUfQd
 KO+M41yEbpaK35k2n905G3xZwQcy12aFboIRsTAAPsLsJ70ZeA8Hl7awX64Q0dsDzjTvGunnYJQ
 UBJ32d2vA+pAxiazMDNf63GDqkMwlQXWRXtZeFsJS9kUx76igUS5tJit1oFUeU7/rQ+iwIkAgaO
 Tr7Kq0lVoO59OPezFePklE29O/1VrUNcH8MkV9wwFVOM20Ry1/hv+cwrLCf2AqTRnMMPuW5tNb
X-Received: by 2002:a05:600c:4505:b0:49c:fc6e:a3e1 with SMTP id
 5b1f17b1804b1-49eb7346118mr70628445e9.32.1789636820532; 
 Thu, 17 Sep 2026 02:20:20 -0700 (PDT)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fbd24034esm71985845e9.15.2026.09.17.02.20.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2026 02:20:20 -0700 (PDT)
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Thu, 17 Sep 2026 11:18:53 +0200
Message-ID: <20260917091904.2560461-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Subject: [Buildroot] [RFC PATCH 0/2] Make check-symbol check host symbols
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SSdtIG5vdCBlbnRpcmVseSBzdXJlIHRoZSBjaGVja3N5bWJvbHNsaWIgZml4IGlzIGNvcnJlY3Qg
b3Igd2FudGVkLApoZW5jZSBhbiBSRkMuIFRoZSByZXN1bHQgaXQgcHJvZHVjZXMgYXQgbGVhc3Qg
ZG9lc24ndCBzaG93IGFueSBmYWxzZQpwb3NpdGl2ZSBvbiBjdXJyZW50IG1hc3Rlci4KCkl0IGFs
bG93ZWQgYXQgbGVhc3QgdG8gdW5jb3ZlciB0aGUgdHlwbyBpbiB0aGUgcWVtdSBDb25maWcuaW4g
aW4gdGhlCnNlY29uZCBwYXRjaC4KCkkgaW5jbHVkZWQgYW4gQXNzaXN0ZWQtYnkgdGFnIHRvIG1h
a2UgaXQgY2xlYXIgSSB1c2VkIHRoZSBoZWxwIG9mIGFuCkxMTSBmb3IgdGhlc2UgcGF0Y2hlcywg
YnV0IEkgY2FuIHJlcGxhY2UgaXQgYnkgc29tZSBmcmVlLWZvcm1hdCB0ZXh0CmlmIHRoYXQncyBw
cmVmZXJhYmxlLgoKUmFwaGHDq2wgTcOpbG90dGUgKDIpOgogIHV0aWxzL2NoZWNrLXN5bWJvbHM6
IGNoZWNrIGZvciB1bmRlZmluZWQgaG9zdCBzeW1ib2xzCiAgcGFja2FnZS9xZW11L0NvbmZpZy5p
bi5ob3N0OiBmaXggdHlwbyBpbiBjb21tZW50IGRlcGVuZGVuY3kKCiBwYWNrYWdlL3FlbXUvQ29u
ZmlnLmluLmhvc3QgICAgICAgICAgICB8ICAyICstCiB1dGlscy9jaGVja3N5bWJvbHNsaWIvYnIu
cHkgICAgICAgICAgICB8ICAxIC0KIHV0aWxzL2NoZWNrc3ltYm9sc2xpYi9kYi5weSAgICAgICAg
ICAgIHwgIDIgLS0KIHV0aWxzL2NoZWNrc3ltYm9sc2xpYi9tYWtlZmlsZS5weSAgICAgIHwgIDMg
KysrCiB1dGlscy9jaGVja3N5bWJvbHNsaWIvdGVzdF9kYi5weSAgICAgICB8ICA0IC0tLS0KIHV0
aWxzL2NoZWNrc3ltYm9sc2xpYi90ZXN0X21ha2VmaWxlLnB5IHwgMTEgKysrKysrKystLS0KIDYg
ZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCgotLSAKMi41
NC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
