Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC6D0C04A95
	for <buildroot@archiver.kernel.org>; Fri, 23 Sep 2022 21:46:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 734054049B;
	Fri, 23 Sep 2022 21:46:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 734054049B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bPB9AYhd6VFA; Fri, 23 Sep 2022 21:46:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9D4A540220;
	Fri, 23 Sep 2022 21:46:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D4A540220
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 738AD1BF82C
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 21:46:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 59B5184266
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 21:46:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59B5184266
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fVh3t5wU5XSa for <buildroot@lists.busybox.net>;
 Fri, 23 Sep 2022 21:46:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 095CC84254
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 095CC84254
 for <buildroot@busybox.net>; Fri, 23 Sep 2022 21:46:18 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0B488E0002;
 Fri, 23 Sep 2022 21:46:16 +0000 (UTC)
Date: Fri, 23 Sep 2022 23:46:16 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Michael Fischer <mf@go-sys.de>
Message-ID: <20220923234616.7045112d@windsurf>
In-Reply-To: <20220922124010.26034-1-mf@go-sys.de>
References: <20220921222934.07100d0c@windsurf>
 <20220922124010.26034-1-mf@go-sys.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663969577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9eDUV4jlEUqCLDiY4UcaC4uWU7KkmrgLV9yV77+37wY=;
 b=naGFdoP/X34koJDjw+/w3byiFnNTX+7c2ozcLFHv2pBzEHOrwwu0P1Biv4GYc4oADliH5R
 bD+YraDevNUHoSorppeFi0F7VjX2UJydEXX252ZtMUjlqBbdVg5ifphDu6Sk9VzmYlejm2
 hcuqvpoQF5BlxqVgBY+A/01x4cQgrzGuA4q8UR+spy6A8bl3P5zipZw1UlB71zbN9cRejM
 apXj520zgIYlJrm4c0J+Rvg7b7AvQo9c1v8cuMksklxnm/rfK6fRtR7EsdGxCnz7QaDMW6
 +fLsdxmSnWOlLFJo5uGWUp+We4NUtK4PBmHiDpXiyChbUQfzorCLCLxKXvSKLQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=naGFdoP/
Subject: Re: [Buildroot] [PATCH v2 1/1] package/{glibc,
 localedef}: bump to version
 glibc-2.36-44-g2628500f5dff1dd99c49a09b418b3b1ea3a6b5d3
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 22 Sep 2022 14:40:10 +0200
Michael Fischer <mf@go-sys.de> wrote:

> patch 0002: already applied upstream
> 
> Signed-off-by: Michael Fischer <mf@go-sys.de>
> ---
>  ...ot-posix-conformant-on-microblaze-wi.patch | 37 -------------------
>  package/glibc/glibc.hash                      |  2 +-
>  package/glibc/glibc.mk                        |  2 +-
>  package/localedef/localedef.mk                |  2 +-
>  4 files changed, 3 insertions(+), 40 deletions(-)
>  delete mode 100644 package/glibc/0002-struct-stat-is-not-posix-conformant-on-microblaze-wi.patch

Applied to master, thanks. Let's see what the autobuilders have to say
about this!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
