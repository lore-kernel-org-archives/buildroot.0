Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60686C79F99
	for <buildroot@archiver.kernel.org>; Sun,  6 Sep 2026 12:20:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F713605EB;
	Sun,  6 Sep 2026 12:20:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sNS7Bx65ocSt; Sun,  6 Sep 2026 12:20:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 1597160616
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788697230;
	b=altClO3cqBVmO1GOY0WQFtseL64HDFmsfxYIVzK42gaZ4XNgB6/FcqxieP5rRkV9AeOo
	 V52yeIpFWHzMDz/wZhBc1FlTTwoJyTetT/tMwr6iC+v/G2299TZLEjXuYXklugSNkuccL
	 Pa0zf/9yR8lG2nn+DEGG4k5782g6SGJiAGTY9fwEl1PlUl6a0U4S79bHv6O9SzUiKbmsA
	 s/DJb8yR6jH4TXbskQiqcpK5KYojR/jUzClNPhM9XnxAt6zHwl38h/w8PxJRLfMH3QLkI
	 xCeLRJAUxMBiWjZMaZFAp4dLZNuBuSpPR/vyANYXE8OYdR7RwKSHzvHiORedYdWNawQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788697230;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=6m1eE9nyEeY9lqS6/qJJ1HxZen/SWBIU+pjs08sJLYc=;
	b=Ywf1v5gsxoRYceD3f73TL2XZ7cgJyBDch4g+2EnSzGfuYk0eHT6+Tm5n9mVy4QUlTwjS
	 G2mFyOdOlnJ9k9j9ywe5RxzQvnM5aBgLSU0eW/u26AZKsxdDbNX3uQ3VAv2MaC9F3R1Vh
	 3BJzdbHKX/Y2hJXDbmQWGSEgHCXKtNazO2G8j6OyJN5ENzArEHuFtsROioI2m4ij+KPIh
	 SIUZV+bERJCF3MRt3moCSWwHupGheIMvEICi3oMWYtaX6CqG7lhXi8j1YzvlniTbCVhHt
	 wcYuDQyyWwUr8heUe9qSv+dI2aqpIS10f51MySuICu2xdRVFuZ++6Si/ZOSyp/1b1Ig==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788697230;
	bh=6m1eE9nyEeY9lqS6/qJJ1HxZen/SWBIU+pjs08sJLYc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GD/eazulz1tq2dfJgAmpYUTjgJDX24tK/rln5i3IMb2ZdH0W00+oKiHsRxYpFv2K1
	 FEy+7cTrewh/JfhXUyvdL0MVfZJiC2hIZqfXiDAfp7Ewj118Ks6AMzhXzQGjj2HgGl
	 dWjPNWg8pIyy6+Ecil6CoNfpL9+hqrw2Nqu8v13e2Lv/6vONEn/weZXp9KM0fPsxoz
	 UG15xtquvdcssf844SStjpRaWgVVXF5F6vKlTE7Pm+djRnO2VR3wp56hTIM1J67pBO
	 m8UtJHHxuT/x43yybVM3NI+SoDN66B+LdSP/uUdk5B+q+Vy8pxbb2Nh/NRza3NPxj9
	 TA9FssjAStBaw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1597160616;
	Sun,  6 Sep 2026 12:20:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D2070970
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 12:20:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C35FF405C3
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 12:20:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id psXuJFsn3ZzC for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 12:20:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org A2D78405AE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788697226;
 b=VNaYMDmA8jE6I1NTj12VjHJ29Kb6IK3YzEcNCV4CgGxMaj1sa8JCXWoMZTTUZqv5I3xs
 hjlKvfiSkDjzSHnQPA+QpP8ORdFOgrzwCkPhIWVBhUvunQtVMQyUH9dARP62NdiyqucSE
 fMePAdlviDH3sr1kFMje9TeemN0cI3QDVLLvPjlAKcF2scdf0eSBUf9XvZMJIX1PRnPGu
 W3jcQqv628BmEsSeFZ9xeO574/NbdjFZ4hQtK7DihaouZCZrwQBee/X0sFvwEfnf1httE
 L/qwIkVI9gzNFmzWnWDDjnnEugyqVaygDKJFW9DzKHU6LgFY6ac7aryx8Th49Pqi4wA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788697226;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=kcCvlUGUZtMBTPa3A1m1DrF7uvtSU80aRKSrYaTfou0=;
 b=V6HEBTWSPsx7cj1RRRHf40KERYUcUrTnYlPaEUAV6NNwNr/g0jyx1n12DUqxlUhMRSrP
 f8S6nmFBGqJ6pkAIEFl7nhtoRqJTZcLEGMzB6N+JrtT0sbwYwDlZHFzSP3ojfmccM1mt8
 JuVPWLLEivCZaiDX3J/60SP0+sytf+Krlbz49i4Oruf8O6UVaMjw11v2IYRBRhPxMXXgI
 XO0VlS0MEUO/zinEJZcRXa4nnHaH/+rmyzp0Nui1Bko/+o/M5oh+Vw2x2wvRVBb7mrlgq
 y6wGvKsXjgBU9KwWBcp2xLms/j8a23O6pNsXWBmq8iP//7dA989cVfsPERgkjzGH4gQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=POqAHgcG; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::15"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A2D78405AE
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 12:20:25 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id B8FC8780333;
 Sun,  6 Sep 2026 14:20:19 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:44582])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 06 Sep 2026 14:20:19 +0200
MIME-Version: 1.0
Date: Sun, 06 Sep 2026 14:20:19 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>, Giulio
 Benetti <giulio.benetti@benettiengineering.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260906103257.3688362-1-bernd@kuhls.net>
References: <20260906103257.3688362-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.18
Message-ID: <5f24abaa58bf7164b13c00b9e155fae5@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/7] package/strace: bump version to 7.2
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 06/09/2026 12:32, Bernd Kuhls wrote:
> https://github.com/strace/strace/releases/tag/v7.2
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.

For info, I added the missing symlink rename in the kernel bump. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/7e2c62319303f14a5cd835a2b1f21083dc536878

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
