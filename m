Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7F7FC433EF
	for <buildroot@archiver.kernel.org>; Wed,  5 Jan 2022 09:33:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 974454162B;
	Wed,  5 Jan 2022 09:33:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OKa_T1eyrES1; Wed,  5 Jan 2022 09:33:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 931B441622;
	Wed,  5 Jan 2022 09:33:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3944F1BF390
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 09:33:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 25813410D7
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 09:33:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CD3I_wrtsVR6 for <buildroot@lists.busybox.net>;
 Wed,  5 Jan 2022 09:33:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 37A86409F7
 for <buildroot@buildroot.org>; Wed,  5 Jan 2022 09:33:23 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:dd8f:11a1:7592:f85e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 5530F2003C6;
 Wed,  5 Jan 2022 10:33:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641375200;
 bh=Pz74VXH5UfCFfytnqoV4GabueiH7nZTlbA9FSoXl5dg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eHq7nslWuCTTQafSyGBZAX6KjaDuBrhV4JD5zylF7o+HJ87iscLoCHeQpQ4SzQHrZ
 UhXe4OGSf0qlgmMuJJLJWtz8M7HnSLpx8/T3i/kwL16BRnuwN1Lvbv+lnU/eOw7ytU
 s7zJ0wru3hzrT+rFR0QNOzQeadK+V4a11n47fNOestrfeRsKcRHS85TcspRwE2G0P0
 PeJDiXcKppCiPuqvRSCydvgEAxs/9HP0hnPxF38MTweRa4Ixy7uXTTPaaSqVo+SVCE
 3JVWJ4XD8YLAkKhkCPf/84W3XYy4H1SZiTPfxdJSOROw0KUdkK2YAIrNsNzqr8NRMa
 OR8xQIfB+kRdg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 05 Jan 2022 10:33:08 +0100
Date: Wed, 5 Jan 2022 10:33:08 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220105093308.GF614810@scaer>
References: <20220104220245.3706221-1-fontaine.fabrice@gmail.com>
 <20220104220245.3706221-6-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220104220245.3706221-6-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 6/6] package/selinux-python: bump to version
 3.3
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
Cc: Antoine Tenart <atenart@kernel.org>,
 Clayton Shotwell <clayton.shotwell@collins.com>,
 Matt Weber <matthew.weber@collins.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-01-04 23:02 +0100, Fabrice Fontaine spake thusly:
> Update indentation in hash file (two spaces)
> 
> https://github.com/SELinuxProject/selinux/releases/tag/3.3
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/selinux-python/selinux-python.hash | 4 ++--
>  package/selinux-python/selinux-python.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/selinux-python/selinux-python.hash b/package/selinux-python/selinux-python.hash
> index 00c28b722c..93a28becdd 100644
> --- a/package/selinux-python/selinux-python.hash
> +++ b/package/selinux-python/selinux-python.hash
> @@ -1,5 +1,5 @@
>  # https://github.com/SELinuxProject/selinux/wiki/Releases
> -sha256 770855ea8120ef23007fdb9db94b1ed6e8cd77917b584ed8877bbee9c16e74fb selinux-python-3.2.tar.gz
> +sha256  8ad91061300387996ccb474962fb93dde263d924aa8f740618be16b22e2444ec  selinux-python-3.2.tar.gz

You did update the hash, but forgot to update the version. ;-)

Applied to master with the above fixed, thanks.

Regards,
Yann E. MORIN.

>  # Hash for license file
> -sha256 204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994 COPYING
> +sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
> diff --git a/package/selinux-python/selinux-python.mk b/package/selinux-python/selinux-python.mk
> index 61ec7eb595..0cec602f3d 100644
> --- a/package/selinux-python/selinux-python.mk
> +++ b/package/selinux-python/selinux-python.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -SELINUX_PYTHON_VERSION = 3.2
> +SELINUX_PYTHON_VERSION = 3.3
>  SELINUX_PYTHON_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(SELINUX_PYTHON_VERSION)
>  SELINUX_PYTHON_LICENSE = GPL-2.0
>  SELINUX_PYTHON_LICENSE_FILES = COPYING
> -- 
> 2.34.1
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
