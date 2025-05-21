Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFCBFC54E65
	for <buildroot@archiver.kernel.org>; Wed, 21 May 2025 08:41:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7337B61150;
	Wed, 21 May 2025 08:41:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GdokgjCTUEwc; Wed, 21 May 2025 08:41:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A603608EB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A603608EB;
	Wed, 21 May 2025 08:41:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 92BE81BF
 for <buildroot@buildroot.org>; Wed, 21 May 2025 08:41:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8FD3380DB9
 for <buildroot@buildroot.org>; Wed, 21 May 2025 08:41:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3ZpdpKvOTaDP for <buildroot@buildroot.org>;
 Wed, 21 May 2025 08:41:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 70DED80D8D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70DED80D8D
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 70DED80D8D
 for <buildroot@buildroot.org>; Wed, 21 May 2025 08:41:11 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.117.134]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M26vB-1uFC2O0rHN-004QvR; Wed, 21
 May 2025 10:41:09 +0200
Message-ID: <66a629a3-2e47-4c74-971d-504f88ee2d43@gmx.de>
Date: Wed, 21 May 2025 10:41:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>,
 Marcus Hoffmann <buildroot@bubu1.eu>, buildroot@buildroot.org
References: <20250118133740.4001841-1-fiona.klute@gmx.de>
 <8eccd976-c4c1-4fdc-a3c5-340b4a7f979b@gmx.de>
 <6521217e-0d5a-42ae-a315-c533f0f66909@bubu1.eu>
 <031308f4-35e5-451f-8a6d-1e826ad69b75@gmx.de>
 <53e16a6f-296f-46f6-a66c-4f8f67e7b6b0@green-communications.fr>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <53e16a6f-296f-46f6-a66c-4f8f67e7b6b0@green-communications.fr>
X-Provags-ID: V03:K1:lQrtogIjUoTUZsHkAB0PbgV5HIjCU1EfL8i3XratUuXrr+NsSvz
 5aTHrgr8RpMnUomd7wvUG396QZUlYncudpFtb+o3SqsVnMYg61EbVBxkzj7CXL8RStxRTxO
 KWUFYJ+GeE4rQyszru7JureKO3Vdye2gZPKpEsx1EhMELotXE4dalMGoEUEA45jD7kI0k/L
 Do0UgzZO0Pz14hvEQ58EQ==
