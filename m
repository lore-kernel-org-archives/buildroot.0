Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB209606A333
	for <buildroot@archiver.kernel.org>; Tue, 10 Nov 2026 21:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=JDLIDamD
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D24B60AB4;
	Tue, 10 Nov 2026 21:49:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ii_29uYXxhos; Tue, 10 Nov 2026 21:49:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D2B2F60AA8
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794347346;
	b=P0xVZGtKYOZnEtvyy3zY7/3vWHdPBnoUmWNOuoNB/JYXlKHnOsAfViN7jKQBaCvE8kx3
	 Aluxndd79PjAKa0lkMVH7M2MSLvD0xoxtHHr/8KmCtTxS7MxtPg3FYSrh1lM1kx+NnF8h
	 V5DwyHzhY7pkSO44KVGlYbmuGfLb90gvneRO3drNvgWZd+FKeDiySlkqAj2Y1m5/9w5zJ
	 Waxn2jGIAVoYuNppM5knuYVsLGMJ3IwECIJ6AbH0+bTnbepn5YtS96s4NXhxDzG24Xm3U
	 mE1U9T+6WL9ZIJ3khz1CqSX2kv1qYw4yWcrqHyeML+a9TY8WtIH0ciqf52u6Nf83wiQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794347346;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:Date:X-Gm-Features:Message-ID:To:
	 Cc:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=rhCJBol8IhwyEQupn4ALipsniveTUeUGEkKbHsiQEkE=;
	b=ilSPd/N9UIVsGvST/GmdM8U5OdAK7Hzge77srQso0K6VlpjYIyd/tKNeNnvH4dSIMMHv
	 VW+F0+Z+duWQDKQHsqy/ZP7qbMlfrom2vbNFw/Ho16n17ymIjtEtwrQ13+4Zt7zlAsybC
	 lFBidx8syPScPnsfbUdZ4jcHjUZ/IVu7tUkEcjgipL/LuLydhOcKoHqJG0zjrYoGdEib9
	 CXclSeKfkmQUBvmAndmQo3AtDL0WVCAw2hI5U0ZPZ9soZLy0O4XzXbzz8I8SJ6s9i5H3d
	 EOqYs7CuG+vcoSQpgsSsHmtZEU5A9+ubHzAyhRHPcFnh7PvlWy4WjkwCXTqRp9DUkpA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794347345;
	bh=rhCJBol8IhwyEQupn4ALipsniveTUeUGEkKbHsiQEkE=;
	h=References:In-Reply-To:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JDLIDamDuLL0pcgqAx1mTBTQzvFL5bfNBv0qawhX3TZTGIO65nvBvnbk3J+LTwAK+
	 P3fDIknjtRpMb9LIrRnJJ1aGj5CFzsrZaX0L178p2tggtA6+F8FYVCaboJ9F1dbXOn
	 uCmI3RZJIKR4XD0rBL3cTLjO6Cs0sUgcbsi4fPEr6McF2uFzfzp6X5XepW741GVb+k
	 RG4Nx7YrvphbJRZzQLQnB0hgjwZBmYeWrwZj9i6tlBMT7E2oYTmJLuWU6qFQzgc4m8
	 ygQvqz/uTatIWcJbj5/64D/+5XGGqR+j2RM/MQjFfrtgFdRBeAj3PouHu37ypJdX24
	 tHthMUAzDQgaQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2B2F60AA8;
	Tue, 10 Nov 2026 21:49:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 42570731
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 21:49:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F8B381415
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 21:49:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VtbKG05w72dq for <buildroot@buildroot.org>;
 Tue, 10 Nov 2026 21:49:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 34ECE81414
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 34ECE81414
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 21:49:03 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-c40e30c26a4so384864366b.0
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 13:49:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794347342; x=1794952142;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=7buersOn/44+kVVbvN94pYeZ3jljPIm/dPcL0HpPLNQ=;
 b=Fz925um6wuMzXu28S9SQXq2+HpYpf4UcikUq21oC0Ii+BK0niTZO3Xb56KaXmOunVF
 3Z0pzFLqmvRw/nr8lnlLdsFuaZTbS9tAPNssrwIjy9pxibuQQRq7Cbi0PN5uVSBnnJeA
 YrQSKlgsJvdjhNdlLOPeTOCzbiRJCWWu0hTCSOW/Pch8WtvlR79wfXVbIo1GvRCWWz8t
 XOaSUAkT5s7az84l+UqKeGgqggFQuj+qg7MkoxtSVP3qitH7J82pyBrqRdOgGLJ0dmXG
 HcKA0g2gmriwOX3xEWDwgDd8k/tJ49ES80Z1cId/amUW/81ta2qZPI5zH6nQwJ3UPFzB
 J3rA==
