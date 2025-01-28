Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94208C0218A
	for <buildroot@archiver.kernel.org>; Tue, 28 Jan 2025 13:33:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1306460B99;
	Tue, 28 Jan 2025 13:33:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jx1oBmpnD0aG; Tue, 28 Jan 2025 13:33:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D38560731
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D38560731;
	Tue, 28 Jan 2025 13:33:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D505E94A
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 13:33:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B59C660731
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 13:33:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IB15qAj8v6yD for <buildroot@buildroot.org>;
 Tue, 28 Jan 2025 13:33:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0533960706
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0533960706
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0533960706
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 13:33:39 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.116.205]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MBlxW-1tkUPQ1aJA-004J8p; Tue, 28
 Jan 2025 14:33:32 +0100
Message-ID: <f6d14b70-cf74-4a03-80fd-5e4fc4325a47@gmx.de>
Date: Tue, 28 Jan 2025 14:33:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Edgar Bonet <bonet@grenoble.cnrs.fr>, Romain Naour
 <romain.naour@smile.fr>, Buildroot development <buildroot@buildroot.org>
Cc: Michael Walle <mwalle@kernel.org>, Chris Packham
 <judge.packham@gmail.com>, Sergey Matyukevich <geomatsi@gmail.com>
References: <035d6d78-0a31-4083-8fa1-65f5be5f74b5@grenoble.cnrs.fr>
 <3ea35c40-07d1-41d3-b4f9-08bbb0336d24@smile.fr>
 <4e691513-04a1-4f6f-ad3a-df18f653a6b7@grenoble.cnrs.fr>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <4e691513-04a1-4f6f-ad3a-df18f653a6b7@grenoble.cnrs.fr>
X-Provags-ID: V03:K1:9eDJU/jitJGCj7JxmHtiwQlKV2o3kl4Rp0D7dS8GfaTUmUmbmVF
 QUG2nIEMeHGl10k9LH2TtM8OYrdQyLqcTmMmRNP1MaGM2gt9FWQXEtp4X9FvdygqH8ldQq+
 Cmtp2oL3+Km0iPOET+D5ShARCbsAKr/a/hwCUIMt3u7FBG9uZJkUovpRpFdITBPHEMQgYbf
 DUjGydLgPGfp7xtw7HPYw==
