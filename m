Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2874C4332F
	for <buildroot@archiver.kernel.org>; Wed, 19 Oct 2022 23:36:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A2E741C7C;
	Wed, 19 Oct 2022 23:36:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A2E741C7C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dOJsbuC3xO_Z; Wed, 19 Oct 2022 23:36:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E076441CAA;
	Wed, 19 Oct 2022 23:36:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E076441CAA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3C81A1BF419
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 23:36:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2341441CAA
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 23:36:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2341441CAA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1Wd8aOu5KXlq for <buildroot@lists.busybox.net>;
 Wed, 19 Oct 2022 23:36:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1574941C7C
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1574941C7C
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 23:36:36 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id h2so11356493plb.2
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 16:36:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=juVA/FAYlUFLyJDKQEqB84YVXhL2+YJE05JeaZZ0U/o=;
 b=i44cu4vr7ztqCHnI9nt0BlNWLtYVGuhCDknai1SeHfxcit8ibBdfWIRmZ/WwQmBFtA
 PvX6FEX716flcpEkfLeSZuuwNH5WAed3PhQhgYFPMMHHpX1zkxpc2Fib42l882IspLDw
 5Ogi0PQPN0/8kVHigE+xzF6nH/Had5pj4SKsJ8tgyjEb8keEKOn3fZUCSnTcxwho2ldj
 CUmUav1Pnkm55mnReVEiz4ISlHm6cLCpwpUFZgnDEliFKzlKBG2FOE8Xr2waKryPSniW
 uPz7N9SBIm1eSv6GNOlRUixx6eGaAcB5/stfn42QQMF4mQL5I45Gu0h4V0AG4IJIqYDF
 UIBg==
X-Gm-Message-State: ACrzQf1rBkfiGWcQLo0fCagQl5la0GW7gn7Wi5nLhTLXV5aBO5Emnir/
 KLrgUMyC662XQ5Z2vXTEap9lzz679u8Cu1ynq+s3o135fP9yNg==
X-Google-Smtp-Source: AMsMyM5LJvS2xj9HtWUpyh6grycc2t+RsuvjX989qEQAkUqBsRqiKeECGbqykOgMuHAuh220+t/OEZ9jxcWNuRXT+CE=
X-Received: by 2002:a17:902:e552:b0:179:e795:71c5 with SMTP id
 n18-20020a170902e55200b00179e79571c5mr10885104plf.57.1666222595413; Wed, 19
 Oct 2022 16:36:35 -0700 (PDT)
MIME-Version: 1.0
References: <20221019195519.28536-1-giulio.benetti@benettiengineering.com>
In-Reply-To: <20221019195519.28536-1-giulio.benetti@benettiengineering.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 19 Oct 2022 19:36:22 -0400
Message-ID: <CADvTj4rGMHOZL4X1pkZTDYzxgyGXDLB_jmApmxNOPSK2Tdp+LQ@mail.gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=juVA/FAYlUFLyJDKQEqB84YVXhL2+YJE05JeaZZ0U/o=;
 b=Z5NPMk8PCP5f4X0y4p7qpjvxusxmoTKRSzj+tG2AyMOl+rPiCc30nbnzdIVOx92UrJ
 tJfC2ff476cw0g+PF70H+ozgnsWzzpyvhqqATEzF7B4t2hoLl84mW3PozTozU1KGRpKv
 Si9S3eT7HODPUHal535ed5HrfNp4V8IcqMkajd3sbLKTkl9Flnuj3ukWBKD9BIo1VvX7
 OwXduo4UE0Kbcc40FDUHNvO9v06fLm+MThqqePsF8aw+vBeerQe7sWtE+pcMwjA8bd9L
 02cUcsP9E75L8v/HqKXUU17wDm6pISEKrQbU3fVv3C0CeyWe7Yx9PNz53g3N01YNLXKP
 OtIg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Z5NPMk8P
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

On Wed, Oct 19, 2022 at 3:55 PM Giulio Benetti
<giulio.benetti@benettiengineering.com> wrote:
>
> Fixes:
> http://autobuild.buildroot.net/results/433/4335d0d8454035a8f74645ba8d6c2329ab2e5480/

Hmm, this looks like a bug in the libnss makefile, what was the failure
seen with make 4.3 here:
https://lore.kernel.org/buildroot/20220101210952.2148256-1-giulio.benetti@benettiengineering.com/

>
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/libnss/libnss.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
> index 041b2cfc56..a613006f70 100644
> --- a/package/libnss/libnss.mk
> +++ b/package/libnss/libnss.mk
> @@ -15,8 +15,8 @@ LIBNSS_LICENSE_FILES = nss/COPYING
>  LIBNSS_CPE_ID_VENDOR = mozilla
>  LIBNSS_CPE_ID_PRODUCT = nss
>
> -# Don't parallel build if make version = 4.3
> -ifneq ($(filter $(RUNNING_MAKE_VERSION),4.3),)
> +# Don't parallel build if make version = 4.3 or 4.4
> +ifneq ($(filter $(RUNNING_MAKE_VERSION),4.3 4.4),)
>  LIBNSS_MAKE = $(MAKE1)
>  else
>  LIBNSS_MAKE = $(MAKE)
> --
> 2.34.1
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
