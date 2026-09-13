Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0807C88E5C
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 15:56:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8200460604;
	Sun, 13 Sep 2026 15:56:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V3njZLf5FquW; Sun, 13 Sep 2026 15:56:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org DD90E605F9
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789315000;
	b=AD+Vs/XhDFU+6EhL++LkALiVduI1UGQfcT8RQv3mPqvhDK/iPyS75cOukfo8QnTcJS88
	 TXkNoncoYDLG9J+BiXvSuW6DGq9ztrSm1LXZhlPqjDwRer1N5GNMaAQezoij4APL4/9nk
	 dbt+3jeVLtSyBVLP7wLL5q9oGUKNgyPVM19ZXu+AVqlnGUdOjIBslLIen6ABlCTcKYgdd
	 /z/rD9kAxS1vjamuBiyXBOjHF0X1WDSyzqOcIQZL1Ih+y9CBIghx+NLIIygO0W95lyCYz
	 qiM8nG8zzZh9jdWeb2ZPvCE7VFTip545SvA/KQQwFceqzht66a7AkPKI0U20F3l4bsg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789315000;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=sVi6+gWghocO0/5k//fR+dXlek4ADvCIDo8390TD+uA=;
	b=BXKG715yT1nZrZM7ReT8q1CS2RSsn0hZi5pSVPCNe9o+ugsWTFYCT30Dg2M8QInaxFFy
	 tvwOiDZYD3xjum0GW+tt84hDNs35FdmrjMny9gzNonewBO3ArG4SgpszIUtUQhBM1TPGm
	 190bbJjNqXeiCtOP6Gj6+Tzc7u1HBH+Qi0uycI6bf0Ik20bD+SrJgkRhkz/pPGC8+HQpq
	 rGHPugy4BN0ToNObjTpv8n9R9TzhRyeIt4gWrEYGmYCzIOCX57tjrd8RtWnNqdKUqrEfx
	 CUcm4HYhU+8Hail32PNnYa8sIv6nWcfjsZEyeA/XrqM/dA4/EX0Ru3Axe6SC48OLZVQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789315000;
	bh=sVi6+gWghocO0/5k//fR+dXlek4ADvCIDo8390TD+uA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=IU41S2taiQ29LZOzYlE0pn25ocfG/I6ipycANt/WMMwPSA1tyQdRc9wXLCw50wLb5
	 RAs3nvPdoou0LqmOydaB+XfiDBhegGkqEIacQlo53bTYpHmyip8PA5FjiOK79nxdEq
	 eg7PBReJkdXqowKj/ebrlAzJ7o1H9VclQZsI5d2Q/YysZKUThAu8fK5KcZ6y7OylXG
	 /tgqhQBZlMqMEF4dA6dU5yfySBQYtqecj9389LybgNCAigeNoV8LMdU4lW4NJDns3+
	 5zD1OmHpQ1xWWtu+xQTmmQPP+8zUOjdj2FWxXgV33Mm3f3trqRzSa9EnPg65HE6i96
	 S47JGW0NbMTkw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD90E605F9;
	Sun, 13 Sep 2026 15:56:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A0713224
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 15:56:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 862EA80DC0
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 15:56:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id btZu17WvWylq for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 15:56:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org DF15B80D2B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789314997;
 b=eI5K6hXPDbXnCgrH6SycNVQvpp5Wo4rzRNnA9HQTQBJPgoH0yn7oaRWnXcQgfvAwDrpb
 n1v0ukOTc8w82etYFf/rMWfePfzRmt7qzJogIRPBhfotgYtVxqMDdy0YmkLLM5V1wjbJi
 dvIi6l9yLYiu0EacKGUtH2TswKI7luTzEeHbmLBrxRAzR852b/RIV+pCqhcIHcRpg3lhM
 V5ttvBniq+fdDa21MRot9lLvKD4hw7kamC1ks9GVcxM/+17YMsO6mgvuLKQaCOha45qoM
 oOmvNxSq6jKnzU1uYzyL34xRBJ3dx9f4k9XCQiLKcg6KtAysA/fOwFrXOVfOS+C78Wg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789314997;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=FI+QW0tKvhMHzOQ7gscfkX52cIdU2T1ZJ+S1OMFEyGI=;
 b=j77ydN11VGcUbBbG2gHeEE0nNDU1alZNcD8mB6rSzE6xql1ogedgG0HVm2FETvBxud4L
 Ona+BdxtDI2MABFg3i6tm1+A94BJwLSqVSfZWa41zV1m3JfZqYjblt5Q23nu4knQ7jcQ0
 EfhEZaTiufChN47TX7eQV7gYjvzdWjp0lU+TXMxbKNQCguAmLTsYEgzQCOD7fyebCIsff
 4D1N+DZ34dLAY+hld7MSTCSqK4jLktNjcvcua9ujFJZ4uSiOHSZHydIxuVvLIGDj7bchr
 zJpa5M5fy06jySSvMBNNkpVMxfyahWwxVlBoCvixc3/uC9IdTzajUt58JCAAiQ0eXgw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b="M6/oWXgG"; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DF15B80D2B
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 15:56:35 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 555A01A0504
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 15:56:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 15F3A60435;
 Sun, 13 Sep 2026 15:56:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 613F211C78D5A; 
 Sun, 13 Sep 2026 17:56:31 +0200 (CEST)
Date: Sun, 13 Sep 2026 17:56:30 +0200
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>
Message-ID: <aqbHfSXJn0fhmuvK@windsurf>
References: <20260913120729.1647806-1-thomas.petazzoni@bootlin.com>
 <031430f63fb15e3b24b3627fb14bc16d@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <031430f63fb15e3b24b3627fb14bc16d@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/kodi: propagate mariadb
 dependencies to BR2_PACKAGE_KODI_MYSQL
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, Sep 13, 2026 at 05:36:49PM +0200, Julien Olivain wrote:

> > We don't have a super clear/strong policy on whether dependencies need
> > to be replicated to a sub-option when the package top-level option
> > already has them. I haven't done so in this case, but if people feel
> > like it should be done, I'll be happy to send an updated patch.
> 
> I think most packages are not replicating top-level options.
> When there is replication, it is sometime due to leftovers
> after changes. This is why I applied this patch.

The concern I have with not replicating is that then it's easy to miss
re-adding dependency to sub-options when dependencies get removed from
the top-level option for $whatever reason.

And of course the concern with replicating is that it adds a whole lot
more of Config.in comments :)

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
