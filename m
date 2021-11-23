Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B589DC433EF
	for <buildroot@archiver.kernel.org>; Tue, 23 Nov 2021 21:40:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44AF060A88;
	Tue, 23 Nov 2021 21:40:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Uy8UbFdW5ZrL; Tue, 23 Nov 2021 21:40:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A24E260A7E;
	Tue, 23 Nov 2021 21:40:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6264C1BF47F
 for <buildroot@lists.busybox.net>; Tue, 23 Nov 2021 21:40:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5EBBD402D3
 for <buildroot@lists.busybox.net>; Tue, 23 Nov 2021 21:40:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l7rVKfQ18hPE for <buildroot@lists.busybox.net>;
 Tue, 23 Nov 2021 21:40:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 06B4A402CB
 for <buildroot@buildroot.org>; Tue, 23 Nov 2021 21:40:20 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id u1so308587wru.13
 for <buildroot@buildroot.org>; Tue, 23 Nov 2021 13:40:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=zMFFwBXF/SpvIIbq7rAwleW1WhwAhzif3lq7NrjyJ+g=;
 b=b3HkwUOsbNno8I1NJ94y5c7wf61x/rO1Mu1H9/vMl9Ujza4Ku3uYKY58XQ9ypsPm8J
 8YPhdRLI9s2ifekyf/puA9ABKGJtlj//gkWZ74ofsnQJKsbttbzAPS8mLsqTDPTPBKWJ
 BsoYFPHMATMQY3gaJz69iG3aYKmFg8wIqmeHMiOEkfq6pNA2NtK0TeP65PS9Aqik5Joy
 AGUMLEVXgA6EnL96ft6XT24QW9RJ1G5QKBSQhlOvoo7UBgNhZLpGfM9WSEYENMyU8nvV
 9pp1ZXNkCCz1/sLB8KOtTP3JFQiSL0J0w2YiGlCR0JWgUv2KzeHMBbDyYUzXht9tI07y
 3BYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zMFFwBXF/SpvIIbq7rAwleW1WhwAhzif3lq7NrjyJ+g=;
 b=1InEleFdp1u/LVPmiWYxPT70WQ0k1xGPMA+tlu1riH5ihNrujdRLpH9ijJP0GuXosC
 VbnkoZH9KwYn2NkARWTmDa3uaTz5TZl7Re6MrDq/jD1mB7QlXrvZrS4Wfh7yFUmK8ElC
 DuV/5qRRWDyLK64F8oqxLOnmdDR01Q2kLo4Bh9e2b7IFmFarJ0t/qM4FTWGSV3zGR5nF
 +l2bFaRzuCsnX+E9GDhrKk2URM9S/Thxb+8b9sA8wjSx96rSXVLG6T0gmtl7WdqSDDSB
 LSXGLRRRaVp2m4jDhlVnbaZ9/di6InS3NQeHcuuyUc30qNO6H1pLnsJ6+1cBvMPZ+cV9
 CBnw==
X-Gm-Message-State: AOAM531vjfMQLwKy0f0X7pvcxBVpU9giCnSbeKtWfkfsl/QgTfw6Mu3m
 6zaH8CZfnvy/mnogJPZf8hA=
X-Google-Smtp-Source: ABdhPJwDISEd2Z+H5JbldzQJD3czsD5H/1iLggidIAwUHQQvRwki1CC9IU7373eEFhnvPW8/sCZIsQ==
X-Received: by 2002:a5d:6501:: with SMTP id x1mr11448119wru.390.1637703619104; 
 Tue, 23 Nov 2021 13:40:19 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521?
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id h22sm2944228wmq.14.2021.11.23.13.40.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Nov 2021 13:40:18 -0800 (PST)
Message-ID: <3ab13cf5-47b0-2577-1a25-c6ec9781b78b@gmail.com>
Date: Tue, 23 Nov 2021 22:40:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <cover.1637700992.git.yann.morin.1998@free.fr>
 <5c509bf436607ed0fad88c8588973edbee3d0713.1637700992.git.yann.morin.1998@free.fr>
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <5c509bf436607ed0fad88c8588973edbee3d0713.1637700992.git.yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH 1/2] support/docker: don't use sudo to build
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

