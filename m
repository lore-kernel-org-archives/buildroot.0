Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C3E9C982C9
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 19:26:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED91260668;
	Wed, 16 Sep 2026 19:26:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bOgBaHOax1jB; Wed, 16 Sep 2026 19:26:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 613DF60657
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789586789;
	b=CTxVLAYuxaXFJNJ2U7Gjc4jYGx4XjrXyslFqBrUBwc/udw1We2NFTWNcXf+AzrkQhcKz
	 T4HX/bOilJkMMCN34X6YxlGA1F+vlGKu0aO+OW2SeW9nkiRpTckosPV8dnvMYz9M6vPvE
	 aJWBFGQFi/2/9Cv5422uFyxVWGSrKFARoMSYMAqrPddFcufAnoqSLdOitQLewlNNng5lz
	 L3cMuWZKC2VTjENElF2mB5HQFu9n/9QCS0RZE5DPoA1NtomKHZygv7gzgCPy+fb7hNl2Z
	 TFT4s6BvRGXOA3CkqGfxyXSeREPyONKJ0UiGg4ZSwdOMVrPy0eG7BXW0Wa3bh8nmK4Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789586789;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=e/9Hp1tz6+lRMaLT5OwOHQnygST+lKseSHGHKSwnR48=;
	b=jVDTdpVP37n/1SH1LSPB+s55OLTo7iGytzkxlQimh/caJTLZAGQUO/n8lTUDOB1ouIsK
	 bNLZU0OySzRqXnMfVwlHqCoPtk/GKdZSU60weX6722Ni2RFMIszuRw8DAna+ZbsMIGrCk
	 GclEn23TarMz3FtdAGI4vJ4d7VDdshE/S4r40SJDWV8nwHIt929ex+fo5IKzhHE1MIOTd
	 toq4CDEezvhYXWJ7lTdMbf4+WHhJTWbT0sc6syMzFxJ1g2x7GyHp1ukolvRMsTPuFJwWB
	 0DOkCILjXGVJ8prYjDt/dzXqgZHS3nf7J/BcviIdyd7xVyNh85j2WJYMDzIzkf6NZOA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789586789;
	bh=e/9Hp1tz6+lRMaLT5OwOHQnygST+lKseSHGHKSwnR48=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=UbwSvQAeXIYp2VHnnGJ28E8uxtLwKsbq0oF+pLt5kipMILjHykZHp0mBfGqNC/UsO
	 hj6EjQ8kPgXFxRdp2wBDBwqszkZE7e+qFWTssNTxYjq+iYjWwIK+POn66aEtEuTLuK
	 dz8M7n2ukykUGmjSPxzcPw4GVvroO0bgGqMw+9aI1BfvCuMEjsyjtef0Fi7Rm5yvda
	 eX1t4/+Tna9J09aPF2gqJDVYE51WE9NyTshL6BdnFp4LtD/IwsVvvJqZQh1BNTASzB
	 ffHcZapio2LSsXSfnqsoGjYOfy7sGhvNc/Dx4CTa2lN1Ard6lAbTBSD9SQAXnPY1WY
	 pK6FhU8w9jVPA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 613DF60657;
	Wed, 16 Sep 2026 19:26:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 252C22EB
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 19:26:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0B604400F9
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 19:26:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A_5l4O17pstt for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 19:26:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org A95F2400B0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789586786;
 b=QQr8knWWZ5w/0QXDMJ4LOy1PWvbMQTOsZeEu/hk8ml9u/yZB8lM26S/qqs4/JXKVA97E
 2ERR18zMGn3f2VAhi/wLZfwRzfxzeSGevEgCPzHCQQUBbi9+/8Qx0h84aAbKtJdqHQ/lz
 t1SmOwHzgvKGh4RYIeRvYfQbiq56uJor/DvmC0SFLvME+ysp0YlxfWm3HE528ZS4nj495
 Td/F3nNSwTjrGSLClwQoTOn7Dwnlf3NK0i6HFbYDO6ZFTXsGLgFr8Q3ZE0F6ZVt6c3QcA
 +tmhomnvJNQRgJzR0c5qWpNnn6PAZFwbqCVjL1QDgu0/yRvsv2InJs6WcGB4eKm42cw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789586786;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
 X-Last-TLS-Session-Version;
 bh=0Al8LKV2Z/8LmCjJ6DNz/w4tFYnsrGPA4BvkKhOD9HY=;
 b=FNynz3Ays2teOq/s75ZhJH9ewPZqqfJQeYC7zREE4FiPyS8dgHoYZS7Q7jXhsE2KF2/c
 ATeaahEoEZsuhGB2cfkKEKGS4t7pFbYfVp/+3ELLsF9Y6taVP99KTlPii3YZQzvtbXIe3
 LtSA8hpU4LRA9CSLO8lCSnXvWIXNYLNVqj9sI9KN3OR6GzqGYRPVBnyEU1/RVw1sAJnkF
 +VLQMRKky7PPXbhEIkcdPJmxItrncxa66GjhLFe6yCIKlV2AUU+IYEDnpNU2RdPDKS6o4
 Nm7+lXd4j/H6mTZKbgNa7HLhpKMuQYxBYYcwg/lnuokbu8w9yqOBSqs/dwcBWPi7aQw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b="Fx//D81e"; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A95F2400B0
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 19:26:25 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 34E791A08EA;
 Wed, 16 Sep 2026 19:26:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0861860337;
 Wed, 16 Sep 2026 19:26:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 21B0811C7B05D; 
 Wed, 16 Sep 2026 21:26:17 +0200 (CEST)
