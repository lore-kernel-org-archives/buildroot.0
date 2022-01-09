Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBA9FC433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 10:52:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8210D40211;
	Sun,  9 Jan 2022 10:52:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x_i-CQ6KM4bi; Sun,  9 Jan 2022 10:52:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A5024024E;
	Sun,  9 Jan 2022 10:52:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 45A1F1BF4DD
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 10:52:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3241E8131E
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 10:52:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E2YLcNHfOkYe for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 10:52:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 81F3A812E4
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 10:52:42 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id t28so14320186wrb.4
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 02:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=D5bhhXNMv2eB+VNWnm6wn9KzVTsDyY2F+QJjnkeKfnU=;
 b=6F/wgC1Q3EvqsBMusmXS6s2oEd6HuPiiEid9y9dVjS4d+59mNoWCVPaZAvX33cod8W
 EJlCcVYwB7bcWAPODQBWEMItUX9E6MOAnNfPcOptGQ8plpy6jT0XVttsmJSiMZCmunPx
 JLs7unqgOzfN95qwIw8XqsAE9xSZAZKidRm9Orm8pDAiMZTXG+P3BL0yBZzEMHHQW9ZR
 FtqHUbnW+ODX9rXbkL9qtpDgMJ4VFB3ujmrlMQM/PIFpXH8HevuB+8ps2Y5zcOwHQbAT
 yBQ/xCK/A6yd42ek7T+lRsQVXuF9o9O0bHb+Wytfi71wkakbqse0UP807EzlglXAcfhY
 chIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=D5bhhXNMv2eB+VNWnm6wn9KzVTsDyY2F+QJjnkeKfnU=;
 b=PPCUHcR2Sndv58wga7XJAAPvVw6ffW6mn6A8Dlx9HfzNJDGuSis7DmCxEVUmfbT6eq
 lzvBFA06C3qN6EeoL4fLM4/vZ653c2+nyz5Oa2o6heZzHJo7pP2fdar1kjpKKZE2eE6b
 7cRPIx+Bv52cXVnGaDqOdNDC+ATOMxofbGI0LAjevFS9wqDvg4kOuYK/8OF7Sk14myIS
 4gBLLNcOV5YyPozf7Z+hAVT2Ogc7+CW/FeXRxKy40IfJjsKWzepV0QBCw2mrHe1iErtu
 NBSfa3n3/GJdLD2r42hWzbuFOaQNSnsvCSa7XXWb/qrff9iRf5eoq9Tynh8oAhe0uXRl
 DaCg==
X-Gm-Message-State: AOAM533LOHTLeGfVnyElySl+pUixvIDq/Hiu9EGIQ8blHqNPLE+YcR56
 JGzDEUpQWfUoBMsCZQVFd5l8THeP6TdY9w==
X-Google-Smtp-Source: ABdhPJwIkgHdw1QAgbBlelYlgt0toucKOv1Abztc6DzGT77e+8smdCfAkiNpwGCqxwIqVxhn2pw7ww==
X-Received: by 2002:a05:6000:154c:: with SMTP id
 12mr60937661wry.447.1641725560608; 
 Sun, 09 Jan 2022 02:52:40 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f?
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id e12sm3994841wrg.110.2022.01.09.02.52.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Jan 2022 02:52:40 -0800 (PST)
Message-ID: <4a065445-d2a7-4796-2b54-570260095ad4@smile.fr>
Date: Sun, 9 Jan 2022 11:52:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: fr
To: Ricardo Martincoski <ricardo.martincoski@gmail.com>,
 buildroot@buildroot.org
References: <20211226184919.2753591-1-ricardo.martincoski@gmail.com>
 <20211226184919.2753591-5-ricardo.martincoski@gmail.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20211226184919.2753591-5-ricardo.martincoski@gmail.com>
Subject: Re: [Buildroot] [PATCH 4/5] support/docker: add shellcheck
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gUmljYXJkbywKCkFja2VkLWJ5OiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBzbWls
ZS5mcj4KCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKTGUgMjYvMTIvMjAyMSDDoCAxOTo0OSwgUmlj
YXJkbyBNYXJ0aW5jb3NraSBhIMOpY3JpdMKgOgo+IEFsbG93IGRldmVsb3BlcnMgdG8gcnVuIGNo
ZWNrLXBhY2thZ2UgZm9yIGluaXQgc2NyaXB0cywgdGhhdCBjYWxsCj4gc2hlbGxjaGVjaywgd2l0
aG91dCBoYXZpbmcgdG8gaW5zdGFsbCB0aGUgdG9vbC4KPiAKPiBTaW5jZSB0aGUgZG9ja2VyIGhh
dmUgYSBmaXhlZCB2ZXJzaW9uIG9mIHRoZSB0b29sLCB0aGVyZSB3aWxsIGJlIG5vCj4gZGlmZmVy
ZW5jZSBiZXR3ZWVuIHJ1bnMgaW4gZGlmZmVyZW50IG1hY2hpbmVzLgo+IAo+IE9uZSBjYW4gY2Fs
bDoKPiAkIHV0aWxzL2RvY2tlci1ydW4gdXRpbHMvY2hlY2stcGFja2FnZSBwYWNrYWdlL3BhY2th
Z2UvUyoKPiAkIHV0aWxzL2RvY2tlci1ydW4gc2hlbGxjaGVjayBwYWNrYWdlL3BhY2thZ2UvUyoK
PiAKPiBUaGlzIGNoYW5nZSBhbHNvIGFsbG93cyB0byBldmVudHVhbGx5IHJ1biBjaGVjay1wYWNr
YWdlIGZvciBpbml0IHNjcmlwdHMKPiBpbiB0aGUgR2l0TGFiIENJLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IFJpY2FyZG8gTWFydGluY29za2kgPHJpY2FyZG8ubWFydGluY29za2lAZ21haWwuY29tPgo+
IC0tLQo+IFBsZWFzZSByZWFkIHRoZSBjb3ZlciBsZXR0ZXIgYmVmb3JlIGFwcGx5aW5nLgo+IC0t
LQo+ICBzdXBwb3J0L2RvY2tlci9Eb2NrZXJmaWxlIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKQo+IAo+IGRpZmYgLS1naXQgYS9zdXBwb3J0L2RvY2tlci9Eb2NrZXJmaWxl
IGIvc3VwcG9ydC9kb2NrZXIvRG9ja2VyZmlsZQo+IGluZGV4IDc5MmU3MGUyOTIuLjJiMTRmMGY3
YTcgMTAwNjQ0Cj4gLS0tIGEvc3VwcG9ydC9kb2NrZXIvRG9ja2VyZmlsZQo+ICsrKyBiL3N1cHBv
cnQvZG9ja2VyL0RvY2tlcmZpbGUKPiBAQCAtNDQsNiArNDQsNyBAQCBSVU4gYXB0LWdldCBpbnN0
YWxsIC15IC0tbm8taW5zdGFsbC1yZWNvbW1lbmRzIFwKPiAgICAgICAgICBxZW11LXN5c3RlbS1h
cm0gXAo+ICAgICAgICAgIHFlbXUtc3lzdGVtLXg4NiBcCj4gICAgICAgICAgcnN5bmMgXAo+ICsg
ICAgICAgIHNoZWxsY2hlY2sgXAo+ICAgICAgICAgIHN1YnZlcnNpb24gXAo+ICAgICAgICAgIHVu
emlwIFwKPiAgICAgICAgICB3Z2V0IFwKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
