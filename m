Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E69F606A321
	for <buildroot@archiver.kernel.org>; Thu, 26 Nov 2026 15:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=jG3JKxi1;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=fiN5vQqJ
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6AC2A81082;
	Thu, 26 Nov 2026 15:29:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gXAUMedSdxOu; Thu, 26 Nov 2026 15:29:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8CFF980D6F
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795706998;
	b=iPd8ANI/gm2RJeWlUbtgovPuXDvo0koLHp+zc5ztEYy2yB1zXpaq8i01T7aWM6A4TbeN
	 /GX5mP4qP5+cprh3rMAGcoSN4GvBbEJLth24LRPE/cKY/Ey+bAzYWcL+kjuU4MNEpIfyt
	 xc5NuriikooCW5c6yFXRD0WrPUe+RERzdV73xsVVQXx3g1g6EnzYPWanaBNhZ7bsvj/wa
	 4l9kOcWV9pauH/Tx4Bm8EpVxxeERS+YArVEC+hDKj8hBfQcXOtoWR29VZy++hc7dFS4An
	 0iKiZf/Cp5GdYJ3FCHXGFX3QBLWWijeIsZcurh4yQPiXI9mQkmTnXgM+GOnsc5FL6rw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795706998;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:To:Cc:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=2y9uhes7LtXhezXr3dFAjKzOTay99vj016FHpptCtcU=;
	b=NmvfKrjjDV7US1eFSayOh2IzuSNxg+mf+YQqJkUpP40FYO+W/DriLoFiiiP6qn5f8KqT
	 WnMGvDsslkbRKilnmkr7dVf3ijbLJbjrhEVTanznl1KsdeNihI2211N1DQiqMfH1uC2Te
	 cLz7qAOYd12gRQM/ugHsok+H/dWfNHnYmzSY8ru9iUQ6bJ0JzveFeCp1ysa+TRsy5g7SI
	 DAb16wmXdgOtf+RGm8Re04Cf/PdUbV+tO+b4EXPAz0+onoKB2mqTvPZbO/E0eBiCWqNCP
	 yCKYwwheYSPXvgZvBhhb4wHspAVcctG3qd2+isxd7Bfyl6pXui1p8mkNIn7xVD4b2SQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795706998;
	bh=2y9uhes7LtXhezXr3dFAjKzOTay99vj016FHpptCtcU=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jG3JKxi1b42I+2MAWey/5gq3Nt6JdN4BXhZfyLqZPjjsZd+o0BUJDLToIY8JtoZpA
	 5aR1Kllvumz7ycNHbxZ5g2owzhBzXOyuQHgRkUMINyux4qyqfBtMw0m67o8+ouiUxQ
	 gCAxtGIJeDcHmOXJsRNsYFzzyYSbS6JkIgkNxhQtoBhm97tTdjYCu3A/8m4qOKtk5x
	 OvE0cbXFrWLsFnp3yJo1th1kFrFg010SUmO/XpXf6KUbC8sNSwya1mxg0HRVSGYv+K
	 sk9hnkUn8YsLmoE78Y/VtPqbb6KI/HrSOBcyGrB8GbjW1yVy3PdEA7tl4cnfqhOgvf
	 LiimmrRc87l2Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8CFF980D6F;
	Thu, 26 Nov 2026 15:29:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2027A260
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 15:29:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1266F40510
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 15:29:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 11KHGCuwWG-k for <buildroot@buildroot.org>;
 Thu, 26 Nov 2026 15:29:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 005924050E
