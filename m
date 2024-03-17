Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1580C54E68
	for <buildroot@archiver.kernel.org>; Sun, 17 Mar 2024 21:47:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3753F4058A;
	Sun, 17 Mar 2024 21:47:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UcYatmUTZVSl; Sun, 17 Mar 2024 21:47:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F38CA4058B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F38CA4058B;
	Sun, 17 Mar 2024 21:47:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E34B51BF3FB
 for <buildroot@lists.busybox.net>; Sun, 17 Mar 2024 21:47:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CAF8181586
 for <buildroot@lists.busybox.net>; Sun, 17 Mar 2024 21:47:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mc1JZbnSHu22 for <buildroot@lists.busybox.net>;
 Sun, 17 Mar 2024 21:47:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 314EA814BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 314EA814BB
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 314EA814BB
 for <buildroot@buildroot.org>; Sun, 17 Mar 2024 21:47:03 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-513da1c1f26so3639905e87.3
 for <buildroot@buildroot.org>; Sun, 17 Mar 2024 14:47:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710712021; x=1711316821;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/PkTCRvw4SjQbkPXA3Rp9KHb+JMTEOhuyyxvlUboOC4=;
 b=oe/KJ27j3VMf6TaQmccxi8KMcaoqnOL81MAbn0KtMqJrH+xTUXM3laxVOvykkbX5mc
 sRmMjOyNKZK6GCMa1eJWpzVZzu16Mv7ryai7QDBrMelgrOl1jBmKtXn6RkxSXG/jH968
 C3FjHViMGp+9oVu3mq/NUF2SlBKL7kBm60sW/Ecma2ukYdH2iYR2DJInP1rvYcV+hfBa
 lkk61fgIyXP7SAwVF3EVUh4mDlv1OYM5Jq6QGVh6iFUNiw1wH8IRdMqq0OukBNZlpaqK
 xfT7H/rS3O4GpktleQPpa1/zOLAjFBBUJ54O3QW522eja9ZnYXqsRzsL7CKj390WfBzH
 LNIA==
X-Gm-Message-State: AOJu0Yz9G6kOhj/umAhVDlOXqSEFW04D3EHH+QJDRozhxmxSyUniMJwa
 h2P7m425Rl3F6naRTayXPE9V4xp3LUjoE5kxZYeeJgPIxJGcPe01782tKwfZlmKTmG2hUjao586
 iD/L9EvHcjv2laKdF1vd/YU5jpcq67CTl25A=
X-Google-Smtp-Source: AGHT+IG6XFaa36GZjIbwi3xJ3DV9TMbX+yfeq1nuQLnCt0btEq1Q7oyca2LCZhnOGvdPxtwybn9tlz9L+x3J/6jYXDY=
X-Received: by 2002:a05:6512:284:b0:513:d79b:d10d with SMTP id
 j4-20020a056512028400b00513d79bd10dmr5936510lfp.26.1710712021242; Sun, 17 Mar
 2024 14:47:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240317094037.41936-1-fontaine.fabrice@gmail.com>
 <27462b41-cf7c-4ce8-bab1-66a1559479f4@mind.be>
In-Reply-To: <27462b41-cf7c-4ce8-bab1-66a1559479f4@mind.be>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 17 Mar 2024 22:46:49 +0100
Message-ID: <CAPi7W82XVii7w86Fy2bd_K4MnMFWUso4Dfs91XKzk8GqYtuveQ@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710712021; x=1711316821; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/PkTCRvw4SjQbkPXA3Rp9KHb+JMTEOhuyyxvlUboOC4=;
 b=hzwxTiX/vaVGw7sXelY6fGGhpWNF3MtKQnCDrLB6gMsXLC1+BSjfOTvb1sSgCmKuGj
 fX0r00qf9+2EMh1zsmXrUy9Kyy7T+uC0ajjtGRS+UnClIrfmLQlmmOuvpHniCAq6/Y1l
 YLQ26SAThSofiL5Ek80ZkWxsqCUYWdnoH9jyoTseHU+C6BQThxj3rkBIZgdVRM4gyXJT
 Pw3/aDBVxu2J4UIwEX8QP3WHHM2s+Zo5uThPf9A9JyYvPGqjr3QDNh3QLcA3uQnsVpum
 UGkSSEkwZSt1TenOudQ55ZpA+144St1N1Bwtip//K/BlwkwuBSBLqLCOmgvMu2lYx4uM
 vQmw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hzwxTiX/
