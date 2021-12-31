Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 969CAC433EF
	for <buildroot@archiver.kernel.org>; Fri, 31 Dec 2021 23:40:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0653C60DCB;
	Fri, 31 Dec 2021 23:40:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JSI_7Ys3oXYk; Fri, 31 Dec 2021 23:40:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E1D160C27;
	Fri, 31 Dec 2021 23:40:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 311A91BF37F
 for <buildroot@lists.busybox.net>; Fri, 31 Dec 2021 23:40:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1FE6060C27
 for <buildroot@lists.busybox.net>; Fri, 31 Dec 2021 23:40:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cCTOEKTuvY-W for <buildroot@lists.busybox.net>;
 Fri, 31 Dec 2021 23:40:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2E4E060C1F
 for <buildroot@buildroot.org>; Fri, 31 Dec 2021 23:40:12 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 j3-20020a056830014300b0058f4f1ef3c2so32966479otp.13
 for <buildroot@buildroot.org>; Fri, 31 Dec 2021 15:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PjXzDvxwA7UMPt/ego3zVtY9ssSWtSQWb4opzS97WGw=;
 b=FhvW0stv0Tl1mfBjwAodHSkv4vbX5W+P5P4FyPmOhpwQX5jXPi8jbVnllwvEDxp9QB
 guaQ+msJUvabFTBTcwBy6X/e15b2hz+2RwBl3u74o+fs8/Bn7JvwGXVeSS8SXD7SyFrc
 RGIEffFPlZtchHotGPeNHhwqzijZub9FStGD1sR5844By2KEHMLFbbnCqllAfLsqiawA
 urbFyalSDCmJ6YKtLDwPorCojXmFoXEZa8XltDt7yjm34SSptHt/+82rrEY7h+JVKkLP
 OG8lIzan7HFGCjMnCzYccYcPcsEbsex2D4/fb9xbejTuLKia6lLMyve7dbLbkV2DGAaZ
 phbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PjXzDvxwA7UMPt/ego3zVtY9ssSWtSQWb4opzS97WGw=;
 b=Z3FB2rGv3v5Lh8G4WM45xF6ej+5GNnh761HCLWE8UBb8oVJW4xHrClM/pfHAnVEy3C
 EiYfOq8db56myFIWSF0W+MOCFg8wPZGdDBTOwcY5uW+egH+IYHx3M2cFLF+6vOrg103L
 RgV3LLl0rdk1xllAalKvwP9P1zOhwvCRDwzVWfyyoAPl0a8VzBuAlnvOTgs5F0tnrPDw
 Qfts+yyOkMV+LxJQZzX222J+JHpegpBSHpWlStqVeSLk5A2tmT1DhzfPAjcalqrTO8wn
 UfMqtsFkx4G7sfG7qvGM9eRXAgTJkeUcyN76H8OcspR56v3Z0MjHoj7ft8R7zjvefkTI
 YkAA==
X-Gm-Message-State: AOAM533HnNRwFDCgvNH72RbhnH5b5kCpJQnAQzV4+rO4jiCkkz5kxj2D
 W1Bf8dTos2ZFRp6+oFXt2+zBxkf2BUD3a28ad78=
X-Google-Smtp-Source: ABdhPJxbFgpX5oH7phEG2azrgXX2agR328vdaUI4lII+GeRKHeAgyXirYbqucBRQv/rhUthLeBFbPGpkRcwwqf4Bh6M=
X-Received: by 2002:a9d:7855:: with SMTP id c21mr27002802otm.167.1640994010995; 
 Fri, 31 Dec 2021 15:40:10 -0800 (PST)
MIME-Version: 1.0
References: <20211231100725.3662078-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20211231100725.3662078-1-fontaine.fabrice@gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 31 Dec 2021 17:40:00 -0600
Message-ID: <CADvTj4ooFfPYg7-1jTzMm_=d1PMEFKJtdwMkiB-81dxEe4z5pw@mail.gmail.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/nodejs: bump to version 14.18.2
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
Cc: Martin Bark <martin@barkynet.com>, Daniel Price <daniel.price@gmail.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, Dec 31, 2021 at 4:08 AM Fabrice Fontaine
<fontaine.fabrice@gmail.com> wrote:
>
> This bump will fix the following build failure raised since bump of
> python3 to version 3.10.1 in commit
> 25b1fc2898d68ddf2674b14c738045875fc5a2dc:
>
> Please use python3.9 or python3.8 or python3.7 or python3.6 or python3.5 or python2.7.
>         /usr/bin/python3.7 ./configure
>         /usr/bin/python3.5 ./configure
>         /home/peko/autobuild/instance-1/output-1/host/bin/python2.7 ./configure
> Node.js configure: Found Python 3.10.1...
>
> https://github.com/nodejs/node/releases/tag/v14.18.2
>
> Fixes:
>  - http://autobuild.buildroot.org/results/9e2ebb9c3681ec0485eaa042fa838c8ee62f649b
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Tested-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/nodejs/nodejs.hash | 4 ++--
>  package/nodejs/nodejs.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
> index 3a4571e8e5..f330757341 100644
> --- a/package/nodejs/nodejs.hash
> +++ b/package/nodejs/nodejs.hash
> @@ -1,5 +1,5 @@
> -# From https://nodejs.org/dist/v14.17.6/SHASUMS256.txt
> -sha256  3fa1d71adddfab2f5e3e41874b4eddbdf92b65cade4a43922fb1e437afcf89ed  node-v14.18.1.tar.xz
> +# From https://nodejs.org/dist/v14.18.2/SHASUMS256.txt
> +sha256  3e8a9ce10f8bcd3628eb6dd049f7f03c84ba9219be6f9743e2221154b9cc680b  node-v14.18.2.tar.xz
>
>  # Hash for license file
>  sha256  b3a67885b5a6ac35e8bbe8190509e41b79b0d9a2e3fbd47186f2ac4727f63be5  LICENSE
> diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
> index 322eed6d19..7d5c93eb93 100644
> --- a/package/nodejs/nodejs.mk
> +++ b/package/nodejs/nodejs.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>
> -NODEJS_VERSION = 14.18.1
> +NODEJS_VERSION = 14.18.2
>  NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
>  NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
>  NODEJS_DEPENDENCIES = host-qemu host-python3 host-nodejs c-ares \
> --
> 2.33.0
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
