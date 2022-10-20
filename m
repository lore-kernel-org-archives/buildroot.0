Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D47F3C433FE
	for <buildroot@archiver.kernel.org>; Thu, 20 Oct 2022 00:23:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07C3141CF5;
	Thu, 20 Oct 2022 00:23:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07C3141CF5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3F4yaENs7ppN; Thu, 20 Oct 2022 00:23:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56FD441C07;
	Thu, 20 Oct 2022 00:23:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56FD441C07
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 002121BF2F7
 for <buildroot@lists.busybox.net>; Thu, 20 Oct 2022 00:23:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DBF09611E3
 for <buildroot@lists.busybox.net>; Thu, 20 Oct 2022 00:23:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBF09611E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tlxSuOsobtBP for <buildroot@lists.busybox.net>;
 Thu, 20 Oct 2022 00:23:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A560611AB
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0A560611AB
 for <buildroot@buildroot.org>; Thu, 20 Oct 2022 00:23:21 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 a6-20020a17090abe0600b0020d7c0c6650so1793428pjs.0
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 17:23:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xQuXHwJGuKmkTJh7bvB550hkgQoexDumOCuMvJUliqM=;
 b=KYVe1LCKk3Hwfa5XHlxkOnxB0udaZS3hiPk2hJQWdJB3FUwe9caHJrTO26GyEhFhHp
 oBTBE3AFv5xI2ccdSfmR+2PinsmNDZoza/4xzOCc3HoIobIj+RDPXx9wGcdBjYW9b2Zm
 U9HwV28clXwRSRZyl7qDay7+kCQDzw9PmIajzyU7aq1LY+cFGRZZ6cZC0nlWvxv5rAEY
 R1on/jRAVn20HG0tEgFICawwPRlPcMK7/8FZx2ldqWe/R7E9+xMqnGCDPObKxupKhIs8
 0UpMVb3t4Gl8v+NE0AbwCprmuNLEdU5hkSHHQDXtPuoAzPFlLBCUpIcPd5a0lU7SXQ5w
 +rIg==
X-Gm-Message-State: ACrzQf1LPl+iN130LlEK8gX1Z3Psq0mbLqWi/f191d+GwQqBR92nMOBe
 /fUTozS9s980YIsziX3eKsApj4o6bU/i9FIFHyE=
X-Google-Smtp-Source: AMsMyM7z3bfF3tyZJjASXcK7BTDizxtAzKQOMmIDFeR3NU5Z4j6nVvX+q5es8wxSuCQECK0Aw0L61gaXWuah9AhRQHw=
X-Received: by 2002:a17:902:b598:b0:184:e49d:3042 with SMTP id
 a24-20020a170902b59800b00184e49d3042mr11445864pls.16.1666225401393; Wed, 19
 Oct 2022 17:23:21 -0700 (PDT)
MIME-Version: 1.0
References: <20221019195519.28536-1-giulio.benetti@benettiengineering.com>
 <CADvTj4rGMHOZL4X1pkZTDYzxgyGXDLB_jmApmxNOPSK2Tdp+LQ@mail.gmail.com>
In-Reply-To: <CADvTj4rGMHOZL4X1pkZTDYzxgyGXDLB_jmApmxNOPSK2Tdp+LQ@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 19 Oct 2022 20:23:08 -0400
Message-ID: <CADvTj4qYnqsAjQMZQHBTdpxgiZ2VoLtewn9uWa1QzPjriT_VZg@mail.gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xQuXHwJGuKmkTJh7bvB550hkgQoexDumOCuMvJUliqM=;
 b=hg+inkoISZGBkm4Fgu0CGs3U11Q56PBNsciLkdsZY5m5npck9C0pLSoXWxtNxlNI/i
 YlKKf06BW2/Q7s29enR08SQWQhmArUmmBiSBC6x9l42lZc1JldWVIIgsDAYai0bsJHUc
 nABT5b/AOClRH6QX4UnApWWUJA8bygmhAK+y/uPtFZuakzUScDqkua8LLd9VCJUp7JKg
 PFN1yAppzWMh+M9VIve/HiGmKbv41HXriLOovzH0kOugHwApYint4E0igCsjWqW6F6Bi
 kJnBB9EsR9IyOp5LWZL0J1HkzViHr9o9FGuGZDEq7/gdUyop8vb5kJTytlyoy6iB3jaC
 a/9A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=hg+inkoI
Subject: Re: [Buildroot] [PATCH] package/libnss: disable parallel build with
 Make 4.4
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, Oct 19, 2022 at 7:36 PM James Hilliard
<james.hilliard1@gmail.com> wrote:
>
> On Wed, Oct 19, 2022 at 3:55 PM Giulio Benetti
> <giulio.benetti@benettiengineering.com> wrote:
> >
> > Fixes:
> > http://autobuild.buildroot.net/results/433/4335d0d8454035a8f74645ba8d6c2329ab2e5480/
>
> Hmm, this looks like a bug in the libnss makefile, what was the failure
> seen with make 4.3 here:
> https://lore.kernel.org/buildroot/20220101210952.2148256-1-giulio.benetti@benettiengineering.com/

This patch also does not fix the build with make 4.4(make from master branch)
from my testing.

Even without shuffle mode enabled the build appears to always fail.

>
> >
> > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> > ---
> >  package/libnss/libnss.mk | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
> > index 041b2cfc56..a613006f70 100644
> > --- a/package/libnss/libnss.mk
> > +++ b/package/libnss/libnss.mk
> > @@ -15,8 +15,8 @@ LIBNSS_LICENSE_FILES = nss/COPYING
> >  LIBNSS_CPE_ID_VENDOR = mozilla
> >  LIBNSS_CPE_ID_PRODUCT = nss
> >
> > -# Don't parallel build if make version = 4.3
> > -ifneq ($(filter $(RUNNING_MAKE_VERSION),4.3),)
> > +# Don't parallel build if make version = 4.3 or 4.4
> > +ifneq ($(filter $(RUNNING_MAKE_VERSION),4.3 4.4),)
> >  LIBNSS_MAKE = $(MAKE1)
> >  else
> >  LIBNSS_MAKE = $(MAKE)
> > --
> > 2.34.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
