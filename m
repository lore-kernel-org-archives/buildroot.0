Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B291D606A325
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 13:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ejwpcRuE;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=li1xw21V
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88974816A0;
	Fri, 20 Nov 2026 13:00:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T0isXkCrqo6S; Fri, 20 Nov 2026 13:00:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org AF02F8167E
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795179634;
	b=CVE8ulmoK7E/904Wpe2GCsiNc7eAxSnO+hBvJ0V7ulwEUq1sfy+wmEa0LHfmnlbGgt8g
	 yJD9p+pga95LVKQ5JQiE1O5nZfMNb85vlEto9nZ2LvLmBv7diUVhUHTbjhTIYr4M3QelU
	 Fm+TYMyyTGqR6+qtymZiW9te6h11jbytibJ1YtEs2OGgt9sb+FLC/KGn63h7GDy1ltz1e
	 fq/WODy6vYF7g6nZMuFAZm6qRuP2tRnAMAXspGi0YrGtzRx+eLvpio9Kak/Ur7/0oEFqn
	 WrSwBdGnuIjgMZ/woEUBZTq+wmRi4IFo0atwlPiFYcVTskSRUaiGDDK79ZCCS5dTTkw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795179634;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Organization:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=8FNIZdzw84IMBwAcD/vY4zFRi7cR+8Ujsj/8CtkL82Y=;
	b=WMYW05xeqPTGAwYG9qotQ5EJgICIszEYqqlmLTPG6vbUHQGSeUudzvCCTcuEm6T7FjY7
	 9crIPQwjh6Yd9rSbUTkq9CGVdRd+seu0MNi9S1vEfGH6DSniON8tmh38jwXUQNbZUwazt
	 t84EOzXXnOHJZPrZBiAIKZGzdW1isnhamwHK/82zjmTNigC+SXQWBm2XCPkejM9D9zILU
	 nSFFxfA9WC93Uo1aiL+lGel6TfwiVOOYK6MkH3kOOZdw3k9IOIMZgbnkI647FWit7DpTD
	 DPeaMqq04Nzavn0h8pSw6lK6SM8R8xDL28oMvQOvjRFc7uy1+1gJvOWWiAuAw397efw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795179634;
	bh=8FNIZdzw84IMBwAcD/vY4zFRi7cR+8Ujsj/8CtkL82Y=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ejwpcRuEWEIBjsPoONB0mLoGFAVMHWYPx8L7I4AGlZ9sl9zxSRwMOqYbjKQAyckDD
	 U0cywO3MDTo5Fxmqi9TB/5xBDMUcHt2zdwaIujEObum0KmCW7pwe9QrIxM+MLayLSU
	 yzQxttBlbZ7zJwhF5ROdI82SK/ZxsMCDfQc7Ni5xr5ITZFkTi+TeIg+XK82DD831CW
	 DPtjN+QzSdTBGMvOL0KJKRoUy7ABhiEg4ao0atMroqJlwpNFkMhy8RS70RJbhWHf1m
	 ql3W5ppn0Tw85TijFqvF1p6MtH2vcbuLly5BpOhpZWAGU/AH3Am3Irf+Gkrvj71JvV
	 UEz3QElCjZxgA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF02F8167E;
	Fri, 20 Nov 2026 13:00:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 01BE31E7
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 13:00:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DCF5340208
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 13:00:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a3ta1S5HVAqG for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 13:00:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org D933E40A47
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::62d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com;
 envelope-from=lazzer@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=li1xw21V
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D933E40A47
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 13:00:30 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-c50a2efbe1dso150976966b.3
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 05:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795179629; x=1795784429; darn=buildroot.org;
 h=content-transfer-encoding:organization:content-type:mime-version
 :references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=0lkeDSAMs/noi3pO8t/o+s1NrlWOoKhTGV4kPui3zA4=;
 b=li1xw21VnZSPqdq8fF9ytbnzhLaklNlUUnHvizkYls2zTdQHI8zrzSIkIN3rXFeo8x
 epMyyTcqjDj8wRQXUWHXBdFCF81BL5f1T08YBG/IdJuiEIyCHoKxO3TaGGXUBu4zfroj
 sY3kA5W2ZG6CnlX4hUZhVAMojvC/rnupnTyFvRUItqmKX+6VRFWeJfEKKZqmyj07bfgm
 Ro/jIxdJLhQxXDyJlaoHs5DeawDsRr6xI2eQktQjhlOrk1R+OreCWnGAyyxMp9mEv1an
 rx+/yVOF2b6vgieKF//VJ+op3zLdYevXHk3BmRr6IuzuoDEE9nqzEOnZxueoQNXieyVv
 GUzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795179629; x=1795784429;
 h=content-transfer-encoding:organization:content-type:mime-version
 :references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=0lkeDSAMs/noi3pO8t/o+s1NrlWOoKhTGV4kPui3zA4=;
 b=2Vg63kqbZUAZBlcmnuBFTwkNuT5eMZtQdUd9YAwpwgDB/y0jzXS5m/PAC7iNO2d0js
 CV7R3sJVMXiU/VL7OicWfDNUWD/fagJdN3s5MYE2Z6W0pvKcfAdsYOFBaIteTOtHa6tC
 UHoc4qhz0GzI1DtK69ZLTmxzHR3ee4aNQo4MnyNwunIAq5CFQgAUOeaesrz22dJlKudr
 rErEnAR3K7LWm78WFVL5ioT79G204XpleZH3R4YjBP1CEGoBSazkDwpwRz9kTEaiYIcz
 48C/b1khyKxpseCKd+tCO2m5Glu6brZA7DD0lvlXkFQ33vxV/JA+Cf61/uufoCQxhWyt
 7Phg==