Subject: Re: [Buildroot] [PATCH 1/1] package/poco: needs C++17
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpMZSBkaW0uIDE3IG1hcnMgMjAyNCDDoCAyMjo0MSwgQXJub3V0IFZhbmRlY2FwcGVs
bGUgPGFybm91dEBtaW5kLmJlPiBhIMOpY3JpdCA6Cj4KPgo+Cj4gT24gMTcvMDMvMjAyNCAxMDo0
MCwgRmFicmljZSBGb250YWluZSB3cm90ZToKPiA+IHBvY28gbmVlZHMgQysrMTcgYW5kIGdjYyA+
PTggc2luY2UgYnVtcCB0byB2ZXJzaW9uIDEuMTMuMiBpbiBjb21taXQKPiA+IDQzM2M0ZmQzOGIx
NWVmY2Y3NGI0MTBlNTA2OGUyZTUxZWViYTZlNDYgYW5kCj4gPiBodHRwczovL2dpdGh1Yi5jb20v
cG9jb3Byb2plY3QvcG9jby9jb21taXQvNzgyMzQ4NTdiZjQxNmI3MTg0NTU0OTY4MDBkMWI3YmUz
YTBkMGE1Mwo+ID4gaHR0cHM6Ly9naXRodWIuY29tL3BvY29wcm9qZWN0L3BvY28vY29tbWl0LzEw
ZjQxYzA2ZDk0MTZhNmFlMDg4NGM0ODI3ZWEyYTkxYmY1ZDJjZjgKPiA+IHJlc3VsdGluZyBpbiB0
aGUgZm9sbG93aW5nIGJ1aWxkIGZhaWx1cmUgd2l0aCBnY2MgNzoKPiA+Cj4gPiBJbiBmaWxlIGlu
Y2x1ZGVkIGZyb20gc3JjL1RocmVhZC5jcHA6Mjg6MDoKPiA+IHNyYy9UaHJlYWRfUE9TSVguY3Bw
OiBJbiBtZW1iZXIgZnVuY3Rpb24gJ3ZvaWQgUG9jbzo6VGhyZWFkSW1wbDo6c2V0TmFtZUltcGwo
Y29uc3Qgc3RyaW5nJiknOgo+ID4gc3JjL1RocmVhZF9QT1NJWC5jcHA6MTYyOjU2OiBlcnJvcjog
bm8gbWF0Y2hpbmcgZnVuY3Rpb24gZm9yIGNhbGwgdG8gJ3N0ZDo6X19jeHgxMTo6YmFzaWNfc3Ry
aW5nPGNoYXI+OjphcHBlbmQoY29uc3Qgc3RyaW5nJiwgc3RkOjpfX2N4eDExOjpiYXNpY19zdHJp
bmc8Y2hhcj46OnNpemVfdHlwZSknCj4gPiAgICAgdHJ1bmNOYW1lLmFwcGVuZCh0aHJlYWROYW1l
LCB0aHJlYWROYW1lLnNpemUoKSAtIGhhbGYpOwo+ID4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXgo+ID4KPiA+IEZpeGVzOiA0MzNjNGZk
MzhiMTVlZmNmNzRiNDEwZTUwNjhlMmU1MWVlYmE2ZTQ2Cj4gPiAgIC0gaHR0cDovL2F1dG9idWls
ZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvN2IxYzE0NGYzOWE4YmU0Y2U4Zjk2NGFhMTNhNTJkMGJm
NjJkZDBhYQo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5l
LmZhYnJpY2VAZ21haWwuY29tPgo+Cj4gICBBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLCBidXQg
SSBoYXZlIGEgcXVlc3Rpb24gYmVsb3cuCj4KPiA+IC0tLQo+ID4gICBwYWNrYWdlL3BvY28vQ29u
ZmlnLmluIHwgNiArKystLS0KPiA+ICAgcGFja2FnZS9wb2NvL3BvY28ubWsgICB8IDEgLQo+ID4g
ICAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiA+Cj4g
PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9wb2NvL0NvbmZpZy5pbiBiL3BhY2thZ2UvcG9jby9Db25m
aWcuaW4KPiA+IGluZGV4IDdjYjk5ODdlYzcuLjliZGVmMTI1YWQgMTAwNjQ0Cj4gPiAtLS0gYS9w
YWNrYWdlL3BvY28vQ29uZmlnLmluCj4gPiArKysgYi9wYWNrYWdlL3BvY28vQ29uZmlnLmluCj4g
PiBAQCAtMTIsNyArMTIsNyBAQCBjb25maWcgQlIyX1BBQ0tBR0VfUE9DTwo+ID4gICAgICAgYm9v
bCAicG9jbyIKPiA+ICAgICAgIGRlcGVuZHMgb24gQlIyX0lOU1RBTExfTElCU1REQ1BQCj4gPiAg
ICAgICBkZXBlbmRzIG9uIEJSMl9VU0VfV0NIQVIKPiA+IC0gICAgIGRlcGVuZHMgb24gQlIyX1RP
T0xDSEFJTl9HQ0NfQVRfTEVBU1RfNSAjIEMrKzE0Cj4gPiArICAgICBkZXBlbmRzIG9uIEJSMl9U
T09MQ0hBSU5fR0NDX0FUX0xFQVNUXzggIyBDKysxNwo+ID4gICAgICAgIyBwdGhyZWFkX2NvbmRh
dHRyX3NldGNsb2NrCj4gPiAgICAgICBkZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fSEFTX1RIUkVB
RFNfTlBUTAo+ID4gICAgICAgZGVwZW5kcyBvbiAhQlIyX1NUQVRJQ19MSUJTICMgZGxvcGVuKCkK
PiA+IEBAIC0xMTYsOCArMTE2LDggQEAgY29uZmlnIEJSMl9QQUNLQUdFX1BPQ09fWklQCj4gPgo+
ID4gICBlbmRpZiAjIEJSMl9QQUNLQUdFX1BPQ08KPiA+Cj4gPiAtY29tbWVudCAicG9jbyBuZWVk
cyBhIHRvb2xjaGFpbiB3LyB3Y2hhciwgTlBUTCwgQysrLCBkeW5hbWljIGxpYnJhcnksIGdjYyA+
PSA1IHcvIEMrKzE0Igo+ID4gK2NvbW1lbnQgInBvY28gbmVlZHMgYSB0b29sY2hhaW4gdy8gd2No
YXIsIE5QVEwsIEMrKywgZHluYW1pYyBsaWJyYXJ5LCBnY2MgPj0gOCIKPiA+ICAgICAgIGRlcGVu
ZHMgb24gIUJSMl9VU0VfV0NIQVIgfHwgIUJSMl9JTlNUQUxMX0xJQlNURENQUCBcCj4gPiAgICAg
ICAgICAgICAgIHx8ICFCUjJfVE9PTENIQUlOX0hBU19USFJFQURTX05QVEwgfHwgQlIyX1NUQVRJ
Q19MSUJTIFwKPiA+IC0gICAgICAgICAgICAgfHwgIUJSMl9UT09MQ0hBSU5fR0NDX0FUX0xFQVNU
XzUKPiA+ICsgICAgICAgICAgICAgfHwgIUJSMl9UT09MQ0hBSU5fR0NDX0FUX0xFQVNUXzgKPiA+
ICAgICAgIGRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfUE9DT19BUkNIX1NVUFBPUlRTCj4gPiBkaWZm
IC0tZ2l0IGEvcGFja2FnZS9wb2NvL3BvY28ubWsgYi9wYWNrYWdlL3BvY28vcG9jby5tawo+ID4g
aW5kZXggY2M4YTIyZmMyYS4uMjMzMjUyYzY3YiAxMDA2NDQKPiA+IC0tLSBhL3BhY2thZ2UvcG9j
by9wb2NvLm1rCj4gPiArKysgYi9wYWNrYWdlL3BvY28vcG9jby5tawo+ID4gQEAgLTY4LDcgKzY4
LDYgQEAgZGVmaW5lIFBPQ09fQ09ORklHVVJFX0NNRFMKPiA+ICAgICAgIChjZCAkKEBEKTsgJChU
QVJHRVRfTUFLRV9FTlYpIC4vY29uZmlndXJlIFwKPiA+ICAgICAgICAgICAgICAgLS1jb25maWc9
TGludXggXAo+ID4gICAgICAgICAgICAgICAtLXByZWZpeD0vdXNyIFwKPiA+IC0gICAgICAgICAg
ICAgLS1jZmxhZ3M9LXN0ZD1jKysxNCBcCj4KPiAgIFNvIHRoZSBidWlsZCBzeXN0ZW0gbm93IHBh
c3NlcyAtc3RkPWMrKzE3IGJ5IGl0c2VsZj8gT3IgaXMgQysrMTcgYWxyZWFkeSB0aGUKPiBkZWZh
dWx0IGluIEdDQzg/CgpCdWlsZCBzeXN0ZW0gYWxyZWFkeSBwYXNzZXMgLXN0ZD1jKysxNyBieSBp
dHNlbGYgc2luY2UgYXQgbGVhc3QKdmVyc2lvbiAxLjEzLjAgYW5kCmh0dHBzOi8vZ2l0aHViLmNv
bS9wb2NvcHJvamVjdC9wb2NvL2NvbW1pdC82ZGFkODUwMmQzNjVjYjIwY2MyMjI0ZGM1ZDkyMmZi
MDIxODk4Y2NiCgo+Cj4gICBSZWdhcmRzLAo+ICAgQXJub3V0Cj4KPiA+ICAgICAgICAgICAgICAg
LS1sZGZsYWdzPSIkKFBPQ09fTERGTEFHUykiIFwKPiA+ICAgICAgICAgICAgICAgLS1vbWl0PSIk
KFBPQ09fT01JVCkiIFwKPiA+ICAgICAgICAgICAgICAgJChQT0NPX0NPTkZfT1BUUykgXAoKQmVz
dCBSZWdhcmRzLAoKRmFicmljZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
