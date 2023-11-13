Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA2A9C4332F
	for <buildroot@archiver.kernel.org>; Mon, 13 Nov 2023 11:20:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7109260D72;
	Mon, 13 Nov 2023 11:20:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7109260D72
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QCmGGyXfDH88; Mon, 13 Nov 2023 11:20:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9CE2E60B7C;
	Mon, 13 Nov 2023 11:20:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9CE2E60B7C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 405D01BF3BF
 for <buildroot@lists.busybox.net>; Mon, 13 Nov 2023 11:20:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 16959405CF
 for <buildroot@lists.busybox.net>; Mon, 13 Nov 2023 11:20:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 16959405CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3X0C6NZtO-Ak for <buildroot@lists.busybox.net>;
 Mon, 13 Nov 2023 11:20:53 +0000 (UTC)
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 67FE9404B9
 for <buildroot@buildroot.org>; Mon, 13 Nov 2023 11:20:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 67FE9404B9
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-9d242846194so636283566b.1
 for <buildroot@buildroot.org>; Mon, 13 Nov 2023 03:20:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699874451; x=1700479251;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tKIQsUN23lf8KvWe3TkX01D9Vbt+JKrc5alh1ROMmnc=;
 b=KovGZbqeYzPJqVzn+JdTkolLvUrJz67uESj1nwgv5pYZ7aS6Q2EmNKKoWkxSqzms5b
 lS+0hX+1Cv5VNuNDSLOCVRPAAQZCM23a3vnWC9goFudt54sYj5MnzFXCv9S6lrfwQctR
 lrVRpuDh3bvFfU/q/7+yiIZL6uKiBL/yK9RXl3KaI+13OjUWdHy8HRxtyVLgRHDDJszx
 ekbFGRw0ZOnn3NKqiXJMKqLBw4Y3n7Jh6YZU+QYzRJYygK9HvFu7XQW7r6JOpsUpveqE
 iCcHvMNGUFZMqhHsHPS3PTuqskX50BEm33gGwRzoCL9zUewshPP8b6m520KTHaY/4kc3
 JKHA==
X-Gm-Message-State: AOJu0YwQZqYM6OHrXhM3i4E0JN+OoQtrbccvC5P9GaA9UaN5h2zanqzI
 +u83bO6rA9gTAuFgiDZQhjSFcA==
X-Google-Smtp-Source: AGHT+IHaTgVCBokFIhg82RP358Sw079jItyEFEsmsOJlUrMKR/g5rEJkHEmD2IjDbHm0s4C5mns6sg==
X-Received: by 2002:a17:907:20f3:b0:9c3:bb0e:d4c7 with SMTP id
 rh19-20020a17090720f300b009c3bb0ed4c7mr4106765ejb.28.1699874451405; 
 Mon, 13 Nov 2023 03:20:51 -0800 (PST)
Received: from [10.1.0.174] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 t25-20020a1709066bd900b0099c53c4407dsm3847910ejs.78.2023.11.13.03.20.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Nov 2023 03:20:50 -0800 (PST)
Message-ID: <bde89972-78dc-4f5f-9373-76a0bd317b64@mind.be>
Date: Mon, 13 Nov 2023 12:20:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
References: <20231008182952.253DD843AA@busybox.osuosl.org>
 <2a1cad98-3c88-4706-9c09-b67ee688f92b@smile.fr>
In-Reply-To: <2a1cad98-3c88-4706-9c09-b67ee688f92b@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1699874451; x=1700479251; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tKIQsUN23lf8KvWe3TkX01D9Vbt+JKrc5alh1ROMmnc=;
 b=HHUFK7G9682n2AIq4eNddfKZB2LavOZV3/c0nKCe5AXCUVp2jk+DCr6+maX3dzuD4n
 oioibOdaCIMfw4yWpZFb/gGVK5aDY4hiB9Ve1XKklHWZkedhCJO+93r5QsJqMQvH8v2g
 hfkyWl1FsceVTL2eJs1jLo+2qhBc8pXzzhmnamBxKaO8PD4RlDCusH+QaHiRlwWZdaoW
 K7GQdxHEp9Z2YJcfyiIYBPFq90PJ/KjM2jLNDlC4oM/emJSBfloGvEHUPsmUA+LLAN+6
 ud5D+AX1fu1BE0IR4ASGVNcdo0unuBZxbCC7Ky6nwv7mRxtTCLys+/JLRGEQM5R5gZXd
 sMPQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=HHUFK7G9