Authentication-Results: smtp2.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2607:f8b0:4864:20::112c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::112c; helo=mail-yw1-x112c.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=fiN5vQqJ
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com
 [IPv6:2607:f8b0:4864:20::112c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 005924050E
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 15:29:55 +0000 (UTC)
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-8b51871c5c4so51055927b3.1
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 07:29:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1795706994; x=1796311794;
 darn=buildroot.org; 
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=+vGKijZM+0OVgYkOduAe58erfMlH7K24ZZXWpk2N9wQ=;
 b=fiN5vQqJFDUI1QuG5TqGsUxSzQT0uV0d8mo1kcedLDEekAwvJVoBxfkCtZb7ggbLYP
 S2heDUr/lVBic6bQn9Ryxi4Ylj4Mm6VPBN44OZ9hjpHmMuCIOey/Q6mTwMBnjmbf3RJE
 XkYH75pj6nDPDCgVB3TYmLwWmOiYX8D+Kevh0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795706994; x=1796311794;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=+vGKijZM+0OVgYkOduAe58erfMlH7K24ZZXWpk2N9wQ=;
 b=S+HHhRWeiaCzmjAI9mozf3tSs2KImmQfHitl53YBVxJZag4uyiwKj1/xGuUo8Tc3am
 TNxfgijT8l7OHRmfx3hOhdgnx/Lb4EzE49qT3TEiJNfSDj+Anc8JiKXM3fyPLPzLVd8t
 0FhjmkEnm4YSVkcCH32ovSAvkT9tb1BZSloTEcBSdPSIqITSKjcIdD4Wr/NhztoLNZgZ
 WiTY1+IIY03gYBvDoR72iDaeWCHDlqzVKgvqeEI02v/nYfSBjFHXij35gfE1p7B4aIE0
 K/B741tYUhxm9wTcczSSv283G9jjUoVUdSjhyX5mIdBLMk5a0O60TL9u6+nId7kw4itM
 F1JQ==
X-Gm-Message-State: APuU4Z9W4M37tP2b0FGVHmehMCj9bH0ldPOhh5vw6JD6A71jz3UkAWP1
 wPJ7Cd+NGOixexXAo1DaUz17LldMEYVFG2sVca6/DqiNgIPzVigvj6qtACwbkjWx1EGUyEqpDoN
 UWCrpoqJjhnv4D8jGxJxPLPYbUcoNtg1PYTUMOLHxrtO3bIGdm6bkXSk=
X-Gm-Gg: AZFdTZdgp+3/vfzpgBC8hElPnXtDOYWM8yQ8XlAe14tlZFbelrHZHwEmVh5uWvBnvRH
 B+M7Qplx2V/wQ2X/j2yp8+qFjShHl9yzxbVLRiIwQIPFeRekJzqpjEGmC0ZqhBR2sWjwdPcHL8D
 W1PrijdwbMNQwt4T5B0p0rVb3VzlBrg2WbQjX/Pa+AhbOoQZXqFGM0JFkqwHKeU+vNcJxy9YEHy
 nHSTZNxvROAyaaJ5CcoPeO7LA6L/N+OYTgc6naMQDaDpBKWR7d7pYdbk2+3yDmztWGQ1uwWXaF2
 Pv7TRmPWebBweGIjjv0jTnaBx+NN2pADCpec5zW4MyFkFPdhI5qR1mut1jin4Hn4dKMX/UTOEbs
 HS2Zgjmt1nC2rYRWOgqsTUCr1qxkM88Z29BlNn1YvXpB9DAL3FponEjbRXpbQXTu2eQ==
X-Received: by 2002:a05:690c:e3cd:b0:8b0:c8be:f884 with SMTP id
 00721157ae682-8b518d25b6cmr87287117b3.1.1795706994256; Thu, 26 Nov 2026
 07:29:54 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261029164212.672884-1-dario.binacchi@amarulasolutions.com>
In-Reply-To: <20261029164212.672884-1-dario.binacchi@amarulasolutions.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Thu, 26 Nov 2026 16:29:43 +0100
X-Gm-Features: Aa3M54rzaRX4iAMwtFUO2zqiyCaPboMFEp4_JVrq0MNYr61Vhk_TNBPpMiVtvik
Message-ID: <CABGWkvoEU7jDQoeH8x4YtRLLUj+Tb8DdYs6r8Jm3LrcXKf9F3w@mail.gmail.com>
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 Fiona Klute <fiona.klute@gmx.de>, linux-amarula@amarulasolutions.com
Subject: Re: [Buildroot] [PATCH 1/1] package/eudev: S10udevd: wait for udevd
 before triggering events
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGVsbG8gYWxsLAoKT24gVGh1LCBPY3QgMjksIDIwMjYgYXQgNTo0MuKAr1BNIERhcmlvIEJpbmFj
Y2hpCjxkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbT4gd3JvdGU6Cj4KPiBzdGFy
dC1zdG9wLWRhZW1vbiBzdGFydHMgdWRldmQgaW4gdGhlIGJhY2tncm91bmQgYW5kIHJldHVybnMg
YmVmb3JlCj4gdWRldmQgbGlzdGVucyB0byBrZXJuZWwgZXZlbnRzLiBUaGUgY29sZHBsdWcgZXZl
bnRzIGdlbmVyYXRlZCByaWdodAo+IGFmdGVyIGJ5ICJ1ZGV2YWRtIHRyaWdnZXIiIG1heSB0aGVu
IGdldCBsb3N0LCBzbyB0aGF0IG5vIG1vZHVsZSBpcwo+IGxvYWRlZCBhdCBib290Ogo+Cj4gICBT
dGFydGluZyBuZXR3b3JrOiBXYWl0aW5nIGZvciBpbnRlcmZhY2UgZXRoMCB0byBhcHBlYXIuLi4u
Li4uLi4uLi4uLi4gdGltZW91dCEKPgo+IFdhaXQgdW50aWwgdWRldmQgYW5zd2VycyBvbiBpdHMg
Y29udHJvbCBzb2NrZXQgYmVmb3JlIHRyaWdnZXJpbmcgdGhlCj4gZXZlbnRzLgo+Cj4gRml4ZXM6
IDQxMjU4YTgxOTQ4ZmRkZmE3ZmM4YWMwNmI2OWQ3N2ZhMDUxYjc0NGQgKCJwYWNrYWdlL2V1ZGV2
OiByZWZhY3RvciBpbml0IHNjcmlwdCBhbmQgcmVuYW1lIGl0IHRvIFMxMHVkZXZkIikKPiBTaWdu
ZWQtb2ZmLWJ5OiBEYXJpbyBCaW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9u
cy5jb20+CgphIGdlbnRsZSBwaW5nIG9uIHRoaXMgcGF0Y2guIEl0IGZpeGVzIGEgYm9vdCByZWdy
ZXNzaW9uIChubyBtb2R1bGUKbG9hZGVkIGF0IGJvb3QsIHNpbmNlIHRoZSBjb2xkcGx1ZyBldmVu
dHMgY2FuIGdldCBsb3N0KSBhbmQgaXQgc3RpbGwKYXBwbGllcyBjbGVhbmx5IG9uIHRoZSBjdXJy
ZW50IG1hc3Rlci4KClRoYW5rcyBhbmQgcmVnYXJkcywKRGFyaW8KCj4gLS0tCj4gIHBhY2thZ2Uv
ZXVkZXYvUzEwdWRldmQgfCA4ICsrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlv
bnMoKykKPgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2V1ZGV2L1MxMHVkZXZkIGIvcGFja2FnZS9l
dWRldi9TMTB1ZGV2ZAo+IGluZGV4IDhiYjhmNmViM2EwMS4uNjYwMmU5MmMyYzg2IDEwMDY0NAo+
IC0tLSBhL3BhY2thZ2UvZXVkZXYvUzEwdWRldmQKPiArKysgYi9wYWNrYWdlL2V1ZGV2L1MxMHVk
ZXZkCj4gQEAgLTM1LDYgKzM1LDE0IEBAIHN0YXJ0KCkgewo+ICAgICAgICAgc3RhdHVzPSQ/Cj4g
ICAgICAgICBpZiBbICIkc3RhdHVzIiAtZXEgMCBdOyB0aGVuCj4gICAgICAgICAgICAgICAgIGVj
aG8gIk9LIgo+ICsgICAgICAgICAgICAgICAjIHN0YXJ0LXN0b3AtZGFlbW9uIHJldHVybnMgYmVm
b3JlIHVkZXZkIGxpc3RlbnMgdG8ga2VybmVsIGV2ZW50czoKPiArICAgICAgICAgICAgICAgIyB3
YWl0IGZvciBpdCwgb3IgdGhlIGV2ZW50cyB0cmlnZ2VyZWQgYmVsb3cgbWF5IGdldCBsb3N0Cj4g
KyAgICAgICAgICAgICAgIGk9MAo+ICsgICAgICAgICAgICAgICB3aGlsZSAhIHVkZXZhZG0gY29u
dHJvbCAtLXN0YXJ0LWV4ZWMtcXVldWUgMj4vZGV2L251bGw7IGRvCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgaT0kKChpICsgMSkpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgWyAiJGkiIC1n
ZSA1MCBdICYmIGJyZWFrCj4gKyAgICAgICAgICAgICAgICAgICAgICAgc2xlZXAgMC4xCj4gKyAg
ICAgICAgICAgICAgIGRvbmUKPiAgICAgICAgIGVsc2UKPiAgICAgICAgICAgICAgICAgZWNobyAi
RkFJTCIKPiAgICAgICAgIGZpCj4gLS0KPiAyLjQzLjAKPgoKCi0tIApEYXJpbyBCaW5hY2NoaQpT
ZW5pb3IgRW1iZWRkZWQgU29mdHdhcmUgRW5naW5lZXIKTS4gKzM5IDMyOCAwNjI1MjQ2CmRhcmlv
LmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tCuKAleKAleKAleKAleKAleKAleKAleKAleKA
leKAleKAleKAleKAleKAleKAlQpBbWFydWxhIFNvbHV0aW9ucyBTUkwKIFZpYSBGZWxpY2UgQ2F2
YWxsb3R0aSAyNUQsIDQxMDEyIENhcnBpLCBNTywgSVQKaW5mb0BhbWFydWxhc29sdXRpb25zLmNv
bQp3d3cuYW1hcnVsYXNvbHV0aW9ucy5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
