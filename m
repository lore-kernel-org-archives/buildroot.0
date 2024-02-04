Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8263AC48286
	for <buildroot@archiver.kernel.org>; Sun,  4 Feb 2024 10:36:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3DC418513F;
	Sun,  4 Feb 2024 10:36:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3DC418513F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0szAVaS_JS4a; Sun,  4 Feb 2024 10:36:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CCA985136;
	Sun,  4 Feb 2024 10:36:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9CCA985136
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BA04A1BF3EB
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 10:36:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9121E408B4
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 10:36:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9121E408B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v3zqgwvfe7YG for <buildroot@lists.busybox.net>;
 Sun,  4 Feb 2024 10:36:08 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CBEF0401D5
 for <buildroot@buildroot.org>; Sun,  4 Feb 2024 10:36:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CBEF0401D5
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2001:67c:1810:f051:9566:1ebe:e5dc:dd49])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 8D55CB004FF;
 Sun,  4 Feb 2024 11:36:00 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 04 Feb 2024 11:36:00 +0100
Date: Sun, 4 Feb 2024 11:36:00 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <Zb9okKO-F6etpGOx@landeda>
References: <20240204102056.1409453-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240204102056.1409453-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707042964;
 bh=9br9P4dODMf5Th7bCLAZ7Fea8tFXiPccuQlQG1t0DjQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vTYgHMrkEhYi+3PRwldo64tsdmX8xMjtysPWNwq40LBO3Q6r0KVYrrtIVhiOZm6/o
 exVK8w4VT/VUbVSc6eWa+34pWIXub/utWIU3+NuBxRbuH8XRwlnCMUGtU6wG+OOK4I
 rjO0GVl6KvoJTPxWEbdaFr95pCe46PpgVOVkKjezlqaI3cGjRUGUFW/iWEMmeJK8sa
 8jp77QZ46Rgs18AQ2cWnPID6rq7EE1CVKFhIGq5KQpdhC94VTV6wQUWjU/jOAcEC2F
 Eyd6jD7BJuowo6VpRcge/bBV8UR8JYe933kUBkzuhnyLrPHWiMc1TpUcfqXEJJ240o
 bFvk3SwsUw2IQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=vTYgHMrk
Subject: Re: [Buildroot] [PATCH 1/1] package/nfs-utils: drop
 NFS_UTILS_AUTORECONF
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
Cc: Petr Vorel <petr.vorel@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2024-02-04 11:20 +0100, Fabrice Fontaine spake thusly:
> Commit 63332c33aa0771532807fd2684d4eee4eb952435 wrongly set
> NFS_UTILS_AUTORECONF
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/nfs-utils/nfs-utils.mk | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
> index a11ba154ad..4f2b41c782 100644
> --- a/package/nfs-utils/nfs-utils.mk
> +++ b/package/nfs-utils/nfs-utils.mk
> @@ -11,7 +11,6 @@ NFS_UTILS_LICENSE = GPL-2.0+
>  NFS_UTILS_LICENSE_FILES = COPYING
>  NFS_UTILS_DEPENDENCIES = host-nfs-utils host-pkgconf libevent libtirpc sqlite util-linux
>  NFS_UTILS_CPE_ID_VENDOR = linux-nfs
> -NFS_UTILS_AUTORECONF = YES
>  
>  NFS_UTILS_CONF_ENV = knfsd_cv_bsd_signals=no
>  
> -- 
> 2.43.0
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
