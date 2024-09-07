Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EF3AECE571
	for <buildroot@archiver.kernel.org>; Sat,  7 Sep 2024 20:50:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE09F605E6;
	Sat,  7 Sep 2024 20:50:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k2JmHEDEPQ1N; Sat,  7 Sep 2024 20:50:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 02B9360659
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02B9360659;
	Sat,  7 Sep 2024 20:50:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BF0E41BF3DA
 for <buildroot@lists.busybox.net>; Sat,  7 Sep 2024 20:50:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA068814B6
 for <buildroot@lists.busybox.net>; Sat,  7 Sep 2024 20:50:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j1JHgAuVvwUM for <buildroot@lists.busybox.net>;
 Sat,  7 Sep 2024 20:50:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AEE4D8144D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AEE4D8144D
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AEE4D8144D
 for <buildroot@buildroot.org>; Sat,  7 Sep 2024 20:50:44 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id E63FB13F879;
 Sat,  7 Sep 2024 22:50:38 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 07 Sep 2024 22:50:38 +0200
Date: Sat, 7 Sep 2024 22:50:38 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <Zty8ngItqAFuU89g@landeda>
References: <20240906184756.1166732-1-james.hilliard1@gmail.com>
 <20240906184756.1166732-2-james.hilliard1@gmail.com>
 <ZtysrvrjZ6EEwuyc@landeda>
 <CADvTj4rnN9F6obtE7uaptYY6jdhOJJB8sOcstutOP1FTB6tb1Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADvTj4rnN9F6obtE7uaptYY6jdhOJJB8sOcstutOP1FTB6tb1Q@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1725742243;
 bh=pHvVsG46WAY62I9QzwFsblyjcMGVMgt2vsQ1VqSThCg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kUOacg4RKXlX4OcQ7BOhIUj297TFjFqYclZhMflz24184VwmIyPU3nYBoTUqyn+8e
 o/nkO2VVtbGRfHOu7hgbWHAbeS9VwtLYVk2OqASWa4FCUyBeZPz34BCQIz62sH7yd1
 NCV8rRS/FcwM0ax1UjBBXeLgO6JVrz5eCixDg8IfEJDWik8uktpqf/A2ZbnJOpY1GT
 Qqljia40OseAVWFFdx5hi6juS+rXATT+XPwAnDny/QLjVbpLMdr+3h/vup3WUwsXYx
 wFNQUKnqcC7B6tyoGzuVMlpqBFGyHYHp5TwDfFbqL554WcHu5e/RjSmE+KU3kuBajV
 Va6m2Trs7NK/g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=kUOacg4R
Subject: Re: [Buildroot] [PATCH 2/2] package/python-pydantic: bump to
 version 2.9.0
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SmFtZXMsIEFsbCwKCk9uIDIwMjQtMDktMDcgMTQ6NDEgLTA2MDAsIEphbWVzIEhpbGxpYXJkIHNw
YWtlIHRodXNseToKPiBPbiBTYXQsIFNlcCA3LCAyMDI0IGF0IDE6NDLigK9QTSBZYW5uIEUuIE1P
UklOIDxbMV15YW5uLm1vcmluLjE5OThAZnJlZS5mcj4KPiB3cm90ZToKPiAgICAgVGhpcyBpcyB3
ZWlyZCB0aGF0IGl0IGlzIG5lZWRlZCwgYmVjYXVzZSB0aGUgZGVwZW5kZW5jeSBpcyB3cml0dGVu
IGFzCj4gICAgIGFuIG9wdGlvbmFsIGRlcGVuZGVuY3ksIHNwZWNpZmljIHRvIHdpbjMyOwpbLS1T
TklQLS1dCj4gSXQncyBub3QgbGlzdGVkIHVuZGVyIG9wdGlvbmFsIGluIHZlcnNpb24gMi45LjA6
Cj4gWzNdaHR0cHM6Ly9naXRodWIuY29tL3B5ZGFudGljL3B5ZGFudGljL2Jsb2IvdjIuOS4wL3B5
cHJvamVjdC50b21sI0w1NC1MNTUKPiAKPiBCdXQgaXQgZG9lcyBsb29rIGxpa2UgaXQgd2FzIGNo
YW5nZWQgaW4gbWFpbjoKPiBbNF1odHRwczovL2dpdGh1Yi5jb20vcHlkYW50aWMvcHlkYW50aWMv
cHVsbC8xMDMzMQoKT0ssIHJpZ2h0LiBUb28gYmFkLiBDYW4gd2UgYmFja3BvcnQgdGhpcyBjaGFu
Z2UgaW5zdGVhZCwgdGhlbj8KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgotLSAKLi0tLS0tLS0t
LS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0t
LS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAv
IlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYg
fCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAg
ICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5T
VCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5v
cmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4t
LS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
