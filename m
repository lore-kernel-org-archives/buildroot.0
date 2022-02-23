Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9661BC433F5
	for <buildroot@archiver.kernel.org>; Wed, 23 Feb 2022 20:28:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42A3E812C5;
	Wed, 23 Feb 2022 20:28:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3mauZ7osYJtK; Wed, 23 Feb 2022 20:28:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6ABEC81242;
	Wed, 23 Feb 2022 20:28:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7727C1BF5AA
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 20:28:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D86040273
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 20:28:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gN-nNiWTcrLV for <buildroot@lists.busybox.net>;
 Wed, 23 Feb 2022 20:28:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 822F6403B3
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 20:28:51 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id s1so12960452edd.13
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 12:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:references:organization:in-reply-to
 :content-transfer-encoding;
 bh=FcUSkhgaP0qdQAUzHM1GplpN2R55EkfHl9aOMut49X4=;
 b=J5Ssme4DMZbecv0oX+RTd16C5WCmPlLytUdN0GRIXtushQ9fLb4ZPbdmiUk4Tvqkd6
 1uiVsHb/lEgGBD/nFuka6p2CiMAst7hMNIzwihWes8gFcvw8rnzg5GLnkFgImcP7lBt5
 tYeBy9GlxR0pMFP4kXGj0msZ/fmkvaHIdAmLFrxeFBi5xeJz/T5yjPjblST/opVIzw/u
 RHojNTl2koGEJzx8r5gb+LwgSox3m0OsO66cZC4ynN3IetuF+7sb/f7OdlvR8xw47WKL
 AwRWtlWPIU/bqYbJLsgoD7y3impOw8a9cV2wf0vUUxqwGVhamHL7Rt4d+LlebnCCkni3
 kezw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:references:organization:in-reply-to
 :content-transfer-encoding;
 bh=FcUSkhgaP0qdQAUzHM1GplpN2R55EkfHl9aOMut49X4=;
 b=RYg7v3N0tS0DMDH3cEYNcDRka/lxKRdwLUEl3yB5bin50c+aaJgWhRKJ206r+DbcWF
 nVDcdJtzZwlYR7BA0i24AwDL0zIUhJdWA5/wcAqypUQa4lOhEm1ZEOfJqxk+WNKeet9N
 jE6GbWsAEzLePB7Y6kqBMT6Pwi5zkKcioXwA7xy0++F1Fsl3mvIjKPOKdobiRSh8EqUs
 npNw2b36LI26Ff64zqhbypWSQ+PvRF5v86GobPGfNWZyGKCLfvBXDTk98NSd94qfh7+q
 DUKyD/jBa4IRWt0oTRDgpPB5VuS+Z+rFPG5/xOpoo7gvv9OMOUZP102f3FmOyxLaTUdk
 QriQ==
X-Gm-Message-State: AOAM532fcNfT3JSdKYe7LBwKHToLLAbGKhAjYK7w6WBw8SQoomL9aD7a
 p64XeL2m+HDmrUdHTMOrnvwv3A==
X-Google-Smtp-Source: ABdhPJxT1CgezYXsutNjJOiLy1Y8zD8cN1yJF+FaubFunt8FgQ+rq0Yzsu+2ES+z1x2DxbFdYxsRBA==
X-Received: by 2002:a50:baaa:0:b0:410:a098:2a7f with SMTP id
 x39-20020a50baaa000000b00410a0982a7fmr1101140ede.53.1645648129774; 
 Wed, 23 Feb 2022 12:28:49 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id h21sm343451edt.26.2022.02.23.12.28.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Feb 2022 12:28:49 -0800 (PST)
Message-ID: <b64f7b11-dee6-3a8e-ed47-ead9f4137ab0@mind.be>
Date: Wed, 23 Feb 2022 21:28:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
From: Arnout Vandecappelle <arnout@mind.be>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220216204538.2450673-1-fontaine.fabrice@gmail.com>
 <aca890fa-8ce8-ce5a-b127-2a51018cb2e5@mind.be>
