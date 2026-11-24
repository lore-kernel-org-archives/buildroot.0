Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922E5606A321
	for <buildroot@archiver.kernel.org>; Tue, 24 Nov 2026 09:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=OB2XOEVM
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 674C1607C3;
	Tue, 24 Nov 2026 09:34:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dF6qmKR8xkWk; Tue, 24 Nov 2026 09:33:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7448B605F3
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795512839;
	b=qAyUMoZEiGOYgnefeHamgzyU8loaRwetlFKWMdibeRkOa5hJ3M11CfIPRgrVvKgKdfdn
	 jWkaeCIsOTOSKk+GflBMlwnt62GcWQUeyPtt5kakXcSmW4KHBILXaw28Pcvv8pURLzuyX
	 u4G2/cOaqNzUhJJGdStR7vSChugnhYXkLhKiuuqa8zIcgBfNhvPBQfiEkpc12t81a+1gJ
	 tBE1kIZFlz614r1FueBjt8kq8OE6NxIR7yoSViY1YynPOifbeIHPhg0F445YZY800moGY
	 jlkV0LGDg7w3VZEE3IhG5B+LUfQeJoVlIoUdgVDbonjhgm5Q5OnBJ/OdWDCh/7b7/rA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795512839;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:Date:X-Gm-Features:Message-ID:To:
	 Cc:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=PYpuhIvyD2q18TCxTJsd793Hyn1zEDwrn8aHqCa1bXs=;
	b=sM+j20lQ0K1192xONk1wmkbiRAd425A4IPO6bBAekHeO5803fVFxxGdomgaAoBEr6MH1
	 L0LOXZaw5w+dtf56P6J4fvDquSK+SYUelqtFHuL6HLrjGpGW4k9K5Ae3ZGutIoL36mxy0
	 +pHqpfeD6/AETRqKH53CZPMqV0XebitBsZXHQ742u0xnU9YIcnSHnjNwrreaBQa7YxB1T
	 IqQewfRhW+WSe62gnNfqm7gnysFRWVqeg86pllR7N53uTkMYVOVR8idwGc9JfZxwchyWA
	 jJk1Yf8cM09SHUiUUvCD65Lxyg0O8XJo55iZPtZlvvnFFkmyVGn05CMYB6EEmyDXeIQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795512839;
	bh=PYpuhIvyD2q18TCxTJsd793Hyn1zEDwrn8aHqCa1bXs=;
	h=References:In-Reply-To:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OB2XOEVM2tTRtbf4kYQw+5BfJ+FRw4RUx1F+zErhB+JMS0TKjziIbFCaiSlttYuGi
	 psfGgc/CeAExWTacwLSPxspi3D6JsZN/dC2HH3o/fDoOvDUTIZR65Fqawc45H5fKBh
	 dzCogXBYzt2Ed5DoxvOuibBdSpv4zDdJzi0+YiO+EqvT4rUSV7uV2Xtqu4zLfih7JW
	 cMDT3cv42rDZDo2exZTKp+xz9NWHABZfxfICsR5hKvpnesa7iQUawOumkeKzB2w1Bf
	 6U88/LOOOm20ozAg9N/W9squc0lQ7Bfa+Hq0B8cItIfq8u3YMQ7of7ICzoXNrYncTr
	 0p0s2dFybuoeA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7448B605F3;
	Tue, 24 Nov 2026 09:33:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9DDBAFBB
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 09:33:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E49540675
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 09:33:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R9YkIdy_HCal for <buildroot@buildroot.org>;
 Tue, 24 Nov 2026 09:33:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1B9B0405ED
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1B9B0405ED
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 09:33:56 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-6b8786bb305so5209310a12.0
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 01:33:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795512835; x=1796117635;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=+rEniS1YGnXnlYR9QPzIxI3uhqv0GHj6pgjFw+8RBZg=;
 b=cR62moXp9ZV4jBXlSsZqIxBldpw4aB9i20ZoOjXaLfzeV5aNuX7AxRIcrXqKP0Z/p0
 9rpf9/GpjlDV0qUTuanZi2NkZLQVlF/t7hpwq/8fbSV7ogTBkAqr95frwQ3A8CFNhVim
 F08Jgy5AKFNMZnN4ILPq2+04dGHQBQT5xht4puNRd8i9LDlyvNvusKwB4OHgDwkjha82
 JSP1Gkwd7ceVE2cFZ6TcJZCNE/NNpl3pIRGVgL+a0iIIRjl3BRZzIXBK85daHkHGXwwu
 681mBiVfwIGy/RVnB/a7zHTX76LKa7wRkrESRpC5paNKoGyugN/TCS+4iIKgTiQUFKeA
 yf7g==
X-Gm-Message-State: APuU4Z/bFq+mtF2mwKqXzYjo8pmjrBim+Z9UUusFNSeJjG63qRzJa88f
 hmyKXzpWWcy5+t5JDUpCCKSE0WfFShoVS9jeNTWiJ9D5BJ4xtB3z/sKalYOxzx1lk73r+D5xQgj
 /UtR1PMv5Bl0HqutXiGtWvYxaBhx3PT92IA==
X-Gm-Gg: AZFdTZcm8ESzzIvR1iwpAbHAQJuB1Osd58qHwQaMnfLQ74dQaku2Y5IAppVXUzlzoYm
 KrmLaLSnXYen/tRbgqLXE2khOdK02dzBMCncdDC2OLzWlNHCkJ/FLwhmnKY43+S2X7BkwoZy7zb
 /f8rNZSSwEtxXK3npcMmmrCSJs2x5z8kxdyissH51ZWPsfhp26t+Zsv64DtBtc4yRpfPQYtCZmG
 HzqKnvWnjmod6KQpKiCOha3yWCdA1RwH/q0dNcGCTK+6m1YrJyekCw3Yc/0b5lcAdhlbpMHRoyR
 5i2pewuocLIotqESv+rS0eb2qPlSwxLhpEMzfQnHt7oqJae1idrot2f7fWo4j4uiy1KI4EcgHpc
 WWPNI3AR9nL8Vl5Wca23x2ncgCpUW2hErkEaAIg==