Date: Wed, 16 Sep 2026 21:26:17 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
Message-ID: <aqrtL9ZFmaHmfT6f@windsurf>
References: <20260911221033.880486-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260911221033.880486-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/tpm2-openssl: bump version to
 1.3.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU2F0LCBTZXAgMTIsIDIwMjYgYXQgMTI6MTA6MzNBTSArMDIwMCwgQmVybmQgS3VobHMgd3Jv
dGU6Cj4gaHR0cHM6Ly9naXRodWIuY29tL3RwbTItc29mdHdhcmUvdHBtMi1vcGVuc3NsL3JlbGVh
c2VzL3RhZy8xLjMuMAo+IAo+IFVwZGF0ZWQgbGljZW5zZSBoYXNoIGR1ZSB0byBjb3B5cmlnaHQg
eWVhciBidW1wOgo+IGh0dHBzOi8vZ2l0aHViLmNvbS90cG0yLXNvZnR3YXJlL3RwbTItb3BlbnNz
bC9jb21taXQvM2ZiM2E1ZmY3ZmNkOTkyMWFkNmU5MzNhZWQ4ZjM0ZThlNjNkNDZkYgo+IAo+IFJl
bW92ZWQgLVdlcnJvciAtV2FsbCBmcm9tIE1ha2VmaWxlLnthbSwgaW59IHdoaWNoIHdhcyBhZGRl
ZCBieSB1cHN0cmVhbQo+IGNvbW1pdCBodHRwczovL2dpdGh1Yi5jb20vdHBtMi1zb2Z0d2FyZS90
cG0yLW9wZW5zc2wvY29tbWl0L2MzYTg3NThjYWQxNTIwZDM2ZDZjYjg3YWE4N2ZmODAxMmYzMjgz
ZDgKPiBmaXJzdCBpbmNsdWRlZCBpbiB0aGlzIHJlbGVhc2UuCj4gCj4gVGhpcyBmaXhlcyBhIGJ1
aWxkIGVycm9yIHNlZW4gd2l0aCB0aGUgR2l0bGFiIHBpcGVsaW5lcyBmb3IKPiBib290bGluLWFh
cmNoNjQtZ2xpYmMtb2xkOgo+IAo+IHNyYy90cG0yLXByb3ZpZGVyLWVuY29kZXIuYzoKPiAgSW4g
ZnVuY3Rpb24g4oCYdHBtMl9yc2FfZW5jb2Rlcl9lbmNvZGVfU3ViamVjdFB1YmxpY0tleUluZm9f
ZGVy4oCZOgo+IHNyYy90cG0yLXByb3ZpZGVyLWVuY29kZXIuYzo4Njo3MTogZXJyb3I6IHRoZSBj
b21wYXJpc29uIHdpbGwgYWx3YXlzCj4gIGV2YWx1YXRlIGFzIOKAmHRydWXigJkgZm9yIHRoZSBh
ZGRyZXNzIG9mIOKAmHRwbTJfcnNhX2VuY29kZV9wdWJsaWNfCj4gU3ViamVjdFB1YmxpY0tleUlu
Zm9fZGVy4oCZIHdpbGwgbmV2ZXIgYmUgTlVMTCBbLVdlcnJvcj1hZGRyZXNzXQo+IAo+IFNpZ25l
ZC1vZmYtYnk6IEJlcm5kIEt1aGxzIDxiZXJuZEBrdWhscy5uZXQ+CgpBcHBsaWVkIHRvIG1hc3Rl
ciwgYWZ0ZXIgY2hhbmdpbmcgb25lIGFzcGVjdCwgc2VlIGJlbG93LgoKPiAtVFBNMl9PUEVOU1NM
X1ZFUlNJT04gPSAxLjIuMAo+ICtUUE0yX09QRU5TU0xfVkVSU0lPTiA9IDEuMy4wCj4gIFRQTTJf
T1BFTlNTTF9TSVRFID0gaHR0cHM6Ly9naXRodWIuY29tL3RwbTItc29mdHdhcmUvdHBtMi1vcGVu
c3NsL3JlbGVhc2VzL2Rvd25sb2FkLyQoVFBNMl9PUEVOU1NMX1ZFUlNJT04pCj4gIFRQTTJfT1BF
TlNTTF9MSUNFTlNFID0gQlNELTMtQ2xhdXNlCj4gIFRQTTJfT1BFTlNTTF9MSUNFTlNFX0ZJTEVT
ID0gTElDRU5TRQo+ICBUUE0yX09QRU5TU0xfSU5TVEFMTF9TVEFHSU5HID0gWUVTCj4gIFRQTTJf
T1BFTlNTTF9ERVBFTkRFTkNJRVMgPSBob3N0LXBrZ2NvbmYgb3BlbnNzbCB0cG0yLXRzcwo+ICAK
PiArZGVmaW5lIFRQTTJfT1BFTlNTTF9ESVNBQkxFX1dFUlJPUgo+ICsJJChTRUQpICdzLy1XZXJy
b3IgLVdhbGwgLy9nJyAtaSAkKEBEKS9NYWtlZmlsZS4qCj4gK2VuZGVmCj4gK1RQTTJfT1BFTlNT
TF9QUkVfQ09ORklHVVJFX0hPT0tTICs9IFRQTTJfT1BFTlNTTF9ESVNBQkxFX1dFUlJPUgoKSSBy
ZWFsbHkgZG9uJ3QgbGlrZSB0aGlzIGtpbmQgb2YgcmFuZG9tIHBhdGNoaW5nLCBzbyBJJ3ZlIHJl
cGxhY2VkCnRoaXMgd2l0aDoKCisjIE5lZWQgdG8gZGlzYWJsZSAtV2Vycm9yIHRvIGF2b2lkIHdh
cm5pbmdzIGJlaW5nIHRyZWF0ZWQgYXMgZXJyb3JzCisjIHdpdGggc29tZSBnY2MgdmVyc2lvbnMK
K1RQTTJfT1BFTlNTTF9DT05GX0VOViA9IENGTEFHUz0iJChUQVJHRVRfQ0ZMQUdTKSAtV25vLWVy
cm9yIgoKd2hpY2ggaXMgYSBsb3QgY2xlYW5lciBJTU8uCgpCZXN0IHJlZ2FyZHMsCgpUaG9tYXMK
LS0gClRob21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KRW1iZWRkZWQg
TGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBhbmQgdHJhaW5pbmcKaHR0cHM6Ly9ib290bGlu
LmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
