Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74B3AC433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 10:51:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A1A18128F;
	Sun,  9 Jan 2022 10:51:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qeD5_ff6_IWo; Sun,  9 Jan 2022 10:51:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7605B8127C;
	Sun,  9 Jan 2022 10:51:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9D6411BF4DD
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 10:51:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 847B140465
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 10:51:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hW8CcWjJsv_W for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 10:51:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 75010400E9
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 10:51:40 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id p18so148278wmg.4
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 02:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=jTfEP3YIz3dkJrCG7oWim6NC+AawHLy/1qcFZG+UyKI=;
 b=ktzH/iXI4m5FKJVM3GBfLsNtvOJQwtOFpC9NVLliUq3hfh97U46qrlY9ppb6tS7E57
 bhQQS2GI7FkHTfw3ASrmmVxIRLxfPUIrlwZMwRx2xZTHQUzWt0ed1edDC8EIT0etjjcT
 9z+PScWEljM4OVU2sPJ/OVeB2bZWN42b41bEj4OK8HRGanVS6SwpVsTyksHj8aqzSXBv
 ckEiiVBcMCtd1qKG3hnJRZ/Izh/QZR+5qgVFHQSafY40HybvCZVsHRvXyFm7Qt03HApq
 478Nszes+l/iO/Dos3V7UzX5vngcVWpjAw0yV2PXZTCbgwBbM+qNVQLShTRFuwKfSSlk
 hPKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jTfEP3YIz3dkJrCG7oWim6NC+AawHLy/1qcFZG+UyKI=;
 b=JZnIB4u/NRtOERLz7FE+6oUgrIuRcAUc53kLSogqFJb50ur3KFqI6T3PeR4KURXIIt
 YWULYqzLFTEp4Fyu+Nwk2lxXZEbvNnjfNsABMfZnHPhWFBiEoekRkucwurVqO1DQKiZA
 /Xa737vc8JEpaRkp3+LDEfje+6kG4e9WR64RX8/EQVyjo8kt/oPFXxWaVKxCImBLPorS
 zFCrCrKrD12HtlYPBLBNFU399gTrwHl4ji9fVfKQ96mZ6fCxHsWfDSOpxTg15iSO5Vxg
 6c3SVB1H9M78FBr8J5nIrP9TcXXcBJQlyTYIYCk3mLUV03rFufYWdHbz2vxcN06zpPXF
 +qYg==
X-Gm-Message-State: AOAM530QjkExUANWD6Cd81SavMMNcDm2AguOC/v7g/rnHvAh/SRBtEj0
 XNZw6UuaTAa39PseHFEy0pJ/G7nr37zORg==
X-Google-Smtp-Source: ABdhPJz5XHg+BGoqvirzX+KUNYQ53hSX+1nbKp/TrYLTpdZH3V5m5PGM/r+4YT8Yb9akMvB7gdOVKw==
X-Received: by 2002:a7b:cd82:: with SMTP id y2mr18078985wmj.99.1641725498569; 
 Sun, 09 Jan 2022 02:51:38 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f?
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id j26sm4221312wms.46.2022.01.09.02.51.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Jan 2022 02:51:38 -0800 (PST)
Message-ID: <66959117-0faa-1e56-3bb0-54b2167c9175@smile.fr>
Date: Sun, 9 Jan 2022 11:51:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To: Ricardo Martincoski <ricardo.martincoski@gmail.com>,
 buildroot@buildroot.org
References: <20211205105318.2755542-1-ricardo.martincoski@gmail.com>
 <20211205105318.2755542-2-ricardo.martincoski@gmail.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20211205105318.2755542-2-ricardo.martincoski@gmail.com>
Subject: Re: [Buildroot] [PATCH-next 2/4] support/docker: add python3-pytest
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

SGVsbG8gUmljYXJkbywKCkluIG9yZGVyIHRvIGJlIHJlYWR5IGZvciBtZXJnaW5nIHlvdXIgc2Vy
aWVzLCBhZGQgcHl0aG9uMy1weXRlc3QgdG8gdGhlIGRvY2tlcgppbWFnZSBub3cuCgpBY2tlZC1i
eTogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+CgpCZXN0IHJlZ2FyZHMsClJv
bWFpbgoKCkxlIDA1LzEyLzIwMjEgw6AgMTE6NTMsIFJpY2FyZG8gTWFydGluY29za2kgYSDDqWNy
aXTCoDoKPiAuLi4gc28gdGhlIHVuaXQgdGVzdHMgZm9yIGNoZWNrLXBhY2thZ2UgY2FuIHJ1biBp
biB0aGUgR2l0TGFiIENJLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJpY2FyZG8gTWFydGluY29za2kg
PHJpY2FyZG8ubWFydGluY29za2lAZ21haWwuY29tPgo+IC0tLQo+ICBzdXBwb3J0L2RvY2tlci9E
b2NrZXJmaWxlIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+IAo+IGRp
ZmYgLS1naXQgYS9zdXBwb3J0L2RvY2tlci9Eb2NrZXJmaWxlIGIvc3VwcG9ydC9kb2NrZXIvRG9j
a2VyZmlsZQo+IGluZGV4IDJhZWUxMjk2NjguLmE1ZDU0YjZlOWQgMTAwNjQ0Cj4gLS0tIGEvc3Vw
cG9ydC9kb2NrZXIvRG9ja2VyZmlsZQo+ICsrKyBiL3N1cHBvcnQvZG9ja2VyL0RvY2tlcmZpbGUK
PiBAQCAtNDAsNiArNDAsNyBAQCBSVU4gYXB0LWdldCBpbnN0YWxsIC15IC0tbm8taW5zdGFsbC1y
ZWNvbW1lbmRzIFwKPiAgICAgICAgICBweXRob24zLWZsYWtlOCBcCj4gICAgICAgICAgcHl0aG9u
My1ub3NlMiBcCj4gICAgICAgICAgcHl0aG9uMy1wZXhwZWN0IFwKPiArICAgICAgICBweXRob24z
LXB5dGVzdCBcCj4gICAgICAgICAgcWVtdS1zeXN0ZW0tYXJtIFwKPiAgICAgICAgICBxZW11LXN5
c3RlbS14ODYgXAo+ICAgICAgICAgIHJzeW5jIFwKPiAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
