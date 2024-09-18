Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2703CCD18B
	for <buildroot@archiver.kernel.org>; Wed, 18 Sep 2024 08:08:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C9FB846F5;
	Wed, 18 Sep 2024 08:08:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dharpHZK8Rz0; Wed, 18 Sep 2024 08:08:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA356846B3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA356846B3;
	Wed, 18 Sep 2024 08:08:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EDD421BF2A7
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 08:08:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DD204846B3
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 08:08:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 97WpO9qAfADu for <buildroot@lists.busybox.net>;
 Wed, 18 Sep 2024 08:08:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=147.173.1.68;
 helo=mailgw-out1.grenoble.cnrs.fr; envelope-from=bonet@grenoble.cnrs.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2FA7684458
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FA7684458
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [147.173.1.68])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2FA7684458
 for <buildroot@buildroot.org>; Wed, 18 Sep 2024 08:08:41 +0000 (UTC)
Received: from [147.173.65.159] (unknown [147.173.65.159])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id DC3CEC2EEF
 for <buildroot@buildroot.org>; Wed, 18 Sep 2024 10:08:38 +0200 (CEST)
Message-ID: <563a1e6d-aefe-4a83-a609-fb860257be7d@grenoble.cnrs.fr>
Date: Wed, 18 Sep 2024 10:08:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <CAG94F8ptMs+ywOnb9FugtEQxb_JA5FscQP9d1SbRP+9ULq4Txw@mail.gmail.com>
Content-Language: en-US
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
In-Reply-To: <CAG94F8ptMs+ywOnb9FugtEQxb_JA5FscQP9d1SbRP+9ULq4Txw@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1726646918;
 bh=9UINvqb3nYRWXSYY5NEjOGW4RSEtB8Y7ZMmBvqTIQdM=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=HsGYjGhZuxhHdwvqBDPJD+s+Xyc9KR62qKz5s6cetlHN03TGn/sBxz2JEmmOXwcDr
 JScE2A3A2iwIM5EfkDwnq/bNcyVBwr7HLO51HBGzD4stoleDbomVeNdqzV9/48iFEy
 7R8u2R3pmwYXBVf/ojXBizFwjz3NCaMAkaOo2m5VQztilSvF5bDCbTygSepI5hxPAe
 M8hDoKaNJXyD17IDPbr44fEKP1lUe8q1zT8RI2U9U4gPiVSkrUa0fAUSx5FJIDpFzM
 7ouGNS6iTimWkFbrgcfrqGUCnQiW1DTY4qN33ORpM5F5KLVq4uqRZL/V5TJQaZhTAz
 fnTWoPnFGseCQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=HsGYjGhZ
Subject: Re: [Buildroot] 
 =?utf-8?q?node_crashes_when_the_madvise_system_call_?=
 =?utf-8?q?returns_=E2=80=9CFunction_not_implemented=E2=80=9D?=
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

SGVsbG8hCgpEYXJ5bCBTcGl0emVyIHdyb3RlOgo+IG9uIGEgdGFyZ2V0IHJ1bm5pbmcga2VybmVs
IHZlcnNpb24gNC45Ljg0IFsuLi5dIGEgY2FsbCB0byB0aGUgbWFkdmlzZQo+IHN5c3RlbSBjYWxs
IFtmYWlscyB3aXRoXSDigJxGdW5jdGlvbiBub3QgaW1wbGVtZW50ZWTigJ0gKEVOT1NZUykuCj4K
PiBJIHN1c3BlY3QgdGhhdCBJJ20gdHJ5aW5nIHRvIHJ1biBub2RlIG9uIHRvbyBvbGQgYSBrZXJu
ZWwuCgpBY2NvcmRpbmcgdG8gbWFkdmlzZSgyKSwKCiAgICBTaW5jZSBMaW51eCAzLjE4LCBzdXBw
b3J0IGZvciB0aGlzIHN5c3RlbSBjYWxsIGlzIG9wdGlvbmFsLAogICAgZGVwZW5kaW5nIG9uIHRo
ZSBzZXR0aW5nIG9mIHRoZSBDT05GSUdfQURWSVNFX1NZU0NBTExTCiAgICBjb25maWd1cmF0aW9u
IG9wdGlvbi4KCllvdXIga2VybmVsIGlzIG5vdCB0b28gb2xkLCBidXQgbWFrZSBzdXJlIGl0IHdh
cyBjb21waWxlZCB3aXRoCkNPTkZJR19BRFZJU0VfU1lTQ0FMTFMgZW5hYmxlZCAod2hpY2ggaXMg
b24gYnkgZGVmYXVsdCkuCgpSZWdhcmRzLAoKRWRnYXIuCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
