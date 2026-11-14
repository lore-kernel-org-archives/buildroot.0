Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9272D606A327
	for <buildroot@archiver.kernel.org>; Sat, 14 Nov 2026 23:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=eibfCnIh;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=EmRIheJ8
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55C76606CA;
	Sat, 14 Nov 2026 23:42:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pidPPEhK9RkR; Sat, 14 Nov 2026 23:42:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 88DCE606A0
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794699723;
	b=AAw+v1T5z3bItbxFWROfTQyIKi3fVfOP6ftcpjJXjzr9hrYmgOIf6+zCXsXk1VhapcJT
	 O9JvZirTgEPQDWhF4/Ir8tH3dicC0wAh8owP3xPmVssgReh6UaVsKnhfrB6TAAvSx+5RY
	 Jxv0xesTKnHzI+kQpXE1OFw1JcT7ET9Id/LrxQ7oEkZ4t+xWnZBhNw75SdEgaDyZ8lUTk
	 i3fxFtz+zei6DWIjsFjtIu40ihDM571vUKauZQD+Sa4IYirbdjAVwEjGZjzfTcVL4NjYI
	 vyey63Y60U4oWJLKlOesKuU0nfdCSSTezRdJa3+RqKrdlOIL3OuSFC4j2KKtoWIJC/g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794699723;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:To:Cc:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=j0oEKXi4DOrqvjjj5y0ul/1nzAQd3qYdkwcxR0r9y2Q=;
	b=G22JuI/9Fmg8FMp3NWqiBDSiV3h3UtwG8xcDdToyBGIKIiYvAbxbthwkRvZXAIoEyCh9
	 u/AJw4YtdRrn2GGWcH2y//hW94eA8nuhm28futYtJrH4fNvDeGXi+lAUbf3vjdK2ESXoe
	 3STGjkWfqCkAUAvWn9F/pc/+OGaOwPZLfZLxhscG2FD6cIqmdlly7bmlG65lvKTUfqSPx
	 xduC10MimNBFamY7GlauOo0sp5ugkSzCcIaHgh2pGmqUkebLeUCCBFF5zvsGsrHycJrLG
	 4RZdJRKSN7PFmuDxzUd7qj5GA4Qn3+N04WOMFAT+ZtSMT1X0EWL+R/V4SevX+/02ybA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	dmarc=pass header.from=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=EmRIheJ8;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794699723;
	bh=j0oEKXi4DOrqvjjj5y0ul/1nzAQd3qYdkwcxR0r9y2Q=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eibfCnIhujD7/dtlF9luU7gJ1S2ZmRnlGl7Xu0xbsjo0bUDK4TGv88hbmOrjbNZTv
	 UMq+V57KR3PFn2Z2PT8QLY1urnZ42SKd6BpzzdrPB5FvAypziMoJ8xCXg9JNBss4XO
	 0U0xsSWYrZ/rWy7WZhOa3O1BECtN1fRFbwBGSLcD1CbhQjOlz2J3kBMtfQSCs70zMQ
	 tieouC6nb6QupIrI2GX0YXeFt1ix5lXMTlRVqBKBhMmgk+NcQ9maFms3766ESstsvx
	 PMnCXEU1Bnjb/A4MCTUwXrboO03ZE2jFXvRwK4m0oEv65qiXxclTwDMSDSWZr+5Up1
	 46uSfKZBy80sQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88DCE606A0;
	Sat, 14 Nov 2026 23:42:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 831BA169
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 23:42:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 61323606A0
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 23:42:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lEOeHBWmsDba for <buildroot@buildroot.org>;
 Sat, 14 Nov 2026 23:42:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 21D6C60634
