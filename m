Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D0B606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 09:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=FiLoKkhk
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4BF54092B;
	Fri, 23 Oct 2026 09:46:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id okO9WHVvWXLX; Fri, 23 Oct 2026 09:46:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D9B7240761
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792748787;
	b=fXPVE52ykPq3/BYcTRsROXbTeFslnh6yJM0e+WxT0xvWf+6DI3GTbXpSei7BoEuVK5WR
	 g6V81OPjTtwxvMF47hEdo70vWnmqtVqPnlQbmGUJqWNWjHmxClRR7MWZGuR+s85MCnyRn
	 yv85lsc7P87qxh7hM2uQ1TbC+NMd2OPOesltrhY2bZALL+mLF8VDl+4KSi0Iqff6vBK9T
	 4YbPCUkqHUDTmEwnjgZ4CyzLuCntCGH92y0YKQaEpfLDeMhXPvJmWQph4lbgFbB4+a6LZ
	 UUj9uCAI8UJ/8nulM9sGO9bWWJxzMWXWVVyjuk5tpMMTnzfesiHQgmnIzb7gHhPYdUw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792748787;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Message-ID:Date:MIME-Version:User-Agent:To:Cc:
	 References:Content-Language:In-Reply-To:X-Last-TLS-Session-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=A8pNYWgl1MnO8X8u5ZIZ75lFUqc/jqokcgD5Npx42pY=;
	b=aZOVnif/8p8Q8aj7Jtocts1vGpxmg1r+W+1we5zljfEP13ZbSz4kswPlcDoP5dVMD0as
	 wQVw8RbbYaR3xeeW1WmbIUDJ6fQVyDd+nEe0hN/1bmU1/PMbSzwGNdku5Ttf2+IjXUUXY
	 zTL+Gu0376oZh96UqXbG20mASchGXA6Tv35BvPVWk6WtxtCSP4W6k6rakEv++810i26IP
	 VQMcNZZXsvBmUs1AeptD4iSav3bhndq0tTedBqSAdvyk1ObZ0mMmcZHqchA+r0Vbvng4m
	 pgMy0LGEvclmo75VdmjlpAPUhZKTigUV++kxJgXgxS/UiosClfXbJroBk6cCpKg7BdQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792748786;
	bh=A8pNYWgl1MnO8X8u5ZIZ75lFUqc/jqokcgD5Npx42pY=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=FiLoKkhk2oiVqA20d4BG6XSlU954luyobSFKzGI4DT2aAkCFeg8AFWV9Y/0dYetKn
	 PM6vrYyYeZCQLf181JMUA5//f6TXkINPuSMekyGCvoFf46boqOq+CNnqugoKmcbMLA
	 TI47V3Z+lCl9yGXyjFJ06q45fYTrQBEqBpzh/Z3IGYFDPNBsCxO1dhrw1WsaBZXt2N
	 VWNvOnW3D04zy/snwN58gt2c4OueOZZuElNQTxzT2cCiqA7oyDmIIKYqxLWcGphX1o
	 I1/Lods5E9HedibsBtfuxgmFta94r8oomzb43InfGvLXn8Okr+7rynu8pa4RMIVYTg
	 x/R8d8tHCBoKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9B7240761;
	Fri, 23 Oct 2026 09:46:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3746B3C1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 09:46:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C80860648
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 09:46:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YFXRVM2_4uhT for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 09:46:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 718B66062A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792748784;
 b=lAr6XlxFYxPwczsQzk0qGECgufc2LuSECw6uWUUsGy+itsi5/nY0mXj8m9CHTGtTOqfl
 ix2K1GL299ZmbqJYVKvd0DdPJScMVbqkoL6JE+V9vkmpT3SXYkbykA1K9CU+zijEa71XL
 Oez6PqY5pF8uoDIGHOHnHxNko2bvNKoRlQ6pL9Z1ybtADckoEjNOHH/AtW7u6MtCmqT8x
 HsHkFhY0Fm0bgVpLEIsfTKTnGhL676hGvUGx3vwxP1T+gc6bUNQArkV+J+ZEWGo79XEF+
 p6WZPPlKVVqfzXQQGl8yLj5/YOugYz/S12U86665roZf/Qk5BivC06BqPJ7FwamNJSQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792748784;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 X-Last-TLS-Session-Version;
 bh=jSheyN8wVBQdE/fghhrep0Xwna48EZLPWDNSKc/Hnew=;
 b=Hu8FbEf+MXcrirlNXTJZxGYnz9i7vqOJimLe/UClrfmn+z+mJzE4wnHJwl+6JFeLSujw
 vr01ufIy9frGHYoXBxgAmwenpT1w2mYf7TfgArrZIQ9NXp1QnoQyu2wUM0C5PZ4hsc6ag
 KGVLdFIGjluAKctvki6bTu93cQDrslq5yAIQoOmDE/zWgLWIf7EMYGhNZDyfAPiu/Gv3o
 YwG/WKykl65I6lh7FtT4OFI9IVBjLVczuscMygLSgbh/IbPUI+x/A9qNft7OvV7JzejzW
 ofymB2QVhOBiDsRl9D7ACpGOPbx5o6VLx4zJ+fCsdN2csTLJglQt++ZENgYoOjw1hEw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=l7KjE9k+; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 718B66062A
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 09:46:23 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 1ED8DC6344F;
 Fri, 23 Oct 2026 09:47:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5D6DB60398;
 Fri, 23 Oct 2026 09:46:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 05EA710328501; 
 Fri, 23 Oct 2026 11:46:18 +0200 (CEST)
