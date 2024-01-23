Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43AD0C47258
	for <buildroot@archiver.kernel.org>; Tue, 23 Jan 2024 08:07:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF6BF82B49;
	Tue, 23 Jan 2024 08:07:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF6BF82B49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I3nemdLKlOYV; Tue, 23 Jan 2024 08:06:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 01DB682AF8;
	Tue, 23 Jan 2024 08:06:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01DB682AF8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E57551BF2C9
 for <buildroot@lists.busybox.net>; Tue, 23 Jan 2024 08:06:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CB1F482AF8
 for <buildroot@lists.busybox.net>; Tue, 23 Jan 2024 08:06:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB1F482AF8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zpOCakiIgr0T for <buildroot@lists.busybox.net>;
 Tue, 23 Jan 2024 08:06:57 +0000 (UTC)
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C737D82AF5
 for <buildroot@buildroot.org>; Tue, 23 Jan 2024 08:06:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C737D82AF5
Received: by mail-yb1-xb2e.google.com with SMTP id
 3f1490d57ef6-dc238cb1b17so3620219276.0
 for <buildroot@buildroot.org>; Tue, 23 Jan 2024 00:06:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705997215; x=1706602015;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nt6NbtQVLev56VuaaEHqWxSIGWhRNcMM743V7fDq9Mw=;
 b=cAI5DrmSDQ06U5h27Z3gU35QVV8lK++G6QuOFs6H5eoUPCb/3WkCen0F9Jr6mF+SkE
 wbJZO1pLza4yFqZOULI3jrfuuUqZM+yoNsWuI6fgLHV4lYBumr+2iS77wfskSLIaMSEB
 ypN8QxHDbp0bDAgnw29kCd85trxr4raBssvMXUi8wZJjfc56+16jODE//I8mrx4mUeyq
 3riR+c1NI/BOtb0Bb7ZiW3K08icewB5PPepol0Z4Jl3iKojdN/7DLxPo5dwGmO+oa5Zp
 DK9+5mXWVL7/r+nsUb3VnI5Srl52O1FBpRtjzaF1FGtFptY+Q3OPbBRJ3UHfRPpnjnrf
 DF9Q==
X-Gm-Message-State: AOJu0Yz4fWsiUzieHnLeUR3dYx+VxG5NktkIkHhLyYzfdL8xPlKbm6Ug
 WFIttiQ6kRh+k2gnlb5xO21pRxjbvAfEQ3KSiIf9/tdcff2/MoJGA/7oCQOTIMsuuk7FJ/w5DUW
 3mY+BdMLAfi6ST8AYWaGl6ElUr+y5k5xCmrupnQ==
X-Google-Smtp-Source: AGHT+IENwTv4afd/L9pjVpdbCzocknAINeF8LCIpBuLanm7IQbX/5SFBnfSvRKreYeQyYk5h1loGiwLFOEV5UdQrNEY=
X-Received: by 2002:a25:c791:0:b0:dc2:328a:b095 with SMTP id
 w139-20020a25c791000000b00dc2328ab095mr3213769ybe.56.1705997215536; Tue, 23
 Jan 2024 00:06:55 -0800 (PST)
MIME-Version: 1.0
References: <20240122223037.889955-1-giulio.benetti@benettiengineering.com>
In-Reply-To: <20240122223037.889955-1-giulio.benetti@benettiengineering.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Tue, 23 Jan 2024 09:06:44 +0100
Message-ID: <CABGWkvqXpPMqxVwaenww-a6zHw1c9AjMD5G7K_1cxOq0rRtaHw@mail.gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1705997215; x=1706602015;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nt6NbtQVLev56VuaaEHqWxSIGWhRNcMM743V7fDq9Mw=;
 b=WneA7iOgRmf4nWQPRnOUeh167RfvKh3EA3ioLeXD8yfRm4XPPukfsucqXy5ly33tbW
 ZF0QaiE6QaoogxT16byEhssmYv0G6CIi1rmW7z2Bljws+NjVExzbN/fo4TYz/apxvnND
 C8rw0aOURzJw4oaCYjR/8fhcRJa9VrCuTHrZQ=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=WneA7iOg