Authentication-Results: smtp3.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2a00:1450:4864:20::533"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20260707 header.b=EmRIheJ8
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 21D6C60634
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 23:41:59 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-6b7221c0f2cso3743710a12.3
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 15:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20260707; t=1794699718; x=1795304518; darn=buildroot.org; 
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=xQdj69ykDJpVERFN1x0Vik+cF1d4upgkWRwa2AzZQtc=;
 b=EmRIheJ8mMI43rSZOm6YukPMBoKu0C38aCYD0znyJdDZJYpdUJFINRuYgfupGXyqHk
 ugpDNP2bBPjeChP0PlazShy/htyrqzsqLt2so9j8zV5zGjGHzOR/qXv5n1jsp7Uj4XZL
 2xypKpgSbJkOOtBQsRsLO5iWYpXX4QctUj9rHZnU5BO+IKHIfwPmReSFMpmUBdui5LG6
 IFQgmCQOfucbtXWH+O2kyqJd0ve78uAX5ejMYWmcAx10oRggR8pHaAo1v2rX4cOFBZSg
 iLL+NSrsTMeqnvRvmFwB4837IdQznfmYJo5cx1DF4wm6CJPg3fIuw6Y4TatgPDhNd+JA
 zEIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794699718; x=1795304518;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=xQdj69ykDJpVERFN1x0Vik+cF1d4upgkWRwa2AzZQtc=;
 b=WxBJHrx1XgTa2sv+HEHS4jS0YAppSHE+aYfzVDi1qs8MAnpNf4pLdrODbCH1QxwHgO
 /02BG1XSnXeYL77npaCF7ov5NiW8hE2uvzKU0pUQgRKdMj2BRy6WUL+FsPsL3FlcCDFy
 /MhsCcw7mhwENetZ7pSN0m5zzfb4xl0uL9jvket1YqIXc1t6sgx4UgS3vICmnAdLwNtC
 pnlPw/aFFDQ1ccKs3F5OcROv34Yj78RNY85V1f9NNDX67y9RV42RS2dtwpSO0y6iAuEO
 rk9GA9Zweerd9Pnj7IfEHcCLb5vCaiffpv+Wu58fYJUkGf19M5+R8Xt1C6LqhLfjrMfm
 ovGQ==
X-Gm-Message-State: APuU4Z9gve/n6yHU6ExUWqhu49GSiq4Azv1F2j8zun4c5x9taTuuiLMf
 8agTXelkunktJXFe2Jx7vGeszVuBY7h9Z5lRcFb8Pb0htXHXSKG/qE38MTt8WkQk50LbLEv460A
 dEFKACe3PJ9s7OMFbSqtnThvqkF6oNKCQkw==
X-Gm-Gg: AYBFou3iSAK/v62ZknM9MMZVjPrETU2xAzrLX5u5OAi9r5eikXl9BdKrrwv7x9ijq3E
 iERGZyVAqGA/z4sCUZjp9SfkjTIomTs0WunwNrp5klhT4ZbczYaHHWeoNUKOVBA0kjy9yMX4IUN
 IlK4eudnwj3FIqs6jiO9CAAJ2fA6gwuulIkJQP/po6v3yTB5sDExJ8pa8aa5Imv0IjIMZlJYt9h
 bw0tn/wWgHK/8sCHIIzefcfFtBQNa3FowTSWWkb4wH+Pku6pc46SuBU8sPeEWgpP8IDcpyFezPD
 zCLeGJ+B5yIwzSvsW/LgB50iYsoxUVVNVL+oW7iDx4PXm+KSc/yA1f/ffyBcC3cc7SYtOH4X6/T
 n/0DSP9YKEjEYjyFfxlxoe0PvLm5RYRxFQrN4mg==
X-Received: by 2002:aa7:ca50:0:b0:6b3:e89b:126a with SMTP id
 4fb4d7f45d1cf-6b7c0957c29mr4014375a12.12.1794699717702; Sat, 14 Nov 2026
 15:41:57 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261112100822.3298943-1-yegorslists@googlemail.com>
 <87bj7rg394.fsf@dell.be.48ers.dk>
In-Reply-To: <87bj7rg394.fsf@dell.be.48ers.dk>
From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sun, 15 Nov 2026 00:42:23 +0100
X-Gm-Features: AclHuK9K-FisQE2xkZmjbYkBcr71OJpudojKnklUDMIiWlhTxTSBiwFAusaqkMg
Message-ID: <CAGm1_ktugsJe2cNGk_=3k0T_LCu8fV-=fvVPDLcTqZZksXi7Rg@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Yegor Yefremov via buildroot <buildroot@buildroot.org>,
 Bernd Kuhls <bernd@kuhls.net>, Thomas Perale <thomas.perale@mind.be>