X-Gm-Message-State: APuU4Z88SIyqffopTBEJ6wuQdgyn4vRTVWhbUvkGiTvO5pgBWdodracz
 Wmli/QVuu1RSfeOvQ9oo4FDiFePLFuaq2VPcyVReXsAmOYkwFOQMOAFLgTPG3Q==
X-Gm-Gg: AZFdTZdy/025bHVsAHawhTWKid3S8+I/M6ZfZtL7BU5MKIynTWJQ/rqvznD4ePFVcSE
 Wkl4q/MzBs9GKUNJsTrM+W390LRRmckSsn+v4aB1yFqc+rvlG1DFgalMUPheLP31TVdEDbZXbqt
 JjT+VfwUacahIc8FYJmzZrsAheZTvxb5PEIEaejzEalNhaV0taGLeHijdbgY/hXkhd6HTg9gAeF
 dfEq7rMWh+/Lzw4JtGmqk0HKtUvEFvlvytfr1Ybvck0urQECs3A0HTS1n8OO5+2XxH5LerBMK4X
 zHSQ/QbbVp79aLoPFqfyeCDqL8QOVALn70DY8WrCkk1O9oHwizNr284Jn6K0+A5ouGG1dCp0zBd
 DpGWqrNJ+Ry1loOxts3tHBB/gya4pyMCa9pkS1QIygCCPa8iGe0xzrmvYu/i+ZTGYGNlib/KiuQ
 mYMpTDQoiEnLKHRuUZy/EiEWMqkejlhi4CnB9lhxXP2T2tBD+m5rU/SVRJL6y5AA2FEVMz7pzMt
 +SYqyz+rkdDavWhkru26ZHCA5fKlnq374M0jnYU9nTFJwl8DGHJYDCA48gnfmJROlNBtbwAlqIE
 HECViI1EdtAiR5t5yXhtUyxY7nvqOy9lWynW6y7r1yfpot/+frdssRsfneHVdmTD
X-Received: by 2002:a17:906:a2d0:b0:c2e:5efe:f1cb with SMTP id
 a640c23a62f3a-c513a9994eemr252286366b.8.1795179628318; 
 Fri, 20 Nov 2026 05:00:28 -0800 (PST)