SGVsbG8gWWFubiwKCkxlIDIzLzExLzIwMjEgw6AgMjE6NTYsIFlhbm4gRS4gTU9SSU4gYSDDqWNy
aXTCoDoKPiBPbiBhIHByb3Blcmx5IHNldHVwIG1hY2hpbmUsIGl0IGlzIHRvdGFsbHkgdXNlbGVz
cyB0byB1c2Ugc3VkbyB0byBydW4KPiBkb2NrZXI7IGl0IGlzIHZlcnkgYmFkIHByYWN0aWNlLiBJ
bnN0ZWFkLCB1c2VycyByZWFsbHkgc2hvdWxkIGFkZAo+IHRoZW1zZWx2ZXMgdG8gdGhlIGRvY2tl
ciBncm91cC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBZYW5uIEUuIE1PUklOIDx5YW5uLm1vcmluLjE5
OThAZnJlZS5mcj4KPiBDYzogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAZ21haWwuY29tPgo+
IENjOiBBcm5vdXQgVmFuZGVjYXBwZWxsZSAoRXNzZW5zaXVtL01pbmQpIDxhcm5vdXRAbWluZC5i
ZT4KPiAtLS0KPiAgc3VwcG9ydC9kb2NrZXIvRG9ja2VyZmlsZSB8IDQgKystLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQg
YS9zdXBwb3J0L2RvY2tlci9Eb2NrZXJmaWxlIGIvc3VwcG9ydC9kb2NrZXIvRG9ja2VyZmlsZQo+
IGluZGV4IDJhZWUxMjk2NjguLjU3NDQ1ZDVjZDEgMTAwNjQ0Cj4gLS0tIGEvc3VwcG9ydC9kb2Nr
ZXIvRG9ja2VyZmlsZQo+ICsrKyBiL3N1cHBvcnQvZG9ja2VyL0RvY2tlcmZpbGUKPiBAQCAtMSw3
ICsxLDcgQEAKPiAgIyBUaGlzIERvY2tlcmZpbGUgZ2VuZXJhdGVzIHRoZSBkb2NrZXIgaW1hZ2Ug
dGhhdCBnZXRzIHVzZWQgYnkgR2l0bGFiIENJCj4gICMgVG8gYnVpbGQgaXQgKFlZWVlNTURELkhI
TU0gaXMgdGhlIGN1cnJlbnQgZGF0ZSBhbmQgdGltZSBpbiBVVEMpOgo+IC0jICAgc3VkbyBkb2Nr
ZXIgYnVpbGQgLXQgYnVpbGRyb290L2Jhc2U6WVlZWU1NREQuSEhNTSBzdXBwb3J0L2RvY2tlcgo+
IC0jICAgc3VkbyBkb2NrZXIgcHVzaCBidWlsZHJvb3QvYmFzZTpZWVlZTU1ERC5ISE1NCj4gKyMg
ICBkb2NrZXIgYnVpbGQgLXQgYnVpbGRyb290L2Jhc2U6WVlZWU1NREQuSEhNTSBzdXBwb3J0L2Rv
Y2tlcgo+ICsjICAgZG9ja2VyIHB1c2ggYnVpbGRyb290L2Jhc2U6WVlZWU1NREQuSEhNTQoKUmV2
aWV3ZWQtYnk6IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQGdtYWlsLmNvbT4KCkJlc3QgcmVn
YXJkcywKUm9tYWluCgo+ICAKPiAgIyBXZSB1c2UgYSBzcGVjaWZpYyB0YWcgZm9yIHRoZSBiYXNl
IGltYWdlICphbmQqIHRoZSBjb3JyZXNwb25kaW5nIGRhdGUKPiAgIyBmb3IgdGhlIHJlcG9zaXRv
cnkuLCBzbyBkbyBub3QgZm9yZ2V0IHRvIHVwZGF0ZSB0aGUgYXB0LXNvdXJjZXMubGlzdAo+IAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
