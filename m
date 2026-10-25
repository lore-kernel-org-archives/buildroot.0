Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B9F606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 20:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=acTUguV0
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DAC260613;
	Sun, 25 Oct 2026 20:37:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ig8TJTB0j_UF; Sun, 25 Oct 2026 20:37:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2E14860601
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792960625;
	b=O5ZIR0Fk37CDco9LSynMsmwoEYuScuib2odwr4eh806TOZtYzxaitt/7CzlZrfCo6E82
	 KNsLpNLFMwMkQUZjW7mv59J3OeOLhctS6quXnWlKtiPaInJMr+/e+sGGYMEQTUvvKI13N
	 ziSRpJrfPRcEXLr+70V6CElaG4HTi0BXekcvbfL8hL6cP+0YjwATZR/WaE+GusNbPGjWD
	 6nyFNk5rB9uG+eDRCPd4gSrBv43T2Z0ElQwUpf1oeqNFG0P82h3CswIykh02sl+lJmhCN
	 cktytZ2eVKzvsBS6wWo/UylIRQkP2e0usJ1Bbr2ryC7dMfSLykrQJsMX53PSl6hJsbA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792960625;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Nn6PnQ9Tw9bBzcAuNL0WRxxTVwS0Ua5aEcpIVyMtiOo=;
	b=U/XmcEqKTUm6kQekFIQMtRu6SeujrRVo711XFyu4BjzuWwk0RxjahkxhyVoZfK0+Ezjx
	 fpHLX9pokfcM1EAvN8ZLNDuHqUgpCSN/OZ/JGUn2sIqUFv5zMVNXwVs8RkJyHVbSIgS0A
	 uy7HfspH1gMpLw0dyRpTDohwN3mPRFk6ud/NOxDUrI9FscrjcrQisu562BnnccVUXHmae
	 bEzuiE3JACZdM+jcmnOT60JKdS1MzDPKsDFg2ZQpchJn8ClDcfyjCDcYepo8AsXE75edP
	 NXsnBLVKWLKr/lOCjuqqn22n3wkGCVkCOaGkXdB2O8fSF4ZpBp6myRxzDQwRPPEKhog==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792960625;
	bh=Nn6PnQ9Tw9bBzcAuNL0WRxxTVwS0Ua5aEcpIVyMtiOo=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=acTUguV0tIs1LC00bzVLZD9tcJve4i3kM8i0K3O/OaPXekp3AZbxlD3Jlmk1wcB4/
	 TdkYEGD+ra+o63o6Zrvf11HMubNTTEOxsQtsdGH0XpARfmeOkj46dW1lNYvEyrgMkM
	 aWUA6H9K0OF+YA+KZNXS5/+OYQuj1y7V+NcWbwlGGWrNxKKmhUOmWORRDw2ZyeG5kq
	 jJJEgaAbfe7IXKLXqBLzMR8hHDGpSntXNFFk+W3E6pI8kM9xjUHkF5gHLFdNxfkeot
	 6Cqtx5TP8oS21hx34rfMd4S635o3XEznN+DTJys+RsZne6GmMDwH87aKBGqGh3aGyA
	 FPh3JvFpmIztA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E14860601;
	Sun, 25 Oct 2026 20:37:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B5983D9
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:37:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 424CC405C5
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:37:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v46pUu25va3k for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 20:37:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 77255405C4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792960621;
 b=jhQD6xgrbZwomPbkqnKFGbHKWvWc7y+dyWvzZSZVexVxVRVQdJ5DYRCiG8Y68n6MCkbM
 rylKK2emTRJLon1rb7rrknQJcDJx5khVW+bYfPVGNnNypM35YzFoZs+mjBTIQ4YSzzSwm
 swrF+362Xrbez6wSDuDQGYnCkwzkWMuqJXrciZcGxy5MTB25e8mE/cyhsLhQ5urkn/V32
 rwtVwes2waTB2MDeEC8fmh3+07LR6aAqzlhDiwEQcvmvoG0qmXbZD5tQTT74a5ii2YSFg
 bBOm9qgARlRdfev8ENHsFxNM2iVQ+XTkCn3Rp3Dlmmd1rq93Zk2LMq2zRTXDVVzcE1Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792960621;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
 X-Last-TLS-Session-Version;
 bh=g1XckpJQ/8nkNoCLRvbpPcV2263eKTjyxv2e/rta9Uc=;
 b=XNOffsD1PTI7NGM1ngWEwld7J4HD8vPirq/drxWiApTwAWjk+0PO85KugbKx1in9dCI/
 ecU7MNsU/TkeVxJjTyJ9SKKihpDJ5RCCZz4vWCCpvlSOTLGBx0i/LNNlAdcig3L/Bhlbo
 uQhfIKqVsn3n5C/zlL5Cu8pLRp2P14V5pjfAEqi+MCjBH/S9TsUsV9ZyU3EKAWSidWQ9t
 nmYlta94N8JJAHfJNeFBnokW2AppitQbp4vD7/OSAC1qdb/ZgQFcBXehkzzPtegDEY4UE
 qUdGfaE2BQHLUb+PR9Q/h4QKdboBFbvK9fYz4vC1oZDmIHQGDSbbVaAmgPKu/zDhuHA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=C6DKo8Id; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 77255405C4
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:37:00 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id CD90AC51477;
 Sun, 25 Oct 2026 20:37:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E012160740;
 Sun, 25 Oct 2026 20:36:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 457C010328E76; Sun, 25 Oct 2026 21:36:57 +0100 (CET)