Subject: Re: [Buildroot] [PATCH] package/uuu: fix build failure with host
 gcc 13.x
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
Cc: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgR2l1bGlvLAoKT24gTW9uLCBKYW4gMjIsIDIwMjQgYXQgMTE6MzDigK9QTSBHaXVsaW8gQmVu
ZXR0aQo8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4gd3JvdGU6Cj4KPiBG
cm9tOiBHaXVsaW8gQmVuZXR0aSA8Z2l1bGlvLmJlbmV0dGkrdGVrdm94QGJlbmV0dGllbmdpbmVl
cmluZy5jb20+Cj4KPiBXaXRoIGdjYyB2ZXJzaW9uID49IDEzLnggc3RkaW50LmggbXVzdCBiZSBl
eHBsaWNpdGx5IGluY2x1ZGVkIGFjY29yZGluZyB0bwo+IFswXSBzbyBhZGQgbG9jYWwgcGF0Y2gg
dG8gZXhwbGljaXRseSBpbmNsdWRlIHN0ZGludC5oLgo+Cj4gWzBdOiBodHRwczovL2djYy5nbnUu
b3JnL2djYy0xMy9wb3J0aW5nX3RvLmh0bWwKPgo+IEZpeGVzOgo+IHN0aWxsIG5vdCBoYXBwZW5l
ZAo+Cj4gU2lnbmVkLW9mZi1ieTogR2l1bGlvIEJlbmV0dGkgPGdpdWxpby5iZW5ldHRpK3Rla3Zv
eEBiZW5ldHRpZW5naW5lZXJpbmcuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEdpdWxpbyBCZW5ldHRp
IDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPgo+IC0tLQo+ICBwYWNrYWdl
L3V1dS8wMDAxLUZpeC1taXNzaW5nLXJlZmVyZW5jZXMucGF0Y2ggfCA0MCArKysrKysrKysrKysr
KysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA0MCBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBwYWNrYWdlL3V1dS8wMDAxLUZpeC1taXNzaW5nLXJlZmVyZW5jZXMucGF0Y2gKPgo+
IGRpZmYgLS1naXQgYS9wYWNrYWdlL3V1dS8wMDAxLUZpeC1taXNzaW5nLXJlZmVyZW5jZXMucGF0
Y2ggYi9wYWNrYWdlL3V1dS8wMDAxLUZpeC1taXNzaW5nLXJlZmVyZW5jZXMucGF0Y2gKPiBuZXcg
ZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjE0MGM5NzU1YzcKPiAtLS0gL2Rl
di9udWxsCj4gKysrIGIvcGFja2FnZS91dXUvMDAwMS1GaXgtbWlzc2luZy1yZWZlcmVuY2VzLnBh
dGNoCj4gQEAgLTAsMCArMSw0MCBAQAo+ICtGcm9tIDI0ZmQwNDMyMjU5MDMyNDdmNzFhYzEwNjY2
ZDgyMDI3N2MwYjEwYjEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCj4gK0Zyb206IG5peGduYXVo
Y3V5IDxuaXhnbmF1aGN1eUBnbWFpbC5jb20+Cj4gK0RhdGU6IFR1ZSwgOSBNYXkgMjAyMyAxNDoz
MjozMyArMDgwMAo+ICtTdWJqZWN0OiBbUEFUQ0hdIEZpeCBtaXNzaW5nIHJlZmVyZW5jZXMKPiAr
Cj4gK1Vwc3RyZWFtOiBodHRwczovL2dpdGh1Yi5jb20vbnhwLWlteC9tZmd0b29scy9jb21taXQv
MjRmZDA0MzIyNTkwMzI0N2Y3MWFjMTA2NjZkODIwMjc3YzBiMTBiMQo+ICsKPiArU2lnbmVkLW9m
Zi1ieTogR2l1bGlvIEJlbmV0dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5j
b20+Cj4gKy0tLQo+ICsgbGlidXV1L2xpYmNvbW0uaCB8IDEgKwo+ICsgdXV1L2J1aWxkaW5jbWQu
aCB8IDEgKwo+ICsgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPiArCj4gK2RpZmYg
LS1naXQgYS9saWJ1dXUvbGliY29tbS5oIGIvbGlidXV1L2xpYmNvbW0uaAo+ICtpbmRleCAwYWZk
ZmEzLi4zOGQ2MjJkIDEwMDY0NAo+ICstLS0gYS9saWJ1dXUvbGliY29tbS5oCj4gKysrKyBiL2xp
YnV1dS9saWJjb21tLmgKPiArQEAgLTI4LDYgKzI4LDcgQEAKPiArICogUE9TU0lCSUxJVFkgT0Yg
U1VDSCBEQU1BR0UuCj4gKyAqCj4gKyAqLwo+ICsrI2luY2x1ZGUgPHN0ZGludC5oPgo+ICsgI2lu
Y2x1ZGUgPHN0cmluZz4KPiArICNpbmNsdWRlIDxzdGRhcmcuaD4KPiArICNpbmNsdWRlIDxsb2Nh
bGU+Cj4gK2RpZmYgLS1naXQgYS91dXUvYnVpbGRpbmNtZC5oIGIvdXV1L2J1aWxkaW5jbWQuaAo+
ICtpbmRleCA5NDE1MTE3Li40NjI4NmNjIDEwMDY0NAo+ICstLS0gYS91dXUvYnVpbGRpbmNtZC5o
Cj4gKysrKyBiL3V1dS9idWlsZGluY21kLmgKPiArQEAgLTMxLDYgKzMxLDcgQEAKPiArCj4gKyAj
cHJhZ21hIG9uY2UKPiArCj4gKysjaW5jbHVkZSA8c3RkaW50Lmg+Cj4gKyAjaW5jbHVkZSA8bWFw
Pgo+ICsgI2luY2x1ZGUgPHN0cmluZz4KPiArICNpbmNsdWRlIDx2ZWN0b3I+Cj4gKy0tCj4gKzIu
MzQuMQo+ICsKPiAtLQo+IDIuMzQuMQo+CgpSZXZpZXdlZC1ieTogRGFyaW8gQmluYWNjaGkgPGRh
cmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgoKVGhhbmtzIGFuZCByZWdhcmRzLApE
YXJpbwoKLS0gCgpEYXJpbyBCaW5hY2NoaQoKU2VuaW9yIEVtYmVkZGVkIExpbnV4IERldmVsb3Bl
cgoKZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KCgpBbWFydWxhIFNvbHV0aW9ucyBTUkwKClZpYSBMZSBDYW5ldmFy
ZSAzMCwgMzExMDAgVHJldmlzbywgVmVuZXRvLCBJVAoKVC4gKzM5IDA0MiAyNDMgNTMxMAppbmZv
QGFtYXJ1bGFzb2x1dGlvbnMuY29tCgp3d3cuYW1hcnVsYXNvbHV0aW9ucy5jb20KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