Message-ID: <031537e0-f176-44bf-adde-6f1dcb8ab7f8@bootlin.com>
Date: Fri, 23 Oct 2026 11:46:17 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
Cc: Dick Olsson <hi@senzilla.io>, Sergey Matyukevich <geomatsi@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-amarula@amarulasolutions.com
References: <20261022151358.2260712-1-dario.binacchi@amarulasolutions.com>
 <20261022151358.2260712-7-dario.binacchi@amarulasolutions.com>
Content-Language: en-US
In-Reply-To: <20261022151358.2260712-7-dario.binacchi@amarulasolutions.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 6/6] configs/stm32mp257f_ev1_defconfig: new
 defconfig
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Kory Maincent via buildroot <buildroot@buildroot.org>
Reply-To: Kory Maincent <kory.maincent@bootlin.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

CgpPbiAxMC8yMi8yNiAxNzoxMywgRGFyaW8gQmluYWNjaGkgd3JvdGU6Cj4gQWRkIHN1cHBvcnQg
Zm9yIHRoZSBTVE0zMk1QMjU3RiBFdmFsdWF0aW9uIGJvYXJkIChFVjEpIFsxXS4KPiAKPiBUaGUg
Z29hbCBpcyBhbiBpbWFnZSBidWlsdCBmcm9tIHVwc3RyZWFtIGNvbXBvbmVudHM6Cj4gCj4gLSBU
Ri1BIHYyLjE1LjAKPiAtIFUtQm9vdCAyMDI2LjEwCj4gLSBMaW51eCA3LjMKPiAKPiBjb25maWd1
cmVkLCB3aGVyZSBwb3NzaWJsZSwgd2l0aCB0aGUgc2FtZSBidWlsZCBvcHRpb25zIHVzZWQgYnkg
dGhlCj4gb2ZmaWNpYWwgU1RNaWNyb2VsZWN0cm9uaWNzIE9wZW5TVExpbnV4IFlvY3RvIGxheWVy
cyBbMl0uCj4gCj4gVGhpcyB3YXMgbm90IHBvc3NpYmxlIGZvciBPUC1URUUgT1MuIEluZGVlZCB1
cHN0cmVhbSBPUC1URUUgT1MgZG9lcyBub3QKPiBzdXBwb3J0IHlldCwgb24gU1RNMzJNUDI1LCB0
aGUgU1RQTUlDMiBQTUlDIGFuZCB0aGUgU0NNSSB2b2x0YWdlCj4gZG9tYWlucywgd2hpY2ggdGhl
IG1haW5saW5lIExpbnV4IGRldmljZSB0cmVlIHJlcXVpcmVzIGZvciB0aGUgbWljcm9TRAo+IGNh
cmQgc3VwcGxpZXMgWzNdLiBVbnRpbCB0aGlzIGlzIHJlc29sdmVkLCB0aGUgU1RNaWNyb2VsZWN0
cm9uaWNzCj4gZG93bnN0cmVhbSB2ZXJzaW9uICg0LjAuMC1zdG0zMm1wLXIzKSBoYXMgdG8gYmUg
dXNlZC4KPiAKPiBIb3N0IGJtYXAtdG9vbHMgaXMgZW5hYmxlZCB0byBzcGVlZCB1cCB0aGUgZmxh
c2hpbmcgb2YgdGhlIG1pY3JvU0QKPiBjYXJkLCB3aGljaCBpcyBtdWNoIGZhc3RlciB0aGFuIHdp
dGggZGQuCj4gCj4gWzFdIGh0dHBzOi8vd3d3LnN0LmNvbS9lbi9ldmFsdWF0aW9uLXRvb2xzL3N0
bTMybXAyNTdmLWV2MS5odG1sCj4gWzJdIGh0dHBzOi8vZ2l0aHViLmNvbS9TVE1pY3JvZWxlY3Ry
b25pY3MvbWV0YS1zdC1zdG0zMm1wL3RyZWUvb3BlbnN0bGludXgtNi42LXlvY3RvLXNjYXJ0aGdh
cC1tcHUtdjI2LjAyLjE4Cj4gWzNdIGh0dHBzOi8vZ2l0aHViLmNvbS9PUC1URUUvb3B0ZWVfb3Mv
aXNzdWVzLzgwMjcKPiAKPiBTaWduZWQtb2ZmLWJ5OiBEYXJpbyBCaW5hY2NoaSA8ZGFyaW8uYmlu
YWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4gLS0tCj4gICBERVZFTE9QRVJTICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArCj4gICAuLi4vc3RtMzJtcDI1N2YtZXYx
L2dlbmltYWdlLmNmZyAgICAgICAgICAgICAgfCA1MiArKysrKysrKysrKysrKwo+ICAgLi4uL292
ZXJsYXkvYm9vdC9leHRsaW51eC9leHRsaW51eC5jb25mICAgICAgIHwgIDQgKysKPiAgIC4uLi9v
dmVybGF5L2V0Yy9md3VtZGF0YS5jb25maWcgICAgICAgICAgICAgICB8ICA0ICsrCj4gICAuLi4v
YXJtLXRydXN0ZWQtZmlybXdhcmUuaGFzaCAgICAgICAgICAgICAgICAgfCAgMiArCj4gICAuLi4t
YXJtLXNtYy1pZC1vZi10aGUtU01DLXdhdGNoZG9nLW9uLXMucGF0Y2ggfCA1MyArKysrKysrKysr
KysrKwo+ICAgLi4uL3N0bTMybXAyNTdmLWV2MS9wYXRjaGVzL2xpbnV4L2xpbnV4Lmhhc2ggIHwg
IDIgKwo+ICAgLi4uMm1wMjUtcmVuYW1lLXRoZS1QQ0llLWJ1cy1TQ01JLWNsb2NrLnBhdGNoIHwg
NDQgKysrKysrKysrKysrCj4gICAuLi4vcGF0Y2hlcy9vcHRlZS1vcy9vcHRlZS1vcy5oYXNoICAg
ICAgICAgICAgfCAgMiArCj4gICAuLi4vc3RtMzJtcDI1N2YtZXYxL3BhdGNoZXMvdWJvb3QvdWJv
b3QuaGFzaCAgfCAgMiArCj4gICAuLi4vc3RtMzJtcDI1N2YtZXYxL3Bvc3QtaW1hZ2Uuc2ggICAg
ICAgICAgICAgfCAxOCArKysrKwo+ICAgLi4uL3N0bTMybXAyNTdmLWV2MS9yZWFkbWUudHh0ICAg
ICAgICAgICAgICAgIHwgNzIgKysrKysrKysrKysrKysrKysrKwo+ICAgY29uZmlncy9zdG0zMm1w
MjU3Zl9ldjFfZGVmY29uZmlnICAgICAgICAgICAgIHwgNjYgKysrKysrKysrKysrKysrKysKPiAg
IDEzIGZpbGVzIGNoYW5nZWQsIDMyMyBpbnNlcnRpb25zKCspCj4gICBjcmVhdGUgbW9kZSAxMDA2
NDQgYm9hcmQvc3RtaWNyb2VsZWN0cm9uaWNzL3N0bTMybXAyNTdmLWV2MS9nZW5pbWFnZS5jZmcK
PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBib2FyZC9zdG1pY3JvZWxlY3Ryb25pY3Mvc3RtMzJtcDI1
N2YtZXYxL292ZXJsYXkvYm9vdC9leHRsaW51eC9leHRsaW51eC5jb25mCj4gICBjcmVhdGUgbW9k
ZSAxMDA2NDQgYm9hcmQvc3RtaWNyb2VsZWN0cm9uaWNzL3N0bTMybXAyNTdmLWV2MS9vdmVybGF5
L2V0Yy9md3VtZGF0YS5jb25maWcKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBib2FyZC9zdG1pY3Jv
ZWxlY3Ryb25pY3Mvc3RtMzJtcDI1N2YtZXYxL3BhdGNoZXMvYXJtLXRydXN0ZWQtZmlybXdhcmUv
YXJtLXRydXN0ZWQtZmlybXdhcmUuaGFzaAo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGJvYXJkL3N0
bWljcm9lbGVjdHJvbmljcy9zdG0zMm1wMjU3Zi1ldjEvcGF0Y2hlcy9saW51eC8wMDAxLWFybTY0
LWR0cy1zdC1maXgtYXJtLXNtYy1pZC1vZi10aGUtU01DLXdhdGNoZG9nLW9uLXMucGF0Y2gKPiAg
IGNyZWF0ZSBtb2RlIDEwMDY0NCBib2FyZC9zdG1pY3JvZWxlY3Ryb25pY3Mvc3RtMzJtcDI1N2Yt
ZXYxL3BhdGNoZXMvbGludXgvbGludXguaGFzaAo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGJvYXJk
L3N0bWljcm9lbGVjdHJvbmljcy9zdG0zMm1wMjU3Zi1ldjEvcGF0Y2hlcy9vcHRlZS1vcy8wMDAx
LWR0cy1zdG0zMm1wMjUtcmVuYW1lLXRoZS1QQ0llLWJ1cy1TQ01JLWNsb2NrLnBhdGNoCj4gICBj
cmVhdGUgbW9kZSAxMDA2NDQgYm9hcmQvc3RtaWNyb2VsZWN0cm9uaWNzL3N0bTMybXAyNTdmLWV2
MS9wYXRjaGVzL29wdGVlLW9zL29wdGVlLW9zLmhhc2gKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBi
b2FyZC9zdG1pY3JvZWxlY3Ryb25pY3Mvc3RtMzJtcDI1N2YtZXYxL3BhdGNoZXMvdWJvb3QvdWJv
b3QuaGFzaAo+ICAgY3JlYXRlIG1vZGUgMTAwNzU1IGJvYXJkL3N0bWljcm9lbGVjdHJvbmljcy9z
dG0zMm1wMjU3Zi1ldjEvcG9zdC1pbWFnZS5zaAo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGJvYXJk
L3N0bWljcm9lbGVjdHJvbmljcy9zdG0zMm1wMjU3Zi1ldjEvcmVhZG1lLnR4dAo+ICAgY3JlYXRl
IG1vZGUgMTAwNjQ0IGNvbmZpZ3Mvc3RtMzJtcDI1N2ZfZXYxX2RlZmNvbmZpZwo+IAo+IGRpZmYg
LS1naXQgYS9ERVZFTE9QRVJTIGIvREVWRUxPUEVSUwo+IGluZGV4IGMxODhjZDMwMWYyYy4uMjRl
YTgzZTQyOGVjIDEwMDY0NAo+IC0tLSBhL0RFVkVMT1BFUlMKPiArKysgYi9ERVZFTE9QRVJTCj4g
QEAgLTgxMSw2ICs4MTEsNyBAQCBGOglib2FyZC9ic2gvCj4gICBGOglib2FyZC9zdG1pY3JvZWxl
Y3Ryb25pY3Mvc3RtMzJmNzQ2LWRpc2NvLwo+ICAgRjoJYm9hcmQvc3RtaWNyb2VsZWN0cm9uaWNz
L3N0bTMyZjc2OS1kaXNjby8KPiAgIEY6CWJvYXJkL3N0bWljcm9lbGVjdHJvbmljcy9zdG0zMmg3
NDctZGlzY28vCj4gK0Y6CWJvYXJkL3N0bWljcm9lbGVjdHJvbmljcy9zdG0zMm1wMjU3Zi1ldjEv
Cj4gICBGOglib290L3N0bTMyLWRkci1waHktYmluYXJ5Lwo+ICAgRjoJYm9vdC90aS1rMy1ib290
LWZpcm13YXJlLwo+ICAgRjoJY29uZmlncy9pbXg2dWx6X2JzaF9zbW1fbTJfZGVmY29uZmlnCj4g
QEAgLTgxOSw2ICs4MjAsNyBAQCBGOgljb25maWdzL2lteDhtbl9ic2hfc21tX3MyX3Byb19kZWZj
b25maWcKPiAgIEY6CWNvbmZpZ3Mvc3RtMzJmNzQ2X2Rpc2NvX3NkX2RlZmNvbmZpZwo+ICAgRjoJ
Y29uZmlncy9zdG0zMmY3NjlfZGlzY29fc2RfZGVmY29uZmlnCj4gICBGOgljb25maWdzL3N0bTMy
aDc0N19kaXNjb19zZF9kZWZjb25maWcKPiArRjoJY29uZmlncy9zdG0zMm1wMjU3Zl9ldjFfZGVm
Y29uZmlnCj4gICBGOglwYWNrYWdlL2Flc3BpcGUvCj4gICBGOglwYWNrYWdlL2FybWFkaWxsby8K
PiAgIEY6CXBhY2thZ2UvYXRmLwo+IGRpZmYgLS1naXQgYS9ib2FyZC9zdG1pY3JvZWxlY3Ryb25p
Y3Mvc3RtMzJtcDI1N2YtZXYxL2dlbmltYWdlLmNmZyBiL2JvYXJkL3N0bWljcm9lbGVjdHJvbmlj
cy9zdG0zMm1wMjU3Zi1ldjEvZ2VuaW1hZ2UuY2ZnCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBp
bmRleCAwMDAwMDAwMDAwMDAuLmFlYzY2Y2M3YzQ5MAo+IC0tLSAvZGV2L251bGwKPiArKysgYi9i
b2FyZC9zdG1pY3JvZWxlY3Ryb25pY3Mvc3RtMzJtcDI1N2YtZXYxL2dlbmltYWdlLmNmZwo+IEBA
IC0wLDAgKzEsNTIgQEAKPiAraW1hZ2Ugc2RjYXJkLmltZyB7Cj4gKwloZGltYWdlIHsKPiArCQlw
YXJ0aXRpb24tdGFibGUtdHlwZSA9ICJncHQiCj4gKwl9Cj4gKwo+ICsJcGFydGl0aW9uIGZzYmxh
MSB7Cj4gKwkJaW1hZ2UgPSAidGYtYS1zdG0zMm1wMjU3Zi1ldjEuc3RtMzIiCj4gKwkJc2l6ZSA9
IDI1NksKPiArCX0KPiArCj4gKwlwYXJ0aXRpb24gZnNibGEyIHsKPiArCQlpbWFnZSA9ICJ0Zi1h
LXN0bTMybXAyNTdmLWV2MS5zdG0zMiIKPiArCQlzaXplID0gMjU2Swo+ICsJfQo+ICsKPiArCXBh
cnRpdGlvbiBtZXRhZGF0YTEgewo+ICsJCWltYWdlID0gImZ3dS1tZGF0YS5iaW4iCj4gKwkJcGFy
dGl0aW9uLXR5cGUtdXVpZCA9ICIke0ZXVV9NREFUQV9UWVBFX1VVSUR9Igo+ICsJCXNpemUgPSAy
NTZLCj4gKwl9Cj4gKwo+ICsJcGFydGl0aW9uIG1ldGFkYXRhMiB7Cj4gKwkJaW1hZ2UgPSAiZnd1
LW1kYXRhLmJpbiIKPiArCQlwYXJ0aXRpb24tdHlwZS11dWlkID0gIiR7RldVX01EQVRBX1RZUEVf
VVVJRH0iCj4gKwkJc2l6ZSA9IDI1NksKPiArCX0KPiArCj4gKwlwYXJ0aXRpb24gZmlwLWEgewo+
ICsJCWltYWdlID0gImZpcC5iaW4iCj4gKwkJcGFydGl0aW9uLXR5cGUtdXVpZCA9ICIke0ZJUF9U
WVBFX1VVSUR9Igo+ICsJCXBhcnRpdGlvbi11dWlkID0gIiR7RklQX0FfVVVJRH0iCj4gKwkJc2l6
ZSA9IDRNCj4gKwl9Cj4gKwo+ICsJcGFydGl0aW9uIGZpcC1iIHsKPiArCQlpbWFnZSA9ICJmaXAu
YmluIgo+ICsJCXBhcnRpdGlvbi10eXBlLXV1aWQgPSAiJHtGSVBfVFlQRV9VVUlEfSIKPiArCQlw
YXJ0aXRpb24tdXVpZCA9ICIke0ZJUF9CX1VVSUR9Igo+ICsJCXNpemUgPSA0TQo+ICsJfQo+ICsK
PiArCXBhcnRpdGlvbiB1LWJvb3QtZW52IHsKPiArCQlwYXJ0aXRpb24tdHlwZS11dWlkID0gIjNk
ZTIxNzY0LTk1YmQtNTRiZC1hNWMzLTRhYmU3ODZmMzhhOCIKPiArCQlzaXplID0gNTEySwo+ICsJ
fQo+ICsKPiArCXBhcnRpdGlvbiByb290ZnMgewo+ICsJCWltYWdlID0gInJvb3Rmcy5leHQ0Igo+
ICsJCXBhcnRpdGlvbi11dWlkID0gImU5MWM0ZTEwLTE2ZTYtNGMwZS1iZDBlLTc3YmVjZjRhMzU4
MiIKPiArCQlib290YWJsZSA9ICJ5ZXMiCj4gKwl9Cj4gK30KCkkgZG9uJ3Qga25vdyB0aGUgcG9s
aWN5IGhlcmUsIGRvIHdlIHdhbnQgdG8gaGF2ZSB0aGlzIEEvQiBjb21wbGV4IGJvb3QgCnJlZHVu
ZGFuY3kgaW4gQnVpbGRyb290IHVwc3RyZWFtIHJhdGhlciB0aGFuIGEgc2ltcGxlIGltYWdlIHBh
cnRpdGlvbiAKbGF5b3V0PwpUaGUgRldVIG1ldGFkYXRhIGlzIGFsc28gbm90IGEgcmVxdWlyZW1l
bnQgdG8gYm9vdCB0aGUgYm9hcmQuCgouLi4KCj4gZGlmZiAtLWdpdCBhL2JvYXJkL3N0bWljcm9l
bGVjdHJvbmljcy9zdG0zMm1wMjU3Zi1ldjEvcG9zdC1pbWFnZS5zaCBiL2JvYXJkL3N0bWljcm9l
bGVjdHJvbmljcy9zdG0zMm1wMjU3Zi1ldjEvcG9zdC1pbWFnZS5zaAo+IG5ldyBmaWxlIG1vZGUg
MTAwNzU1Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi5jNjg3NzRjZGI4MTQKPiAtLS0gL2Rldi9udWxs
Cj4gKysrIGIvYm9hcmQvc3RtaWNyb2VsZWN0cm9uaWNzL3N0bTMybXAyNTdmLWV2MS9wb3N0LWlt
YWdlLnNoCj4gQEAgLTAsMCArMSwxOCBAQAo+ICsjIS9iaW4vc2gKPiArCj4gK3NldCAtZQo+ICsK
PiArQk9BUkRfRElSPSIkKGRpcm5hbWUgIiQwIikiCj4gKwo+ICsjIEdQVCBwYXJ0aXRpb24gdHlw
ZSBhbmQgcGFydGl0aW9uIFVVSURzLCBhbHNvIHVzZWQgYnkgZ2VuaW1hZ2UuY2ZnCj4gK2V4cG9y
dCBGV1VfTURBVEFfVFlQRV9VVUlEPSI4YTdhODRhMC04Mzg3LTQwZjYtYWI0MS1hOGI5YTVhNjBk
MjMiCj4gK2V4cG9ydCBGSVBfVFlQRV9VVUlEPSIxOWQ1ZGY4My0xMWIwLTQ1N2ItYmUyYy03NTU5
YzEzMTQyYTUiCj4gK2V4cG9ydCBGSVBfQV9VVUlEPSI0ZmQ4NGM5My01NGVmLTQ2M2YtYTdlZi1h
ZTI1ZmY4ODcwODciCj4gK2V4cG9ydCBGSVBfQl9VVUlEPSIwOWM1NDk1Mi1kNWJmLTQ1YWYtYWNl
ZS0zMzUzMDM3NjZmYjMiCj4gKwo+ICsjIEZXVSBtZXRhZGF0YSAodjIpOiAxIGltYWdlICh0aGUg
RklQKSBwZXIgYmFuaywgMiBiYW5rcyAoZmlwLWEsIGZpcC1iKQo+ICsiJHtIT1NUX0RJUn0vYmlu
L21rZnd1bWRhdGEiIC1nIC1pIDEgLWIgMiAtdiAyIFwKPiArCSIke0ZXVV9NREFUQV9UWVBFX1VV
SUR9LCR7RklQX1RZUEVfVVVJRH0sJHtGSVBfQV9VVUlEfSwke0ZJUF9CX1VVSUR9IiBcCj4gKwki
JHtCSU5BUklFU19ESVJ9L2Z3dS1tZGF0YS5iaW4iCj4gKwo+ICtzdXBwb3J0L3NjcmlwdHMvZ2Vu
aW1hZ2Uuc2ggLWMgIiR7Qk9BUkRfRElSfS9nZW5pbWFnZS5jZmciCgpTYW1lIHF1ZXN0aW9uIGhl
cmUsIGRvIHdlIHdhbnQgdG8gdXNlIEZXVSBtZXRhZGF0YSBpbiB0aGUgQnVpbGRyb290IAp1cHN0
cmVhbSBpbWFnZT8KCi0tIApLw7ZyeSBNYWluY2VudCwgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBh
bmQga2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
