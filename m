Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85252C02194
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 13:22:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 411A540580;
	Sat, 14 Sep 2024 13:22:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dm3Li2gyGj9M; Sat, 14 Sep 2024 13:22:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 02F7140568
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 02F7140568;
	Sat, 14 Sep 2024 13:22:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 08B761BF3F9
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 13:22:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA98340340
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 13:22:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3dfrD8bvF5aG for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 13:22:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E95EF40305
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E95EF40305
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E95EF40305
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 13:22:45 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [IPv6:2a02:61:a2::3f4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 28A3178050F;
 Sat, 14 Sep 2024 15:22:40 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 14 Sep 2024 15:22:39 +0200
Date: Sat, 14 Sep 2024 15:22:39 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Federico Pellegrin <fede@evolware.org>
Message-ID: <ZuWOH8KW_dPAwK71@landeda>
References: <20240914124337.1200461-1-peter@korsgaard.com>
 <20240914124337.1200461-13-peter@korsgaard.com>
 <CAM6O0ZhnJrAYQSLSXWZsMBxc8hY8bRqwbUOuWvkR+PuKKrzPRA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAM6O0ZhnJrAYQSLSXWZsMBxc8hY8bRqwbUOuWvkR+PuKKrzPRA@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1726320164;
 bh=J9qDxrr129vzJ1t3dHU0xJhe3v/4kEWbDCKVE9BBkdw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q778p2MrzEVX1BdlqTyCIGWuZiZVl3IEVpAB5ObMW5cn+qQcVtOFcAQ/2uSWfLR52
 LynjsgcAMQfhi7Lk9ixsQWYNI4jVYtFTpmGj8wTpkeREHDI3SVj+vDFttG2xXkW0fo
 lXg2ikOvtQW2cYMuYpyIEGXM4Z/xs5QNL0KYSn1yYWcuwANwhO05JNgi2Pq+0sVJCs
 Jw6MsPNI3RRixB7nfHTmgLdFqHZ8NgabaOl8NBZxNgb9zb1xTClhE0M5IoKCOqyxYW
 gMKN9PShdsCK8ivEUGddSsgyTWW5QcxAehRvyCL7A58/dAVdefZBSRNtTsrvjiXZbT
 /mAO7OASNAkjw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Q778p2Mr
Subject: Re: [Buildroot] [PATCH 13/20] package/mrouted: fix typos
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
Cc: Joachim Wiberg <troglobit@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RmVkZXJpY28sIEFsbCwKCk9uIDIwMjQtMDktMTQgMTQ6NTcgKzAyMDAsIEZlZGVyaWNvIFBlbGxl
Z3JpbiBzcGFrZSB0aHVzbHk6Cj4gSWwgZ2lvcm5vIHNhYiAxNCBzZXQgMjAyNCBhbGxlIG9yZSAx
NDo0NCBQZXRlciBLb3JzZ2FhcmQgPFsxXQo+IHBldGVyQGtvcnNnYWFyZC5jb20+IGhhIHNjcml0
dG86Cj4gICAgIC3CoCDCoCDCoCDCoCDCoE5vdGU6IGF0IGxlYXN0IHR3byBpbnRlcmZhY2VzIHdp
dGggTVVMVElDQVNUIGZsYWcgaXMgcmVxdXJpZWQuCj4gICAgICvCoCDCoCDCoCDCoCDCoE5vdGU6
IGF0IGxlYXN0IHR3byBpbnRlcmZhY2VzIHdpdGggTVVMVElDQVNUIGZsYWcgaXMgcmVxdWlyZWQu
Cj4gU2hvdWxkIHRoYXQgc2F5IGluc3RlYWQ6Cj4gTm90ZTogYXQgbGVhc3QgdHdvIGludGVyZmFj
ZXMgd2l0aCBNVUxUSUNBU1QgZmxhZyBhcmUgcmVxdWlyZWQuCj4gPyAoc28gaXMgLT4gYXJlKQoK
R29vZCBjYXRjaCEgSSBmaXhlZCBpdCB3aGVuIGFwcGx5aW5nLCB0aGFua3MhIPCfkY0KClJlZ2Fy
ZHMsCllhbm4gRS4gTU9SSU4uCgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0t
LS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBF
LiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3Mn
IGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBc
IC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0Mjcg
YC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMg
bm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBN
QUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
