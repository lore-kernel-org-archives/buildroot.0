Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72C2EC52D7F
	for <buildroot@archiver.kernel.org>; Sat, 17 Aug 2024 10:55:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 013716060C;
	Sat, 17 Aug 2024 10:55:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8qqJWv_hzRPF; Sat, 17 Aug 2024 10:55:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7A6160625
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7A6160625;
	Sat, 17 Aug 2024 10:55:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 32E361BF57C
 for <buildroot@lists.busybox.net>; Sat, 17 Aug 2024 10:55:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 20CAD60631
 for <buildroot@lists.busybox.net>; Sat, 17 Aug 2024 10:55:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TbKyVArxmDdP for <buildroot@lists.busybox.net>;
 Sat, 17 Aug 2024 10:55:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=rgallaispou@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 909FF6060C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 909FF6060C
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 909FF6060C
 for <buildroot@buildroot.org>; Sat, 17 Aug 2024 10:55:52 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-428101fa30aso20323285e9.3
 for <buildroot@buildroot.org>; Sat, 17 Aug 2024 03:55:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723892150; x=1724496950;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ysxi4MmiMggiS0zCrgguKNTCEumL+3tpP50TlfIBu0Y=;
 b=iDvBllshD1ahDON7e8PLtVf+0GWcRNFJaK1sCeTBX4d+A5tTQSmV1mV6P1m74ZT3a+
 1yfDvNb6uQ+p8BwGEB9RV99J4mxFqqJe9fPjYi08JQ6qS/Zb6xB8m18PFyKmGyeaCnxy
 +re6/qQN3MofdTCte+Bc17DY+TgZn/3o2vg3oNKIKrWa6LisRKwJ1wYn8EumHZ8QCASG
 b/ym4G1PRiZHIAM5dufhCNtU46IF0OMNfHr9e4b/GCICe/V9jvUKoFL+zH5SNnE1Klmn
 TLtsvkfBhshPMlfVCcWEuf1lTv7B2i/81y559JcidVAoL4AR6hnU9+vO5pekh9L81f+N
 +Fzg==
X-Gm-Message-State: AOJu0YwLaFjtny8VA01CJpxS+GVyhYxlKwKC0Dupx0XPU8VWObGNiwf0
 jmrZ1Mud+MD6MWM+Pr0FDOb0tcBiVhn/57IJZXVOrAZWMDPFD8ji
X-Google-Smtp-Source: AGHT+IHXBLuC0vSFQAMwtyiR5nZffgR2m2NdsJRua6oVkVLb4uCA3bnaC8sMduH+6A+Vv7ukfy9gQQ==
X-Received: by 2002:a05:600c:4692:b0:425:7bbf:fd07 with SMTP id
 5b1f17b1804b1-429ed7856b4mr40474745e9.5.1723892149281; 
 Sat, 17 Aug 2024 03:55:49 -0700 (PDT)
Received: from ?IPV6:2001:861:3385:e20:6384:4cf:52c5:3194?
 ([2001:861:3385:e20:6384:4cf:52c5:3194])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429ded17cb3sm99717955e9.10.2024.08.17.03.55.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Aug 2024 03:55:48 -0700 (PDT)
Message-ID: <b9b52c88-a352-4ff2-856e-430cb65185ed@gmail.com>
Date: Sat, 17 Aug 2024 12:55:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?Q?Rapha=C3=ABl_Gallais-Pou?= <rgallaispou@gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240814-master-v1-0-7834f3deddcb@gmail.com>
 <20240814-master-v1-2-7834f3deddcb@gmail.com>
 <20240815105603.1a752184@windsurf>