Subject: Re: [Buildroot] [git commit] support/testing: add systemd tests for
 factory and overlayfs
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxMS8xMS8yMDIzIDE2OjU0LCBSb21haW4gTmFvdXIgd3JvdGU6Cj4gSGVsbG8gQXJub3V0
LAo+IAo+IExlIDA4LzEwLzIwMjMgw6AgMjA6MTUsIEFybm91dCBWYW5kZWNhcHBlbGxlIHZpYSBi
dWlsZHJvb3QgYSDDqWNyaXTCoDoKPj4gY29tbWl0OiBodHRwczovL2dpdC5idWlsZHJvb3QubmV0
L2J1aWxkcm9vdC9jb21taXQvP2lkPTA4M2U2NWE2N2M4NGY4M2EzNDAzYzkyYzUxZDg5ZjhjOTQ5
MDdjNTUKPj4gYnJhbmNoOiBodHRwczovL2dpdC5idWlsZHJvb3QubmV0L2J1aWxkcm9vdC9jb21t
aXQvP2lkPXJlZnMvaGVhZHMvbWFzdGVyCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFlhbm4gRS4gTU9S
SU4gPHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPgo+PiBbQXJub3V0Ogo+PiAgIC0gdXNlIGEgc2lt
cGxlIG1vdW50IHVuaXQgZm9yCj4+ICAgICBUZXN0SW5pdFN5c3RlbVN5c3RlbWRSb0Z1bGxPdmVy
bGF5ZnNWYXJCYWNraW5nOwo+PiAgIC0gY2hhbmdlIHRoZSB0ZXN0IG9mIFRlc3RJbml0U3lzdGVt
U3lzdGVtZFJvRnVsbE92ZXJsYXlmc1ZhckJhY2tpbmcgdG8KPj4gICAgIGNoZWNrIHRoYXQgdGhl
IGV4YWN0IGV4cGVjdGVkIG1vdW50IHdhcyBwZXJmb3JtZWQ7Cj4+ICAgLSBhZGQgYSB0ZXN0IG9m
IHZhciBiYWNraW5nIHdpdGggZnN0YWIgaW5zdGVhZCBvZiBtb3VudCB1bml0Lgo+PiBdCj4+IFNp
Z25lZC1vZmYtYnk6IEFybm91dCBWYW5kZWNhcHBlbGxlIDxhcm5vdXRAbWluZC5iZT4KPj4gLS0t
Cj4+ICAgLi4uL3Rlc3RpbmcvY29uZi9vdmVybGF5ZnMta2VybmVsLWZyYWdtZW50LmNvbmZpZyAg
fCAgIDEgKwo+PiAgIC4uLi9zeXN0ZW1kL3N5c3RlbS9ydW4tYnVpbGRyb290LW1vdW50cy12YXIu
bW91bnQgIHwgIDEzICsrCj4+ICAgc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL2luaXQvdGVzdF9zeXN0
ZW1kLnB5ICAgICAgICAgfCAyMzMgKysrKysrKysrKysrKysrKysrKystCj4+ICAgMyBmaWxlcyBj
aGFuZ2VkLCAyMzggaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKW3NuaXBdCj4+ICtjbGFz
cyBUZXN0SW5pdFN5c3RlbVN5c3RlbWRSb0Z1bGxPdmVybGF5ZnNWYXJCYWNraW5nRnN0YWIoCj4+
ICsgICAgVGVzdEluaXRTeXN0ZW1TeXN0ZW1kUm9GdWxsT3ZlcmxheWZzLAo+PiArICAgIEluaXRT
eXN0ZW1TeXN0ZW1kQmFzZU92ZXJsYXlmc1ZhckJhY2tpbmcsCj4+ICspOgo+PiArICAgIGNvbmZp
ZyA9IEluaXRTeXN0ZW1TeXN0ZW1kQmFzZU92ZXJsYXlmc1ZhckJhY2tpbmcuZ2VuX2NvbmZpZygK
Pj4gKyAgICAgICAgJ3Rlc3RzL2luaXQvc3lzdGVtZC1vdmVybGF5LWZzdGFiJywKPiAKPiBUaGlz
IGZpbGUgaXMgbWlzc2luZyBpbiB0aGUgcmVwcm9zaXRvcnkgKGdpdCBhZGQgZmFpbGVkIHNvbWVo
b3cgOikgKQo+IAo+IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8t
L2pvYnMvNTQ2NDkyOTgwNQoKICBPb3BzaWUhIFB1c2hlZCBpdCBub3cuLi4KCiAgUmVnYXJkcywK
ICBBcm5vdXQKCj4gCj4gQmVzdCByZWdhcmRzLAo+IFJvbWFpbgo+IAo+IAo+PiArICAgICkKPj4g
Kwo+PiArICAgIGRlZiB0ZXN0X3J1bihzZWxmKToKPj4gKyAgICAgICAgc3VwZXIoKS50ZXN0X3J1
bigpCj4+ICsgICAgICAgIHNlbGYuY2hlY2tfdmFyX21vdW50ZWQoKQo+PiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBidWlsZHJvb3QgbWFpbGluZyBs
aXN0Cj4+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo+IApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
