Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8BB7C5DF81
	for <buildroot@archiver.kernel.org>; Mon, 24 Aug 2026 11:47:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7508480DCF;
	Mon, 24 Aug 2026 11:47:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 10lRCeBcBU1P; Mon, 24 Aug 2026 11:47:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787572059;
	bh=gc+Xn5gSH7wDprPg8xgvd9TX7tkSKQGbRZH2G9YFMy8=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pMC+1yTyx2Q7fUXQtiQQxLA/5xHvNFPS1hHDk9QDqGdmlluJ0LGAG2V9j+frjCaXT
	 9sInWq1RkXEKi2kQ4yxuzkd5RAbC/rHM/TWFA/aWP8KUkIq+0cqMESJbk6JfyrCl4/
	 YhIbjwN96rqquYy7Ri7ygZZFypEA59e+BItMvThqWqcNoPHk8klAufWRmqZTSz8ejU
	 M36SKXBWzjYW/oil59Sl4RVM0wRTCZN0bNcZ8QvCR7wEB/+0Pq6fGOoz/5O6uV9kSx
	 VLmJ/PYMh4W09bLJTABMEfV7I88L43pOun+IyA9YEQ8/rMznQu+zyHZrVS7Vpc2dS0
	 QIh84cFqSyooA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A030980DC6;
	Mon, 24 Aug 2026 11:47:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 050C43DA
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 11:47:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB17840077
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 11:47:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SsPv3o5BrVF3 for <buildroot@buildroot.org>;
 Mon, 24 Aug 2026 11:47:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=93.91.132.248;
 helo=mail.gnudd.com; envelope-from=rubini@arcana.gnudd.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=gnudd.com
Received: from mail.gnudd.com (mail.gnudd.com [93.91.132.248])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 86FEB40042
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 11:47:35 +0000 (UTC)
Received: from rubini by mail.gnudd.com with local (Exim 4.94.2)
 (envelope-from <rubini@arcana.gnudd.com>)
 id 1wyT9H-00017L-MU; Mon, 24 Aug 2026 13:47:31 +0200
Date: Mon, 24 Aug 2026 13:47:31 +0200
From: Alessandro Rubini <rubini@gnudd.com>
To: thomas.petazzoni@bootlin.com
Cc: buildroot@buildroot.org
Message-ID: <aowvUy1MDIDNYB/I@arcana.i.gnudd.com>
MIME-Version: 1.0
Content-Disposition: inline
Organization: GnuDD, Device Drivers, Embedded Systems, Courses
In-Reply-To: <aohHBg5JtecHVORq@windsurf>
References: <aohHBg5JtecHVORq@windsurf>
 <amaDQ/RxzLn24+me@arcana.i.gnudd.com>  <aoglkraRzHufPBHQ@windsurf>
 <aognldAvgHC81hyu@windsurf>
Subject: Re: [Buildroot] [PATCH] package/opencv: depend on webp mux/demux
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

VGhhbmsgeW91IFRob21hcyBmb3IgeW91ciBmZWVkYmFjayBhbmQgY29tbWVudHMuCgo+IEFsZXNz
YW5kcm8sIHdpbGwgeW91IHN1Ym1pdCBhbiB1cGRhdGVkIHBhdGNoLCBvciBzaG91bGQgSSBkbyBz
bz8KCkkgYW0gYWxtb3N0IG9mZmxpbmUgYW5kIHZlcnkgYnVzeSwgdW50aWwgdGhlIDI2dGggaW5j
bHVkZWQsCnNvIHBsZWFzZSB0YWtlIGl0IG92ZXIgaWYgeW91IHdhbnQgKHRoaXMgYXBwbGllcyB0
byBhbGwgb2YKeW91ciBtZXNzYWdlcyBzZW50IG9uIEF1ZyAyMXN0KS4gSSB3aWxsIGJlIGFsYmUg
dG8gd29yayBvbgpCdWlsZHJvb3Qgb24gdGhlIDI3dGgsIGJ1dCBpdCBtYXkgYmUgaW5jb252ZW5p
ZW50bHkgbGF0ZS4KCmdyYXppZSwgc2FsdXRpCi9hbGVzc2FuZHJvCi0tIAogICszOS0wMzgyLTUy
OTU1NCBzZW1wcmUsIHNvbG8gc2UgY2kgc29ubwogICszOS0zNDktMjY4OTA0MSBzZW1wcmUsIHNv
bG8gc2UgYyfDqCBjYW1wbwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
