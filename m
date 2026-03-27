Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B46D810ED640
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 10:03:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89514613D3;
	Fri, 27 Mar 2026 10:03:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CS0n2jhFH8gm; Fri, 27 Mar 2026 10:03:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B33146140B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774605801;
	bh=uISbSTZZQn655TH9xKPfpw2ABxR0NusigQ1mLn11c1o=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PtSueCs8nM56eRUyKIxAarXlD6jFictaRWs1+12cc5civyugMNcIRekAq6Rg7A4fD
	 5pLzu+M8JksXR3FjuDcHjvASqzUuu7sA/Lyu9NvNnb9JbVvxI7XMaZ6fDoemjk134s
	 2CYSVU2kBnnKR2L2cE6o34KbHkrRveh0GukadbqrN5SL9/yp3swFmN/O9k16KXCWI8
	 yAGsXqS6tK8WLyVR5CgPznqUF0rc/DDrGEcKpY729EBDjD7aa5h2+vM3emktCvyUu9
	 oi7jjOhZcvpzdssplnH+6cctSsYJB+uEUtI59WaxD45YvYww5kAsDVGO2wgWGwSE1w
	 W1w6dSf4zOeOw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B33146140B;
	Fri, 27 Mar 2026 10:03:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 550F8249
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:03:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4757F4172A
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:03:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xE-33n2yZnc4 for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 10:03:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2347141747
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2347141747
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2347141747
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:03:18 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-48541edecf9so23830195e9.1
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 03:03:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774605797; x=1775210597;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=WzgbnslvcR/1TwFUFz5ViFiOl/jclX8pXP2TUm8XxC8=;
 b=PCoIlJviG27X7ouGZRtdk2jxjDyM5FGYg6G7QR69HDyxFU8FFoT5XUe3ym1UlKN6Mt
 uS1t6gzVt7JDClcugwXi6HCecwk9ppAKoKGVS+rqAUk1pX37qkUGwx2Wo9N6MBmhbyIS
 rE53rh/hmnzx3Xpro2xMhbrq4xoUsCGaoTVuUc0rnHwhmrMamtTzEX6vv7bQerQ86m6p
 k6iBuCW2Qi5535f7e2Qv6x5UzPbSkvvHMYtqwZPDOCskhWYdpbrNNEdGAcVPm+9ZWepw
 1l4LtWZQlvtt5OfMoufXEb7gdn4ku4AMLG7pMMMdON627kFQusWvcFXjd3R2PJCBEKhF
 WaQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMEwaNPwEx5VyHka18HT5X3AVcQGtHBUwiRcmOJU5sgrYJ0wj9VBEO4za3wGtlhfJvxgJRtbwu7I4=@buildroot.org
X-Gm-Message-State: AOJu0YxChVEtOkt5P9tlNnraBqNME8egA0Qp0lcDMp/WEIJ41y4NqYpB
 yOk5HyTlM028FNxsBONE4yBEEq5lmgAYe4pqz1l+yLqDV1sNuFxWSaHW5LNiWVtY2+I=
X-Gm-Gg: ATEYQzwnoEsO84Qk7SsdgQi7yaoiFyTsoYepvenITDHzavTAGEk7OjUa+1QkJjMSE5y
 9DtHBoEhyYGqqE6zGl+492pb1id7VQYeGLyl0st9HkNAoTLUcmBLhckgyR0hXvmBK5AukmXhFl/
 nSWaMWGfoQQvprPPcg3z/HvDF8jKAhoXzkO0HvUDsTBth/8EJ8P9ARqZX7I/kl0hLXNFOKYc1SU
 iqtx7aWxtbi3Wg8r5MZu8eIfTJerURPFRRllKIG9aTbDOJt5YHGj5E/2PLVwDrgBTOMlK/CmuQo
 vDklikiI+krIc+YqPuzNyQMeaK5OQzHcrQqxg6eUSVG57/BJusBhKSOaCA/7e9K2gU1+Q/QfJs0
 hzyC2vC2DteC6XvXIu8Xn53IJ5xUFwOInsQHNZCIsLCPs1Zc3LUdno3zCVe9+qQuSO9x/p7ncC1
 VY5qgQ84GyDvzUDCOehM8MoyAGtlA=
