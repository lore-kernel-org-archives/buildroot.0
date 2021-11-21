Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E484DC433EF
	for <buildroot@archiver.kernel.org>; Sun, 21 Nov 2021 13:52:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7AF1E40426;
	Sun, 21 Nov 2021 13:52:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nx_yHSnPR-br; Sun, 21 Nov 2021 13:52:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C044D40423;
	Sun, 21 Nov 2021 13:52:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8E61B1BF25B
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 13:51:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8A4D840124
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 13:51:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1VHkoqkoBaNL for <buildroot@lists.busybox.net>;
 Sun, 21 Nov 2021 13:51:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8260C400C8
 for <buildroot@buildroot.org>; Sun, 21 Nov 2021 13:51:43 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id r11so64679734edd.9
 for <buildroot@buildroot.org>; Sun, 21 Nov 2021 05:51:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Vn1nzCvBmj2U/G+FGDrIohgfaewA3YtdnfrCwrNoh7U=;
 b=m4+YoENjcwKUV9mkYx2uOyWGU7aPzXvIhg0MS9qc7wedshrGexizoHSvY0TrH1XyfT
 QGPyLlxA/1sTQsvM2C5fnSt58qTdIIhHsmyyrJnUK3nnZpS9DJ3DYZPW/E1ItTSeaycx
 dYKApPQzC5IIar8vTdToJblMAIypW0UNGxli/XbP60DDVltIgQWZck23zqN//f/TsqmN
 6oE4p0UsFyvBQul1CTtbBrLzRZRoDD+6JRbeMx+sjHE+Z6fL6dtfnMUjsvWXxMbNSjso
 EjNJi+kKZEfdxAKMOvUpbLyQYStpHyZd8EJlqDt3QaFxlQ9sucaW5aaghmLrgicbg58c
 aERA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Vn1nzCvBmj2U/G+FGDrIohgfaewA3YtdnfrCwrNoh7U=;
 b=OTQyemmW99uUxsAUKH827LEQQFMPs6vms8xTBdX6H82yfxP5uHPZI/WVTnyf47p+Jm
 H/g+EH1vZVCuxU16JVPzKLiIO9FtT46use7iw47P53ACOiioYIXSubnkETNpVsvR/DYb
 q4NQlVTBGGug+ahJlOZKQ7SmQx51TiYCsvWFd4NH6khKF2FqNashy9ruNAEdrVK178Od
 k22d9+ytHYE6MQx6FUHtyEZwx/MY5b4v7BjQBzyAmB2yhx9Nqaw5H9Aifb6pfJG42tae
 Muu07njJWdauNu9yKQaI1Od4XUAioHaiazC+d4jGNi24yiQDYLsa+Xtxc7RM1RFjOta6
 +txA==
X-Gm-Message-State: AOAM530VtHCz1stqPz9+6ImWjHtpn0SbSOkCvOVR80cHL/bvsMbp6DoR
 R7EWKOBqQurLEAorCXR2ySSsXImwQwnPi+57YXEDlIFIYa8=
X-Google-Smtp-Source: ABdhPJz5PWPp+i8YCe7+xguZ/Gm+1rZmU+NiEBPYm2NL0AdKsjYHIcuKVRntExZ18RMsEgD51HjxvCLqeEYf+eGU/rc=
X-Received: by 2002:a05:6402:12d3:: with SMTP id
 k19mr51189590edx.244.1637502701390; 
 Sun, 21 Nov 2021 05:51:41 -0800 (PST)
MIME-Version: 1.0
References: <6198aa46.1c69fb81.97575.e879SMTPIN_ADDED_MISSING@mx.google.com>
In-Reply-To: <6198aa46.1c69fb81.97575.e879SMTPIN_ADDED_MISSING@mx.google.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Sun, 21 Nov 2021 14:51:30 +0100
Message-ID: <CAJiuCce_3OYGUXpOtuqLn9OZ6-dk2Tqf6P7S0XjRMNN2C+i+GA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2021-11-19
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Lots of boards are failing due to multiple definitions of 'yylloc'

The fix is already upstreamed.
https://source.denx.de/u-boot/u-boot/-/commit/018921ee79d3f30893614b3b2b63b588d8544f73

Should we cherry-pick this fix for each board?

I have sent a patch to bump the U-boot version of Beelink GS1.

Regards,
Clement


On Sat, 20 Nov 2021 at 08:56, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> Gitlab CI failures
> ==================
>
> Below is a list of Gitlab CI job failures in relation to defconfigs or
> runtime tests you are in charge of. Please help us improving the quality
> of Buildroot by investigating those build failures and sending patches
> to fix them.
>
> Results for 'master'
> --------------------
>
> Build failures related to your defconfigs:
>
>                         defconfig |                        link to the job
> ----------------------------------+--------------------------------------------------------------
>                       beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1795045768
>
>
>
> Thanks for your contribution to Buildroot!
>
> --
> http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
