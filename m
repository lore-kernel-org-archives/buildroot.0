Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA565C77B60
	for <buildroot@archiver.kernel.org>; Sun, 23 Apr 2023 13:05:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 450D540B5B;
	Sun, 23 Apr 2023 13:05:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 450D540B5B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CcWmt8adESdH; Sun, 23 Apr 2023 13:05:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 65D5040470;
	Sun, 23 Apr 2023 13:05:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65D5040470
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E85971C2B28
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 13:05:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C239681F8B
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 13:05:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C239681F8B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WdxJ-n5PRyAZ for <buildroot@lists.busybox.net>;
 Sun, 23 Apr 2023 13:05:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D91381F3B
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6D91381F3B
 for <buildroot@buildroot.org>; Sun, 23 Apr 2023 13:05:24 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:f69d:4ee8:8d2a:132a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 7476AB0059A;
 Sun, 23 Apr 2023 15:05:19 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 23 Apr 2023 15:05:19 +0200
Date: Sun, 23 Apr 2023 15:05:19 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Michael Hacker <mh@superbox.one>
Message-ID: <20230423130519.GH2696@scaer>
References: <A79A145F-0D4E-40BC-9B67-889333FCDCF7@superbox.one>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <A79A145F-0D4E-40BC-9B67-889333FCDCF7@superbox.one>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1682255121;
 bh=TVIrjVnXJE+c1isy8FvQJCC6LxhMqXCAWaIwLhOUwjs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XmGOUJez/a7FNocafIzVsV4lXaQ2dMFa5QtvE5TJRIPmyLKkPqFc4epj5KrGy1ULA
 08QM5RLN4g5AmC2sQCPPxiWBBmNw0J7rIn8V0KRYRB3ep6VJzyY1bxKJE6kFXepmk2
 OONH+zJ3nL24rvNXxksIV2F8igi+zRNBBR5M9APL0pOZIogluHZucrVdYOVw4f6xrD
 1/+JCaBIcVSbYKnfYvWXkgD04tmb3/QN4pAJMdlbfCH8fpN1aNiNPRkH7etqI5k00U
 LuRbHsGXM8F6QSlOblkX7L6W0W1vyRRk8zGi+f8qAwssZDBVLGvm3g75zDiG2nJqYq
 FLT+mp1lbn9xw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=XmGOUJez
Subject: Re: [Buildroot] opkg-utils binaries did not installed with make
 install-utils
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

Michael, All,

On 2023-04-19 05:22 +0200, Michael Hacker spake thusly:
> There seems to be something wrong in the opkg-utils.mk. install-utils does not run correctly and some tools are missing, e.g. opkg-utils.
> 
> I have a patch for it and after that everything is installed correctly:
> 
> diff --git a/package/opkg-utils/opkg-utils.mk b/package/opkg-utils/opkg-utils.mk
> index ad267c5c94..384a7323ee 100644
> --- a/buildroot/package/opkg-utils/opkg-utils.mk
> +++ b/buildroot/package/opkg-utils/opkg-utils.mk
> @@ -16.7 +16.7 @@ HOST_OPKG_UTILS_DEPENDENCIES = \
>  host-xz
> 
>  # Nothing to build; only scripts to install.
> -define OPKG_UTILS_INSTALL_CMDS
> +define OPKG_UTILS_INSTALL_TARGET_CMDS

Eh, good catch! ;-)

Can you please resend with a proper commit log, and your sign-off:

    package/opkg-utils: actually install to target

    Commit b9bf1c6535cb (package/opkg-utils: add opkg-utils as target
    pkg) mis-spelled the macro to install to target, most probably as a
    bad copy-paste from the host macro.

    Fix that.

    Signed-off-by: You Real Name <your-email>

Note that I could have tweaked the commit log, but I can't add the sob
line for you.

Regards,
Yann E. MORIN.

>  $(MAKE) -C $(@D) PREFIX=$(TARGET_DIR) install-utils
>  endef
> 
> Michael Hacker
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