X-Gm-Message-State: APuU4Z/f+FGtHT57djI8GKwUQAz2Pw7yJuPp/v73/g1L/IGev1j7LMk9
 xx7Ot9TaFCQsj0w/+6PULbcdPvT15QdcaWqBGC1/jou6al7uK+dy1q/K0Yv8hriwcQWd7/M+77H
 QJPB070t7R3RYvN5LkBOo6R9AVmb749g=
X-Gm-Gg: AYBFou3Zgzirez5zVfX7kmO/M4wPhMTJ7reU7Z8OUAIYOTmBGmnYP7fGurXbzNr4FCE
 ahrZgacrTv8f8S0pJlT7qfakU5Uqv7lpDWgJECjcoGvlNEL1UboeQWt8nK3id8qQiMNRmjSPK/w
 uUshtrQT8NpuYgSbPNlluezyHtSied1SpoTogH+7USFY3zV3DsXfIGrNMI5xAxAVxJePScvhR/D
 xEZ7X63sn3VMze9aOuy9S4SQLjPPN+UxO5nMFAPYgVmHOFFLhzOAy/GfW0842K5XzXp4C3+/s7c
 r68591XmO7JgfsHmIOAee2nn4EG/qabq8rUEulqD+BiklsISDr85KkLQyDCU4jSQBB/4aDO+diP
 TUYFxedaF42mqmE1N496sei8tAZN64wS1BhajdKY=
X-Received: by 2002:a17:907:6e89:b0:c3e:d0ca:d30a with SMTP id
 a640c23a62f3a-c5066a7e866mr34643866b.4.1794347341738; Tue, 10 Nov 2026
 13:49:01 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261110140830.3359501-1-yegorslists@googlemail.com>
 <87v764tx8k.fsf@dell.be.48ers.dk>
