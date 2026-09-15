Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EB4BC88E75
	for <buildroot@archiver.kernel.org>; Tue, 15 Sep 2026 17:27:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6793B6074D;
	Tue, 15 Sep 2026 17:27:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OzPpU3Ahk7uP; Tue, 15 Sep 2026 17:27:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 8BB7F60760
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789493277;
	b=MabJnOMd2+ge9DR7JiSibfy1JgKxqy8dQ3CAhoJa3eQHMBodNv4sk7fUQwcxYAWSAHv0
	 nXIjTMETBpiJjP9Ozq3MjIeOab71kmFVaOPpcZD7GVr6VoXfJWcbvdBoyHOdKgeQza0Wr
	 xPOZhP6QfARQAaCDFhZx0oF/6dPRoIfyQM+XRqBFBpojqxJN9FwumBcpB32O6PbRYrbbi
	 U6pA/n+U+26yxJ4uW5UplacPGBt+EC3vSnVZzwOlveoNPdV65xWBbkPg/u8kHCdUcJ5MK
	 bmnuXsa+803iUeGxOZAgXuAFj+Dz+7vahEWScIjPPrrvQbECklFVlwTMxqnGDUcTl2g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789493277;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=XAWKLpgYvNbrHSo4YqllzSClVrTStyOPRgwlRiBX0Vk=;
	b=C79yo0jRScJLPCBJ65T1zkZTR9VQ/cw6BhXRg+hrRAXNxsKtmyyrrbjVoKLySmSPZ0la
	 cY5nxexqAb52TI3qToF29NSq8/wIHkQQCudJ8eOGuc20GGVNWuHJbYAjgHJ5SAuU7PUlE
	 LDZ9BTBJ7INJZhSXx6r9wzBIH49imnt6e4wJWl4xJRZG6ey8l9BtDFwEgWuAl2YOJCLcy
	 Zv0Jh0qVxEjCNUoR+a52iMnwxEoxKkiIu3puWjuUFY3Jq6YnkgOG9jvbOWFvJ+qhkfxIg
	 zob2f2fvK4/v7qg4Bm0z7jmFf2t7N/qxUSvQoxfTa/Pski0G6jg5+TaFKiLcFUF4iEA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789493277;
	bh=XAWKLpgYvNbrHSo4YqllzSClVrTStyOPRgwlRiBX0Vk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mrlUvry28Pd0BZx9o35AHb518YMam5901YbP8QjA5e5ovkSY5rt4Lis44JWsBHI3D
	 NhbLrC3S2nGbxeCfE5XE1UhMAV1T719E9VQn/1/hx6u9SoDQUM9WMqG9nX6pNpUEUs
	 yaNA3bhMJdqC5e+5Dbprqs4go58dndf9EgDY1KYh2TZu0pWN68hkqJN44EFB/54TEM
	 qkLurT2gtHqm8I9Ij6ZHA9tAk5TuVgIpuYw7OsxjHUaDrTezbXes+9PS+wKe5UX16n
	 n3ynamiWLN7PNkPq33rQ+RLI8ll7IBWCOmBX4mdCSdEKa/5n2IBVWtWiOJ5W0xjpSe
	 zF3RXdgFGjXCA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BB7F60760;
	Tue, 15 Sep 2026 17:27:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 211BE23F
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 17:27:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 12FB54055D
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 17:27:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8cGSQD-arGhb for <buildroot@buildroot.org>;
 Tue, 15 Sep 2026 17:27:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 38B6C40400
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789493275;
 b=Llh/yW5gjY+nlPUlrosEB4HD/W91vDRa+84wHmu2torohvaVSQM/34pV5MGtzm5M4k7l
 Ot1jiKGJxyojQfoIsQkZW4RUbXmKagPo5Zyr6oaxLR0mriDZXxqU3hQZAJa5fLWeUq248
 rnttq0/+KukWDuXt62Z+PcOb3P3aDjI6+SCdEyE0icCMfCbw5ESmTpu6RupBhmxqDRARK
 BQU9fqR0p8AEC4oHCQQGWAwa21rKMi41bQyZYf7b5nRR0SwzDbGmk6Z81C3lqvW35nbin
 eang5ca9Dy61/EWOIuCDzJ8H/MezEqDe96ih3NdkOlxBH+0zZ92b14m9+fQQSlTFiWw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789493275;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=GXwr4l0xvVqOcu6WQ8jB15IMBfWLjsUvoRzZWkDuXDA=;
 b=ENI+A1JLhhydsQsIKz9sDhQcrn9uIFuWskkO3vtD0+3IMdymjqOUY087CkmegLcZM+BJ
 VA4yV0YqYCi6u5aSg2MOcvOKsjCa8sCOl+UOU9z7nsuGVvjIFHonaPR3FfF1HPsWjFYj2
 kAPigeisVEzD3Gx5itrFUVPHUQdCRNKwIvbVhB/Bg8tTmPUm3Cvi8KaPihIdVtzcsLH6h
 Uxo65KRJ3iBtLxjbYIx+XeJMRHySsnXXFPoa0Mq4ys1s7ElSwJkxGrWUoRlWzZXbFU9n/
 D3kkfkbM3tSZYejELaekSxZaeDFnxSji0ec7EBZd0bc8DXXzaUWRgyD8hArF/8gLBBA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=fjaV2UOy; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::12"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 38B6C40400
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 17:27:54 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 8DB7D13F86A;
 Tue, 15 Sep 2026 19:27:49 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 15 Sep 2026 19:27:49 +0200
MIME-Version: 1.0
Date: Tue, 15 Sep 2026 19:27:49 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Marcin Niestroj <m.niestroj@grinn-global.com>
In-Reply-To: <20260915110904.1918014-1-thomas.petazzoni@bootlin.com>
References: <20260915110904.1918014-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <538f58f9c7a00899ba0dbaabff3b3a15@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/netdata: propagate gcc version
 dependency of protobuf
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

On 15/09/2026 13:09, Thomas Petazzoni via buildroot wrote:
> Since the bump of libabseil-cpp in commit
> 76241e89e1fa7a7b46e23d0a22c3d4fc11a2475c, it requires gcc 10. As part
> of this commit, the protobuf package was updated, but not its reverse
> dependency netdata. This commit fixes this issue.
> 
> Fixes: 76241e89e1fa7a7b46e23d0a22c3d4fc11a2475c 
> ("package/libabseil-cpp: bump to version 20260817.0")
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
