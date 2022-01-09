Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98CADC433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 17:24:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F2A981BBD;
	Sun,  9 Jan 2022 17:24:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xnTdlQIoNzBk; Sun,  9 Jan 2022 17:24:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 843F481BA9;
	Sun,  9 Jan 2022 17:24:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ED6511BF475
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 17:24:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E8BD660BB4
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 17:24:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uIr-Sv62fhv1 for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 17:24:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BCEA560B59
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 17:24:07 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id o3so22366931wrh.10
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 09:24:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=6LZIDrZPPxD08WYo6x1BlU8e+4XUwVyr9jafq/cJKMc=;
 b=1r9iaAA8FAW8i4rt3Gj2X983Wsf9JKmQ4irnEpGq2U41DnlJ6HK/IgEKofB84jWe3H
 mjIiKhL6IcYgftOXUt6h3rm24r+c8WfNRQ7rHAcFUKTYC1g4bW+qtRWd6uXPsEs9CzY6
 pPr9VnqszkPyOFD9NEyAl27GxsgCI8z/U4xVzM+PXY9w0FSby6x3G/vJKdjQPtwvD/Ew
 ZvXuozyrJh+Ers+b3xIVuDKdidU/A3eALy1i2ytwdOjPkBJvb+lM1bo64KKwsdAkhEmm
 7Ni9qPe6UInT4X5O7mtukEUK2k0/ORZMjk3dOOWT3bwAtjsxp+qV4QMHy4top5z6Uk/o
 DSCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6LZIDrZPPxD08WYo6x1BlU8e+4XUwVyr9jafq/cJKMc=;
 b=yET0R04puyG0Wt8fb51Wf3WZGuzuGWqXspT78uUo4iSi2VLUKTPFztf4A9F7nAgZ2r
 Bq+siRGG0Ogv0ahyVaeqYl7Gsm886mM91WFKyQALxpBCKOBwIkvXmGfyix5SS2kynHN+
 KcpMmprIcCIOIY7Y/DxnUcBeNQdt2E1vB2H+swWgmO9pQmBuBur8X+Wqb8ld6C2Jlh4t
 7OHYuEKA30k3wK5r6JYAK3maeaSmdBkct/ctpWrY+MEnwtmqPWHkKJJEtlul7+YhgqCE
 bquK+j4/SDXZpA7wsBQMR25zRLqxZQvIIm+9rWjYpMhLUmm7X/sHs5meyAKZlta7+3oj
 bkCQ==
X-Gm-Message-State: AOAM533DZU5X32ZOrNjqNk5H/20y/5w+U0VAvIaH2k4keIbnQCJ0iQX4
 0AW/yI5RIld2PNRIqqb0cJnq5Q==
X-Google-Smtp-Source: ABdhPJypC2BGDCzZHuJ9KdiKMlPc9LKJ54Jl4kTCGZgqz0igEE5rFM1VIuROPK9M+X2DPAHyytawWg==
X-Received: by 2002:a5d:4e51:: with SMTP id r17mr2471156wrt.444.1641749045791; 
 Sun, 09 Jan 2022 09:24:05 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f?
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id m6sm5041898wrp.34.2022.01.09.09.24.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Jan 2022 09:24:05 -0800 (PST)
Message-ID: <73b148ec-c6bd-fb58-64fd-fd4e224f966e@smile.fr>
Date: Sun, 9 Jan 2022 18:24:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>,
 buildroot@buildroot.org