Organization: Essensium/Mind
In-Reply-To: <aca890fa-8ce8-ce5a-b127-2a51018cb2e5@mind.be>
Subject: Re: [Buildroot] [PATCH 1/1] package/dialog: bump to version
 1.3-20220117
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ck9uIDIzLzAyLzIwMjIgMjE6MjcsIEFybm91dCBWYW5kZWNhcHBlbGxlIHdyb3RlOgo+Cj4KPiBP
biAxNi8wMi8yMDIyIDIxOjQ1LCBGYWJyaWNlIEZvbnRhaW5lIHdyb3RlOgo+PiBodHRwczovL2lu
dmlzaWJsZS1taXJyb3IubmV0L2RpYWxvZy9DSEFOR0VTLmh0bWwjaW5kZXgtdDIwMjIwMTE3Cj4+
Cj4+IEZpeGVzOgo+PiDCoCAtIGh0dHBzOi8vYnVncy5idWlsZHJvb3Qub3JnL3Nob3dfYnVnLmNn
aT9pZD0xNDU5Ngo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWlu
ZS5mYWJyaWNlQGdtYWlsLmNvbT4KPgo+IMKgQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KCiDC
oEkgbWVhbiBuZXh0IQoKCiDCoFJlZ2FyZHMsCiDCoEFybm91dAoKCj4KPiDCoFJlZ2FyZHMsCj4g
wqBBcm5vdXQKPgo+PiAtLS0KPj4gwqAgcGFja2FnZS9kaWFsb2cvZGlhbG9nLmhhc2ggfCAyICst
Cj4+IMKgIHBhY2thZ2UvZGlhbG9nL2RpYWxvZy5ta8KgwqAgfCAyICstCj4+IMKgIDIgZmlsZXMg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0
IGEvcGFja2FnZS9kaWFsb2cvZGlhbG9nLmhhc2ggYi9wYWNrYWdlL2RpYWxvZy9kaWFsb2cuaGFz
aAo+PiBpbmRleCAyMjg2NTkwYjY2Li4zMTM2ZDE4YjJiIDEwMDY0NAo+PiAtLS0gYS9wYWNrYWdl
L2RpYWxvZy9kaWFsb2cuaGFzaAo+PiArKysgYi9wYWNrYWdlL2RpYWxvZy9kaWFsb2cuaGFzaAo+
PiBAQCAtMSw0ICsxLDQgQEAKPj4gwqAgIyBMb2NhbGx5IGNhbGN1bGF0ZWQgYWZ0ZXIgY2hlY2tp
bmcgcGdwIHNpZ25hdHVyZQo+PiAtc2hhMjU2IDQ2NjE2M2U4Yjk3YzJiNzcwOWQwMDM4OTE5OWFk
ZDMxNTZiZDgxM2Y2MGNjYjAzMzVkMGEzMGYyZDRhMTdmOTkgCj4+IGRpYWxvZy0xLjMtMjAyMDAz
MjcudGd6Cj4+ICtzaGEyNTYgNzU0Y2I2YmY3ZGM2YTlhYzVjMWY4MGMxM2NhYTRkOTc2ZTMwYTVh
NmU4YjQ2ZjE3YjNiYjliMDgwYzMxMDQxZiAKPj4gZGlhbG9nLTEuMy0yMDIyMDExNy50Z3oKPj4g
wqAgIyBMb2NhbGx5IGNvbXB1dGVkCj4+IMKgIHNoYTI1NiA2MDk1ZTlmZmE3NzdkZDIyODM5Zjc4
MDFhYTg0NWIzMWM5ZWQwN2YzZDZiZjhhMjZkYzVkMmRlYzhjY2MwZWYzIAo+PiBDT1BZSU5HCj4+
IGRpZmYgLS1naXQgYS9wYWNrYWdlL2RpYWxvZy9kaWFsb2cubWsgYi9wYWNrYWdlL2RpYWxvZy9k
aWFsb2cubWsKPj4gaW5kZXggMWM5OGQzNTRlMy4uNjgxZjhlYzlmZSAxMDA2NDQKPj4gLS0tIGEv
cGFja2FnZS9kaWFsb2cvZGlhbG9nLm1rCj4+ICsrKyBiL3BhY2thZ2UvZGlhbG9nL2RpYWxvZy5t
awo+PiBAQCAtNCw3ICs0LDcgQEAKPj4gwqAgIwo+PiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+
PiDCoCAtRElBTE9HX1ZFUlNJT04gPSAxLjMtMjAyMDAzMjcKPj4gK0RJQUxPR19WRVJTSU9OID0g
MS4zLTIwMjIwMTE3Cj4+IMKgIERJQUxPR19TT1VSQ0UgPSBkaWFsb2ctJChESUFMT0dfVkVSU0lP
TikudGd6Cj4+IMKgIERJQUxPR19TSVRFID0gaHR0cHM6Ly9pbnZpc2libGUtbWlycm9yLm5ldC9h
cmNoaXZlcy9kaWFsb2cKPj4gwqAgRElBTE9HX0NPTkZfT1BUUyA9IC0td2l0aC1uY3Vyc2VzIC0t
d2l0aC1jdXJzZXMtZGlyPSQoU1RBR0lOR19ESVIpL3VzciBcCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