In-Reply-To: <87v764tx8k.fsf@dell.be.48ers.dk>
Date: Tue, 10 Nov 2026 22:49:25 +0100
X-Gm-Features: AclHuK_zQfoufoL5b6GSmN1t0iIciFpm9SYEESMpgjGjnvaHWN5s46gccDyVwAM
Message-ID: <CAGm1_kuJsUerY5Fg9dAPRBs_jDtj3mbrFUHw51v51rfiSn+XDg@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org, Ash Charles <ashcharles@gmail.com>
Subject: Re: [Buildroot] [PATCH] package/pru-software-support: download from
 git
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgUGV0ZXIsCgpPbiBUdWUsIE5vdiAxMCwgMjAyNiBhdCA2OjI14oCvUE0gUGV0ZXIgS29yc2dh
YXJkIDxwZXRlckBrb3JzZ2FhcmQuY29tPiB3cm90ZToKPgo+ID4+Pj4+ICJZZWdvciIgPT0gWWVn
b3IgWWVmcmVtb3YgPHllZ29yc2xpc3RzQGdvb2dsZW1haWwuY29tPiB3cml0ZXM6Cj4KPiAgPiBn
aXQudGkuY29tIG5vIGxvbmdlciBzZXJ2ZXMgY2dpdCBzbmFwc2hvdHMuIERvd25sb2FkaW5nIHRo
ZSB0YXJiYWxsCj4gID4gbm93IGZhaWxzIHdpdGggSFRUUCA0MDAgYW5kIHRoZSBtZXNzYWdlOgo+
Cj4gID4gICBVbnN1cHBvcnRlZCBzbmFwc2hvdCBmb3JtYXQ6IHBydS1zb2Z0d2FyZS1zdXBwb3J0
LXBhY2thZ2UtdjYuMC4xLnRhci5nego+Cj4gSSBkbyBnZXQgdGhhdCA0MDAgQmFkIFJlcXVlc3Qs
IGJ1dCBJIGRvIG5vdCBzZWUgdGhhdCBlcnJvciBtZXNzYWdlPwoKVGhlIG1lc3NhZ2UgaXMgaW4g
dGhlIGJvZHkgb2YgdGhlIDQwMCByZXNwb25zZSwgc28gaXQgb25seSBzaG93cyB1cCB3aXRoCmUu
Zy4gY3VybCA8dXJsPjsgd2dldCAoYW5kIHRodXMgQnVpbGRyb290KSBvbmx5IHByaW50cyB0aGUg
c3RhdHVzIGxpbmUuCmdpdC50aS5jb20gY3VycmVudGx5IGFuc3dlcnMgNTAzIChtYWludGVuYW5j
ZSksIHNvIEkgY2FuJ3Qgc2hvdyBpdAphZ2FpbiByaWdodCBub3cuCgpZZWdvcgoKPgo+ICA+IEFs
bCBvdGhlciBhcmNoaXZlIGZvcm1hdHMgZmFpbCB0aGUgc2FtZSB3YXksIGFuZCB0aGUgdGFnIHBh
Z2Ugbm8gbG9uZ2VyCj4gID4gb2ZmZXJzIGFueSBkb3dubG9hZCBsaW5rcy4gVGhlIHBhY2thZ2Ug
aXMgY3VycmVudGx5IG9ubHkgZmV0Y2hlZCB0aGFua3MKPiAgPiB0byB0aGUgY29weSBvbiBzb3Vy
Y2VzLmJ1aWxkcm9vdC5uZXQuCj4KPiAgPiBGZXRjaCB0aGUgdjYuMC4xIHRhZyBmcm9tIHRoZSBn
aXQgcmVwb3NpdG9yeSBpbnN0ZWFkLCB3aGljaCBpcyBzdGlsbAo+ICA+IGF2YWlsYWJsZS4gVGhl
IGNvbnRlbnRzIG9mIHRoZSBnZW5lcmF0ZWQgdGFyYmFsbCBhcmUgaWRlbnRpY2FsIHRvIHRoZQo+
ICA+IHByZXZpb3VzIHNuYXBzaG90IHRhcmJhbGwuIE9ubHkgaXRzIGhhc2ggY2hhbmdlcy4gVGhl
IGxpY2Vuc2UgZmlsZQo+ICA+IGlzIHVuY2hhbmdlZC4KPgo+ICA+IEFzIHRoaXMgaXMgYSBjaGFu
Z2Ugb24gdGhlIFRJIHNlcnZlciBzaWRlLCBhbGwgbWFpbnRhaW5lZCBicmFuY2hlcwo+ICA+ICgy
MDI1LjAyLnggYW5kIGxhdGVyKSB1c2UgdGhlIHNhbWUgc25hcHNob3QgVVJMIGFuZCBhcmUgYWZm
ZWN0ZWQuCj4KPiAgPiBBc3Npc3RlZC1ieTogQ2xhdWRlOmNsYXVkZS1vcHVzLTUtNQo+ICA+IFNp
Z25lZC1vZmYtYnk6IFllZ29yIFllZnJlbW92IDx5ZWdvcnNsaXN0c0Bnb29nbGVtYWlsLmNvbT4K
Pgo+IENvbW1pdHRlZCwgdGhhbmtzLgo+Cj4gLS0KPiBCeWUsIFBldGVyIEtvcnNnYWFyZApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