UI-OutboundReport: notjunk:1;M01:P0:/nvkPc8jRMI=;v7drCQ6xrrQ5ZW8czcZMK5drWL5
 MeyKPWjVjD6xgIhwR0Gwgs9xzEU1h8JkLYw0e9Dsq8dCQ7OY0+uP5XyFgwuTT38HEqeLuk89T
 RLKh5CtjlkElbhfTQ9ejMCqOEPXxYmFaKIgTORFO+x8+Pkv4Ym0Vd1L6cuhpeMcY12WcTmrCz
 LFyP0ilRNI6mNRWAMDD0lPO0y/o+tIQxo6Oid4Bl/8KQSJo3C1DSQdsRIjXX2pYy9H6PiO+WR
 jADk+xZXlwWX90T34efYydJGHvDUvbVWTDpmXjBRNrNjYGPzwS0tStLaXuW9qO9E5qlWvWrb2
 sZ6cSy5kQmGzvPMebK/9xpczU0fadsQNtC7o+1ugCwj4ITROOVGW05mHZ4I332Lwsy41MLOLt
 2PDzYTU0hWsxYH/IQhA1IT/LLfq/NFLsuIA209YLPNnDXI8FQSiZzBAtEVbYG1dl/fnFr2LvN
 laW4eBkduE/tdJNrFXp3sNi/fKcBX6xm4BKdNM5OXhGfuFcTI3PwhSxwjg5qCNyoIQRCiu1RV
 4QI6r9biIC/g22n9TgkEXgAyetlaUMcrRqtRqWq0hFkGZBYAdA8ANhw7Lsp3MCmFXiwGErEnW
 aBsspvPWNml8u/OGt7hnigh6+OWFu2h/0ka8SVCFKN7YJGCtpxY4cT1AHAzNKl/4W3lZLbbIG
 h1aIrLpiQY8e2OOhLbxqiVuEKQYK6/Ujmnayi3OCNpLbzGLkAPtWvao0oAZ7lWd9UGUi87dnn
 1FGT1D/GqTizWcWJs1EQVs4enotRK936ER1KgxcIa4n1oFr1AEHVSg5VL1vLBuocHa8vd8zVE
 67GShXiyr9vmtaYKbJgqNtA9sdKSSbmH9IM9KgvlAqXgElnAZhLX11OCtWGO+v8eFLAfga755
 iOSN/QLPoDt/fjnCXNwXw71DlGuLHTXcMDQ0wEGlWXQevws5JMu/FudUZa4Bho2WQn6GLcVpl
 eupNZO6YRzM6K1znub2JXDHT9z2LzdDz8wAF3aR+G/0VrqcHBGsA59IIhfhOs9+0J2C96VOyl
 u8ejJ4UM1Hb0Pw32/OWUml+wX7xCzMvg3P2biPeeIw021xl+QOSW+Fkw/zS2DSSwWsFmFBkwv
 YzuaI0MIhb1EnVVBr/M5zsnzfePb5+Zg1tk+vmpIJTYzk2TbDjg/kQxpW0epv4tJKZbqSX8xs
 /hBb6EoZEREjxNe4Wqt4I9IthCubMqAnSbM8fz8ECugB2jgoiIkl9fy7KEojuiwG/UZEXCT/k
 InCQIK9rtRSez2BKnDQL9DbczFwMfyQpIUW2DHdIRjksYF9Qoct8r/1X0meq78LSXSR3LCAJX
 I2K38acxOTkrq836BmKV3Z4PHnxtO3Y1PNUWtKZYzek0zE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1738071212; x=1738676012; i=fiona.klute@gmx.de;
 bh=rjH4dzZbi44WUR4f+85j0FbrJBcaeN+wcdOitoHWLDE=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=kHBzI6e5IBrGe1lfAAZvpgCTXk4DUhYvOG7HRbvHrjvTpy0KAKwZQORNhr81PzZZ
 d0z8UVG9Kye1RoUlXUgi1A3clU24gVmzTaYQPKVCIuQNb6JPQPxVag1db5Pyl/TY7
 kCMSedCpjvEVcy7crXzr27YYwzDCNrgpZkOA794ueCrPQFjL3UY2+hw9dCW+ACd5l
 GXwCKhb1expNAc8FVrYdMslwh2oNelNqv9ifZyjQhopqPYWlyg3rHxsX1CeI+E1PT
 InevM6G4y1ZJtpTR2DmJch8thCiRt8R8qOlOB3Pp0tg5QUAFLoLkRKp2UQWEX6Cof
 9fNe8MVpz+rGCnSQrg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=kHBzI6e5
