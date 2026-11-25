Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ADC1606A326
	for <buildroot@archiver.kernel.org>; Wed, 25 Nov 2026 04:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Bcm4kBWV;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256 header.s=mail header.b=I8mgFuTQ
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5752C6087F;
	Wed, 25 Nov 2026 04:47:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EiZA0hTW4xhx; Wed, 25 Nov 2026 04:47:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 933B9606A3
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795582025;
	b=nG9voEPLxzXY9G/878R+6lNznZHpiFn9zfEvZTxvVbzNRpLNgKR/60RssHgmE4mxYuLk
	 XzrT5EkmLsAAw/E03tkify4jOfWqQbsH8srPWLjFodZt+YbMGMdsn9RTiStd6QIvFEdHz
	 dyamoqoSAXQhIXzxGBmZ5hn1Ng1AjQFkYoQyBWWOy23NcBRIQl9eeLLAgKr67VF8SOR2g
	 S77fXH8WEolxEizJm3ST6ACUrcaMFxM7M2+8GJNbyNJulXGnlTy0/iFvxwacyKbgJyvz9
	 CWLKfr3+T9FSPEDNYeT9u6GqxTnIvnX33N++eEzYZsqU8ULwkEEaYW+B3fnQqSjoHoA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795582025;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:MIME-Version:Date:From:To:Cc:In-Reply-To:
	 References:Message-ID:X-Sender:X-Virus-Scanned:X-Virus-Status:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=tLnOW8c9jbbK2qKHH5qqEuhW0iX/jdbNIZrlHPTB8Kg=;
	b=DPuaQ4jufjr3l4UgfO+sK1ZzzQNBqZpyXQLb0UlwIyNJFw0gh/nPayOdboOqC/7ad5+G
	 dNVdcXSZrLcGQPKmkzWGhE6Lj8DrTFlCEzzc9oxjUPjdihj9ygM9jaFFEWZ1RtF/eeWBx
	 Otr0LuwWojQaIGxnJWem1U9j7M0714MLJyLKWXkml1nq6DlZBXf5ev34XG2dfQzxfZDwk
	 UgJIukfkstjTut3ApJRdLXrPW9ft8PfQ+MoTN4wv34MFmv/rjjb1vGrt7P/zbmJx2gQiQ
	 x/UBaWvx20O7EjbeN0/P97DDt3fu6Cpln1cmTG6kgoNhhXqqNiislGPzYBCNp37ysvA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795582025;
	bh=tLnOW8c9jbbK2qKHH5qqEuhW0iX/jdbNIZrlHPTB8Kg=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Bcm4kBWVaYhYTZ3bIi08eDsxrFxQybrkgBudRri8MlskWAvJAo69170rDZ2lx1J+p
	 r8SHuAJWORTjl7oOoavhZP4Mn/v7IJBuE/8hkUdV9N7F8L5PCXy8+bOWoFURE1SXeH
	 C19+aBaI1MXr1X4RuVR5RpJng4L/ncNWKWVLq4qlUIcIxOlGsxKJllAHcwvweJcv8A
	 MJrGRa7F1iFzdWOvsG4mtZ/IOjjWvtKzNIflefsK6yhZqvG7kymgrR0S60s7L71oE0
	 YHbY5JPaznnTaqcwRf4FH6NfYhNVgt1xHKHT6tcn6qdWaW4d9kf4nl84odLYfNJCi4
	 DJPpvYXTwgDZA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 933B9606A3;
	Wed, 25 Nov 2026 04:47:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 30B5110B
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 04:47:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1933140180
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 04:47:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ax0Eu8LnR1ce for <buildroot@buildroot.org>;
 Wed, 25 Nov 2026 04:47:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 49949400AF
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=176.9.89.163
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=176.9.89.163;
 helo=serv15.avernis.de; envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=umbiko.net
