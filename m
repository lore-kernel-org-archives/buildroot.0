Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EE40C79FA0
	for <buildroot@archiver.kernel.org>; Sun,  6 Sep 2026 19:09:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2EF560643;
	Sun,  6 Sep 2026 19:09:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ga0UatlN6fsI; Sun,  6 Sep 2026 19:09:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 2F609605EA
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788721770;
	b=W9I1S0qNOg6VWoP5xgij5/XarxzN1oxbEUPsJed7bp1JkfRuip3MkOs92T2cliDBlFbp
	 dyaWuLwxXe09nZ9/afKDt93Fth2wSy6fjlHwQJ6tlacCFssQcxviVeX0vPbbkUTv5Pzqx
	 a32cxCAQ+ePg4Gm5bTlO6hUdRIEnJFtpioRVMOCunb6jmFRpJPDf2khz+wSMXePpzKyBk
	 DDn8Aw91oxI+LsDTZr05pGF2Kgt715naMEX+4wnsGbAIKh3GzWcUH+RKxRzwz7XbGhLe/
	 4Z1IADvZ0xw7+tM8WT94M1UG5t6oH5nBvgsyGUlcUZDpS3ev68zBWGMKso9iGapr7Qw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788721770;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=707pI3Yh+EhYqnGzmssIPo7dsM6aQB/OeSDOENHCB2o=;
	b=m3VNa8NMeFopnlnOaZPOqcv6Oy3EBNw+5KhQYltMYi3+tmzoAUotrqoBXqAp7RGENFgu
	 qUEZFuZ/MbXseL51VAACBd7NfONH7xwgbrIW8HSdR3d00MsTYKFGkjCVpPGkMmxd5fRGD
	 qfd9UzdRv6QpFj5XE+RJ8sisk2KPv8UygzYNQVfmUafCPCyCgDLHGVzZg12rRVLw/3ZuG
	 wUKyhwJ31SMF3t54ty06/nisCmngKNDnMr2SJmHUlZ/n8XWJamznFI5P2gzmLhbJiu2ht
	 +HGSEBs5IHYhXnSK4TpqQgJvNtwP25HZHIwO7XbQYNkk/gbXvYYpFFPZ9W9ys0WvB1w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788721770;
	bh=707pI3Yh+EhYqnGzmssIPo7dsM6aQB/OeSDOENHCB2o=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JgE80Ejxku34VeOlU4gXFRUpFEzrgFcZ1WikIzjLuU4755kaiPUXkOS+HAUYkmRyR
	 AmZnJ+EMAw31eiy0xrjscoKVGnQI9+V0Lm8Oyd5Fv7Et+KGO1P40Tm7SLXd24EEUhc
	 eZBLjkewnclyxoa8U3iqbexs+m6aRKX39XA0nh2KiuSNPCBSmgd59MW2HbCT9sGuuA
	 8OTajVN6xVBMDFAAhtflCTwlMBlLmujAT64dySVKzmeDtfN6yFojpfVy50rYnHN+c6
	 SqGCDxIDgre1eGBB94rEzJOPTP4ZGpjYjjbpycpExZkVbvpZ9YiANdnCaASi/CSWh9
	 4M/AAculldVzw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F609605EA;
	Sun,  6 Sep 2026 19:09:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DEFC388
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 19:09:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 00C2E80B59
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 19:09:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uRa2e6IZKFZj for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 19:09:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 9350C80B32
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788721767;
 b=Z2NjJ/pXvaatkUHJlbQjkf2YJb/fFOzHk8RJ7UXjJCNS/c9PaGQsIcpbpWYFF8+a1O07
 h6EuF7+XNmA/czZByrretIFyUR+0uE50s3kv/3ngyoQo0gh5gHPfNFZ19S4tn8yxIHrae
 uzbNBigzUFQoqy+OgzcFOMaeqijg5hRrxBd7IK9Omw8K4AkVaUeQOERKpnRQKI3pqFI5Z
 v3RAQSVaVX3S/xChasIlivQedz2op+KBctZjPMysIlUTIkXlk1heMcyRsBMg3Arnfjbaa
 8YuzP8+UmPiQBlCWPAA4iFak2FPkLgrWWtuUTHbpyxQU97ox5NNMGaF/jVam/iXfWMw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788721767;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=VEBSsSECl/GuNO3+E+UdbgMeNRYEYybsSViOIhvjEhI=;
 b=WoxeWOowJYJUOHCFqhz4HiDz4PKq/0/DFO6gHO/hX6XCj3MJhwWTSxAEBBgmA1YiVtOu
 U4kco0IvoHuE0UZnY+26ahv/CftfQXRfnVlIoDwpBczfw62nuvvDmv9a7LQE7yF8PuOnu
 3qa/VqaMqb7kod8YK+51QKlsVyQYYCIVarWi+nKiVT31W5CvURoa1XhCsFDz8dS+pQP1e
 bJ3WIqDIBFx6tDtRjsb1Zq1gQqnMJgfEqky19f6cgJQoRrHGWooSvVP/NSDOGu+TM9zLs
 +vivsYyvHoJWYYMsf/ioPIaup4gY9GUPs7DiN5EHnmwU+txGi6pTWciPT3YJAyHR3fQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=VaDmpQhJ; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::11"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9350C80B32
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 19:09:25 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 15C1C2003A4;
 Sun,  6 Sep 2026 21:09:19 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 06 Sep 2026 21:09:19 +0200
MIME-Version: 1.0
Date: Sun, 06 Sep 2026 21:09:19 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Shubham Chakraborty
 <chakrabortyshubham66@gmail.com>
In-Reply-To: <20260904162452.118307-1-bernd@kuhls.net>
References: <20260904162452.118307-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.18
Message-ID: <41b32337a0940eca712fd17d0bd8c9e2@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/ccache: bump version to 4.14
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

On 04/09/2026 18:24, Bernd Kuhls wrote:
> https://ccache.dev/releasenotes.html#_ccache_4_14
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
