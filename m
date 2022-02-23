Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F76C433F5
	for <buildroot@archiver.kernel.org>; Wed, 23 Feb 2022 18:25:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0C41A408F1;
	Wed, 23 Feb 2022 18:25:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bPz4rCoZzofs; Wed, 23 Feb 2022 18:25:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0FA7A408EA;
	Wed, 23 Feb 2022 18:25:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6D2791BF5F5
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 18:25:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 66C2F829AF
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 18:25:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sSOISQJCb6Na for <buildroot@lists.busybox.net>;
 Wed, 23 Feb 2022 18:25:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from hostingweb31-40.netsons.net (hostingweb31-40.netsons.net
 [89.40.174.40])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7D1158291D
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 18:25:48 +0000 (UTC)
Received: from [77.244.183.192] (port=62598 helo=[192.168.178.41])
 by hostingweb31.netsons.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <luca@lucaceresoli.net>)
 id 1nMwKg-0005NG-8h; Wed, 23 Feb 2022 19:25:46 +0100
Message-ID: <67b712f3-91f0-d726-d7e3-3b6363f6fe94@lucaceresoli.net>
Date: Wed, 23 Feb 2022 19:25:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Neal Frager <neal.frager@xilinx.com>, buildroot@buildroot.org
References: <20220223180336.3372352-1-neal.frager@xilinx.com>
From: Luca Ceresoli <luca@lucaceresoli.net>
In-Reply-To: <20220223180336.3372352-1-neal.frager@xilinx.com>
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - buildroot.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id:
 luca@lucaceresoli.net
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: Re: [Buildroot] [PATCH v4 1/1] configs/zynqmp_zcu10x: fix U-Boot
 dts config
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
Cc: giulio.benetti@benettiengineering.com, michal.simek@xilinx.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Neal,

On 23/02/22 19:03, Neal Frager wrote:
> This patch:
>   - fixes U-Boot issue when DEVICE_TREE environment variable is not defined
> 
> Signed-off-by: Neal Frager <neal.frager@xilinx.com>

> Reviewed-by: Peter Korsgaard <peter@korsgaard.com>
> Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
> Tested-by: Peter Korsgaard <peter@korsgaard.com>

These are probably copy-paste errors, we did not write these tags. :)

> 
> ---
> V1->V2:
>   - removed version bumps from patch
>   - removed unnecessary blank lines from uboot-fragment.config files
> V2->V3:
>   - fixed typo in zynqmp_zcu106_defconfig
> V3->V4:
>   - re-added patch notes

In case it helps, here's how I manage these changelogs and the review
tags in patches minimizing the above kind of problems.

In my local commits I do keep them in the commit message:

  $ git show
  commit bb20b3e1faded47201f4d6a7758b5826eb3139e8
  Author: Luca Ceresoli <luca@lucaceresoli.net>
  Date:   Mon Oct 4 16:24:00 2021 +0200

    title line....

    more info...

    even more info...

    Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
    Reviewed-by: Some Body <...email...>
    Acked-by: Somebody Else <...email...>

    ---

    Changes in v2:
     - improved this
     - added comments

When reworking the patch I add to the changelog and the tag list using
'git commit --amend' or 'git rebase --interactive' to reword the message.

When sending a patch with 'git format-patch' / 'git send-email' they
appear in the e-mail and the changelog will be removed when applying the
patch because it is after the '---' line.

Of course it is how I do manage patches, you might do in whatever way
suits you.

I just started a build, let's see whether it works.

-- 
Luca
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
