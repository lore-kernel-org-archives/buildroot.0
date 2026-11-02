Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774DD606A335
	for <buildroot@archiver.kernel.org>; Mon,  2 Nov 2026 21:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Etc6M9b5
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D1E3605FF;
	Mon,  2 Nov 2026 21:04:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W3Hx-Slk5qGu; Mon,  2 Nov 2026 21:04:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5FCB1606A3
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793653469;
	b=m5cAVmYXLhd5t3fTOVcecw8ihwfYwJwKlzGEIPm1lzDeCW8S/0NxGTeTa03U4USCFUWD
	 QfvLLy/L5t7fozedUYuK+8WRQsbj4GWPKhtTsm2Kqf0zu7k56pN9PL8AwzbjmM7LifsbJ
	 /4QYWO4+jtGkImotmELExpjaE9StFN2m+pVmkPKtt2C+P60qGwr57DlfyH5aTm4q/s0SI
	 Nx56R+cwDkuavxT88icVKcicqBJJpxq0tcdTiV/Pf5SByLgwTGNYf3tk2gBIIQzSLqjgk
	 KTrq7Q4J3uh/yFLzf6vzvjJG5ShULfkgyuxvGsxxaqH+89F4Br9eOv4ljYUkc6KjtAw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793653469;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 Cc:References:Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:
	 UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=VVJcRUdIVK6kDjSyBn+Ldpbu+KabJSovJcK9ImPvTIU=;
	b=gNt/kS9SnJu3iH+FtaAdCLRyuYnK+93swRpClwXX18y1a+w3lKWEv8MPQgQyuh5gMPkk
	 xYcmJryL/r+YJOhJtt7ZiBPJyDJcvNIZXJ6bzYBSGLEXbejs7kpT/eBQ18lcyxaDLJIpi
	 WhIJ7ocTL4f4Ehr6/9mzBpPAL0qnx5kR9NFDr8rvJ6dawwr2QrnyawWvkmpIPiSWG79W1
	 YmgcpJgwxWILkILWSkWYR/xfOeVpezIAcVdRi7NjwdsBTf34BjGBTqldd18Ft2854iPGF
	 xUvLlLLyX2hQExiNVEqV8+PNoti2Lk9+kPATHBF8waY/7XeIHim2dRNfbSuok/nPT4A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793653469;
	bh=VVJcRUdIVK6kDjSyBn+Ldpbu+KabJSovJcK9ImPvTIU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Etc6M9b5aK5wnMmUp4PWiNH07ddBOmJdsS2OAuZjWpTrfH3wmOlcU3ixZJYQ8UhLR
	 amANXNZY0PcBkMMCdpmWUvhOIQwUz3yDsA/WREZ/NdwebxXaYWcWN6Vna6VJ78G7N+
	 G45mvKmATNUs4VXNKX6xzsVZzG5ZBDbv5GzIC5un2MsKKwWz2xzQyKu3hhAvPdKRZL
	 hZtysbzXIiMjlYbRp50JcUpXfj2uff8pyvkf/lnBTKJ3X/5a0ubIUjMwmu3YtyDNs2
	 zyw5BSCTrACTH4p+90SDtJT86O18JjthmrER8DK56kDy19Wg5CqFxhnPZ3XhrmSIqw
	 NVW/VowbUyU/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FCB1606A3;
	Mon,  2 Nov 2026 21:04:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B12E323
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 21:04:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 01774400BE
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 21:04:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BfGcFTs4S-CC for <buildroot@buildroot.org>;
 Mon,  2 Nov 2026 21:04:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 7C5E840098
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793653467;
 b=WP5tBnRAZjJNSnmWzQbiPDh1TUQVJ/2Vf7EX2myF+EBvfOY2dJt97tjCn3IlcpcCIm/Q
 lRnCd+XNB/oVrkPUS+a45MgNomLEfjTyihRdGqHfndb7I4YYoRH/FbVgzrhCAkYg88NZ1
 bkou0ZKn4GSMfHVGNEfUQPETW8tcBPPhQvEDM7bBtbTju8CgfxibNsKs7roeXBF5TS/U4
 QzKkSzOw03LUVutKs4HBEfcDef3PQtQJI5k4xFlB+m1VReVIaFPhmsc6+JqQfFBKztaZ4
 1tbC/epMBlUZdXlJb977nw//8sOZ5calfli3wp2cgIfrooRWjILlNx0eJa8UHvlpZ+w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793653467;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=+Kt271rqYKG3GZkr8Mcbqpw4axpdE+6Vtwi27sZx6gQ=;
 b=JXcXZHKhc/Jl7qGelEm0d84HSDYdQ1Y672skNJ+obYmnEzzSwKBBRSfUlzLcDQGsNmwh
 ZfQcippaqXFT7DJjoks8jRoygIfBH59lPS5msjX5y8O80JOVzkI0YmHpIKn1srSuTRjRF
 bKq0AzdGXw9rFO1Mq0aewsW69NZgGqQcyjnLOrZPMbVGCvIs14JIVX9y5So5a16Rkw237
 aNxajyRUSnjg/hja7a3iFeMI7fCYX2qz2x9tUUppZ+VFWYK+2pm/gQUVhWOw6MWtjNIxd
 mDS0MktPD6+jTZ3SGTA0sLSjZ5mxqjpHkxXd1qsFwbGZVKt9ADREts8jPuJNVmhTvKw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b="PCfYee/O"; 
 arc=none smtp.remote-ip=212.227.15.15
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7C5E840098
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 21:04:25 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MGQnP-1xIhsh2F0H-0013zi; Mon, 02
 Nov 2026 22:04:22 +0100
