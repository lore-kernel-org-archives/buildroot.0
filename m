Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 364BDC48297
	for <buildroot@archiver.kernel.org>; Mon, 12 Feb 2024 19:50:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9BB160A5F;
	Mon, 12 Feb 2024 19:50:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id URlWBwPV8jes; Mon, 12 Feb 2024 19:50:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BD1560A50
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BD1560A50;
	Mon, 12 Feb 2024 19:50:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 880171BF427
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 19:50:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F9C1407C1
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 19:50:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3E1S3ChMBVjY for <buildroot@lists.busybox.net>;
 Mon, 12 Feb 2024 19:50:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 11D7740799
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11D7740799
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 11D7740799
 for <buildroot@buildroot.org>; Mon, 12 Feb 2024 19:50:50 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4108cbd92b9so17182385e9.1
 for <buildroot@buildroot.org>; Mon, 12 Feb 2024 11:50:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707767449; x=1708372249;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sFs6lsW0BMCb5h9hqv6bLqz3pKyc1546TPS7R6nIgx8=;
 b=XokrX4+4PGrGoV/Dn5leGnbuaOdLzyisS1ywmwINBm+0eCpIYGhyw01GXOjqlUTwXm
 8KVbZX4Fvok8uxVhIfqQIQMQyDnoqR78Imfv6xhBxVA+BZKjfl2BfusYfUXoB+EA3eJ5
 S5Qd8fM6/eeBjSyM7iHr/VMVZjgvYrUqV4czJRgrzI7Jtt4nwRIqwYEF3RW3rZWQRiB+
 VFhwrgXH9iLFrfyJbmavG3mUli1wZ9cKpe397B6S9krrRzg45aJddpS2wNLwJQ7kFP2L
 JQsc+pRfL6QAxyHPZrwTpdh48IvK2lIiIoJ9UxKT8jCDVsVWhuBX9NMewJDWGGlKqW6Q
 blQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyHdckiGu2EgO5Cj32UhTY19WrIEualv5AEv/wKESIGHkpjBIoI4sJcau2LG3ntN4yvkstp1QRzMygbO43JMF/gInr4Eab9g==
X-Gm-Message-State: AOJu0YxrMlsiqmylJ98PoWDee0FX0tuLtfK+ADbQm2HnbnYFDasMpuGv
 YkbcQcGFXIegVAEhLl10g+7a+MDUeyY3duDFwyfgs4rifXFqPXSbdrdvanZJtn0E0FdGQbNZyu5
 e
X-Google-Smtp-Source: AGHT+IH8Mo28DzJZqnPPKRFucHqtDAiC9OoAj0S/gK4RUSGdZHhdcFJhiRF5fM5EjX3iulXUKfvIhg==
X-Received: by 2002:a05:600c:3481:b0:411:b394:f15d with SMTP id
 a1-20020a05600c348100b00411b394f15dmr104744wmq.4.1707767448703; 
 Mon, 12 Feb 2024 11:50:48 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXRkpkaLUOzn+ZcaWIKuyxkZGd9HJzMWtwjpbrEIKPl1MxqwDUAtRJJoKJT8oJlk/bTtjGVbBQSq08to0dK8hO+HUmAxYtrgzlR4Ffw5YYCalXn17kl76tM9IOEaNwPLEYLj0LVEo3OJ1SU/VuSR3Dwi0W+V1WalEXYfTWBabdEwQBH3/HEsJIT1TX4Dse3UNrPA9uyY9uq5jXehIDXaxwJJn8NoY0Ssz/y/XUiLxk=
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 n5-20020a05600c3b8500b00410e90e82ebsm2697788wms.4.2024.02.12.11.50.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Feb 2024 11:50:47 -0800 (PST)
Message-ID: <ae0932bd-dd5c-4082-a34d-af0eea110b20@mind.be>
Date: Mon, 12 Feb 2024 20:50:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>,
 Marcus Hoffmann <buildroot@bubu1.eu>