Subject: Re: [Buildroot] [PATCH] package/prboom: fix build with GCC 14
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgUGV0ZXIsCgpPbiBTYXQsIE5vdiAxNCwgMjAyNiBhdCAxMDo0MOKAr0FNIFBldGVyIEtvcnNn
YWFyZCA8cGV0ZXJAa29yc2dhYXJkLmNvbT4gd3JvdGU6Cj4KPiA+Pj4+PiAiWWVnb3IiID09IFll
Z29yIFllZnJlbW92IHZpYSBidWlsZHJvb3QgPGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPiB3cml0
ZXM6Cj4KPiAgPiBTaW5jZSBhdXRvY29uZiAyLjczLCBBQ19QUk9HX0NDIGVuYWJsZXMgQzIzIHdp
dGggLXN0ZD1nbnUyMyB3aGVuIHRoZQo+ICA+IGNvbXBpbGVyIGFjY2VwdHMgaXQsIHdoaWNoIEdD
QyAxNCBkb2VzLiBBcyBwcmJvb20gaXMgYXV0b3JlY29uZmlndXJlZCwKPiAgPiBpdCBpcyB0aGVu
IGJ1aWx0IGluIEMyMyBtb2RlLCB3aGVyZSBmYWxzZSBhbmQgdHJ1ZSBhcmUga2V5d29yZHM6Cj4K
PiAgPiAuLi8uLi9zcmMvZG9vbXR5cGUuaDo0ODoxNTogZXJyb3I6IGV4cGVjdGVkIGlkZW50aWZp
ZXIgYmVmb3JlICdmYWxzZScKPiAgPiAgICA0OCB8IHR5cGVkZWYgZW51bSB7ZmFsc2UsIHRydWV9
IGJvb2xlYW47Cj4gID4gICAgICAgfCAgICAgICAgICAgICAgIF5+fn5+Cj4KPiAgPiBDb21taXQg
MmViNzJlNzY2NiAoInBhY2thZ2UvcHJib29tOiBmaXggYnVpbGQgdy8gZ2NjLTE1IikgYWxyZWFk
eQo+ICA+IGZvcmNlcyAtc3RkPWdudTE4IHRvIGF2b2lkIHRoaXMsIGJ1dCBvbmx5IGZvciBHQ0Mg
Pj0gMTUsIHdoZXJlIEMyMyBpcwo+ICA+IHRoZSBkZWZhdWx0LiBBcHBseSBpdCBmcm9tIEdDQyAx
NCBvbi4gV2l0aCAtc3RkPWdudTE4IGluIENGTEFHUywgdGhlCj4gID4gY29uZmlndXJlIEMyMyBj
aGVjayBmYWlscyBhbmQgLXN0ZD1nbnUyMyBpcyBubyBsb25nZXIgYWRkZWQuCj4KPiAgPiBUaGlz
IGlzc3VlIGhhcyBiZWVuIHByZXNlbnQgc2luY2UgY29tbWl0IGE2ZThjMDdhMzMwYQo+ICA+ICgi
cGFja2FnZS9hdXRvY29uZjogYnVtcCB2ZXJzaW9uIHRvIDIuNzMiKSwgYXMgYXV0b2NvbmYgMi43
MiBuZXZlcgo+ICA+IHNlbGVjdGVkIEMyMy4gSXQgdGhlcmVmb3JlIGFmZmVjdHMgMjAyNi4wOCBh
bmQgbGF0ZXIuIFRoZSAyMDI2LjA1LnggYW5kCj4gID4gb2xkZXIgbWFpbnRlbmFuY2UgYnJhbmNo
ZXMgc3RpbGwgdXNlIGF1dG9jb25mIDIuNzIgYW5kIGFyZSBub3QKPiAgPiBhZmZlY3RlZC4KPgo+
ICA+IEZpeGVzOgo+ICA+IGh0dHBzOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy83
ZDUwNTBjNTRiYTgzMTlmMGZkNTgzMzY4NTExMjFmNWUxMjdiMWFhCj4KPiAgPiBGaXhlczogYTZl
OGMwN2EzMzBhMzg5ZTk1NzhkOGYxMTEwZTQxYmVjYWMyNjRkMiAoInBhY2thZ2UvYXV0b2NvbmY6
IGJ1bXAgdmVyc2lvbiB0byAyLjczIikKPiAgPiBBc3Npc3RlZC1ieTogQ2xhdWRlOmNsYXVkZS1v
cHVzLTUtNQo+ICA+IFNpZ25lZC1vZmYtYnk6IFllZ29yIFllZnJlbW92IDx5ZWdvcnNsaXN0c0Bn
b29nbGVtYWlsLmNvbT4KPgo+IENvbW1pdHRlZCwgdGhhbmtzLgo+Cj4gTWF5YmUgdGhlIHRpbWUg
aGFzIGNvbWUgdG8gZHJvcCBwcmJvb20/IEl0IGlzIGFuY2llbnQgYW5kIGlzIGFsc28gb25lIG9m
Cj4gdGhlIGZldyBwYWNrYWdlcyB1c2luZyB0aGUgb2xkIFNETCAoMS4yLngpIHZlcnNpb24uCgpZ
ZXMsIGxldCdzIGRyb3AgaXQuIEknbGwgcHJlcGFyZSBhIHBhdGNoLgoKWWVnb3IKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
