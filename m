Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F5C2CA5FDD
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 20:17:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C272160D90;
	Fri,  2 Oct 2026 20:17:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nK3qFY-hUra3; Fri,  2 Oct 2026 20:17:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org EE80B60D70
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790972237;
	b=BzPUEZ31MAm8hAaSN+/j6usMMgSrIdXWwhAQs3f6OfUQ8urn2UGiFG7ljJ/F8wpZ1B32
	 vljo6DcrKXh8OMDmoTROJ2mhB8MnFNkn8YSU3TWHRTeS7fp8j+SVsSVSA7LoQMpVVNo02
	 nHT1wa+By5siLH4ANT3VdSkJFyJInNTw81Fd5v/k0K8ZeFoeZ8Yot+oNljeppXHrd2LCE
	 TSxDX9YplpJ8ozND0OoPlYxC1RRnLG/WVVpskCifg8uy7rZpJAAJUo1nKVTa/IHS1LdCh
	 kmqch+KmgRGKclQLBySjr5haucNPQXatxq2wOd1nu2w5EZxd2JSELZxBBBV3driPP+w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790972237;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=SO7WirG6KoY2z8Uk10CpuiGONTCUVgDGtZHuaTa9Ic8=;
	b=ldTF57Zlk3GxtfJcoLd4S8MCzd6vKcyQvzNwMwqkmQrjHXwj32WCD5iwZVNj1PsFai9z
	 0l72keOSCm2dgmR8BAsSvtecem0uz3KwDSKJlV/xU0oidR+js27zdMBMhlLZoyU8uRkl6
	 khdjE3394DQ2qcqseiqE59npz5f2bcLBK2gI3pNn7iaGfKPe6UrF3c3ZEGPKl1Xdtav00
	 gJTt4TuB8GiPzjeS3qnfIyUUBc/W6LitktvVgO90DZ01NxDnCuAeXqFK6ZqL3UyK0PRfG
	 WMhZ9GCdH5fZtWGT+Qo/eJfyKSqQl+Q5NwcXlg5PERuPvxgnOKvP7AkKIMr/PjWmPQA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790972237;
	bh=SO7WirG6KoY2z8Uk10CpuiGONTCUVgDGtZHuaTa9Ic8=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Ly+2revtnnAn+DAfs1rbB0yDwu5EOj8bIYSqvKe96kD7vzWDlFd7gPknysaLokeHd
	 KO3uR5k2+8a034GWSHcI/YhLeGrg2Ilc/2n6Nu4YRcX6c/2SP5mhpSQ36ls22tH5vv
	 jcQtsxMg0yC7l1Zic24ZT0OBP1b1ZtBD8Jbub6AeRc3Dg+XwM2OZUxy0oE3JGb43YC
	 hpn8p5g6wbYRl7ImQAic43AdLf3pYlSJxuDUgfh7VfrUP3uFATbENFQm1ah3/s+1UH
	 LF2KLjQDMlnoetqgd0yvKd5C4oEfXa4YlefZGE87YGc9/hilLNjKbHGdnZRjD6mcRh
	 wh2lgpeZGklQw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE80B60D70;
	Fri,  2 Oct 2026 20:17:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 36AD2282
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 20:17:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1CFE480C75
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 20:17:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RV4Z2dbNFuHp for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 20:17:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org C390E809CA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790972235;
 b=jQLbrLZIhtzvk1O71PhLDVkRJg9epsBKqmKzXnAxeG0UxWtK+JAPCbDN7ZW4aRqcop7A
 x/xew8ZHrBByYDTOMPtRKGbFKIZswSuW8Q9F7nLSeYEEpE+rO1lN5AfB5BikIX39lj6d2
 AYeJxh8a2NuqECOZ7HYRpBoNTSWR1FWiJ1z/aJR8UfD1L7LmsJIlzbJPeK0TGO46XZG76
 LrdOYnxXNW0F2jx8N85BrDgUP6mYcFLqDZT+lVHe+AObxCPiPliRI3pJDlzV7g8EWS9Uf
 Ea6Qy58L3GwKeJMODMHxbU+2hlDquGmmo7kl/lIdzWh3lO6q9t79c+5gY8KF6HG/M8A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790972235;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=MEiFZH2A9f+qW/4pFGatkUJXBcHugR23Dq6jlP/pkfk=;
 b=ecffV580Gjc4wbh4wSQKrKtVIvfbpOe4Efu45I5JNhuuVBXP+naYXBst+2SnfRtPonae
 Y+hlD/T31iPmJ12J7iffbMGDkMZx15+Z9KinwxyAhR+BJd8JUN4HfvryeFqS8BjvmlzPJ
 hRw8nfMfdDHKPY9Ef8YLbLXi7S4yJuolIXYEw3Pyl6nHj9I5tDwdoX8+MNLQoM9fLKzIp
 JrOgM8ed29tLtHHHN/rMYD5pFUCJU8+W2LM+0bH6dliV+l7DyigjA1SIrIzL8v+GMeQg3
 FsWiUGqyEpdG7xYwhb4/PtZmuUx3kyh2xApbfXOGkCZTu9xTK95qb7PIBM+IHivKuSQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=UvgidJgO; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C390E809CA
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 20:17:14 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 94CB21A10EC;
 Fri,  2 Oct 2026 20:17:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 69082603DC;
 Fri,  2 Oct 2026 20:17:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9C6AA103281E6; 
 Fri,  2 Oct 2026 22:17:07 +0200 (CEST)
Date: Fri, 2 Oct 2026 22:17:06 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <asARPw5jsOHNolqs@windsurf>
References: <20260929183607.1849293-1-bernd@kuhls.net>
 <20260929183607.1849293-24-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260929183607.1849293-24-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v7 23/66] package/nmap: bump version to 7.991
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

On Tue, Sep 29, 2026 at 08:35:22PM +0200, Bernd Kuhls wrote:
> Added patch to fix build error introduced by upstream commit
> https://github.com/nmap/nmap/commit/a24082eee41fcabf7fa180020e1771af3226b358
> which was first added to this release.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