References: <20220109171511.3293111-1-arnout@mind.be>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20220109171511.3293111-1-arnout@mind.be>
Subject: Re: [Buildroot] [PATCH] package/mesa3d: Gallium VC4 driver depends
 on NEON
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Romain Naour <romain.naour@gmail.com>, Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQXJub3V0LAoKTGUgMDkvMDEvMjAyMiDDoCAxODoxNSwgQXJub3V0IFZhbmRlY2FwcGVs
bGUgKEVzc2Vuc2l1bS9NaW5kKSBhIMOpY3JpdMKgOgo+IFNpbmNlIHZlcnNpb24gMjEuMy4wIG9m
IG1lc2EzZCwgdGhlIGdlbmVyaWMgYnJvYWRjb20gaW5mcmFzdHJ1Y3R1cmUKPiAod2hpY2ggaXMg
Y2FsbGVkIHYzZCBidXQgaXMgdXNlZCBhbHNvIGZvciBWQzQpIHN0YXJ0ZWQgdXNpbmcgTkVPTgo+
IGluc3RydWN0aW9ucy4gVGhpcyBsZWFkcyB0byBhc3NlbWJsZXIgZmFpbHVyZXMgd2hlbiBWQzQg
aXMgYnVpbHQgZm9yCj4gMzItYml0IEFSTSB3aXRob3V0IE5FT046Cj4gCj4gRkFJTEVEOiBzcmMv
YnJvYWRjb20vbGlidjNkX25lb24uYS5wL2NvbW1vbl92M2RfdGlsaW5nLmMubwo+IC9ob21lL2J1
aWxkcm9vdC9hdXRvYnVpbGQvaW5zdGFuY2UtMi9vdXRwdXQtMS9ob3N0L2Jpbi9hcm0tbGludXgt
Z2NjIFsuLi5dIC1jIC4uL3NyYy9icm9hZGNvbS9jb21tb24vdjNkX3RpbGluZy5jCj4gL3RtcC9j
Y0F2dWZOdi5zOiBBc3NlbWJsZXIgbWVzc2FnZXM6Cj4gL3RtcC9jY0F2dWZOdi5zOjYwMjogRXJy
b3I6IHNlbGVjdGVkIHByb2Nlc3NvciBkb2VzIG5vdCBzdXBwb3J0IGB2bGRtIHI3LHtxMCxxMSxx
MixxM30nIGluIEFSTSBtb2RlCj4gWy4uLl0KPiAvdG1wL2NjQXZ1Zk52LnM6Njg2OiBFcnJvcjog
c2VsZWN0ZWQgcHJvY2Vzc29yIGRvZXMgbm90IHN1cHBvcnQgYHZzdG0gcjcse3EwLHExLHEyLHEz
fScgaW4gQVJNIG1vZGUKPiAKPiBMZXQgdGhlIFZDNCBkcml2ZXIgZGVwZW5kIG9uIE5FT04gZm9y
IDMyLWJpdCBBUk0uIEFhcmNoNjQgYWx3YXlzIGhhcwo+IE5FT04sIHNvIG5vIGNvbmRpdGlvbiBp
cyBuZWVkZWQgdGhlcmUuCgpCUjJfUEFDS0FHRV9NRVNBM0RfR0FMTElVTV9EUklWRVJfVjNEIHNl
bGVjdGluZwpCUjJfUEFDS0FHRV9NRVNBM0RfR0FMTElVTV9EUklWRVJfVkM0IGFscmVhZHkgcmVx
dWlyZXMgTkVPTi4KClJldmlld2VkLWJ5OiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBzbWls
ZS5mcj4KCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiAKPiBGaXhlczoKPiBodHRwOi8vYXV0b2J1
aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy8yYjUvMmI1MzFmN2FhNDUwNmVlMzFhNzI1MmM4N2Ey
ZTQwMWZmZmFiOWRmYi8KPiBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy82
ZjkvNmY5ZTdjODY0ODA4ZGMwZmFmYmNhN2M4OTg0NjUxZmU5MmVkYmFmMi8KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBBcm5vdXQgVmFuZGVjYXBwZWxsZSAoRXNzZW5zaXVtL01pbmQpIDxhcm5vdXRAbWlu
ZC5iZT4KPiAtLS0KPiAgcGFja2FnZS9tZXNhM2QvQ29uZmlnLmluIHwgMiArLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
cGFja2FnZS9tZXNhM2QvQ29uZmlnLmluIGIvcGFja2FnZS9tZXNhM2QvQ29uZmlnLmluCj4gaW5k
ZXggMzRiMDM1MjA1Ni4uMzdjNGY4MDc4ZSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL21lc2EzZC9D
b25maWcuaW4KPiArKysgYi9wYWNrYWdlL21lc2EzZC9Db25maWcuaW4KPiBAQCAtMjc0LDcgKzI3
NCw3IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9NRVNBM0RfR0FMTElVTV9EUklWRVJfVjNECj4gIAo+
ICBjb25maWcgQlIyX1BBQ0tBR0VfTUVTQTNEX0dBTExJVU1fRFJJVkVSX1ZDNAo+ICAJYm9vbCAi
R2FsbGl1bSB2YzQgZHJpdmVyIgo+IC0JZGVwZW5kcyBvbiBCUjJfYXJtIHx8IEJSMl9hYXJjaDY0
Cj4gKwlkZXBlbmRzIG9uIChCUjJfYXJtICYmIEJSMl9BUk1fQ1BVX0hBU19ORU9OKSB8fCBCUjJf
YWFyY2g2NAo+ICAJZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0hBU19TWU5DXzQgfHwgIUJSMl9Q
QUNLQUdFX1hPUkc3ICMgbGlieHNobWZlbmNlCj4gIAlzZWxlY3QgQlIyX1BBQ0tBR0VfTUVTQTNE
X0RSSTMgaWYgQlIyX1BBQ0tBR0VfWE9SRzcKPiAgCXNlbGVjdCBCUjJfUEFDS0FHRV9NRVNBM0Rf
R0FMTElVTV9EUklWRVIKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