Subject: Re: [Buildroot] [PATCH v2 1/1] linux: make out-of-tree DTS work
 with newest kernels
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QW0gMjQuMTIuMjQgdW0gMTM6MjIgc2NocmllYiBFZGdhciBCb25ldDoKPiBIZWxsbyEKPgo+IE9u
IDIwMjQtMTItMTgsIFJvbWFpbiBOYW91ciB3cm90ZToKPj4gSGVsbG8gRWRnYXIsCj4+Cj4+IExl
IDE3LzEyLzIwMjQgw6AgMTA6NTUsIEVkZ2FyIEJvbmV0IGEgw6ljcml0wqA6Cj4+PiBTaW5jZSBM
aW51eCA2LjEyIChjb21taXQgZTdlMjk0MTMwMGQyLCAia2J1aWxkOiBzcGxpdCBkZXZpY2UgdHJl
ZSBidWlsZAo+Pj4gcnVsZXMgaW50byBzY3JpcHRzL01ha2VmaWxlLmR0YnMiKSwgdGhlIGtlcm5l
bCBidWlsZCBwcm9jZXNzIGRvZXMgbm90Cj4+PiBidWlsZCB0aGUgRFRCcyBmcm9tIHRoZSBzb3Vy
Y2UgZmlsZXMgbGlzdGVkIGluCj4+PiBCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9EVFNfUEFUSC5b
MV0gVGhpcyBpcyBiZWNhdXNlIGl0IGV4cGVjdHMgYWxsIHRoZQo+Pj4gRFRTIGZpbGVzIHRvIGxp
dmUgaW4gdmVuZG9yLXNwZWNpZmljIHN1YmRpcmVjdG9yaWVzIG9mCj4+PiBhcmNoLyRBUkNIL2Jv
b3QvZHRzLyAsIHdoZXJlYXMgQnVpbGRyb290IGRyb3BzIHRoZW0gaW4gdGhlIHRvcCBkdHMKPj4+
IGRpcmVjdG9yeS4KPj4KPj4gTWF5YmUgd2UgY291bGQgYWRkIHNvbWUgYWRkaXRpb25hbCBleHBs
YW5hdGlvbjoKPj4KPj4gQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fRFRTX1BBVEggd2FzIGludHJv
ZHVjZWQgaW4gQnVpbGRyb290IDIwMTIuMDggWzFdIGF0IHRoZQo+PiB0aW1lIHRoZSBrZXJuZWwg
ZGlkbid0IGhhdmUgYW55IHZlbmRvci1zcGVjaWZpYyBzdWJkaXJlY3RvcnkgaW4KPj4gYXJjaC8k
QVJDSC9ib290L2R0cy8uCj4+Cj4+IHZlbmRvci1zcGVjaWZpYyBzdWJkaXJlY3Rvcnkgd2FzIGlu
dHJvZHVjZWQgaW4ga2VybmVsIHYzLjE5IFsyXSBmb3IgQVJNNjQgYW5kIGluCj4+IGtlcm5lbCB2
Ni41IGZvciBBUk0gWzNdLiBOb3RlLCBvdGhlciBhcmNoIHRoYW4gQVJNIGFuZCBBUk02NCBkb2Vz
bid0IGFjdHVhbGx5Cj4+IHVzZSBhIHZlbmRvci1zcGVjaWZpYyBzdWJkaXJlY3RvcnkgKG5vdCBl
dmVuIHBvd2VycGMpLgo+Cj4gSSBoYWRuJ3Qgbm90aWNlZCB0aGF0IHRoaXMgdmFyaWVzIGFtb25n
IGFyY2hzLiBOb3cgdGhhdCBJIGxvb2sgYXQgaXQsIGl0Cj4gYXBwZWFycyBtaXBzIGFuZCByaXNj
diBhbHNvIHVzZSB2ZW5kb3Itc3BlY2lmaWMgc3ViZGlyZWN0b3JpZXMuCj4KPj4gWW91ciBjb21t
ZW50IGRvZXNuJ3Qgc2VlbXMgdG8gYXBwbHkgZm9yIG5vbiBBUk17LDY0fSBhcmNoOgo+PiAiVGhp
cyBpcyBiZWNhdXNlIGl0IGV4cGVjdHMgYWxsIHRoZSBEVFMgZmlsZXMgdG8gbGl2ZSBpbiB2ZW5k
b3Itc3BlY2lmaWMKPj4gc3ViZGlyZWN0b3JpZXMgb2YgYXJjaC8kQVJDSC9ib290L2R0cy8iCj4K
PiBJbmRlZWQsIGl0IGlzIGFyY2hpdGVjdHVyZS1kZXBlbmRlbnQuCj4KPj4gWzFdCj4+IGh0dHBz
Oi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2NvbW1pdC82OWZjNDk3ZGYw
YWU1MWJjYzhhMDY3Yzg0OTQ0N2FiZGViM2NiMmJlCj4+IFsyXQo+PiBodHRwczovL2dpdC5rZXJu
ZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9zdGFibGUvbGludXguZ2l0L2NvbW1pdC8/
aWQ9Y2E1YjM0MTAwYzU3MTY1OGU2MDVjNTU1NGFhYzM3NDY0OTU5MzMyNwo+PiBbM10KPj4gaHR0
cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvc3RhYmxlL2xpbnV4
LmdpdC9jb21taXQvP2lkPTcyNGJhNjc1MTUzMjA1NWRiNzU5OTJmYzZhZTIxYzNlMzIyZTk0YTcK
Pj4KPj4KPj4+Cj4+PiBGdWxmaWxsaW5nIHRoaXMga2VybmVsIGV4cGVjdGF0aW9uIHdvdWxkIHJl
cXVpcmUgYSBuZXcgY29uZmlndXJhdGlvbgo+Pj4gcGFyYW1ldGVyIGZvciB0aGUgbmFtZSBvZiB0
aGUgYXBwcm9wcmlhdGUgdmVuZG9yIHN1YmRpcmVjdG9yeS4gSXQgd291bGQKPj4+IGFsc28gcmVx
dWlyZSBjaGFuZ2luZyB0aGUgcmVsYXRpdmUgcGF0aHMgdG8gaW5jbHVkZWQgLmR0c2kgZmlsZXMu
Cj4+Pgo+Pj4gTGV0J3MgYWRkIGluc3RlYWQgYSBydWxlIHRvIHRoZSB0b3AgZHRzL01ha2VmaWxl
IGZvciBlYWNoIERUQiB3ZSB3YW50IHRvCj4+PiBidWlsZC4gVGhpcyBhdm9pZHMgYnJlYWtpbmcg
dXNlcidzIG91dC1vZi10cmVlIGNvbmZpZ3VyYXRpb25zLgo+Pj4KPj4+IFsxXSBodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvcGlwZXJtYWlsL2J1aWxkcm9vdC8yMDI0LU9jdG9iZXIvNzY1NDYz
Lmh0bWwKPj4KPj4gTm90ZTogWW9jdG8gZG9lc24ndCByZWx5IG9uIHRoZSBrZXJuZWwgYnVpbGQg
aW5mcmFzdHJ1Y3R1cmUgdG8gYnVpbGQgdXNlcgo+PiBwcm92aWRlZCBkZXZpY2V0cmVlIFs0XS4K
Pj4KPj4gTWF5YmUgd2Ugc2hvdWxkIGNvbnNpZGVyIGFkZGluZyBhIG5ldyBwYWNrYWdlIGluZnJh
c3RydWN0dXJlIGxpa2Uga2VybmVsLW1vZHVsZT8KPgo+IFRoaXMgc2VlbXMgbGlrZSBhbiBpbnRl
cmVzdGluZyBvcHRpb24uIEl0IGlzLCBob3dldmVyLCBiZXlvbmQgbXkKPiBjYXBhYmlsaXRpZXMu
CgpCaXQgbGF0ZSB0byB0aGUgcGFydHksIGJ1dDogSSBjdXJyZW50bHkgaGF2ZSBhIHBhY2thZ2Ug
aW4gYW4gZXh0ZXJuYWwKdHJlZSB0aGF0IHRha2VzIGEgbGlzdCBvZiAuZHRzLy5kdHNvIGZpbGVz
IGZyb20gY29uZmlnIGFuZCBjYWxscyBjcHAgJgpkdGMgdG8gYnVpbGQgLmR0Yi8uZHRibyBmaWxl
cywgd2l0aCBpbmNsdWRlIHBhdGhzIGludG8gdGhlIExpbnV4IGJ1aWxkCmRpciBhZGRlZC4gVGhl
IGJ1aWxkIGNvbW1hbmRzIGFyZSBuYXR1cmFsbHkgbW9kZWxlZCBvbiBob3cgdGhlIGtlcm5lbApi
dWlsZCBidWlsZHMgRFRCcywgYnV0IGl0IGRvZXNuJ3QgcmVseSBvbiB0aGUga2VybmVsIE1ha2Vm
aWxlcy4KCldvdWxkIHNvbWV0aGluZyBsaWtlIHRoYXQgYmUgaW50ZXJlc3RpbmcgZm9yIEJ1aWxk
cm9vdCwgd2hldGhlciBhcyBhCmdlbmVyaWMgRFRCIGJ1aWxkIHBhY2thZ2Ugb3IgaW5mcmFzdHJ1
Y3R1cmU/CgpCZXN0IHJlZ2FyZHMsCkZpb25hCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
