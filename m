Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78991C624D3
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 17:08:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47B2660625;
	Sat,  5 Sep 2026 17:08:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OPFTmVBmq-9U; Sat,  5 Sep 2026 17:08:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E4F8860602
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788628121;
	b=CqKQWLvjOXG8phDZKsCYpwoq+1OEVCm+fBYpJiANB5CJdwRjvf3cR9ROAygSHEC3Udz8
	 uEZuL7tWYdVpHnxLDQC8I0dX4GP7Vz+ndAnW68KeENyGYJm3EwuVtamqtVr26c5jWb5B2
	 eVKsQAGTZYU3OYoSkiJyJiI/YjG95yaMXJp8Y+oZqAXsjTm7M1KbDsSGGafA7L6Gql2Kl
	 R3T9CTkX/Fecq/rYzZrK8auk17CJEHTht27dkqpcyWkezKoJzJUOcGIcTKtkCX+Bof81q
	 /z/2PO/A9dudkLgoPTQc8lx+3/zBVeClNu8rJqNBGxUqIOoRUbSMZ0moiQQWu2/FAMA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788628121;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=Cx7XodYjY4GYSXUndjm8SIYyOu5L2b+GdrwM1o1/smA=;
	b=Y7Mcn3spxEw3DzmQzqfZnlN9fIJ9ewFQUfNn+3drLQ7HQBu/A/qaljE8fNEOjg0eHD/q
	 TU9qzEqZ/hG1diwF4+iJ8k/3CdA/On8GKmiJWzt4Up843Q1A6dT1gt/u9tooC0bkSq/rI
	 rENPCgMqrhfuIVIlWZV/kQjpFRTh430S5M9ANRHPggIoPz9zizxj+ZAJ9S7MlETyNV80u
	 Vs4i2jO7/+Hj/8qwocMt//TdkgFyvr15u5Lk7sVmEZZbCJPpTvdWHWDutjZej+Z7aMbWE
	 +NFN4zZs/8cxkbq4n52FXBV/aa4DOGrUlftcgznm3dX0tAJz6qs459WjIcYoFCs11FA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788628121;
	bh=Cx7XodYjY4GYSXUndjm8SIYyOu5L2b+GdrwM1o1/smA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BkN6/ZQsR0zObfGfNG1IEAkVBCJElRTckaLk+UgFCzsNWxCsKXKToNz6Qile0SveK
	 OrOxhhqyaVCtAB+1Hg/Qm0IkSlBNNBeElhHE6vhavOsoe5dpHbt13Hs8gqxQ01Wv1g
	 AoqqEBTn1yp18zgyC6HMYbscndYQaHAFMsuwY6eAfX6t8rAzIHPb6uGp5AY1K3jrzH
	 IAObLqt1LCKTg6oLWZLRRYH53ixJufHIQ0/8ocNs4VMwEeuqm1A27trGJaIDKjZMUc
	 HdzkBvdruu4WXIJee7s9cGi+N1OzwGI0L/YX22mDQ3UXB0R61lN7Lhkwr4NRz+ScME
	 2mQQZQo0clmBw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4F8860602;
	Sat,  5 Sep 2026 17:08:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 229D8105
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 17:08:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 144D180F50
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 17:08:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gbyb9MQrb7hC for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 17:08:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 0FD7C80F48
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788628118;
 b=qSphdGib96eyTTMH0OhbqiOU0h58RHv9e2LfR7TSeeuJ6SXERhTMBgDZVpe4Doo52uu7
 i8ZHlElX8WO6dD0yjxJQk29Fp44WypyQlratD/L3fW1M4HlQmK+F207g2oRSFRmSS4OeF
 HVL0uV0F8ihulFms8cW4TajF/EFb43gIl2R1oIyKsT6dLpPNvKluefNVyQnsP+gjOXwfV
 u0uJeOsbsqfhAELP0nIDwjmvmUdJWZE4P80e+DoIfS6tlVPqeP5aVgANW8DEGtQmbGDzh
 jpP38IjyyxplsZkqYOIXNtrdJhfX1NrQiuWQCo5zIUiWiF1MvyJaE7w7+7BQ855/COA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788628118;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=5YAz+22EYDXhSL9bH6wVnTbv4YVd7jUbIuexD/24Ww0=;
 b=P4UKoFxyYe36nMjRDhXV077JIBGubAH3av8AwOKwrLsGDm/11royGctrFddaDqI90Z3a
 5z8PoLMx2SWQLibmmnhUH3W4euZUJ/cS5qbURWdhufhzJQCy9f/p8ZVSn/bEUqXjU4SOr
 4YT1rCJEe8puJUWgqyBaE57RtHOScYTvu0s8mZQUUr7wWehyX3UW65lmF2Wq0Y9PW9cP3
 y8f4Nwq8mMTO21tYof8tHPck4I7ce/l96DYomqc2YFEmg7nLjfc3dWWCKsuOLrnuoSP3+
 wna4LB/YI2TKmLX3LjyI1aTkBLC7S3GPXKwg849AJSEIG+Whuptcm5enLN5x7TS2Jmg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=UFPQwyw3; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::11"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0FD7C80F48
 for <buildroot@busybox.net>; Sat,  5 Sep 2026 17:08:37 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 48CCB2003C8;
 Sat,  5 Sep 2026 19:08:34 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 05 Sep 2026 19:08:34 +0200
MIME-Version: 1.0
Date: Sat, 05 Sep 2026 19:08:34 +0200
To: Francois Perrad <francois.perrad.86@gmail.com>
Cc: buildroot@busybox.net
In-Reply-To: <20260904185921.587878-1-francois.perrad.86@gmail.com>
References: <20260904185921.587878-1-francois.perrad.86@gmail.com>
User-Agent: Webmail Free/1.6.18
Message-ID: <845d9a1a28034c27d14ae13221b9ff28@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 01/12] package/lsqlite3: bump to version
 0.9.7
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

On 04/09/2026 20:59, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
