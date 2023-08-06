Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4879C04A94
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 11:49:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F06C81E7D;
	Sun,  6 Aug 2023 11:49:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F06C81E7D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R3QAPJi3NFJW; Sun,  6 Aug 2023 11:49:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4E8A81E6C;
	Sun,  6 Aug 2023 11:49:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4E8A81E6C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 183021BF293
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 11:49:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8B44E81E83
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 11:48:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B44E81E83
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pJsKXi5HcNVx for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 11:48:15 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7642781842
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 11:48:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7642781842
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5D122C0003;
 Sun,  6 Aug 2023 11:48:12 +0000 (UTC)
Date: Sun, 6 Aug 2023 13:48:11 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230806134811.2e4ca69f@windsurf>
In-Reply-To: <20230804183321.1766262-1-bernd@kuhls.net>
References: <20230804183321.1766262-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691322492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/Al82UyW1k3lGguhyDcpTeCzWlDpEpO/s4J9zu3SC04=;
 b=NQAEpxTgHD96h6tkxfKlESQ6Y6sNLOR7LM7RQ8ubbDV9RqAyNsVaCnzXjB9s0L4/deJ03j
 3OwD8X3zuZ8P5gUDTQ/Y6GA5I5C6ITXyfjt9MJuV76e/PRkaN1Av1A7nCsYWvtlFMRyN3+
 rpWHoE/OBQashlaLsXeF6Ps/yPGXKxsHVmKwt3n7GH0ZdK+6avjUd8c9WO7qI9rLejZql0
 rjIjc4E2PaWrV4j41IrlrX3fGcmtD0gcqmxp1i+Xtc87eChILt7Gilv/rggx0fHP9pf8sX
 WCQ9TuSLcTzn4riBQzCMxHlyM8OyiUx2sXkU/uB4NUCeqNltdAtPbUn6mF8nbw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NQAEpxTg
Subject: Re: [Buildroot] [PATCH 1/3] package/stellarium: disable
 telescopecontrol plugin
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri,  4 Aug 2023 20:33:19 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Buildroot commit 319c56dfe3309dbf24be01fed3afff6259a2c5dd bumped
> stellarium which included this commit
> https://github.com/Stellarium/stellarium/commit/186b06fa215bd28ea03cc291dc861b552af8d99a
> 
> It removed the previously bundled libindi source and lets stellarium
> download the sourcecode of the indiclient package (not present in
> buildroot) during the build:
> 
> $ find output/build/stellarium-23.2/ -iname *.zip
> output/build/stellarium-23.2/_deps/indiclient-subbuild/indiclient-populate-prefix/src/v1.8.5.zip
> 
> which breaks offline builds.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/stellarium/stellarium.mk | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)

Series applied, thanks! Thanks for including directly in the first
iteration the details of which Buildroot commit introduced the issue,
this is *very* useful and allows such patches to be applied directly.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