References: <20240209175631.1337370-1-james.hilliard1@gmail.com>
 <Zck6_sR8fspWF37e@landeda>
 <CADvTj4ppD06TSGnYUUBSzB_sV6vErb2ozyMuGr1QjyLtu_pvPA@mail.gmail.com>
 <ZclC3_dSvLTp6Ras@landeda> <18bea399-dc8e-424b-b087-3823d0bd4545@bubu1.eu>
 <CADvTj4pdnvNK3go=5t6PWhU8ax0gNpqwD3kpOUn9RCJV8b2NkA@mail.gmail.com>
In-Reply-To: <CADvTj4pdnvNK3go=5t6PWhU8ax0gNpqwD3kpOUn9RCJV8b2NkA@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707767449; x=1708372249; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sFs6lsW0BMCb5h9hqv6bLqz3pKyc1546TPS7R6nIgx8=;
 b=GHU9ksViHjaeBGllzAV0aZyqC3J1b/I1ZwfckMqsOjd/PLgK1nzZd4Lwsu1MWbapt3
 RaoYWE//68q5G8WYJ6+W9KXL0u3NptyauU4rwjHVC5CIctdmExRYssbUFB2CTpVsZY7w
 O+lJnnMKhOH+2IL0meIGzm3qLWc9/ey07ugHv9pSMOT4EbrYzfZ4+mRLjqkOVj48zXYs
 unJOsxsAKjEIWU8/RjZ6N7WhIGeg1SthpoKkbN37dcCaEkRl7mWjvjPAoWc2iYR2CkM/
 FDCI7Vyn8eEr7KNuXjX8yjsdw+hlRVfKzLiXgkfiega3MuQXyhTf5mis4zIeY1Bnm5rE
 yi8w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=GHU9ksVi
Subject: Re: [Buildroot] [PATCH 1/2] package/python-uvloop: add support for
 cython3
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxMi8wMi8yMDI0IDAxOjUxLCBKYW1lcyBIaWxsaWFyZCB3cm90ZToKPiBPbiBTdW4sIEZl
YiAxMSwgMjAyNCBhdCA1OjEz4oCvUE0gTWFyY3VzIEhvZmZtYW5uIDxidWlsZHJvb3RAYnVidTEu
ZXU+IHdyb3RlOgpbc25pcF0+PiBJbiBzaG9ydDogaWYgd2UgY29udGludWUgdG8gdXNlIHRoZSBz
ZGlzdHMgZnJvbSBweXBpLCBjeXRob24gaXMgbm90IGEKPj4gcmVhbCBidWlsZCBkZXBlbmRlbmN5
IGFuZCB3ZSBjYW4ganVzdCByZW1vdmUgaXQgZnJvbSBweXB0b2plY3QudG9tbAo+PiBpbnN0ZWFk
IG9mIHRyeWluZyB0byBwcm92aWRlIHRoZSBjb3JyZWN0IHZlcnNpb24gdGhhdCdzIG5ldmVyIGdv
aW5nIHRvCj4+IGJlIGludm9rZWQuCj4gCj4gV2UgY2FuIHByb2JhYmx5IGp1c3QgcGFzcyAtLXNr
aXAtZGVwZW5kZW5jeS1jaGVjayBhcyBhIGJ1aWxkIGFyZyBvcgo+IHNvbWV0aGluZyBsaWtlIHRo
YXQgSSBzdXBwb3NlLgoKICBUaGF0IHNraXBzIF9hbGxfIGRlcGVuZGVuY3kgY2hlY2tzLCBhbmQg
d2UgdXN1YWxseSB3YW50IHRvIGNoZWNrIGRlcGVuZGVuY2llcy4gClVubGVzcyB0aGUgZGVwZW5k
ZW5jeSBjaGVjayB3aWxsIHJlcXVpcmUgaG9zdCBwYWNrYWdlcyBmb3IgcnVudGltZSBkZXBlbmRl
bmNpZXM/IApCdXQgaWYgdGhhdCB3ZXJlIHRoZSBjYXNlIHdlJ2QgYWxyZWFkeSBoYXZlIGEgbG90
IG9mIHVzZWxlc3MgaG9zdC1weXRob24tZm9vIApwYWNrYWdlcyBJIGV4cGVjdC4uLgoKICBSZWdh
cmRzLAogIEFybm91dAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
