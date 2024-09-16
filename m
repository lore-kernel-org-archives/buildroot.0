Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 660BFC3ABB2
	for <buildroot@archiver.kernel.org>; Mon, 16 Sep 2024 11:17:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2762940A39;
	Mon, 16 Sep 2024 11:17:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hQE5_V0WfTpN; Mon, 16 Sep 2024 11:17:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF19040B2A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF19040B2A;
	Mon, 16 Sep 2024 11:17:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6EC1C1BF3AD
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 11:17:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8E45840A3B
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 11:17:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IG-1cbyZ5RQa for <buildroot@lists.busybox.net>;
 Mon, 16 Sep 2024 11:17:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 47AD140A39
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 47AD140A39
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 47AD140A39
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 11:17:54 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [92.184.102.118])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 017D12003ED;
 Mon, 16 Sep 2024 13:17:45 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 16 Sep 2024 13:17:44 +0200
Date: Mon, 16 Sep 2024 13:17:44 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: =?utf-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>
Message-ID: <ZugT2E3Y1M3TjNt_@landeda>
References: <20240701145708.2886402-1-raphael.melotte@mind.be>
 <20240705091409.3370272-1-raphael.melotte@mind.be>
 <20240705091409.3370272-3-raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240705091409.3370272-3-raphael.melotte@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1726485472;
 bh=3W/OIsz4Thrq89vnopj+LTa2wt2sUtOQ03+BSOGrFgI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=l4k/dYzmUAl/E+GB4goWk6jnqzye6PHh1ueyEAefu8g3x51SrECnIoiYPIENFUZgw
 8G6Zc+4ZQmNkG7EfhjvVlSCasysMESTwUJ/hQM2pSNglP7ZE8IairfbhdAEzrfNDlO
 gaTDyjOpB2X+wGpVGXDdqz0JekW6L1/S5JhvTbjx10J1/lCSWmYnJoy5YFf2Q2S30q
 uAhhuPYG4a8yMq3ZVFHqJGhwjmq6y1/jnRuPU9rkMkWNZrKlMb5WDUN4F6/6ZBaoOa
 DmeWJaYxRCvHe2DEgEVB+W1S/s/sXAG1nji9grzD9kZCeDqHmvTHyoyXFo5hMDDN6R
 V8PthhDE6kpxQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=l4k/dYzm
Subject: Re: [Buildroot] [PATCH v2 3/4] package/python-sdbus-networkmanager:
 new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

UmFwaGHDq2wsIEFsbCwKCk9uIDIwMjQtMDctMDUgMTE6MTQgKzAyMDAsIFJhcGhhw6tsIE3DqWxv
dHRlIHZpYSBidWlsZHJvb3Qgc3Bha2UgdGh1c2x5Ogo+IFNpZ25lZC1vZmYtYnk6IFJhcGhhw6ts
IE3DqWxvdHRlIDxyYXBoYWVsLm1lbG90dGVAbWluZC5iZT4KPiAtLS0KWy0tU05JUC0tXQo+IGRp
ZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1zZGJ1cy1uZXR3b3JrbWFuYWdlci9Db25maWcuaW4g
Yi9wYWNrYWdlL3B5dGhvbi1zZGJ1cy1uZXR3b3JrbWFuYWdlci9Db25maWcuaW4KPiBuZXcgZmls
ZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjcwZWMxMTQxNGMKPiAtLS0gL2Rldi9u
dWxsCj4gKysrIGIvcGFja2FnZS9weXRob24tc2RidXMtbmV0d29ya21hbmFnZXIvQ29uZmlnLmlu
Cj4gQEAgLTAsMCArMSwxMSBAQAo+ICtjb25maWcgQlIyX1BBQ0tBR0VfUFlUSE9OX1NEQlVTX05F
VFdPUktNQU5BR0VSCj4gKwlib29sICJweXRob24tc2RidXMtbmV0d29ya21hbmFnZXIiCj4gKwlk
ZXBlbmRzIG9uIEJSMl9QQUNLQUdFX05FVFdPUktfTUFOQUdFUiAjIHJ1bnRpbWUKPiArCXNlbGVj
dCBCUjJfUEFDS0FHRV9QWVRIT05fU0RCVVMgIyBydW50aW1lCgpZb3UgZm9yZ290IHRvIHByb3Bh
Z2F0ZSB0aGUgZGVwZW5kZW5jaWVzIGZyb20gcHl0cmhvbi1zZGJ1cy4KCj4gKwloZWxwCj4gKwkg
IE5ldHdvcmtNYW5hZ2VyIGJpbmRzIGZvciBzZGJ1cy4KCnMvYmluZHMvYmluZGluZ3MvCgo+ICsJ
ICBodHRwczovL2dpdGh1Yi5jb20vaWdvOTU4NjIvcHl0aG9uLXNkYnVzCj4gKwo+ICtjb21tZW50
ICJweXRob24tc2RidXMtbmV0d29ya21hbmFnZXIgbmVlZHMgbmV0d29yay1tYW5hZ2VyIgo+ICsJ
ZGVwZW5kcyBvbiAhQlIyX1BBQ0tBR0VfTkVUV09SS19NQU5BR0VSCgpZb3UnbGwgYWxzcG8gbmVl
ZCB0byB1cGRhdGUgdGhlIGRlcGVuZGVuY2llcyBsaXN0IG9mIHRoZSBjb21tZW50LgoKUmVnYXJk
cywKWWFubiBFLiBNT1JJTi4KCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0t
LS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUu
IE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycg
Y29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwg
LyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBg
LS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBu
byAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1B
SUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