Message-ID: <90bbc6b7-839f-41db-bc32-46c6928862cb@gmx.de>
Date: Mon, 2 Nov 2026 22:04:21 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20261102195514.3967-1-bernd@kuhls.net>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20261102195514.3967-1-bernd@kuhls.net>
X-Provags-ID: V03:K1:IJBdkFOVyyugmB0k5hiiGYWbD6lN9BUGQe1dmutkqgPBMPLA4Kr
 shQIJu/R7VmmKYSSzK/1dZTTUqEpzx9/npSGNEWNEKg672ZQe1ijlYXMgYLaqhDa0POOCt2
 vK45pv40XxUyCAXQK7c7sQWDgpmXWuQo+KnH9lGc3UONIQlxN5iy8P19pKY2ZWxQK7YjGCJ
 uYIcomvnpIkKfovvyCVMw==
UI-OutboundReport: notjunk:1;M01:P0:XTbEdWYEyA4=;NmztOTslB6k8I6KFJxwsk9uXnTm
 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
 u1ePjW
Subject: Re: [Buildroot] [PATCH 1/1] package/expat: security bump version to
 2.10.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-22.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

QW0gMDIuMTEuMjYgdW0gMjA6NTUgc2NocmllYiBCZXJuZCBLdWhsczoKPiBodHRwczovL2dpdGh1
Yi5jb20vbGliZXhwYXQvbGliZXhwYXQvYmxvYi9SXzJfMTBfMC9leHBhdC9DaGFuZ2VzCj4gaHR0
cHM6Ly9ibG9nLmhhcnR3b3JrLm9yZy9wb3N0cy9leHBhdC0yLTEwLTAtcmVsZWFzZWQvCj4gCj4g
VGhlIGZvdXIgZml4ZWQgc2VjdXJpdHkgaXNzdWVzIGFyZToKPiAKPiBDVkUtMjAyNi0xMTMzNTEg
4oCUIERlbmlhbCBvZiBzZXJ2aWNlIHdpdGggWE1MX1BhcnNlclJlc2V0Cj4gQ1ZFLTIwMjYtMTE1
NTA2IOKAlCBEZW5pYWwgb2Ygc2VydmljZSBmcm9tIHZhcmlhdGlvbnMgb2YgYmlsbGlvbiBsYXVn
aHMKPiAgICAgICAgICAgICAgICAgICAgYXR0YWNrcyBhbmQgcGFyYW1ldGVyIGxhdWdocyBhdHRh
Y2tzCj4gQ1ZFLTIwMjYtMTE3NjEwIOKAlCBEZW5pYWwgb2Ygc2VydmljZSBvciBtb3JlIGZyb20g
aXNzdWVzIHdpdGggaW5pdGlhbAo+ICAgICAgICAgICAgICAgICAgICBub24tZmluYWwgZW1wdHkg
c3VicGFyc2VyIHBhcnNlIGNhbGxzCj4gQ1ZFLTIwMjYtMTE4MzcwIOKAlCBTaWduZWQgaW50ZWdl
ciBvdmVyZmxvdyBpbiBmdW5jdGlvbiBzdG9yZUF0dHMKPiAKPiBTaWduZWQtb2ZmLWJ5OiBCZXJu
ZCBLdWhscyA8YmVybmRAa3VobHMubmV0PgoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rIHlvdSEK
Cj4gLS0tCj4gR2l0bGFiIHBpcGVsaW5lcyBwYXNzZWQ6Cj4gaHR0cHM6Ly9naXRsYWIuY29tL2Jr
dWhscy9idWlsZHJvb3QvLS9jb21taXRzLzM0OTFhZTM5NmRmZDcyMjE5NzNmMjUxNWJkMjdjNDkx
YTE5NTAwY2EKPiAKPiAgIHBhY2thZ2UvZXhwYXQvZXhwYXQuaGFzaCB8IDQgKystLQo+ICAgcGFj
a2FnZS9leHBhdC9leHBhdC5tayAgIHwgMiArLQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvZXhwYXQv
ZXhwYXQuaGFzaCBiL3BhY2thZ2UvZXhwYXQvZXhwYXQuaGFzaAo+IGluZGV4IDQxNzc4ZmM1MzYu
LmU4OTM5ZmQzOGEgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9leHBhdC9leHBhdC5oYXNoCj4gKysr
IGIvcGFja2FnZS9leHBhdC9leHBhdC5oYXNoCj4gQEAgLTEsNCArMSw0IEBACj4gLSMgRnJvbSBo
dHRwczovL2dpdGh1Yi5jb20vbGliZXhwYXQvbGliZXhwYXQvcmVsZWFzZXMvdGFnL1JfMl85XzAK
PiAtc2hhMjU2ICAxZTYzNzE4NjJjYzMxOTk5YjM2OGMzYjg5YjQ5OTk0ZjA2NzdlMWJhYjVmMWIy
Yjg1YWUzNzQxZjVkODAzMDUxICBleHBhdC0yLjkuMC50YXIueHoKPiArIyBGcm9tIGh0dHBzOi8v
Z2l0aHViLmNvbS9saWJleHBhdC9saWJleHBhdC9yZWxlYXNlcy90YWcvUl8yXzEwXzAKPiArc2hh
MjU2ICBjNjI0YmEyOTk4ZmM2NWRmMTE2M2E0OTY0MWZmM2Y5YWI3MzEzOGIxMTY0MWQ5MmM4NmJl
ZTBmYjAxYjFiYzdmICBleHBhdC0yLjEwLjAudGFyLnh6Cj4gICAjIExvY2FsbHkgY2FsY3VsYXRl
ZAo+ICAgc2hhMjU2ICAzMWIxNWRlODJhYTE5YTg0NTE1NjE2OWExN2E1NDg4YmY1OTdlNTYxYjJj
MzE4ZDE1OWVkNTgzMTM5YjI1ZTg3ICBDT1BZSU5HCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvZXhw
YXQvZXhwYXQubWsgYi9wYWNrYWdlL2V4cGF0L2V4cGF0Lm1rCj4gaW5kZXggYmU1ZDhhZTBiOC4u
MjNhNjM1ZTVkNCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2V4cGF0L2V4cGF0Lm1rCj4gKysrIGIv
cGFja2FnZS9leHBhdC9leHBhdC5tawo+IEBAIC00LDcgKzQsNyBAQAo+ICAgIwo+ICAgIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMKPiAgIAo+IC1FWFBBVF9WRVJTSU9OID0gMi45LjAKPiArRVhQQVRf
VkVSU0lPTiA9IDIuMTAuMAo+ICAgRVhQQVRfU0lURSA9IGh0dHBzOi8vZ2l0aHViLmNvbS9saWJl
eHBhdC9saWJleHBhdC9yZWxlYXNlcy9kb3dubG9hZC9SXyQoc3Vic3QgLixfLCQoRVhQQVRfVkVS
U0lPTikpCj4gICBFWFBBVF9TT1VSQ0UgPSBleHBhdC0kKEVYUEFUX1ZFUlNJT04pLnRhci54ego+
ICAgRVhQQVRfSU5TVEFMTF9TVEFHSU5HID0gWUVTCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