Received: from tollan.addiva.ad (h-79-136-22-50.NA.cust.bahnhof.se.
 [79.136.22.50]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c513aea17desm92823566b.44.2026.11.20.05.00.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2026 05:00:27 -0800 (PST)
From: =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 20 Nov 2026 14:00:15 +0100
Message-ID: <20261120130015.344000-3-lazzer@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120130015.344000-1-lazzer@gmail.com>
References: <20261120130015.344000-1-lazzer@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Organization: Wires
Subject: [Buildroot] [PATCH v2 2/2] package/hostapd: add MBO (Wi-Fi Agile
 Multiband) support option
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

QWRkIEJSMl9QQUNLQUdFX0hPU1RBUERfTUJPIHRvIGVuYWJsZSBNdWx0aWJhbmQgT3BlcmF0aW9u
IChXaS1GaQpBZ2lsZSBNdWx0aWJhbmQpIG9uIHRoZSBBUCBzaWRlLCBwcm92aWRpbmcgc3RhbmRh
cmRpemVkIGhpbnRzIHRoYXQKaGVscCBjbGllbnRzIHBpY2sgdGhlIGJlc3QgZnJlcXVlbmN5IGJh
bmQgYW5kIEJTUy4KCk1CTyBidWlsZHMgb24gV05NIChJRUVFIDgwMi4xMXYpLCBzbyBCUjJfUEFD
S0FHRV9IT1NUQVBEX1dOTSBpcwpzZWxlY3RlZCBhdXRvbWF0aWNhbGx5LgoKU2lnbmVkLW9mZi1i
eTogTWF0dGlhcyBXYWxzdHLDtm0gPGxhenplckBnbWFpbC5jb20+Ci0tLQpDaGFuZ2VzIHYxIC0+
IHYyOgogIC0gV05NIG9wdGlvbiBtb3ZlZCB0byBpdHMgb3duIHBhdGNoCiAgLSByZWJhc2VkIG9u
IG1hc3Rlciwgbm8gY29kZSBjaGFuZ2VzCi0tLQogcGFja2FnZS9ob3N0YXBkL0NvbmZpZy5pbiAg
fCAxMCArKysrKysrKysrCiBwYWNrYWdlL2hvc3RhcGQvaG9zdGFwZC5tayB8ICA0ICsrKysKIDIg
ZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvaG9z
dGFwZC9Db25maWcuaW4gYi9wYWNrYWdlL2hvc3RhcGQvQ29uZmlnLmluCmluZGV4IDVkMDhmMTVm
ZjguLmJjY2EyZWVhZTcgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvaG9zdGFwZC9Db25maWcuaW4KKysr
IGIvcGFja2FnZS9ob3N0YXBkL0NvbmZpZy5pbgpAQCAtODQsNiArODQsMTYgQEAgY29uZmlnIEJS
Ml9QQUNLQUdFX0hPU1RBUERfV05NCiAJICBNYW5hZ2VtZW50IHdoaWNoIGFsbG93cyB0aGUgQVAg
dG8gc3VnZ2VzdCBvciByZXF1ZXN0IGEgc3RhdGlvbgogCSAgdG8gbW92ZSB0byBhbm90aGVyIEJT
Uy4KIAorY29uZmlnIEJSMl9QQUNLQUdFX0hPU1RBUERfTUJPCisJYm9vbCAiRW5hYmxlIE1CTyAo
TXVsdGliYW5kIE9wZXJhdGlvbikiCisJZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9IT1NUQVBEX0hB
U19XSUZJX0RSSVZFUlMKKwlzZWxlY3QgQlIyX1BBQ0tBR0VfSE9TVEFQRF9XTk0KKwloZWxwCisJ
ICBFbmFibGUgc3VwcG9ydCBmb3IgTUJPIChNdWx0aWJhbmQgT3BlcmF0aW9uLCBXaS1GaSBBZ2ls
ZQorCSAgTXVsdGliYW5kKS4gVGhpcyBmYWNpbGl0YXRlcyBlZmZpY2llbnQgdXNlIG9mIHRoZSBm
cmVxdWVuY3kKKwkgIGJhbmRzIGF2YWlsYWJsZSB0byB0aGUgQVAsIGVuYWJsaW5nIGJhbmQgc3Rl
ZXJpbmcgb2Ygc3RhdGlvbnMKKwkgIHRvd2FyZCB0aGUgbW9zdCBzdWl0YWJsZSBiYW5kLgorCiBj
b25maWcgQlIyX1BBQ0tBR0VfSE9TVEFQRF9WTEFOCiAJYm9vbCAiRW5hYmxlIFZMQU4gc3VwcG9y
dCIKIAlkZWZhdWx0IHkKZGlmZiAtLWdpdCBhL3BhY2thZ2UvaG9zdGFwZC9ob3N0YXBkLm1rIGIv
cGFja2FnZS9ob3N0YXBkL2hvc3RhcGQubWsKaW5kZXggZDlhMTY2MDg0Mi4uNTYyZGQ2Y2ViMCAx
MDA2NDQKLS0tIGEvcGFja2FnZS9ob3N0YXBkL2hvc3RhcGQubWsKKysrIGIvcGFja2FnZS9ob3N0
YXBkL2hvc3RhcGQubWsKQEAgLTk3LDYgKzk3LDEwIEBAIGlmZXEgKCQoQlIyX1BBQ0tBR0VfSE9T
VEFQRF9XTk0pLHkpCiBIT1NUQVBEX0NPTkZJR19FTkFCTEUgKz0gQ09ORklHX1dOTQogZW5kaWYK
IAoraWZlcSAoJChCUjJfUEFDS0FHRV9IT1NUQVBEX01CTykseSkKK0hPU1RBUERfQ09ORklHX0VO
QUJMRSArPSBDT05GSUdfTUJPCitlbmRpZgorCiBpZmVxICgkKEJSMl9QQUNLQUdFX0hPU1RBUERf
VkxBTiksKQogSE9TVEFQRF9DT05GSUdfRU5BQkxFICs9IENPTkZJR19OT19WTEFOCiBlbmRpZgot
LSAKMi40My4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