X-Received: by 2002:a05:6402:4001:b0:6b7:a357:3761 with SMTP id
 4fb4d7f45d1cf-6ba37ec0a9fmr9735304a12.31.1795512834889; Tue, 24 Nov 2026
 01:33:54 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261119073315.2434687-1-yegorslists@googlemail.com>
 <1a209b2b616.51eb13e963198.391130447023137848@bubbl-tek.com>
In-Reply-To: <1a209b2b616.51eb13e963198.391130447023137848@bubbl-tek.com>
Date: Tue, 24 Nov 2026 10:34:26 +0100
X-Gm-Features: Aa3M54pxv3kvueqxDcYZ3N92pV7H8FDN0u8xHrAdrFiaC6OI10M-UoGyvVyH5B4
Message-ID: <CAGm1_kuu1Bo3K6ZebGUOXr66V6A1miFHVV+RDVB4MO16X60QsQ@mail.gmail.com>
To: Aaron Sierra <aaron@bubbl-tek.com>
Cc: buildroot <buildroot@buildroot.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [Buildroot] [PATCH] package/iotools: fix build with musl on
 PowerPC
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
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgQWFyb24sCgpPbiBNb24sIE5vdiAyMywgMjAyNiBhdCA3OjM34oCvUE0gQWFyb24gU2llcnJh
IDxhYXJvbkBidWJibC10ZWsuY29tPiB3cm90ZToKPgo+IEhpIFllZ29yLAo+Cj4gPiBGcm9tOiBZ
ZWdvciBZZWZyZW1vdiB2aWEgYnVpbGRyb290IDxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4KPiA+
IENjOiAiQW5keSBTaGV2Y2hlbmtvIjxhbmR5LnNoZXZjaGVua29AZ21haWwuY29tPgo+ID4gRGF0
ZTogVGh1LCAxOSBOb3YgMjAyNiAwMTozMzoxNSAtMDYwMAo+ID4gU3ViamVjdDogW0J1aWxkcm9v
dF0gW1BBVENIXSBwYWNrYWdlL2lvdG9vbHM6IGZpeCBidWlsZCB3aXRoIG11c2wgb24gUG93ZXJQ
Qwo+Cj4gLi4uCj4KPiA+IEJhY2twb3J0IHRoZSB1cHN0cmVhbSBmaXgsIHdoaWNoIGRlZmluZXMg
X0xBUkdFRklMRTY0X1NPVVJDRSBpbnN0ZWFkLgo+ID4KPiA+IFRoaXMgaXNzdWUgaGFzIGJlZW4g
cHJlc2VudCBzaW5jZSBjb21taXQgYWE3MjE3Mjc2ZDBkICgicGFja2FnZS9pb3Rvb2xzOgo+ID4g
bmV3IHBhY2thZ2UiKSwgYXMgc2NvbS5jIGFscmVhZHkgdXNlZCB0aGlzIEFQSSBpbiB2ZXJzaW9u
IDEuNy4gSXQKPiA+IHRoZXJlZm9yZSBhZmZlY3RzIDIwMjQuMTEgYW5kIGxhdGVyLCBhbmQgYWxs
IG1haW50ZW5hbmNlIGJyYW5jaGVzLgo+Cj4gUGVyaGFwcyB0aGUgYmFja3BvcnQgcmVxdWVzdCBp
cyBhIENsYXVkZSBxdWlyaywgc2luY2UgdGhlIHBhdGNoIHRvIGZpeCBQUEMvbXVzbCBidWlsZHMg
bGFuZGVkIGluIHRoZSB1cHN0cmVhbSBtYXN0ZXIgYnJhbmNoIGluIEZlYnJ1YXJ5IGxhc3QgeWVh
cjoKPiBodHRwczovL2dpdGh1Yi5jb20vYW5keS1zaGV2L2lvdG9vbHMvY29tbWl0LzdkZDcwYjAy
MDhhNWE5ODU2ZjFkODBhYjgwOTc3MzZmODhmMjQ1MmIKPgo+IElzIGl0IHJpZ2h0IHRvIHVuZGVy
c3RhbmQgdGhpcyBhcyBhIHJlcXVlc3QgZm9yIGEgbmV3IHVwc3RyZWFtIHRhZyAoMS45LCBwZXJo
YXBzKSBhbmQgY29ycmVzcG9uZGluZyBwYWNrYWdlIGJ1bXA/CgpZZXMgYW5kIG5vLiBBbiB1cHN0
cmVhbSB2ZXJzaW9uIGJ1bXAgaXMgYWx3YXlzIGFwcHJlY2lhdGVkLiBCdXQgdGhlIHN0aWxsCm1h
aW50YWluZWQgcmVsZWFzZXMgZnJvbSAyMDI0LjExIHRpbGwgdGhlIGN1cnJlbnQgcmVsZWFzZSB3
aWxsIGhhdmUgdG8KYXBwbHkgdGhlIHBhdGNoIHRvIHRoZSBjdXJyZW50IGlvdG9vbHMgdmVyc2lv
bi4gVGhpcyBpcyBwcmVmZXJhYmxlIHRvCmJ1bXBpbmcgdGhlIHZlcnNpb24uCgoKWWVnb3IKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