X-Received: by 2002:a05:600c:8b86:b0:485:3f58:d9f with SMTP id
 5b1f17b1804b1-48727f405fbmr28808985e9.30.1774605796772; 
 Fri, 27 Mar 2026 03:03:16 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48722d38a5fsm81107315e9.12.2026.03.27.03.03.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2026 03:03:15 -0700 (PDT)
To: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 27 Mar 2026 11:03:14 +0100
Message-ID: <20260327100314.47069-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260318123714.2494747-1-vincent.stehle@arm.com>
References: <20260318123714.2494747-1-vincent.stehle@arm.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1774605797; x=1775210597; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WzgbnslvcR/1TwFUFz5ViFiOl/jclX8pXP2TUm8XxC8=;
 b=RUgxRgiBaeuhKIj1Ed5/4Vz86YuyyrsoTeztrE85nDfxbfHXC3IfCLOXv2G693j1Bz
 h7/bfQTNi1xSrgjOe3TVYiNFnh2BjPnG5dcONTbvq+8Xgi6QVcowAo29SYonkm7OgHwn
 y4ZGSQmHs2MMz9jt64gNhueRhsv7yDc5eBTXN9Z2MXy60P1QfsG1sXqaShe9zUBOvWbt
 tfd8xLUaxncV6Fpk0rzuL0w39cmvL3gI34iFSrMMQco2cthhb6Q9ox4Cy8HKg199DUCu
 9jdVk9h4jYSAhzBrcvKEJ9CHTZ947KxJl21zN6+vfJWTtUgk1euF5bRkkB/Evm9hzvty
 bHvw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=RUgxRgiB
