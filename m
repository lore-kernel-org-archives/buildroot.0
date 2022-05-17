Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2A2DC433EF
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 19:36:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6FB0B40AC4;
	Tue, 17 May 2022 19:36:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CEjkfAEGkAUs; Tue, 17 May 2022 19:36:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 75AD7400F2;
	Tue, 17 May 2022 19:36:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B89291BF403
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 19:36:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A66B74193F
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 19:36:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TNeuKA4Xt11a for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 19:36:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1C1B141528
 for <buildroot@buildroot.org>; Tue, 17 May 2022 19:36:10 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id d21so10146524wra.10
 for <buildroot@buildroot.org>; Tue, 17 May 2022 12:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Fs27dR15kOrodGf79bOB+xgWR9kd7YhCmSz7utKaH24=;
 b=meoPSlRoNNDI9rx4dvdb3J1+pyKYLT0pauTShAJN6DAhZv1wLO1mM9/Fvf7CqHSGJt
 +FpHRGsvvRSCXONJ+0Aesod09SN5G4h8OOVGla3zKprM3W014wWs7vrrgatxAYOL1exC
 lv5g8rEeRkuUK64tF37wuOlD4wsLQCFl8Fe2UqSxQceMJPvQkfJgdDtjsEbHEZRct1cs
 xJjp+0cihHYDFdgEJXRYUv6kG48cjKYdV0+zTJ+UteEF6gjpN6vYHONAabQEXrp2NKh8
 h1A808CJrk+9qfDG5PEVv8WZWv4motpD5b7ZndSXU0vnq/qxUJik0JNs+P0setMTvdMQ
 w0Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Fs27dR15kOrodGf79bOB+xgWR9kd7YhCmSz7utKaH24=;
 b=Gno08KmAilDulHTfX+ZIyI2g89QWk0qLPaJQWvCaH3uCKeEDFpSorZN8z44T+qIGRP
 TWalhQhuRruuQK8DLTD5BEyYtdMI2x3wptc9ntdhPvGKaJGaBYx6pH45rxLN7ewOMI6e
 B8VoEvmA7TevZb5XlzpNUqTRA5VOtF9z9urEvkAvePmNBCiJtsRpFR3r0b5SdyvLU41u
 hGeXBNSU35J/xx5KXtNmWO9BmShgSOw2mQVCbHwe64q/5EPY0kMScfICjhnx8ALul4b7
 x3ybYuYUT/dltePmc1AY4QcWUFeqxcV0HffUvh00d6VcuQz4yL5lRL5EwrlrEILQfckl
 IiQw==
X-Gm-Message-State: AOAM532arJSoM0NVcNCEqapAzJrMgvjSli/UrBOFvtubt+wwcWtL5m6m
 euz292H1WbU7iWqtM1xgRFY=
X-Google-Smtp-Source: ABdhPJyq7sytti5b0+OK/SMFx31v4mf6ZjRrmAT9iA+n7GMyGyG26g9BEKc10pfOm+nNjzIvgAFi1Q==
X-Received: by 2002:adf:a454:0:b0:20d:749:6d5c with SMTP id
 e20-20020adfa454000000b0020d07496d5cmr10822223wra.488.1652816169213; 
 Tue, 17 May 2022 12:36:09 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521?
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id
 c13-20020adfa70d000000b0020c5253d8bfsm13291915wrd.11.2022.05.17.12.36.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 12:36:08 -0700 (PDT)