Content-Language: en-US, fr
In-Reply-To: <20240815105603.1a752184@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723892150; x=1724496950; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Ysxi4MmiMggiS0zCrgguKNTCEumL+3tpP50TlfIBu0Y=;
 b=DzsNr5moW0CRQQfWKDVMGz58/pgKsiyc3lvmo9F+wAAQ0gZi/TVB2coVSz6ri8uBRU
 zETS94UPi1tkYmyv+6Jjwk+CWoVDR7ygoX5ooVRwoYNDV0gbswUKYONNfF4EKBusd5U6
 lShCIKOtYVOl8iygxLjqJgD8YEr9Xayu4fxSQSRMrtfj4JAu2RZxrKwMxeoNr62UWiPF
 Efnsaeq+VAP9ndFoReabLTxmMslFwKbD4UVq4+377CxTKSfqgb3BFGZs9RUFz5VAc5A2
 fHW1yK7A8RXx6JnaAhpCUmSqyLGdNFgeI/fId/xkS1E6Yto7/0ByviRJUGvrAIWofsPj
 ozTw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=DzsNr5mo
Subject: Re: [Buildroot] [PATCH RESEND 2/2] configs/stm32mp135f-dk: new
 defconfig
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
Cc: Bartosz Bilas <b.bilas@grinn-global.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Marleen Vos <marleen.vos@mind.be>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpMZSAxNS8wOC8yMDI0IMOgIDEwOjU2LCBUaG9tYXMgUGV0YXp6b25pIGEgw6ljcml0wqA6Cj4g
SGVsbG8gUmFwaGFlbCwKCkhpIFRob21hcywKCj4gCj4gT24gV2VkLCAxNCBBdWcgMjAyNCAyMDoz
NzowMyArMDIwMAo+IFJhcGhhZWwgR2FsbGFpcy1Qb3UgPHJnYWxsYWlzcG91QGdtYWlsLmNvbT4g
d3JvdGU6Cj4gCj4+IEFkZCBuZXcgZGVmY29uZmlnIGZvciBTVE1pY3JvZWxlY3Ryb25pY3MgYm9h
cmQgU1RNMzJNUDEzNUYtREsuCj4+Cj4+IFNUTTMyTVAxMzVGLURLIGZlYXR1cmVzIGNhbiBiZSBm
b3VuZCBoZXJlOgo+PiAgICBodHRwczovL3d3dy5zdC5jb20vZW4vZXZhbHVhdGlvbi10b29scy9z
dG0zMm1wMTM1Zi1kay5odG1sCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFJhcGhhZWwgR2FsbGFpcy1Q
b3UgPHJnYWxsYWlzcG91QGdtYWlsLmNvbT4KPiAKPiBUaGFua3MgZm9yIHRoZSByZXNlbmQsIGJ1
dCB0aGVyZSB3YXMgbm8gbmVlZCB0byByZXNlbmQ6IHlvdXIgcHJldmlvdXMKPiBwYXRjaCB3YXMg
c3RpbGwgaW4gb3VyIHF1ZXVlIG9mIHBhdGNoZXMgdG8gcmV2aWV3L21lcmdlLiBJIGhhdmUgYQo+
IG51bWJlciBvZiBjb21tZW50cyBiZWxvdy4KClNvcnJ5IGZvciB0aGUgaW5jb252ZW5pZW5jZS4g
SSBoYWQgbm8gbmV3cyBvZiB0aGUgcGF0Y2hzZXQgd2hpY2ggbGVkIG1lIAp0byByZXNlbmQgaXQu
IFRoYW5rcyBmb3IgdGFraW5nIHRoZSB0aW1lIHRvIHJldmlldyB0aGlzIG9uZSBhbmQgbWVyZ2Ug
CnRoZSBwcmV2aWV3LgoKPiAKPj4gLS0tCj4+ICAgLi4uL292ZXJsYXkvYm9vdC9leHRsaW51eC9l
eHRsaW51eC5jb25mICAgICAgICAgICAgfCAgNCArKwo+PiAgIGJvYXJkL3N0bWljcm9lbGVjdHJv
bmljcy9zdG0zMm1wMTM1Zi1kay9yZWFkbWUudHh0IHwgMzggKysrKysrKysrKysrKysKPj4gICBj
b25maWdzL3N0bTMybXAxMzVmX2RrX2RlZmNvbmZpZyAgICAgICAgICAgICAgICAgICB8IDU5ICsr
KysrKysrKysrKysrKysrKysrKysKPj4gICAzIGZpbGVzIGNoYW5nZWQsIDEwMSBpbnNlcnRpb25z
KCspCj4gCj4gRmlyc3Qgb2YgYWxsLCB5b3UgbmVlZCB0byBlbmFibGUgQlIyX0RPV05MT0FEX0ZP
UkNFX0NIRUNLX0hBU0hFUz15LAo+IHdoaWNoIHJlcXVpcmVzIGFkZGluZzoKPiAKPiBCUjJfR0xP
QkFMX1BBVENIX0RJUj0iYm9hcmQvc3RtaWNyb2VsZWN0cm9uaWNzL3N0bTMybXAxMzVmLWRrL3Bh
dGNoZXMvIgo+IAo+IGFuZCB0aGVuIHJ1biAuL3V0aWxzL2FkZC1jdXN0b20taGFzaGVzLCB3aGlj
aCB3aWxsIGF1dG9tYXRpY2FsbHkKPiBwb3B1bGF0ZSB0aGlzIGZvbGRlci4KCkZvciB0aGlzIG9u
ZSBJIHRoaW5rIHRoYXQgaXQgd2lsbCBiZSBiZXR0ZXIgdG8gc2V0IHRoZSBkaXJlY3RvcnkgYXMg
dGhlIApzYW1lIG9mIHRoZSBjb21tb24gZGlyZWN0b3J5LCBlZy4gCiJib2FyZC9zdG1pY3JvZWxl
Y3Ryb25pY3MvY29tbW9uL3N0bTMybXAxeHgvcGF0Y2hlcy8iLiBTbyB0aGF0IHRoZSAKdmVyc2lv
bnMgYmV0d2VlbiBURi1BL1UtQm9vdCwgdGhlIExpbnV4IGtlcm5lbCBhcyB3ZWxsIGFzIE9QLVRF
RSwgaWYgaXQgCmlzIGFjdGl2YXRlZCBpbiB0aGUgZnV0dXJlIGZvciB0aGUgb3RoZXIgcGxhdGZv
cm1zLCB3aWxsIGJlIHN5bmNlZCAKYmV0d2VlbiBhbGwgc3RtMzJtcDEqIHBsYXRmb3Jtcy4KCj4g
Cj4gCj4+IGRpZmYgLS1naXQgYS9jb25maWdzL3N0bTMybXAxMzVmX2RrX2RlZmNvbmZpZyBiL2Nv
bmZpZ3Mvc3RtMzJtcDEzNWZfZGtfZGVmY29uZmlnCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+
IGluZGV4IDAwMDAwMDAwMDAuLmNjMDFhMmJkNDAKPj4gLS0tIC9kZXYvbnVsbAo+PiArKysgYi9j
b25maWdzL3N0bTMybXAxMzVmX2RrX2RlZmNvbmZpZwo+PiBAQCAtMCwwICsxLDU5IEBACj4+ICsj
IEFyY2hpdGVjdHVyZQo+PiArQlIyX2FybT15Cj4+ICtCUjJfY29ydGV4X2E3PXkKPj4gKwo+PiAr
IyBMaW51eCBoZWFkZXJzIHNhbWUgYXMga2VybmVsLCBhIDYuOSBzZXJpZXMKPj4gK0JSMl9QQUNL
QUdFX0hPU1RfTElOVVhfSEVBREVSU19DVVNUT01fNl85PXkKPj4gKwo+PiArIyBTeXN0ZW0gY29u
ZmlndXJhdGlvbgo+PiArQlIyX1JPT1RGU19ERVZJQ0VfQ1JFQVRJT05fRFlOQU1JQ19NREVWPXkK
Pj4gK0JSMl9ST09URlNfT1ZFUkxBWT0iYm9hcmQvc3RtaWNyb2VsZWN0cm9uaWNzL3N0bTMybXAx
MzVmLWRrL292ZXJsYXkiCj4+ICtCUjJfUk9PVEZTX1BPU1RfSU1BR0VfU0NSSVBUPSJib2FyZC9z
dG1pY3JvZWxlY3Ryb25pY3MvY29tbW9uL3N0bTMybXAxeHgvcG9zdC1pbWFnZS5zaCIKPj4gKwo+
PiArIyBLZXJuZWwKPj4gK0JSMl9MSU5VWF9LRVJORUw9eQo+PiArQlIyX0xJTlVYX0tFUk5FTF9D
VVNUT01fVkVSU0lPTj15Cj4+ICtCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OX1ZBTFVF
PSI2LjkuOCIKPj4gK0JSMl9MSU5VWF9LRVJORUxfREVGQ09ORklHPSJtdWx0aV92NyIKPiAKPiBJ
IHNlZSBvbiBTVE0zMk1QMTU3LCB3ZSdyZSB1c2luZyBzb21lIGN1c3RvbSBrZXJuZWwgY29uZmln
dXJhdGlvbgo+IGZpbGVzLCB3aXRoIHByZXN1bWFibHkgYSBtb3JlICJvcHRpbWl6ZWQiIGNvbmZp
Z3VyYXRpb24gdGhhbiBtdWx0aV92Ny4KPiBTaG91bGQgd2UgZG8gdGhlIHNhbWUgaGVyZT8KCkVm
ZmVjdGl2ZWx5IHRoaXMgcmVkdWNlcyB0aGUgb3ZlcmFsbCBrZXJuZWwgc2l6ZS4gTXkgdGhvdWdo
dCBvbiB0aGlzIAp3b3VsZCBiZSB0byBzZXQgdGhlIGdlbmVyYWwgbXVsdGlfdjcga2VybmVsIGRl
ZmNvbmZpZyBvbiB0aGUgaW5pdGlhbCAKc3RtMzJtcDEzIHN1cHBvcnQsIGFuZCBmaW5lIHR1bmUg
YWZ0ZXIuIEJlY2F1c2UgdGhlcmUgaXMgbWFueSBoYXJkd2FyZSAKZGlmZmVyZW5jZXMgYmV0d2Vl
biBzdG0zMm1wMTUgYW5kIHN0bTMybXAxMyBwbGF0Zm9ybXMgKGZvciBleGFtcGxlIHRoZXJlIApp
cyBubyBhdWRpbyBqYWNrIGluIG15IGtub3dsZWRnZSksIEkgZmVlbCBsaWtlIHRoaXMgd291bGQg
dGFrZSBxdWl0ZSAKc29tZSB0aW1lIGZvciBtZSB0byBzb3J0IGV2ZXJ5IGRyaXZlcnMuCgpXaGF0
IGRvIHlvdSB0aGluayBhYm91dCB0aGlzIHByb2Nlc3MgPwoKPiAKPiBPciBtYXliZSB3ZSBzaG91
bGQgZXZlbiBoYXZlIGEgc2luZ2xlIGNvbW1vbiBrZXJuZWwgY29uZmlnIGZpbGUgZm9yIGFsbAo+
IFNUTTMyTVAxIHBsYXRmb3Jtcz8KClRoYXQgY291bGQgYWxzbyBiZSBhIGdvb2QgaWRlYSBvbiB0
aGUgbWlkIHRlcm0uCgo+IAo+PiArQlIyX0xJTlVYX0tFUk5FTF9EVFNfU1VQUE9SVD15Cj4+ICtC
UjJfTElOVVhfS0VSTkVMX0lOVFJFRV9EVFNfTkFNRT0ic3Qvc3RtMzJtcDEzNWYtZGsiCj4+ICtC
UjJfTElOVVhfS0VSTkVMX0lOU1RBTExfVEFSR0VUPXkKPj4gKwo+PiArIyBGaWxlc3lzdGVtCj4+
ICtCUjJfTElOVVhfS0VSTkVMX05FRURTX0hPU1RfT1BFTlNTTD15Cj4gCj4gUGxlYXNlIGdyb3Vw
IHRoaXMgd2l0aCB0aGUgTGludXgga2VybmVsIG9wdGlvbnMgYWJvdmUsIHRoaXMgaXMgbm90Cj4g
ImZpbGVzeXN0ZW0gcmVsYXRlZCIuCgpBY2suCgo+IAo+PiArQlIyX1BBQ0tBR0VfT1BURUVfQ0xJ
RU5UPXkKPj4gK0JSMl9UQVJHRVRfUk9PVEZTX0VYVDI9eQo+PiArQlIyX1RBUkdFVF9ST09URlNf
RVhUMl80PXkKPj4gK0JSMl9UQVJHRVRfUk9PVEZTX0VYVDJfU0laRT0iMTIwTSIKPj4gKyMgQlIy
X1RBUkdFVF9ST09URlNfVEFSIGlzIG5vdCBzZXQKPj4gKwo+PiArIyBCb290bG9hZGVycwo+PiAr
QlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FSRT15Cj4+ICtCUjJfVEFSR0VUX0FSTV9UUlVT
VEVEX0ZJUk1XQVJFX0NVU1RPTV9WRVJTSU9OPXkKPj4gK0JSMl9UQVJHRVRfQVJNX1RSVVNURURf
RklSTVdBUkVfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9InYyLjkiCj4+ICtCUjJfVEFSR0VUX0FSTV9U
UlVTVEVEX0ZJUk1XQVJFX1BMQVRGT1JNPSJzdG0zMm1wMSIKPj4gK0JSMl9UQVJHRVRfQVJNX1RS
VVNURURfRklSTVdBUkVfRklQPXkKPj4gK0JSMl9UQVJHRVRfQVJNX1RSVVNURURfRklSTVdBUkVf
QkwzMT15Cj4+ICtCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFX0JMMzJfT1BURUU9eQo+
PiArQlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FSRV9VQk9PVF9BU19CTDMzPXkKPj4gK0JS
Ml9UQVJHRVRfQVJNX1RSVVNURURfRklSTVdBUkVfVUJPT1RfQkwzM19JTUFHRT0idS1ib290LW5v
ZHRiLmJpbiIKPj4gK0JSMl9UQVJHRVRfQVJNX1RSVVNURURfRklSTVdBUkVfQURESVRJT05BTF9W
QVJJQUJMRVM9IlNUTTMyTVBfU0RNTUM9MSBEVEJfRklMRV9OQU1FPXN0bTMybXAxMzVmLWRrLmR0
YiBFPTAgQkwzM19DRkc9JChCSU5BUklFU19ESVIpL3UtYm9vdC5kdGIiCj4+ICtCUjJfVEFSR0VU
X0FSTV9UUlVTVEVEX0ZJUk1XQVJFX0lNQUdFUz0iZmlwLmJpbiAqLnN0bTMyIgo+PiArQlIyX1RB
UkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FSRV9ORUVEU19EVEM9eQo+PiArQlIyX1RBUkdFVF9PUFRF
RV9PUz15Cj4gCj4gUGxlYXNlIHVzZSB0aGUgImN1c3RvbSIgdmVyc2lvbiBtZWNoYW5pc20gdG8g
c3BlY2lmeSB0aGUgZXhhY3QgdmVyc2lvbgo+IG9mIE9QLVRFRSB0byBiZSB1c2VkLCBsaWtlIHlv
dSBkaWQgZm9yIFRGLUEsIExpbnV4IGFuZCBVLUJvb3QuCgpBY2ssIGZvcmdvdCBhYm91dCB0aGF0
IG9uZS4gSSBzYXcgdGhhdCB0aGVyZSB3YXMgbm8gImN1c3RvbSB2ZXJzaW9uIiAKb3B0aW9uLCBs
aWtlIHRoZXJlIGlzIGZvciBVLUJvb3QgYW5kIHRoZSBLZXJuZWwuIEFuZCBncmVwaW5nIHRocm91
Z2ggdGhlIApvdGhlciBkZWZjb25maWcgdGhlcmUgaXMgbm8gaGFyZGNvZGVkIHZlcnNpb25zLiBN
YXliZSB0aGlzIGNhbiBiZSBhIGlkZWEgCmZvciB0aGUgZnV0dXJlLiBGb3Igbm93IEkgd2lsbCBz
ZXQgYSBjdXN0b20gdGFyYmFsbCBwb2ludGluZyB0byB0aGUgCm9mZmljaWFsIDQuMy4wIHRhcmJh
bGwuIFdvdWxkIHRoaXMgYmUgb2theSA/CgpjZi4gaHR0cHM6Ly9naXRodWIuY29tL09QLVRFRS9v
cHRlZV9vcy9hcmNoaXZlL3JlZnMvdGFncy80LjMuMC50YXIuZ3oKCj4gCj4+ICtCUjJfVEFSR0VU
X09QVEVFX09TX1BMQVRGT1JNPSJzdG0zMm1wMSIKPj4gK0JSMl9UQVJHRVRfT1BURUVfT1NfUExB
VEZPUk1fRkxBVk9SPSIxMzVGX0RLIgo+PiArQlIyX1RBUkdFVF9VQk9PVD15Cj4+ICtCUjJfVEFS
R0VUX1VCT09UX0JVSUxEX1NZU1RFTV9LQ09ORklHPXkKPj4gK0JSMl9UQVJHRVRfVUJPT1RfQ1VT
VE9NX1ZFUlNJT049eQo+PiArQlIyX1RBUkdFVF9VQk9PVF9DVVNUT01fVkVSU0lPTl9WQUxVRT0i
MjAyNC4wNyIKPj4gK0JSMl9UQVJHRVRfVUJPT1RfQk9BUkRfREVGQ09ORklHPSJzdG0zMm1wMTMi
Cj4+ICtCUjJfVEFSR0VUX1VCT09UX05FRURTX1BZTElCRkRUPXkKPj4gKyMgQlIyX1RBUkdFVF9V
Qk9PVF9GT1JNQVRfQklOIGlzIG5vdCBzZXQKPj4gK0JSMl9UQVJHRVRfVUJPT1RfRk9STUFUX0NV
U1RPTT15Cj4+ICtCUjJfVEFSR0VUX1VCT09UX0ZPUk1BVF9DVVNUT01fTkFNRT0idS1ib290LW5v
ZHRiLmJpbiB1LWJvb3QuZHRiIgo+PiArQlIyX1RBUkdFVF9VQk9PVF9DVVNUT01fTUFLRU9QVFM9
IkRFVklDRV9UUkVFPXN0bTMybXAxMzVmLWRrIgo+PiArCj4+ICsjIEFkZGl0aW9uYWwgdG9vbHMK
Pj4gK0JSMl9QQUNLQUdFX0hPU1RfQk1BUF9UT09MUz15Cj4gCj4gUGxlYXNlIGRyb3AsIHdlIGRv
bid0IGVuYWJsZSBibWFwLXRvb2xzIGluIG91ciBkZWZjb25maWdzLCB3ZSBsZWF2ZQo+IHRoYXQg
Y2hvaWNlIHVwIHRvIHRoZSB1c2VyLgoKQWNrLiBNaW5kIHRoYXQgSSB3aWxsIGxlYXZlIHRoZSBC
UjJfUEFDS0FHRV9IT1NUX0dFTklNQUdFPXkgb3B0aW9uIHNpbmNlIAppdCBpcyBtYW5kYXRvcnkg
Zm9yIGJ1aWxkaW5nIHRoZSBpbWFnZS4KClRoYW5rcyBhZ2FpbiwKClJlZ2FyZHMsClJhcGhhw6ts
Cgo+IAo+IFRoYW5rcyEKPiAKPiBUaG9tYXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
