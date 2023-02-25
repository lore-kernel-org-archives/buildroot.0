Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5F70C7EE23
	for <buildroot@archiver.kernel.org>; Sat, 25 Feb 2023 21:03:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 83FFD40BCC;
	Sat, 25 Feb 2023 21:03:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83FFD40BCC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vF9Hhk5cDcLc; Sat, 25 Feb 2023 21:03:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A3C5140BB4;
	Sat, 25 Feb 2023 21:03:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A3C5140BB4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D3C551BF3EE
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 21:02:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA15B415F6
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 21:02:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA15B415F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CzmH7YR7BhMb for <buildroot@lists.busybox.net>;
 Sat, 25 Feb 2023 21:02:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C21B4156E
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3C21B4156E
 for <buildroot@buildroot.org>; Sat, 25 Feb 2023 21:02:41 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2574A20003;
 Sat, 25 Feb 2023 21:02:38 +0000 (UTC)
Date: Sat, 25 Feb 2023 22:02:36 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230225220236.416f2462@windsurf>
In-Reply-To: <20230225141412.2968950-1-fontaine.fabrice@gmail.com>
References: <20230225141412.2968950-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1677358958;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7LIxy1ycYd37aldQSICPkuDn4cOkJLQnoxWBsoqpcVs=;
 b=c8uhXjlLB7XfPh+nykncHmB0yON62LbvHEWz+EeB0wl2WRNQDhRH0HqVKoPhTeOk5wyStg
 eaJbhh9etZG9+rcxk/H1ywjgrrjVG0Ol85CZEF7EQd4YnuDR5OvxFmxB3Hpt1nOjNFtOQa
 XmUyQkpiOdTt0K18AGojwyn8h1+LMgcksDRJDEg+pZrwEmZMAqFjFxhHsw1/4Bx8WFYbPd
 E9bu1N37gq/To5q3X5jYB/2zzd2uR9gIF7RKYBAWioDPz0b484P4743Eh2Dh8Lv8vP6k5A
 VeDMuMIFqrAy0GpKkYp+fmZVQKNak7ufz/6JbABOounB81YRjiJMWfA7k1/LIg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=c8uhXjlL
Subject: Re: [Buildroot] [PATCH 1/1] package/lirc-tools: fix python build
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

On Sat, 25 Feb 2023 15:14:12 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure raised since bump to version 0.10.2 in
> commit 58cc3977e83487bdaa1df232cf7adf6383d49cd7:
> 
> In file included from /home/thomas/autobuild/instance-3/output-1/per-package/lirc-tools/host/bin/../sparc-buildroot-linux-uclibc/sysroot/usr/include/python3.11/Python.h:38,
>                  from lirc/_client.c:1:
> /home/thomas/autobuild/instance-3/output-1/per-package/lirc-tools/host/bin/../sparc-buildroot-linux-uclibc/sysroot/usr/include/python3.11/pyport.h:601:2: error: #error "LONG_BIT definition appears wrong for platform (bad gcc/glibc config?)."
>   601 | #error "LONG_BIT definition appears wrong for platform (bad gcc/glibc config?)."
>       |  ^~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/85359d3f678b49e46821a1c10da5f14edfb5e6d0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/lirc-tools/lirc-tools.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
