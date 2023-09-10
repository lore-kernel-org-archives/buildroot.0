Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AE75EE14D8
	for <buildroot@archiver.kernel.org>; Sun, 10 Sep 2023 12:00:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96CD340961;
	Sun, 10 Sep 2023 12:00:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96CD340961
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9lXDadv6_wWk; Sun, 10 Sep 2023 12:00:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A975A4094F;
	Sun, 10 Sep 2023 12:00:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A975A4094F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 60FDD1BF4D8
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 12:00:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3824E4094F
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 12:00:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3824E4094F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j4Xr8hCAbNHY for <buildroot@lists.busybox.net>;
 Sun, 10 Sep 2023 12:00:28 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 579F64094E
 for <buildroot@buildroot.org>; Sun, 10 Sep 2023 12:00:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 579F64094E
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2D1E0C0007;
 Sun, 10 Sep 2023 12:00:25 +0000 (UTC)
Date: Sun, 10 Sep 2023 14:00:24 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230910140024.74a2e625@windsurf>
In-Reply-To: <1214dd8573105f0075de5019938a5d37@free.fr>
References: <20230909104707.491203-1-ju.o@free.fr>
 <20230909170809.4d0fb384@windsurf>
 <1214dd8573105f0075de5019938a5d37@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1694347225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J3Cqpl0HkPRl8DtwZlqwHnOqPpeKtdAaCODt1XZ5mPg=;
 b=nedtZxMnK5FlAJda0YRsE0o1iTaxA8z7+m2y8y536ZMFRGyRUEeq1xknvHP7kXCWpgPN8d
 UhbUrn+82qHGQC7Ttp0mwartlB31wtFzKhT5W3YtJRVM/h3eM2+nrvBVhy9dbek4lwMqs8
 Ad4NROy92cA6G+YdAUjQjynTqWjHkKwme6iL5OXPTGp43ye/d6mN/jF/xQZKhYD1SSgRxV
 2Uu5GjesxTs+m1hqPWvuAFumsK/cRavuMBOPUXp4Fn4m7+iz1lpVOMKOCOfnc7gJUrFui/
 VikgWRfLzdwLBIFAH9jp2D7hDURbHYSuvhLCVYJNY4QDqog+5m3FXzjPOFK69A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nedtZxMn
Subject: Re: [Buildroot] [PATCH 1/1] package/zynaddsubfx: fix uclibc compile
 error
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

Hello,

On Sat, 09 Sep 2023 23:07:19 +0200
Julien Olivain <ju.o@free.fr> wrote:

> This build failure is the first of its kind, according to autobuild:
> http://autobuild.buildroot.net/?reason=zynaddsubfx-3.0.6
> 
> Looking at the upstream code, this header inclusion is missing, so the
> bug has always been there. My guess is that this "stdint.h" header was
> included indirectly from the libc internally. I did not investigated
> further. Do you want me to?

It seems like it is related to gcc 13.x, and that the right thing would
be to include <cstdint>. See commit
27dc49378071a82688d44a5cc592c0200b3991b4 for an example of something
similar. So you could try to build (without your patch) using gcc 12.x
and gcc 13.x and see if that's the difference that causes the build
failure.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
