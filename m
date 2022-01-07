Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 870B8C433F5
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 10:26:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 22E634019F;
	Fri,  7 Jan 2022 10:26:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4Y22PlEVcn7u; Fri,  7 Jan 2022 10:26:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3015D40157;
	Fri,  7 Jan 2022 10:26:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EF8BB1BF2EC
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 10:26:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DDD3D80B3B
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 10:26:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0xBB2AiVJA_O for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 10:26:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2EC8D80890
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 10:26:25 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id t28so3403690wrb.4
 for <buildroot@buildroot.org>; Fri, 07 Jan 2022 02:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=iYxx6uqoEJubbfDpzkSe5n5D56fSj26KRwGM9BeOYqc=;
 b=cB0MC4VdFS2Ezkky40hlQbS1o1CX8+vFW9+2tkQ0WF8iONG/WlWaTojrBVDys6eFV3
 Y4b/GBczDYC7pIYYLrw9IaZL8RANCN08FYD5ZtmbpxmUuRxuE1gEhm+JhkHu0IMa1cj7
 jU5b/RirWqBWWd5E0cC0cdgcLtN9WO/rfQ41t8Ub96qo7Ju4MYy4opFfzS8TP+D044o/
 PIQHhMWqVq+owwLLlmsynfiN+juvaVHxQ+ALdEPRYgT77jAYtYJ5L0tnYnte2Ek3vtAd
 EikmP/IV1bThgye5Z6SSaIkM7qva0lwQnPdAjxlRa5aT5qZQYtL0JC/4/Qz7uKRHmSWm
 vKwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iYxx6uqoEJubbfDpzkSe5n5D56fSj26KRwGM9BeOYqc=;
 b=S2uqCqn1AXAwNmmSCBxoxnaJwk2nt0a5UwD3erEdn70HsB+S5Yunttx5BbEkpFfART
 nFXHsT7DfsJEvPxHLYnSgbfaCFChfSoYowzDhqkTuLHMTE05goPPO05b78O+N7m3yOsK
 O1qNx2skgePc/2GvbZ2Y4hL88sjl8WqDeSeN8ff1HOxPfLmT/oN6quovSuIPREX/lM7b
 sI8vI2nYsANotiSkXFglAhTwFd7JWJGRTwQ8Kxe1/2r9YQ9xgdcuDUb3+OkJ8Kg0wCDG
 zhG7kcx6EJWhj+HCW0A47ublZbTHInk8IFGUH12kZgM2+64QTvANnWkE+2//g/dDIxLO
 nEMg==
X-Gm-Message-State: AOAM532FfgeN2tgmajAAr++KNrPQult9xPjjbv63xRfZzWmCtbI5zVOs
 Rf6Ax3myQHxd0sH2yS48YBQf2A==
X-Google-Smtp-Source: ABdhPJxsXs543Re9FYBTG1+PQwCHugSv9atFhysoby3sMnb0OcGW13PR/65NRlhpmcNg+pShlKvyVQ==
X-Received: by 2002:a5d:6f11:: with SMTP id
 ay17mr16420249wrb.662.1641551183420; 
 Fri, 07 Jan 2022 02:26:23 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f?
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id i6sm4969278wrf.79.2022.01.07.02.26.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jan 2022 02:26:23 -0800 (PST)
Message-ID: <d30edd2f-9e9f-b4e7-216c-fad53c6f90f4@smile.fr>
Date: Fri, 7 Jan 2022 11:26:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: fr
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Christian Stewart <christian@paral.in>,
 Buildroot List <buildroot@buildroot.org>,
 Matt Weber <Matthew.Weber@rockwellcollins.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220106210000.397694-1-thomas.petazzoni@bootlin.com>
 <20220106210000.397694-6-thomas.petazzoni@bootlin.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20220106210000.397694-6-thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH v3 05/11] package/pkg-cargo.mk: introduce
 the cargo package infrastructure
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
Cc: Patrick Havelange <patrick.havelange@essensium.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgMDYvMDEvMjAyMiDDoCAyMTo1OSwgVGhvbWFzIFBldGF6em9uaSBhIMOpY3JpdMKgOgo+IEZy
b206IFBhdHJpY2sgSGF2ZWxhbmdlIDxwYXRyaWNrLmhhdmVsYW5nZUBlc3NlbnNpdW0uY29tPgo+
IAo+IEluIG9yZGVyIHRvIGJlIHBhY2thZ2UgYWdub3N0aWMsIHRoZSBpbnN0YWxsIHBoYXNlIGlz
IG5vdyB1c2luZyBjYXJnbwo+IGluc3RlYWQgb2YgaW5zdGFsbC4gVEFSR0VUX0NPTkZJR1VSRV9P
UFRTIGlzIG5vdyBhbHNvIHNldCB3aGVuIHJ1bm5pbmcKPiBjYXJnbyBpbiBvcmRlciB0byBzdXBw
b3J0IGNyb3NzIGNvbXBpbGluZyBDIGNvZGUgd2l0aGluIGNhcmdvLgo+IAo+IFRoaXMgY29tbWl0
IGFsc28gYWRkcyBzdXBwb3J0L2Rvd25sb2FkL2NhcmdvLXBvc3QtcHJvY2VzcyB0byBwZXJmb3Jt
Cj4gdGhlIHZlbmRvcmluZyBvbiBDYXJnbyBwYWNrYWdlcy4KCkRvd25sb2FkIHBvc3QtcHJvY2Vz
c2luZyBkb2VzJ3Qgd29yayB3aGVuIHdlIHVzZSBfT1ZFUlJJREVfU1JDRElSLgoKTWF5YmUgd2Ug
aGF2ZSB0byBtYWtlIHN1cmUgdGhhdCBhbGwgZG93bmxvYWQgb2YgdmVuZG9yIG1vZHVsZXMgYXJl
IGFscmVhZHkKcHJlc2VudCBpbiB0aGUgc291cmNlIGRpcmVjdG9yeSB1c2VkIGJ5IF9PVkVSUklE
RV9TUkNESVIuCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKPiAKPiBUaGUgPHBrZz5fTElDRU5TRSB2
YXJpYWJsZSBvZiBjYXJnbyBwYWNrYWdlcyBpcyBleHBhbmRlZCB3aXRoICIsCj4gdmVuZG9yZWQg
ZGVwZW5kZW5jaWVzIGxpY2Vuc2VzIHByb2JhYmx5IG5vdCBsaXN0ZWQiIGFzIGN1cnJlbnRseSBm
b3IKPiBhbGwgcGFja2FnZXMsIHRoZSBsaWNlbnNlcyBvZiB0aGUgdmVuZG9yZWQgZGVwZW5kZW5j
aWVzIGFyZSBub3QgdGFrZW4KPiBpbnRvIGFjY291bnQuCj4gCj4gU2lnbmVkLW9mZi1ieTogUGF0
cmljayBIYXZlbGFuZ2UgPHBhdHJpY2suaGF2ZWxhbmdlQGVzc2Vuc2l1bS5jb20+Cj4gW1Rob21h
czogYWRkIHN1cHBvcnQgZm9yIGhvc3QtY2FyZ28tcGFja2FnZSBhbmQgdmVuZG9yaW5nXQo+IFNp
Z25lZC1vZmYtYnk6IFRob21hcyBQZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5j
b20+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