Subject: Re: [Buildroot] [PATCH] package/xen: fix armv7 build with gcc-15
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SW4gcmVwbHkgb2Y6Cj4gQmFja3BvcnQgYSBwYXRjaCBmcm9tIFhlbiA0LjIxIHRvIGZpeCB0aGUg
Zm9sbG93aW5nIGJ1aWxkIGVycm9ycyBmb3IgQXJtIHY3Cj4gd2l0aCBnY2MtMTU6Cj4gCj4gICB4
ZW4tNC4xNC42L3hlbi9pbmNsdWRlL2FzbS9wbGF0Zm9ybXMvbWlkd2F5Lmg6MTogZXJyb3I6IGhl
YWRlciBndWFyZCAnX19BU01fQVJNX1BMQVRGT1JNU19NSURXQVlfSCcgZm9sbG93ZWQgYnkgJyNk
ZWZpbmUnIG9mIGEgZGlmZmVyZW50IG1hY3JvIFstV2Vycm9yPWhlYWRlci1ndWFyZF0KPiAgIHhl
bi00LjE0LjYveGVuL2luY2x1ZGUvYXNtL3BsYXRmb3Jtcy9vbWFwNS5oOjE6IGVycm9yOiBoZWFk
ZXIgZ3VhcmQgJ19fQVNNX0FSTV9QTEFURk9STVNfT01BUDVfSCcgZm9sbG93ZWQgYnkgJyNkZWZp
bmUnIG9mIGEgZGlmZmVyZW50IG1hY3JvIFstV2Vycm9yPWhlYWRlci1ndWFyZF0KPiAKPiBTaW5j
ZSB0aGUgZXh0ZXJuYWwgMzJiIGFybSB0b29sY2hhaW4gaGFzIGJlZW4gdXBkYXRlZCB0byBhIHZl
cnNpb24gYmFzZWQgb24KPiBnY2MtMTUsIHRoZSB0ZXN0cy5wYWNrYWdlLnRlc3RfeGVuLlRlc3RY
ZW5Bcm12NyBweXRob24gdGVzdCBkb2VzIG5vdCBidWlsZAo+IGFueW1vcmUuCj4gQWRkaW5nIHRo
ZSBwYXRjaCByZXBhaXJzIGl0Lgo+IAo+IExpbms6IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJv
b3Qub3JnL2J1aWxkcm9vdC8tL2pvYnMvMTM1MTgzMTg0NzMKPiBGaXhlczogODZkNDUzYTdkYzA4
ICgidG9vbGNoYWluL3Rvb2xjaGFpbi1leHRlcm5hbC90b29sY2hhaW4tZXh0ZXJuYWwtYXJtLWFy
bTogYnVtcCB0byAxNS4yLnJlbDEiKQo+IFNpZ25lZC1vZmYtYnk6IFZpbmNlbnQgU3RlaGzDqSA8
dmluY2VudC5zdGVobGVAYXJtLmNvbT4KPiBDYzogQWxpc3RhaXIgRnJhbmNpcyA8YWxpc3RhaXJA
YWxpc3RhaXIyMy5tZT4KPiBDYzogRG93YW4gR3VsbGllbnQgPGRvd2FuLmd1bGxpZW50QHNtaWxl
LmZyPgoKQXBwbGllZCB0byAyMDI2LjAyLnguIFRoYW5rcwoKPiAtLS0KPiAgLi4uOS1Bcm0tcGxh
dGZvcm1zLWZpeC1idWlsZC13aXRoLWdjYzE1LnBhdGNoIHwgNDYgKysrKysrKysrKysrKysrKysr
Kwo+ICAxIGZpbGUgY2hhbmdlZCwgNDYgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgcGFja2FnZS94ZW4vMDAwOS1Bcm0tcGxhdGZvcm1zLWZpeC1idWlsZC13aXRoLWdjYzE1LnBh
dGNoCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UveGVuLzAwMDktQXJtLXBsYXRmb3Jtcy1maXgt
YnVpbGQtd2l0aC1nY2MxNS5wYXRjaCBiL3BhY2thZ2UveGVuLzAwMDktQXJtLXBsYXRmb3Jtcy1m
aXgtYnVpbGQtd2l0aC1nY2MxNS5wYXRjaAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXgg
MDAwMDAwMDAwMC4uZmI5NWNhOWZhNQo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL3hl
bi8wMDA5LUFybS1wbGF0Zm9ybXMtZml4LWJ1aWxkLXdpdGgtZ2NjMTUucGF0Y2gKPiBAQCAtMCww
ICsxLDQ2IEBACj4gK0Zyb20gZDEyNjY2ZDc0ZGM3NDJiYjA2YzMwYjk2ZDZiODc0YTNlMTRjNmI0
NiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPiArRnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPgo+ICtEYXRlOiBUdWUsIDI2IEF1ZyAyMDI1IDA4OjQxOjE4ICswMjAwCj4gK1N1
YmplY3Q6IFtQQVRDSF0gQXJtL3BsYXRmb3JtczogZml4IGJ1aWxkIHdpdGggZ2NjMTUKPiArTUlN
RS1WZXJzaW9uOiAxLjAKPiArQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04
Cj4gK0NvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhiaXQKPiArCj4gK0ZvciB0d28gb2YgdGhl
IGhlYWRlcnMgZ2NjMTUgY29tcGxhaW5zICJoZWFkZXIgZ3VhcmQgLi4uIGZvbGxvd2VkIGJ5Cj4g
KycjZGVmaW5lJyBvZiBhIGRpZmZlcmVudCBtYWNybyIuIE1pc3JhIGNlcnRhaW5seSB3b3VsZG4n
dCBoYXZlIGxpa2VkCj4gK3RoaXMgZWl0aGVyLCBpZiB0aGVzZSBoZWFkZXJzIHdlcmUgY292ZXJl
ZCBieSBhIHNjYW4uCj4gKwo+ICtTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+Cj4gK0Fja2VkLWJ5OiBNaWNoYWwgT3J6ZWwgPG1pY2hhbC5vcnplbEBhbWQuY29t
Pgo+ICtVcHN0cmVhbTogaHR0cHM6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPXhlbi5naXQ7
YT1jb21taXRkaWZmO2g9MzlmOTUwODllMmJhMTVjNTQzOGNlOTA0YzBjYmJkOGQ3OWQzZTZlNwo+
ICtTaWduZWQtb2ZmLWJ5OiBWaW5jZW50IFN0ZWhsw6kgPHZpbmNlbnQuc3RlaGxlQGFybS5jb20+
Cj4gKy0tLQo+ICsgeGVuL2luY2x1ZGUvYXNtLWFybS9wbGF0Zm9ybXMvbWlkd2F5LmggfCAyICst
Cj4gKyB4ZW4vaW5jbHVkZS9hc20tYXJtL3BsYXRmb3Jtcy9vbWFwNS5oICB8IDIgKy0KPiArIDIg
ZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ICsKPiArZGlm
ZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vcGxhdGZvcm1zL21pZHdheS5oIGIveGVuL2lu
Y2x1ZGUvYXNtLWFybS9wbGF0Zm9ybXMvbWlkd2F5LmgKPiAraW5kZXggMDk5ZTQzNS4uNjkxNDM5
MyAxMDA2NDQKPiArLS0tIGEveGVuL2luY2x1ZGUvYXNtLWFybS9wbGF0Zm9ybXMvbWlkd2F5LmgK
PiArKysrIGIveGVuL2luY2x1ZGUvYXNtLWFybS9wbGF0Zm9ybXMvbWlkd2F5LmgKPiArQEAgLTEs
NSArMSw1IEBACj4gKyAjaWZuZGVmIF9fQVNNX0FSTV9QTEFURk9STVNfTUlEV0FZX0gKPiArLSNk
ZWZpbmUgX19BU01fQVNNX1BMQVRGT1JNU19NSURXQVlfSAo+ICsrI2RlZmluZSBfX0FTTV9BUk1f
UExBVEZPUk1TX01JRFdBWV9ICj4gKyAKPiArIC8qIGFkZHJlc3NlcyBvZiBTUkVHIHJlZ2lzdGVy
cyBmb3IgcmVzZXR0aW5nIHRoZSBTb0MgKi8KPiArICNkZWZpbmUgTVdfU1JFR19QV1JfUkVRICAg
ICAgICAgICAgIDB4ZmZmM2NmMDAKPiArZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS1hcm0v
cGxhdGZvcm1zL29tYXA1LmggYi94ZW4vaW5jbHVkZS9hc20tYXJtL3BsYXRmb3Jtcy9vbWFwNS5o
Cj4gK2luZGV4IGM1NTljODQuLjg4NjdiNDUgMTAwNjQ0Cj4gKy0tLSBhL3hlbi9pbmNsdWRlL2Fz
bS1hcm0vcGxhdGZvcm1zL29tYXA1LmgKPiArKysrIGIveGVuL2luY2x1ZGUvYXNtLWFybS9wbGF0
Zm9ybXMvb21hcDUuaAo+ICtAQCAtMSw1ICsxLDUgQEAKPiArICNpZm5kZWYgX19BU01fQVJNX1BM
QVRGT1JNU19PTUFQNV9ICj4gKy0jZGVmaW5lIF9fQVNNX0FTTV9QTEFURk9STVNfT01BUDVfSAo+
ICsrI2RlZmluZSBfX0FTTV9BUk1fUExBVEZPUk1TX09NQVA1X0gKPiArIAo+ICsgI2RlZmluZSBS
RUFMVElNRV9DT1VOVEVSX0JBU0UgICAgICAgICAgICAgICAgICAgMHg0ODI0MzIwMAo+ICsgI2Rl
ZmluZSBJTkNSRU1FTlRFUl9OVU1FUkFUT1JfT0ZGU0VUICAgICAgICAgICAgMHgxMAo+ICstLSAK
PiArMi41My4wCj4gKwo+IC0tIAo+IDIuNTEuMAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