Authentication-Results: smtp2.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=I8mgFuTQ
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 49949400AF
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 04:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=umbiko.net; s=mail;
 t=1795582017; bh=UC2UYa8RWoZ2tkbuWLp/T20KzjbIcEi6ggTp2S58EIY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=I8mgFuTQUrutkUznCEzzRiZZOhjG14wSObVOzOpgMdMO9WcPWdW91UEMXJMOqNMRn
 SAVHV6Kz9Z29gs0belXGw7uR2LDusoY+I6rFcRJ9SBapKmzjVevGEo9d5lNEo5nWEJ
 Chy0dvpgI3vhjusPjDdDgTOioy7BHbap4I5G2lY4=
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 2984CBDE22BD;
 Wed, 25 Nov 2026 05:46:57 +0100 (CET)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Wed, 25 Nov 2026 04:46:56 +0000
From: Andreas Ziegler <br025@umbiko.net>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261122004653.3725606-1-alexander.sverdlin@gmail.com>
References: <20261122004653.3725606-1-alexander.sverdlin@gmail.com>
Message-ID: <f6a0348c77729b59f2df6ed7aafc07f2@umbiko.net>
X-Sender: br025@umbiko.net
X-Virus-Scanned: clamav-milter 1.4.6 at serv15.avernis.de
X-Virus-Status: Clean
Subject: Re: [Buildroot] [PATCH v3 1/2] boot/syslinux: Bump to 6.04-pre2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgQWxleGFuZGVyLAoKT24gMjAyNi0xMS0yMiAwMDo0NiwgQWxleGFuZGVyIFN2ZXJkbGluIHdy
b3RlOgo+IFRoZSByZXZpc2lvbiB0byBidWlsZCBjb21lcyBmcm9tIEFyY2hsaW51eCBzeXNsaW51
eCBwYWNrYWdlLCB0aGUgCj4gYXJjaGl2ZQo+IGZyb20gZGViaWFuICh0byBzYXZlIHRpbWUgZm9y
IGdpdCBjbG9uZSkuCj4gCj4gMDAwMS1iaW9zLUZpeC1hbGlnbm1lbnQtY2hhbmdlLXdpdGgtZ2Nj
LTUucGF0Y2ggYmVjYW1lIHVwc3RyZWFtIGNvbW1pdAo+IGU1ZjJiNTc3ZGVkMSAoImJpb3M6IEZp
eCBhbGlnbm1lbnQgY2hhbmdlIHdpdGggZ2NjIDUiKS4KPiAKPiAwMDAyLURpc2FibGUtUElFLXRv
LWF2b2lkLUZUQkZTLW9uLWFtZDY0LnBhdGNoIHdhcyBkcm9wcGVkIGFmdGVyIAo+IHVwc3RyZWFt
Cj4gZjJmODk3YTE3NjJmICgiZ3B4ZTogZGVsZXRlIGxvbmcgc2luY2Ugb2Jzb2xldGUgc25hcHNo
b3Qgb2YgZ1BYRSIpIAo+IGRyb3BwZWQKPiBnUFhFLgo+IAo+IDAwMDMtbWVtZGlzay1Gb3JjZS1s
ZC1vdXRwdXQtZm9ybWF0LXRvLTMyLWJpdHMucGF0Y2ggYmVjYW1lIHVwc3RyZWFtIAo+IGNvbW1p
dAo+IGMwNWZkZTJmMGY3MSAoIm1lbWRpc2s6IEZvcmNlIGxkIG91dHB1dCBmb3JtYXQgdG8gMzIt
Yml0cyIpLgo+IAo+IDAwMDQtdXRpbHMtVXNlLXRoZS1ob3N0LXRvb2xjaGFpbi10by1idWlsZC5w
YXRjaCBiZWNhbWUgdXBzdHJlYW0gY29tbWl0Cj4gNmNkZWI5Y2ViOGI1ICgidXRpbHM6IFVzZSB0
aGUgaG9zdCB0b29sY2hhaW4gdG8gYnVpbGQuIikuCj4gCj4gMDAwNi1UaGUtVlByaW50LWRlZmlu
aXRpb24taXMtbm93LXBhcnQtb2YtdGhlLWV4cG9ydHMtb2YtLnBhdGNoIGJlY2FtZQo+IDdiZWQz
ZTE1N2E2NCAoIlRoZSBWUHJpbnQgZGVmaW5pdGlvbiBpcyBub3cgcGFydCBvZiB0aGUgZXhwb3J0
cyBvZiAKPiBnbnUtZWZpIikuCj4gCj4gMDAwOC1lZmktd3JhcHBlci1idWlsZC1pdC13aXRoLXRo
ZS1ob3N0LXRvb2xjaGFpbi5wYXRjaCBiZWNhbWUgdXBzdHJlYW0KPiAyZWE0NGNiZWRiMjkgKCJl
Zmkvd3JhcHBlcjogYnVpbGQgaXQgd2l0aCB0aGUgaG9zdCB0b29sY2hhaW4uIikuCj4gCj4gMDAw
OS1iaW9zLURvbi10LXRyeS10by1ndWVzcy10aGUtc2VjdGlvbnMtYWxpZ25tZW50LnBhdGNoIGJl
Y2FtZSAKPiB1cHN0cmVhbQo+IDBjYzlhOTllNTYwYSAoImJpb3M6IERvbid0IHRyeSB0byBndWVz
cyB0aGUgc2VjdGlvbnMgYWxpZ25tZW50IikuCj4gCj4gMDAxMC1jb3JlLUNsZWFuLXVwLXRoZS1p
Mzg2LWJpb3MtYnVpbGQucGF0Y2ggYmVjYW1lIHVwc3RyZWFtIGNvbW1pdAo+IGZmODU5MDUwZmE0
ZSAoImNvcmU6IENsZWFuIHVwIHRoZSBpMzg2LWJpb3MgYnVpbGQiKS4KPiAKPiAwMDEyLXB1bGwt
aW4tc3lzLXN5c21hY3Jvcy1oLWZvci1tYWpvci1taW5vci1tYWtlZGV2LnBhdGNoIGJlY2FtZSAK
PiB1cHN0cmVhbQo+IDFhNzQ5ODViMmE0MCAoImV4dGxpbnV4OiBwdWxsIGluIHN5cy9zeXNtYWNy
b3MuaCBmb3IgCj4gbWFqb3IvbWlub3IvbWFrZWRldiIpLgo+IAo+IDAwMjEtbG9hZF9saW51eC1j
b3JyZWN0LWEtdHlwZS5wYXRjaCBiZWNhbWUgdXBzdHJlYW0gY29tbWl0Cj4gODNhYWQ0ZjY5MDY1
ICgibG9hZF9saW51eDogY29ycmVjdCBhIHR5cGUiKS4KPiAKPiAwMDA3LVVwZGF0ZS10aGUtbG9u
Z2p1bXAtY2FsbHMtdG8tZml0LXRoZS1uZXctZGVjbGFyYXRpb24ucGF0Y2ggd2FzIAo+IHNvbHZl
ZAo+IGRpZmZlcmVudGx5IHVwc3RyZWFtIGFuZCBiZWNhbWUKPiAyMmQzMmMxNWVhOTYgKCJVcGRh
dGUgdGhlIGxvbmdqdW1wIGNhbGxzIHRvIGZpdCB0aGUgbmV3IGRlY2xhcmF0aW9uIikuCj4gCj4g
MDAyNC1lZmktbWFpbi5jLWZpeC1pbmNvcnJlY3QtdHlwZS1vZi1sb2FkX2Vycm9yX2J1Zi5wYXRj
aCB1c2VkIHRvIAo+IHJldmVydAo+IHRoZSBhYm92ZSBwYXRjaCAwMDA3LCBidXQgYmVjYW1lIHVz
ZWxlc3MuCj4gCj4gQWRkIHBhdGNoIGZpeGluZyBwYXNzaW5nICZsb2FkX2Vycm9yX2J1ZiB0byBz
ZXRqbXAoKS9sb25nam1wKCksIAo+IHJlamVjdGVkCj4gc2luY2UgZ2NjIDE0IG1hZGUgLVdpbmNv
bXBhdGlibGUtcG9pbnRlci10eXBlcyBhbiBlcnJvciBieSBkZWZhdWx0Lgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IEFsZXhhbmRlciBTdmVyZGxpbiA8YWxleGFuZGVyLnN2ZXJkbGluQGdtYWlsLmNvbT4K
CkltcHJlc3NpdmUgZG9jdW1lbnRhdGlvbiEKQWNrZWQtYnk6IEFuZHJlYXMgWmllZ2xlciA8YnIw
MsKrdW1iaWtvLm5ldD4KCjwuLi4+CgpLaW5kIHJlZ2FyZHMsCkFuZHJlYXMKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