UI-OutboundReport: notjunk:1;M01:P0:zmjeHlykZa0=;p63GA8PjvbofdiyHdyBI9/3ahCe
 8ACv56Sd0jWggrf3igNTEvXuC/AaMaNUJsGI5LaBuDJK6Ec8hYgTrxgIb4m0ywADX+ik5xCJ0
 t0rOTkGT/4q+BbrmRH/VvOAb1zvvPsnpze0Ahe3wiOyuDgljrl24xyixyT1srJ4mDPPrwLWOI
 oE3nEejNXK61gpmi4fEpauwi5+1XffWedrVPE6reF8xNDKLrlPBueLH44UF0oiHIgQtsWRqe9
 QlTNItNCvgTvHNGs+O0HVPXGlo8sfucrQBf1FL+CzJ7sWt/07o4O8tfrLL3TaaDwydtLVBWpk
 Gw6VJb13TgvR0iw1O8hkQcrrl+wNkFhqGcUbQnQywkYGSfkH/0yMvYEi78HP6WUSp5CWEfR8j
 DvwjWRoOd+RWJHJmGXmUEwkZm+oVk1wSwTTm7n92qCkYkk1bB3v8X5HOSx/4m1ToDJ3mbHTn1
 7vVuBtz9O5fiNltCskTA3Clx2RC839SiisfJASfAEqZzsdFIOroVjmj6Z39B4qP0y6IQ+aq20
 r0loej/hyxiNrQmj0Vpz+0DbRUHWJfnPl0kPzfdRcrWvPLpaQpE6UnecvZwXtfsBgVu6/Mu2v
 PrllVRNnztWcAAoYXi4rmC/R8BWybV87jV8/MWxB39jfDApvPJufCFw/KnMxj2HAOXAGEixIT
 mxM6cPLOon5RUMnrDTLBuutuOIrH465ZlyGx+19bz3r5MYCEn+3LDJmcIXSHgt+bmDfLsDqsJ
 nuhPOgMyQTe2qp086336vMywYQBhh2JAADUKHqsIMyQssaZrJ9jBdfal/1Ty/V1bc4xMSl1R1
 P3IvSeKEWIa1WfLAom/EldGWDFmKwwqYdFQrQhEdaUpqfyjU3Y7BQLH7CTHuCJR/hJQqmvcvb
 bkLSXYQKz2yFylYIzdLLFdXAPg2OuJYjSBEvfBEj52L5vXacCz+x0ZoUp6XPxE8dv0r1Pmmjs
 wD3MNyOyxVpWYLjLVqfuVq12XvLMEjftnLxSLbvlAAVgNBdIPDuMNNTKbB2S6z5P/yTowE2s+
 GAxXRrj/+F756ymGmIDZnZM6lELs8LIEu2xbhBRHvjJYvFx3qoY2xjhRGZHu2hGk4RGWN+8zP
 cTm/3vxw2xW3DlAAp5lLuG5c1xmJ+GqbKrwbp0grbqCMXtzFkZ4yLu8K6Km8W+DH+gL7oSiqZ
 I3MPgYTjll3ljHjwdIR+vtxysUKQXQZwpW9fXqELmc8fMQw8ruyIvSvpPBulYQsPblXNwBQbv
 0F/oCE6rz8hJw4eeL5qJVhsCWO0rdiOQxf01FUGdfFIG3mH9YdWcCSVDvhNUBs54SGnOSJOPs
 FEOpSE4rQCOM/y02hsbxc6djhxTvmDIoDbF7n3asb8oQLQfpkRhNc001BCWw61L4Knm6hsA00
 /xLGYV6TpvQN/IMP3vtTJrCkM7IL18bcJ3SIQWL+GaT7j7e9WZojiUgjzjyR1tVPF8RwfL5e1
 RxyZVK70wHvgULZ7Ah8xq7kbcDBYex74PXI3S0a1h1RsKO+W8P2lbru0vC9G97f4rgHeP3WZL
 zuAq0aeqIbkuu2+JNOUqfQZMcPuO3D+a8vuFB1/lrMRguDthkLn/nYnbH/aAXbY2MvUMqiXPd
 nSeEQFKgw7V6LXS92eZ92do09eGHos9E3mASlCHwvn5h+ZmtZCpgotExMrJJu81CL3gUdmO0B
 pMhxOGO2LK5lyfQ6yNHrtMTQhKI/9mz1Jc0lXbTtnevyLtyJpOZdYLMil/S43wsz3iyhsy6Ps
 pv5zScZY3TmLMvypoA6MN44fdVLgTlIIgkr9Ch3rNHwPqS6Q1Cc8oimC+urxkdgs4uSly0mpr
 yBCpx0l/5l8/jWRCyDFMynPi+gZfma0e8TKMnsdXJ3vx+pCogH4CQ2ZVzLL1GsJPUhJEHjV6z
 ETz81cPB/3llMl1aADRcgq0obd5tbvkY/PziZ4nB2Mfv/9sJLZWRlgHZ/3mdUJd5xVLv+RYKD
 gQfnPpkqp4ZvsV445VQABLDN90D1S5ST7ERH1Ldu4B47LM+45G8q1ToNNPVmALpvO51TMAI6f
 jq9t0zHoRTvxcNZsuI59DBcD9H2fYYnEW2/SCkygPmadZsIcyhHTN3rM89MhZfCq/ZNGFm90+
 KxyUWI2i2I/XdTTcacw+9+LpkTcNc8iDV6Jazl6+r/65uMYCBD+/Sz+CJN+UG8yDQWjDVQiI2
 4hWic18BC+e7UkyGpBnC231bigyZw+pRZoubScuvmmYW1Omm2NxB7Q266q+5qxXruRgY/KncS
 vdL7hfFlD56qoYUMWofQpLAxaQya11KosFwQ9frabyJI6ydCO6aoU8WgP5h7diiV3oOr2k+ua
 KcbCSMohzS0MSrq985s2DuiIm2dYhuZXsNAVkj6TaLhzcENSaad8/u2izxyS7KugEa5BWJ7Z+
 CasJIOKFtUEJtUR1+qMBQbEHlzPerfi4ceXzBujv1hNMmsUe1PcC1fWBgSsvcT4/wwwE46cl2
 7R/WK3U+MsYDGXDP6x/gEm5P2yx6aYFMK2kIYfl7PbD+s5OJwwSzV3rBXn6H0qBFwOtLD23z4
 7VclX5H7ojCuDtSiU6U1GjbJx4AUH/6WyJPmig4fzJd5nQ2ypzHyyOILG8M0mNeyujApKjQf8
 2AeMJPMYpfIrkhake++mhsJaTd9WAvQgGAyQt/0ssThvCqHuxUFR2MV1SEHOkMgG9Y8B3CJkJ
 uA1Mn59bY/BBqMcY7noEeaoB8HkW5/kBxJNxAUA/Ui6Uu+/KuJ1Ihp7dsBXoXVV/HEn+Q7tta
 WTyn5xfW7na0/ij/d0FIqGsTFcm5MeQfCKHC5OB1wIZBpb59L82Ax9eWQjvzkZ4/1kzNfLdAA
 qdTVAIpOYDcIiziT2AjyXsv0YtXPJ8hU7puSci9wrHJ6JAwDWtmdUwIYOYEHeIXQCotcYgZwR
 jyZMEzqDtgLylWPAsMhnGJru8oq9xoNjUBqpff//iZnELYRWgea1068T3D7TjzQwAuPaeuXg9
 dfmLnrkH6xdiq5enrTii/WQfmNGcRk+GRCoxK2tT3xafg2XED5Iau/5w5Cqo9n/K6ie79cwWs
 nOwRtyqn4bnyPcqNSLh84aREfbIiDAlHylDQRaFPa25VM3m5WVGqXEIC3X2jhCpknX0I3eLxc
 nw+nAhVDTmRFjfw0NRax/E42uH3HV6yDK7
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1747816869; x=1748421669; i=fiona.klute@gmx.de;
 bh=ej0THauS78PDB9mKwC2apCCKS7k9RDhgkOmCy2953J8=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=iywLD5sXqv5u9fGSF7vpdzBo+4Vs0/jVrk2+dgyEN/2/1H14LbtZBkiU5zBwWMuF
 8ioJmvaN+DDMLey5/5YnHOK3WQMZehwuZYKOTrohiZ26FIhASlL1oa7cT/uisY+lB
 8z1kMFS2mvZhj4J5T4/qPtMKeU8cBV2XUkWvJjP++c/ASrNisnPAYIoiNOQVifkTg
 gRpTSEpNfj2L8kqHE00fOP7xByoKPfivzmSeEovEBKX0J/ZWWT7+8B/1xN2XJSojT
 3e/VM43fWFBAmJmkdtT6IcVgOh+LwBPWqhR3tZaPKXeUx2scwKHdcwZWLySBhUcyN
 WkEzRVKdGRbwjx84qQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=iywLD5sX
