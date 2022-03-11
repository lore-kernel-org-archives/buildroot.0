Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2822C433F5
	for <buildroot@archiver.kernel.org>; Fri, 11 Mar 2022 12:47:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AAA1084726;
	Fri, 11 Mar 2022 12:47:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GXaRlf_PSfvM; Fri, 11 Mar 2022 12:47:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E68DE825DC;
	Fri, 11 Mar 2022 12:47:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8201F1BF3BD
 for <buildroot@lists.busybox.net>; Fri, 11 Mar 2022 12:47:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 716E94090A
 for <buildroot@lists.busybox.net>; Fri, 11 Mar 2022 12:47:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=163.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oFbL1iYuM57N for <buildroot@lists.busybox.net>;
 Fri, 11 Mar 2022 12:47:20 +0000 (UTC)
X-Greylist: delayed 00:10:01 by SQLgrey-1.8.0
Received: from m12-11.163.com (m12-11.163.com [220.181.12.11])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3CDC640906
 for <buildroot@buildroot.org>; Fri, 11 Mar 2022 12:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Message-ID:Date:MIME-Version:Subject:From; bh=j+Zdq
 kjZyk2sFYQ538Ni0QpBoewD2CEPPkzffEGMJBc=; b=JfbT73D3ldWsKOOjL62IA
 VtQt/QSzaNMUV1u9YoVNz0RHrD2D7UyHcYBrsKa14c0UrAJjWFVzFulYZWYlntxD
 bTWP5hZdBWB7tugKfplnTlb8Sv/dvNP4ZztJq0XRqHLodFlzY6l8wfj5XepRyXeE
 y10HS6d1byiuYi+i24BVzc=
Received: from [192.168.31.190] (unknown [123.185.181.179])
 by smtp7 (Coremail) with SMTP id C8CowACHKcjTRCtiW+3YCQ--.54475S2;
 Fri, 11 Mar 2022 20:47:16 +0800 (CST)
Message-ID: <8db51f93-0b22-57b3-5a99-a4199277ea91@163.com>
Date: Fri, 11 Mar 2022 04:47:15 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Mohd Faiz Rohani <mohd.faiz.rohani@gmail.com>, buildroot@buildroot.org
References: <CAHnHX5hroE_7UO1ZftG4VktkSOTCj6u6W7bRM-sBpe8WBM+_oA@mail.gmail.com>
From: TIAN Yuanhao <tianyuanhao3@163.com>
In-Reply-To: <CAHnHX5hroE_7UO1ZftG4VktkSOTCj6u6W7bRM-sBpe8WBM+_oA@mail.gmail.com>
X-CM-TRANSID: C8CowACHKcjTRCtiW+3YCQ--.54475S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
 VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUUSoXUUUUU
X-Originating-IP: [123.185.181.179]
X-CM-SenderInfo: xwld05xxdqxtjrt6il2tof0z/xtbB2ATAjWBHJI15VwAAsx
Subject: Re: [Buildroot] User and Group Utility in Buildroot
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

VGhlc2UgdG9vbHMgc2VlbSB0byBjb21lIGZyb20gX3NoYWRvd18sIHdoaWNoIEJ1aWxkcm9vdCBk
b2Vzbid0IGhhdmUuCgpUaGFua3MsCll1YW5oYW8KT24gMy8xMC8yMiAyMzoxMCwgTW9oZCBGYWl6
IFJvaGFuaSB3cm90ZToKPiBIaSBHdXlzCj4KPiBJIG5lZWQgaGVscCBoZXJlLiBJIGNvdWxkIG5v
dCBmaW5kwqB0aGUgY29ycmVjdCB1dGlscyBmb3IgdGhlIExpbnV4IAo+IHVzZXIgYW5kIGdyb3Vw
IG1hbmFnZW1lbnQgKHVzZXJhZGQgZ3JvdXBhZGQgZXRjLiBldGMuKSBpbiB0aGUgCj4gQnVpbGRy
b290IHBhY2thZ2VzLiBDYW4gYW55b25lIHNob3cgbWUgd2hpY2ggdXRpbHMgSSBuZWVkIHRvIHNl
bGVjdCBpbiAKPiBvcmRlciB0byBhY3RpdmF0ZSB0aGlzPy4gRnlpIEknbSB1c2luZyBidWlsZHJv
b3QtMjAyMi4wMi1yYzMuCj4KPiBUaGFuayB5b3UKPgo+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
