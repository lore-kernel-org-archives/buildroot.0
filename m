Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1559C5DF81
	for <buildroot@archiver.kernel.org>; Thu, 20 Aug 2026 22:15:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6845608B4;
	Thu, 20 Aug 2026 22:15:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dEAo1XvnWR6J; Thu, 20 Aug 2026 22:15:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787264151;
	bh=53Hcj2RNhbdtwTuAcpdUAv5RTvIwMp+WrJZ5u012Nh4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WOWHvYSfKPLNjbWXGcbqHOSjgRmu+5mKv3NKPOusdVFtGCIOL73DozPXqHHAl3/SO
	 sdQkt2cKSO8RYVBgQuo3cnMk091q811pYmrgTQE5wKymYkkb83peCSwPW+rq0X1Zse
	 CdIHe8FBrSeaOg7p0LefyqzYIbuh6G3VWg8gEe68rZvUBuQlIJe1RXxtLJUkCtbNyZ
	 Ad7ObbcH+e+quco5R3PchCxCJAsJb7ICvnpLC1sML1cC0V47ZzuYRb4f0uO8D6VOtS
	 1jpGq4KS8yKMilcWnY/hS3qpcHWdCtusTwS9KLU0jhfqu9ZQapv3QFhvMkhwG4I85Q
	 MrWwi2vuoUOZw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97BAF6084A;
	Thu, 20 Aug 2026 22:15:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id F289CEA3
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 22:15:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E15DC400B1
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 22:15:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OcGh41WdZnVB for <buildroot@buildroot.org>;
 Thu, 20 Aug 2026 22:15:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C4AA64006F
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 22:15:48 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 3846F4E4130E
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 22:15:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E4FCE5FF59;
 Thu, 20 Aug 2026 22:15:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DD43A11C7682F; 
 Fri, 21 Aug 2026 00:15:40 +0200 (CEST)
Date: Fri, 21 Aug 2026 00:15:39 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <aod8fx7tUeYZrNmu@windsurf>
References: <20260624060529.632135-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260624060529.632135-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/netsnmp: add upstream patch to
 fix build of depending packages
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

On Wed, Jun 24, 2026 at 08:05:29AM +0200, Bernd Kuhls wrote:
> Buildroot commit ed27a33ba04fafdb28d5c74a53798c86aecd50e1 bumped the
> package from 5.9.4 to 5.9.5.2 which includes upstream commit
> https://github.com/net-snmp/net-snmp/commit/7536a8d6d363898e0f511aa81cf2dc000c452b89
> that breaks the build of other packages depending on netsnmp like ntp:
> 
> ntpSnmpSubagentObject.c: In function 'init_ntpSnmpSubagentObject':
> ./ntpSnmpSubagentObject.h:51:1: error: ISO C90 forbids mixed
>  declarations and code [-Werror=declaration-after-statement]
>    51 | static oid oidname##_oid [] = { __VA_ARGS__ };
> 
> For details see https://github.com/net-snmp/net-snmp/issues/1035
> 
> Fixes:
> https://autobuild.buildroot.net/results/395/395a3b18719e4ec0c0b94b0692caaa9566ee57c6/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Thanks, applied to master!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