Subject: Re: [Buildroot] [PATCH 1/1] package/wireless-regdb: sysv init
 script to set regdomain
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

QW0gMjAuMDUuMjUgdW0gMTY6NTAgc2NocmllYiBOaWNvbGFzIENhdmFsbGFyaToKPiBPbiAyMC8w
NS8yMDI1IDEyOjM0LCBGaW9uYSBLbHV0ZSB2aWEgYnVpbGRyb290IHdyb3RlOgo+PiBIaSBNYXJj
dXMhCj4+Cj4+IEFtIDE5LjA1LjI1IHVtIDIxOjAzIHNjaHJpZWIgTWFyY3VzIEhvZmZtYW5uIHZp
YSBidWlsZHJvb3Q6Cj4+PiBIaSBGaW9uYSwKPj4+Cj4+PiBPbiAxOS4wNS4yNSAxNzozNywgRmlv
bmEgS2x1dGUgdmlhIGJ1aWxkcm9vdCB3cm90ZToKPj4+PiBIaSBldmVyeW9uZSwKPj4+Pgo+Pj4+
IGp1c3Qgd2FudCB0byBjaGVjayBpZiB0aGVyZSdzIGFueSBpbnRlcmVzdCBpbiBtZXJnaW5nIHRo
aXMuIEl0J3MgCj4+Pj4gdHJpdmlhbCBlbm91Z2ggdG8gbWFpbnRhaW4gaW4gYW4gZXh0ZXJuYWwg
dHJlZSBvdGhlcndpc2UsIEkganVzdCAKPj4+PiBmaWd1cmVkIGl0IG1pZ2h0IGJlIHVzZWZ1bCBm
b3IgYW55b25lIHdobydzIGFsc28gdXNpbmcgYSB3aXJlbGVzcyAKPj4+PiBzZXR1cCB0aGF0IGRv
ZXNuJ3QgaGF2ZSBhIGJ1aWx0LWluIHdheSB0byBzZXQgdGhlIHJlZ3VsYXRvcnkgZG9tYWluIAo+
Pj4+IChuYW1lbHksIE5ldHdvcmtNYW5hZ2VyKS4KPj4+Cj4+PiBXZSBhbHNvIHVzZSBOZXR3b3Jr
TWFuYWdlciBidXQgc3lzdGVtZCBhcyBvdXIgaW5pdCBzeXN0ZW0sIHNvIEkgZW5kZWQgCj4+PiB1
cCB3cml0aW5nIGEgdWRldiBydWxlIHRoYXQgY2FsbHMgYSBzY3JpcHQsIHRoYXQgc2V0cyB0aGUg
cmVndWxhdG9yeSAKPj4+IGRvbWFpbi4gV291bGQgYmUgbmljZSB0byBqdXN0IHVuaXZlcnNhbGx5
IGhhdmUgYSBzb2x1dGlvbiBmb3IgdGhpcywgCj4+PiBidXQgSSBndWVzcyBoYXZpbmcgYSBTeXNW
IGluaXRzY3JpcHQgaXMgYmV0dGVyIHRoYW4gbm90IGhhdmluZyBpdD8KPj4gTmV0d29ya01hbmFn
ZXIgcmVxdWlyZXMgdWRldiAoZXVkZXYpIGV2ZW4gd2l0aG91dCBzeXN0ZW1kLCBzbyBhIHVkZXYg
Cj4+IHJ1bGUgd291bGQgYWN0dWFsbHkgd29yayBmb3IgbWUsIHRvbywgYXMgbG9uZyBhcyB0aGUg
c2NyaXB0IGlzIAo+PiBjb25maWd1cmFibGUuIEkgaGFkbid0IHJlYWxseSB0aG91Z2h0IGFib3V0
IHRoYXQgYmVjYXVzZSBJJ20gc2V0dGluZyAKPj4gdGhlIGdsb2JhbCByZWd1bGF0b3J5IGRvbWFp
biwgbm90IGEgZGV2aWNlIG9uZSwgYnV0IGZvciBtb3N0IGVtYmVkZGVkIAo+PiBzeXN0ZW1zICJz
ZXQgZHVyaW5nIGJvb3QiIGFuZCAic2V0IHdoZW4gYSB3aWZpIGRldmljZSBpcyBhZGRlZCIgd2ls
bCAKPj4gYmUgY2xvc2UgZW5vdWdoIHRoYXQgdGhlIGRpZmZlcmVuY2UgZG9lc24ndCBtYXR0ZXIu
Cj4gCj4gSnVzdCBteSB0d28gY2VudHM6Cj4gCj4gLSBpdyByZWcgc2V0IChha2EgdXNlciByZWd1
bGF0b3J5IGhpbnQpIG1heSBiZSBpZ25vcmVkIG9yIG92ZXJyaWRkZW4gYnkgCj4gdGhlIGtlcm5l
bCBpZiBhIHdpcmVsZXNzIGludGVyZmFjZSBpcyBhZGRlZC4gVHlwaWNhbGx5LCBzb21lIGhhcmR3
YXJlIAo+IGVlcHJvbSBtYXkgaW5kaWNhdGUgdGhlIGNvdW50cnkgaW4gd2hpY2ggaXQgaXMgY2Vy
dGlmaWVkIGFuZCB0aGUga2VybmVsIAo+IHdpbGwgdHJ1c3QgdGhlIGRyaXZlciBoaW50IG1vcmUg
dGhhbiB0aGUgdXNlciBoaW50LiBEZXBlbmRpbmcgb24gaWYgdGhlIAo+IHVzZXIgaGludCBpcyBz
ZW50IGlzIHNlbnQgYmVmb3JlIG9yIGFmdGVyIHRoZSBkZXZpY2UgaXMgcHJvYmVkLCB0aGUgCj4g
a2VybmVsIG1heSBlaXRoZXIgdHJ1c3Qgb25seSB0aGUgZHJpdmVyLCBvciBzZXQgdGhlIHJlZ3Vs
YXRpb24gdG8gdGhlIAo+IGludGVyc2VjdGlvbiBvZiB0aGUgZHJpdmVyIGFuZCB1c2VyIGhpbnQu
Cj4gCj4gLSBpdyByZWcgc2V0IFhYIGlzIGFjdHVhbGx5IGFzeW5jaHJvbm91cy4gSXQgd2lsbCBy
ZXR1cm4gYmVmb3JlIHRoZSBoaW50IAo+IGhhcyBiZWVuIGFwcGxpZWQgb3IgaWdub3JlZC4gVGhl
IGtlcm5lbCBtYXkgaGF2ZSB0byBsb2FkIHRoZSByZWd1bGF0b3J5IAo+IGRhdGFiYXNlIGZyb20g
dGhlIHJvb3Rmcywgd2hpY2ggZ29lcyB0aHJvdWdoIHVkZXYgd2hpY2ggbWlnaHQgYmUgYWxyZWFk
eSAKPiBidXN5IGVub3VnaCwgY2F1c2luZyBmdXJ0aGVyIGRlbGF5LsKgIElmIHNvbWVvbmUgdHJp
ZXMgdG8gY29uZmlndXJlIGUuZy4gCj4gYW4gYWNjZXNzIHBvaW50IG9uIDUgR0h6IHF1aWNrbHkg
ZW5vdWdoIGJlZm9yZSB0aGUgcmVndWxhdG9yeSBoaW50IHRoYXQgCj4gYWxsb3dzIGl0IGlzIGxv
YWRlZCwgaXQgd2lsbCBmYWlsLiBUaGUgaW5pdCBzY3JpcHQgbWF5IGhhdmUgdG8gd2FpdCB0aGF0
IAo+IHRoZSBoaW50IGhhcyBiZWVuIGFwcGxpZWQgYmVmb3JlIGNvbnRpbnVpbmcuIFdpdGggdWRl
diwgaXQgd2lsbCBiZSBtb3JlIAo+IGRpZmZpY3VsdCBzaW5jZSB1ZGV2IGhvb2tzIHdpbGwgYmUg
a2lsbGVkIGlmIHRoZXkgdGFrZSB0b28gbXVjaCB0aW1lLgoKSSB3b25kZXIgaG93IG11Y2ggb2Yg
YW4gaXNzdWUgdGhhdCBpcyBpbiBwcmFjdGljZSwgYmVjYXVzZSBOTSBzaG91bGQgCnJldHJ5IGZh
aWxpbmcgYWN0aXZhdGlvbiBhbnl3YXkuIEJ1dCBJIGFncmVlIHRoYXQgaWYgaXQgaXMgdGhlIGlu
aXQgCnNjcmlwdCBpcyBiZXR0ZXIgYmVjYXVzZSB0aGUgaW5pdCBzeXN0ZW0gcHJvdmlkZXMgZml4
ZWQgb3JkZXJpbmcsIHRoZSAKY3VycmVudCBTMzUgdG8gTk0gYXQgUzQ1IHNlZW1zIHRvIHdvcmsg
d2VsbCB3aXRob3V0IGFueSBleHBsaWNpdCB3YWl0IAooYXQgbGVhc3Qgb24gbXkgc3lzdGVtcyku
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
