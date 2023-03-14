Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDD96C6FD1F
	for <buildroot@archiver.kernel.org>; Tue, 14 Mar 2023 07:58:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C93D813D2;
	Tue, 14 Mar 2023 07:58:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C93D813D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WUXZy2Uov-q9; Tue, 14 Mar 2023 07:58:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B991F8135E;
	Tue, 14 Mar 2023 07:58:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B991F8135E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 59A5B1BF2CC
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 07:58:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 32D284012D
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 07:58:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32D284012D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sw9coPn53Zqy for <buildroot@lists.busybox.net>;
 Tue, 14 Mar 2023 07:58:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D1E1E4011F
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D1E1E4011F
 for <buildroot@buildroot.org>; Tue, 14 Mar 2023 07:58:27 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id ACF90C0009;
 Tue, 14 Mar 2023 07:58:24 +0000 (UTC)
Date: Tue, 14 Mar 2023 08:58:23 +0100
To: C D <dellicker@live.com>
Message-ID: <20230314085823.5a37e5e9@windsurf>
In-Reply-To: <SJ0PR05MB7625D8C1B77DE29365DEDB13D4B99@SJ0PR05MB7625.namprd05.prod.outlook.com>
References: <SJ0PR05MB7625D8C1B77DE29365DEDB13D4B99@SJ0PR05MB7625.namprd05.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1678780704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ox/skXzMn7CxH3lc441ZgXdiYVutIzHSB7Gc2pmsT9I=;
 b=UqKisgwpDuIxt/kW9C1FUwnJA6VCN+/zVlFeV0OKyqgWig24OmenWI5BbrjteJgICfq++z
 SFYoDN8Yvreape5Ajhp6sCYBXHzEK7QO3Cy5T6+BpW4FUGN6D1nKMS8GoxqP1L60tfu4q4
 FyHRHRuqquJccAR2Y+BpfAHh8MQF3/MWDt9sLKwu1Adx5v/Z8oQRmBrqOGgD4MWsxCddnZ
 WSgdjXVML0Vx/5Pm60Sxx4G9ewsBEL+QoyS4ikmXFiKDYkLh2k0wYuQCLFHgZtvhHhNYmx
 xvpXxFjndjr7dAw8jWJpSgGwlgQG2eNOxc0pR9RGtYub9nuhPps/UhiZLOYXew==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UqKisgwp
Subject: Re: [Buildroot] Forcing linker to look at right library path?
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Mon, 13 Mar 2023 23:33:45 +0000
C D <dellicker@live.com> wrote:

> I'm running in to an issue with a package linking against libubsan
> and libasan.  I've figured out how to compile Buildroot so that it
> copies those libraries to the correct output/target/lib and
> output/target/lib64 locations, but it seems like the package is
> linking to the versions installed in my OS (RHEL 8.7) in /usr/lib64
> instead.
> 
> So, in /usr/lib64 I have libasan.so.5 and libubsan.so.1, and in
> Buildroot's output/target/lib64 I have libasan.so.6; when I boot into
> Buildroot and run my program, it errors out because it's looking for
> libasan.so.5.

The Buildroot cross-compiler doesn't look for libraries in
target/usr/lib, but in staging/usr/lib. Having shared libraries in
target/usr/lib is important for your applications to work at run-time
on the target, but those shared libraries should also be present in
staging/usr/lib for the cross-compiler to find them at build time.

> What do I need to do for it to point to the correct library location
> when linking?  Is this a Buildroot config option, or something I need
> to set up in my Makefile?

The answer entirely depends on which package you're trying to build.
However, first thing would be to make sure that libasan and libubsan
are both in staging/usr/lib. This should already help significantly, as
it means the cross-compiler will find them.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
