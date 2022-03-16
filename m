Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79B63C433EF
	for <buildroot@archiver.kernel.org>; Wed, 16 Mar 2022 22:12:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21A5C60C15;
	Wed, 16 Mar 2022 22:12:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QkkpmclbfPsA; Wed, 16 Mar 2022 22:12:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4238560AD0;
	Wed, 16 Mar 2022 22:12:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 686931BF3DB
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 22:12:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 56BBB81458
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 22:12:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tA8IowmC0z9K for <buildroot@lists.busybox.net>;
 Wed, 16 Mar 2022 22:12:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6F4A6817A3
 for <buildroot@buildroot.org>; Wed, 16 Mar 2022 22:12:47 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6da3:2756:3f87:4127])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id D3A4D13F86A;
 Wed, 16 Mar 2022 23:12:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1647468766;
 bh=7QHZWvQlZDhWHo6NvelDW7NxLJ0Hg25FzjY6p2LYd18=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=px96u8TP/soES4z8T5k9Ddsch0pfHSUU+KDSRFaFkHlRvX0C3Wy/xuGTBSVugx/rz
 KMwBbUE27jIX45A+YZRBbooCFRFm7ciJt11cwJIpljlI6hZrBpi6P45lxFuSRsj9cB
 2mzQtuUVUsDJk1y1oZOEK95oSDD0IhYSUnE0XLxNM1p2+s1rJOa7SB3zJldKSTuAe1
 /iaFG801nPhOvQMMziP/ylgpky0sT8yGGrU1VCJMCp51bH3k+yrh26n3EvhbunEdQf
 3LHnvKZAe/kIPpYkJ5HDCjrPyhaUzVPPjXtw8KxkFvKyOo32keHSZvUX6lwC6H3l0/
 /dj9Wt5z/3M/A==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 16 Mar 2022 23:12:42 +0100
Date: Wed, 16 Mar 2022 23:12:42 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20220316221242.GE283544@scaer>
References: <20220316213047.16103-1-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220316213047.16103-1-ps.report@gmx.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v1] package/gst1-shark: bump version to 0.7.5
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
Cc: Chris Packham <judge.packham@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2022-03-16 22:30 +0100, Peter Seiderer spake thusly:
> Changelog ([1], [2]):
> 
>   - 0.7.5: Eclipse Plugin was removed
>   - 0.7.4: Remove RidgeRun Licence from Eclipse Plugin
>            Add README with warning on Eclipse Plugin future removal
> 
> [1] https://github.com/RidgeRun/gst-shark/releases/tag/v0.7.4
> [2] https://github.com/RidgeRun/gst-shark/releases/tag/v0.7.5
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/gstreamer1/gst1-shark/gst1-shark.hash | 2 +-
>  package/gstreamer1/gst1-shark/gst1-shark.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/gstreamer1/gst1-shark/gst1-shark.hash b/package/gstreamer1/gst1-shark/gst1-shark.hash
> index be26050715..cfd72dd2a6 100644
> --- a/package/gstreamer1/gst1-shark/gst1-shark.hash
> +++ b/package/gstreamer1/gst1-shark/gst1-shark.hash
> @@ -1,5 +1,5 @@
>  # locally computed hash
> -sha256  689e60b4e10635a4f3af795b53045c6e90643896fa07b61e164a96158a79bdcf  gst1-shark-v0.7.3-br1.tar.gz
> +sha256  413dbd8b6be1b09751e8d00abf9784de18cb74283c95ac078f6fb7d8750de26a  gst1-shark-v0.7.5-br1.tar.gz
>  
>  # Hashes for license files:
>  sha256  6d191b8f1fa03cabced18b8e48fddbf960a19f965bed8491e76ed62238f92f0b  COPYING
> diff --git a/package/gstreamer1/gst1-shark/gst1-shark.mk b/package/gstreamer1/gst1-shark/gst1-shark.mk
> index 4e7801e920..17df001cef 100644
> --- a/package/gstreamer1/gst1-shark/gst1-shark.mk
> +++ b/package/gstreamer1/gst1-shark/gst1-shark.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -GST1_SHARK_VERSION = v0.7.3
> +GST1_SHARK_VERSION = v0.7.5
>  GST1_SHARK_SITE =  https://github.com/RidgeRun/gst-shark.git
>  GST1_SHARK_SITE_METHOD = git
>  GST1_SHARK_GIT_SUBMODULES = YES
> -- 
> 2.35.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