Date: Sun, 25 Oct 2026 21:36:56 +0100
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: buildroot@buildroot.org, Andreas Ziegler <br025@umbiko.net>
Message-ID: <at5oC97YlhN98HHS@windsurf>
References: <20261024220915.2813680-1-alexander.sverdlin@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261024220915.2813680-1-alexander.sverdlin@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2] boot/syslinux: Bump to 6.04-pre2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gU3VuLCBPY3QgMjUsIDIwMjYgYXQgMTI6MDg6NDRBTSArMDIwMCwgQWxleGFuZGVyIFN2ZXJk
bGluIHdyb3RlOgo+IFRoZSByZXZpc2lvbiB0byBidWlsZCBjb21lcyBmcm9tIEFyY2hsaW51eCBz
eXNsaW51eCBwYWNrYWdlLCB0aGUgYXJjaGl2ZQo+IGZyb20gZGViaWFuICh0byBzYXZlIHRpbWUg
Zm9yIGdpdCBjbG9uZSkuCj4gCj4gQWRkIHBhdGNoIGZpeGluZyBwYXNzaW5nICZsb2FkX2Vycm9y
X2J1ZiB0byBzZXRqbXAoKS9sb25nam1wKCksIHJlamVjdGVkCj4gc2luY2UgZ2NjIDE0IG1hZGUg
LVdpbmNvbXBhdGlibGUtcG9pbnRlci10eXBlcyBhbiBlcnJvciBieSBkZWZhdWx0Lgo+IAo+IFNp
Z25lZC1vZmYtYnk6IEFsZXhhbmRlciBTdmVyZGxpbiA8YWxleGFuZGVyLnN2ZXJkbGluQGdtYWls
LmNvbT4KCkRvZXMgaXQgbWFrZSBzZW5zZSB0byBrZWVwIHN5c2xpbnV4PyBFdmVuIFdpa2lwZWRp
YSBzYXlzIGl0J3MKImRpc2NvbnRpbnVlZCIuIERvIHlvdSBzdGlsbCB1c2UgaXQ/CgpXaGF0IGFi
b3V0IGFsbCB0aGUgcGF0Y2hlcyB5b3UgYXJlIGRyb3BwaW5nLCBhcmUgdGhleSBhbGwgInVwc3Ry
ZWFtIj8KV2UgdXN1YWxseSBsaWtlIHRvIGhhdmUgc29tZSBjbGFyaWZpY2F0aW9uIGluIHRoZSBj
b21taXQgbG9nIG9uIHdoeQpwYXRjaGVzIGFyZSBkcm9wcGVkLgoKPiBkaWZmIC0tZ2l0IGEvYm9v
dC9zeXNsaW51eC8wMDAxLWVmaS1tYWluLmMtZml4LWptcF9idWYtcGFzc2luZy5wYXRjaCBiL2Jv
b3Qvc3lzbGludXgvMDAwMS1lZmktbWFpbi5jLWZpeC1qbXBfYnVmLXBhc3NpbmcucGF0Y2gKPiBu
ZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjNiYWFiYzJiMmUKPiAtLS0g
L2Rldi9udWxsCj4gKysrIGIvYm9vdC9zeXNsaW51eC8wMDAxLWVmaS1tYWluLmMtZml4LWptcF9i
dWYtcGFzc2luZy5wYXRjaAo+IEBAIC0wLDAgKzEsMzQgQEAKPiArRnJvbTogQWxleGFuZGVyIFN2
ZXJkbGluIDxhbGV4YW5kZXIuc3ZlcmRsaW5AZ21haWwuY29tPgo+ICtTdWJqZWN0OiBbUEFUQ0hd
IGVmaS9tYWluLmM6IHBhc3Mgam1wX2J1ZiBkaXJlY3RseSB0byBzZXRqbXAoKS9sb25nam1wKCkK
PiArCj4gK2dudS1lZmkncyBqbXBfYnVmIGlzIGEgb25lLWVsZW1lbnQgYXJyYXksIHNvIGxvYWRf
ZXJyb3JfYnVmIGFscmVhZHkgZGVjYXlzCj4gK3RvIHRoZSBlbGVtZW50IHBvaW50ZXIgc2V0am1w
KCkvbG9uZ2ptcCgpIGV4cGVjdC4gUGFzc2luZyAmbG9hZF9lcnJvcl9idWYKPiAraGFuZHMgb3Zl
ciBhIHBvaW50ZXItdG8tYXJyYXkgaW5zdGVhZCwgcmVqZWN0ZWQgc2luY2UgZ2NjIDE0IG1hZGUK
PiArLVdpbmNvbXBhdGlibGUtcG9pbnRlci10eXBlcyBhbiBlcnJvciBieSBkZWZhdWx0Lgo+ICsK
PiArVXBzdHJlYW06IE4vQSwgZGVhZAo+ICtTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgU3ZlcmRs
aW4gPGFsZXhhbmRlci5zdmVyZGxpbkBnbWFpbC5jb20+Cj4gKy0tLQo+ICsgZWZpL21haW4uYyB8
IDQgKystLQo+ICsgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKPiArCj4gK2RpZmYgLS1naXQgYS9lZmkvbWFpbi5jIGIvZWZpL21haW4uYwo+ICstLS0gYS9l
ZmkvbWFpbi5jCj4gKysrKyBiL2VmaS9tYWluLmMKPiArQEAgLTE4NCw3ICsxODQsNyBAQCBfX2V4
cG9ydCB2b2lkIGxvY2FsX2Jvb3QodWludDE2X3QgYXgpCj4gKyAgICAgICogSW5mb3JtIHRoZSBm
aXJtd2FyZSB0aGF0IHdlIGZhaWxlZCB0byBleGVjdXRlIGNvcnJlY3RseSwgd2hpY2gKPiArICAg
ICAgKiB3aWxsIHRyaWdnZXIgdGhlIG5leHQgZW50cnkgaW4gdGhlIEVGSSBCb290IE1hbmFnZXIg
bGlzdC4KPiArICAgICAgKi8KPiArLSAgICBsb25nam1wKCZsb2FkX2Vycm9yX2J1ZiwgMSk7Cj4g
KysgICAgbG9uZ2ptcChsb2FkX2Vycm9yX2J1ZiwgMSk7CgpBcmUgeW91IHN1cmUgdGhpcyBpcyB0
aGUgcmlnaHQgZml4Li4uCgo+IGRpZmYgLS1naXQgYS9ib290L3N5c2xpbnV4LzAwMjQtZWZpLW1h
aW4uYy1maXgtaW5jb3JyZWN0LXR5cGUtb2YtbG9hZF9lcnJvcl9idWYucGF0Y2ggYi9ib290L3N5
c2xpbnV4LzAwMjQtZWZpLW1haW4uYy1maXgtaW5jb3JyZWN0LXR5cGUtb2YtbG9hZF9lcnJvcl9i
dWYucGF0Y2gKPiBkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCA5ZjYxNzQ1YTYxLi4w
MDAwMDAwMDAwCj4gLS0tIGEvYm9vdC9zeXNsaW51eC8wMDI0LWVmaS1tYWluLmMtZml4LWluY29y
cmVjdC10eXBlLW9mLWxvYWRfZXJyb3JfYnVmLnBhdGNoCj4gKysrIC9kZXYvbnVsbAo+IEBAIC0x
LDQ4ICswLDAgQEAKPiAtRnJvbSBjYmM4YThlMjVjMzU0ODc3MWRlNTI5NGY1YTFlYWVmNmJmZTli
NWRhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+IC1Gcm9tOiBUaG9tYXMgUGV0YXp6b25pIDx0
aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPgo+IC1EYXRlOiBTYXQsIDE4IEphbiAyMDI1IDE3
OjAzOjE2ICswMTAwCj4gLVN1YmplY3Q6IFtQQVRDSF0gZWZpL21haW4uYzogZml4IGluY29ycmVj
dCB0eXBlIG9mIGxvYWRfZXJyb3JfYnVmCj4gLU1JTUUtVmVyc2lvbjogMS4wCj4gLUNvbnRlbnQt
VHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOAo+IC1Db250ZW50LVRyYW5zZmVyLUVuY29k
aW5nOiA4Yml0Cj4gLQo+IC1sb2FkX2Vycm9yX2J1ZiBpcyB1c2VkIGFzIGFyZ3VtZW50IG9mIHNl
dGptcCgpL2xvbmdqbXAoKSwgc28gaXQgc2hvdWxkCj4gLWJlIGEgImptcF9idWYiLCBub3QgYSAi
am1wX2J1ZiAqIi4gQWNjb3JkaW5nIHRvIHRoZSBzZXRqbXAvbG9uZ2ptcCBtYW4KPiAtcGFnZToK
PiAtCj4gLSAgICAgICBpbnQgc2V0am1wKGptcF9idWYgZW52KTsKPiAtICAgICAgIGludCBzaWdz
ZXRqbXAoc2lnam1wX2J1ZiBlbnYsIGludCBzYXZlc2lncyk7Cj4gLQo+IC1GaXhlcyBidWlsZCBp
c3N1ZSB3aXRoIEdDQyA+PSAxNDoKPiAtCj4gLWVmaS9tYWluLmM6MTMyOToyMTogZXJyb3I6IHBh
c3NpbmcgYXJndW1lbnQgMSBvZiDigJhzZXRqbXDigJkgZnJvbSBpbmNvbXBhdGlibGUgcG9pbnRl
ciB0eXBlIFstV2luY29tcGF0aWJsZS1wb2ludGVyLXR5cGVzXQo+IC0gMTMyOSB8ICAgICAgICAg
aWYgKCFzZXRqbXAobG9hZF9lcnJvcl9idWYpKQo+IC0gICAgICB8ICAgICAgICAgICAgICAgICAg
ICAgXn5+fn5+fn5+fn5+fn4KPiAtICAgICAgfCAgICAgICAgICAgICAgICAgICAgIHwKPiAtICAg
ICAgfCAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCA8YW5vbnltb3VzPiAoKilbMV0KPiAteDg2
XzY0LWJ1aWxkcm9vdC1saW51eC1nbnUvc3lzcm9vdC91c3IvaW5jbHVkZS9lZmkvZWZpc2V0am1w
Lmg6NzoyOTogbm90ZTogZXhwZWN0ZWQg4oCYc3RydWN0IDxhbm9ueW1vdXM+ICrigJkgYnV0IGFy
Z3VtZW50IGlzIG9mIHR5cGUg4oCYc3RydWN0IDxhbm9ueW1vdXM+ICgqKVsxXeKAmQo+IC0gICAg
NyB8IGV4dGVybiBVSU5UTiBzZXRqbXAoam1wX2J1ZiBlbnYpIF9fYXR0cmlidXRlX18oKHJldHVy
bnNfdHdpY2UpKTsKPiAtICAgICAgfCAgICAgICAgICAgICAgICAgICAgIH5+fn5+fn5+Xn5+Cj4g
LQo+IC1VcHN0cmVhbTogTi9BIGRlYWQKPiAtU2lnbmVkLW9mZi1ieTogVGhvbWFzIFBldGF6em9u
aSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4KPiAtLS0tCj4gLSBlZmkvbWFpbi5jIHwg
MiArLQo+IC0gMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4g
LQo+IC1kaWZmIC0tZ2l0IGEvZWZpL21haW4uYyBiL2VmaS9tYWluLmMKPiAtaW5kZXggN2RjN2Jj
YTcuLjA0NWRhZTU2IDEwMDY0NAo+IC0tLS0gYS9lZmkvbWFpbi5jCj4gLSsrKyBiL2VmaS9tYWlu
LmMKPiAtQEAgLTMwLDcgKzMwLDcgQEAgdWludDMyX3QgdGltZXJfaXJxOwo+IC0gX19leHBvcnQg
dWludDhfdCBLYmRNYXBbMjU2XTsKPiAtIGNoYXIgYXV4X3NlZ1syNTZdOwo+IC0gCj4gLS1zdGF0
aWMgam1wX2J1ZiAqbG9hZF9lcnJvcl9idWY7Cj4gLStzdGF0aWMgam1wX2J1ZiBsb2FkX2Vycm9y
X2J1ZjsKCkFuZCBub3QgdGhpcyBvbmUsIHRoYXQgeW91IGFyZSByZW1vdmluZz8KClRob21hcwot
LSAKVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgpFbWJlZGRlZCBM
aW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmluZwpodHRwczovL2Jvb3RsaW4u
Y29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