Message-ID: <9adbb119-67f3-3131-7894-61858ab0574d@gmail.com>
Date: Tue, 17 May 2022 21:36:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Arnout Vandecappelle <arnout@mind.be>,
 James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220509013830.1862343-1-james.hilliard1@gmail.com>
 <cc30e61a-025f-5a1f-8b3f-e95fc4d86355@mind.be>
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <cc30e61a-025f-5a1f-8b3f-e95fc4d86355@mind.be>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-jinja2: bump to version
 3.1.2
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
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpMZSAxMy8wNS8yMDIyIMOgIDIzOjU4LCBBcm5vdXQgVmFuZGVjYXBwZWxsZSBhIMOp
Y3JpdMKgOgo+IAo+IAo+IE9uIDA5LzA1LzIwMjIgMDM6MzgsIEphbWVzIEhpbGxpYXJkIHdyb3Rl
Ogo+PiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWls
LmNvbT4KClRoaXMgdmVyc2lvbiBidW1wIHNlZW1zIGludHJvZHVjZSBhIHJlZ3Jlc3Npb24gb24g
cHl0aG9uLWZsYXNrIHBhY2thZ2U6CgooVGVzdFB5dGhvblB5M0ZsYXNrKQpodHRwczovL2dpdGxh
Yi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9qb2JzLzI0NTk4NDEwNzEKCkNhbiB5b3Ug
aGF2ZSBhIGxvb2suClRoYW5rcyEKCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiAKPiDCoEFwcGxp
ZWQgdG8gbWFzdGVyLCB0aGFua3MuCj4gCj4gwqBSZWdhcmRzLAo+IMKgQXJub3V0Cj4gCj4+IC0t
LQo+PiDCoCBwYWNrYWdlL3B5dGhvbi1qaW5qYTIvcHl0aG9uLWppbmphMi5oYXNoIHwgNCArKy0t
Cj4+IMKgIHBhY2thZ2UvcHl0aG9uLWppbmphMi9weXRob24tamluamEyLm1rwqDCoCB8IDQgKyst
LQo+PiDCoCAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkK
Pj4KPj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLWppbmphMi9weXRob24tamluamEyLmhh
c2gKPj4gYi9wYWNrYWdlL3B5dGhvbi1qaW5qYTIvcHl0aG9uLWppbmphMi5oYXNoCj4+IGluZGV4
IGVhN2ZlNzFhMzUuLjJhYjM0M2NjZTYgMTAwNjQ0Cj4+IC0tLSBhL3BhY2thZ2UvcHl0aG9uLWpp
bmphMi9weXRob24tamluamEyLmhhc2gKPj4gKysrIGIvcGFja2FnZS9weXRob24tamluamEyL3B5
dGhvbi1qaW5qYTIuaGFzaAo+PiBAQCAtMSw1ICsxLDUgQEAKPj4gwqAgIyBtZDUsIHNoYTI1NiBm
cm9tIGh0dHBzOi8vcHlwaS5vcmcvcHlwaS9qaW5qYTIvanNvbgo+PiAtbWQ1wqAgYjc2YWUyZjA2
NDdhYmViYzgxZTdjMDNmNWZiN2IwMGbCoCBKaW5qYTItMy4wLjMudGFyLmd6Cj4+IC1zaGEyNTbC
oCA2MTFiYjI3M2NkNjhmM2I5OTNmYWJkYzQwNjRmYzg1OGM1YjQ3YTk3M2NiNWFhNzk5OWVjMWJh
NDA1Yzg3Y2Q3wqAKPj4gSmluamEyLTMuMC4zLnRhci5nego+PiArbWQ1wqAgZDMxMTQ4YWJkODlj
MWRmMWNkYjA3N2E1NWRiMjdkMDLCoCBKaW5qYTItMy4xLjIudGFyLmd6Cj4+ICtzaGEyNTbCoCAz
MTM1MWE3MDJhNDA4YTllNzU5NWE4ZmM2MTUwZmMzZjQzYmI2YmY3ZTMxOTc3MGNiYzBkYjlkZjk0
MzdlODUywqAKPj4gSmluamEyLTMuMS4yLnRhci5nego+PiDCoCAjIExvY2FsbHkgY29tcHV0ZWQg
c2hhMjU2IGNoZWNrc3Vtcwo+PiDCoCBzaGEyNTbCoCAzYjQ5ZGNlZTQxMDVlYjM3YmFjMTBmYWYx
YmUyNjA0MDhmZTg1ZDI1MmI4ZTlkZjJlMDk3OWZjMWUwOTQ0MzdiwqAKPj4gTElDRU5TRS5yc3QK
Pj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLWppbmphMi9weXRob24tamluamEyLm1rCj4+
IGIvcGFja2FnZS9weXRob24tamluamEyL3B5dGhvbi1qaW5qYTIubWsKPj4gaW5kZXggMDUwMzk4
NGJlZi4uMjA5Y2EyZTI1YSAxMDA2NDQKPj4gLS0tIGEvcGFja2FnZS9weXRob24tamluamEyL3B5
dGhvbi1qaW5qYTIubWsKPj4gKysrIGIvcGFja2FnZS9weXRob24tamluamEyL3B5dGhvbi1qaW5q
YTIubWsKPj4gQEAgLTQsOSArNCw5IEBACj4+IMKgICMKPj4gwqAKPj4gIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMKPj4gwqAgLVBZVEhPTl9KSU5KQTJfVkVSU0lPTiA9IDMuMC4zCj4+ICtQWVRIT05f
SklOSkEyX1ZFUlNJT04gPSAzLjEuMgo+PiDCoCBQWVRIT05fSklOSkEyX1NPVVJDRSA9IEppbmph
Mi0kKFBZVEhPTl9KSU5KQTJfVkVSU0lPTikudGFyLmd6Cj4+IC1QWVRIT05fSklOSkEyX1NJVEUg
PQo+PiBodHRwczovL2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcvcGFja2FnZXMvOTEvYTUvNDI5ZWZj
NjI0NjExOWUxZTNmYmY1NjJjMDAxODdkMDRlODNlNTQ2MTkyNDllYjczMmJiNDIzZWZhNmM2Cj4+
Cj4+ICtQWVRIT05fSklOSkEyX1NJVEUgPQo+PiBodHRwczovL2ZpbGVzLnB5dGhvbmhvc3RlZC5v
cmcvcGFja2FnZXMvN2EvZmYvNzVjMjg1NzZhMWQ5MDBlODdlYjYzMzViMDYzZmFiNDdhOGVmM2M4
YjRkODg1MjRjNGJmNzhmNjcwY2NlCj4+Cj4+IMKgIFBZVEhPTl9KSU5KQTJfU0VUVVBfVFlQRSA9
IHNldHVwdG9vbHMKPj4gwqAgUFlUSE9OX0pJTkpBMl9MSUNFTlNFID0gQlNELTMtQ2xhdXNlCj4+
IMKgIFBZVEhPTl9KSU5KQTJfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UucnN0Cj4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
