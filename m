Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61D34C77B7C
	for <buildroot@archiver.kernel.org>; Tue,  9 May 2023 21:05:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0172642BAD;
	Tue,  9 May 2023 21:05:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0172642BAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QdszHRV6Snik; Tue,  9 May 2023 21:05:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 09A6C42B91;
	Tue,  9 May 2023 21:05:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 09A6C42B91
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AC3481BF335
 for <buildroot@lists.busybox.net>; Tue,  9 May 2023 21:05:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 85AD883B13
 for <buildroot@lists.busybox.net>; Tue,  9 May 2023 21:05:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85AD883B13
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MWit4XPydabk for <buildroot@lists.busybox.net>;
 Tue,  9 May 2023 21:05:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 710E283AF4
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 710E283AF4
 for <buildroot@buildroot.org>; Tue,  9 May 2023 21:05:21 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:3a04:4e20:1cde:35ad])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 41ACF2003BE;
 Tue,  9 May 2023 23:05:12 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 09 May 2023 23:05:12 +0200
Date: Tue, 9 May 2023 23:05:11 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <aduskett@gmail.com>
Message-ID: <20230509210511.GG252090@scaer>
References: <20230425171454.48802-1-aduskett@gmail.com>
 <20230425171454.48802-12-aduskett@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230425171454.48802-12-aduskett@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683666319;
 bh=X4wSPVTwUbJA13alxBQsqA3PO5NhCGjpttopJ+Y+Icc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dZZZsAgOdmhuMTf0Po7WKS13oWF31H8TkyD3K9ZCS8CCouV3urdYW0dpn5/nfEO96
 CNGmu24IDbZ0jIzemXN0G7CTodcDf3GKQj8X8U2bBlv1/fRRVM20eS/AKgh7+UYGcU
 zWBwxCmok7ws6PBduihVvcCxvU++FfDatYwB7nk2feXfAl6NJdvUu0Tj37p4KmMi2Y
 7fOsjdyCXEQYMXF31j49aXb/igSkCujqxppbOtqTDmuhZt+hq8rp3KUfu9NO6DRsu5
 FcclOf1TERXaee7enPREH26iNsHMhkWrkugfa6nWqxGlM6yH0vAMBeqS58H/RBAdyC
 1uIh+zvORdGnQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dZZZsAgO
Subject: Re: [Buildroot] [PATCH v2 11/13] package/selinux-python: bump to
 version 3.5
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Antoine Tenart <atenart@kernel.org>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Adam, All,

On 2023-04-25 10:14 -0700, Adam Duskett spake thusly:
> Also:
>   - Change the license file to LICENSE. The hash remains the same.
> 
>   - Add 0001-fix-ausearch-path.patch as audit 3.1 installs ausearch to
>     /usr/sbin not /sbin
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
>  .../0001-fix-ausearch-path.patch              | 37 +++++++++++++++++++
>  package/selinux-python/selinux-python.hash    |  4 +-
>  package/selinux-python/selinux-python.mk      |  4 +-
>  3 files changed, 41 insertions(+), 4 deletions(-)
>  create mode 100644 package/selinux-python/0001-fix-ausearch-path.patch
> 
> diff --git a/package/selinux-python/0001-fix-ausearch-path.patch b/package/selinux-python/0001-fix-ausearch-path.patch
> new file mode 100644
> index 0000000000..c5f0a990ed
> --- /dev/null
> +++ b/package/selinux-python/0001-fix-ausearch-path.patch
> @@ -0,0 +1,37 @@
> +From 7a2456f18a49fa70de1f9ace12512bb00437b6ba Mon Sep 17 00:00:00 2001
> +From: Adam Duskett <aduskett@gmail.com>
> +Date: Mon, 24 Apr 2023 12:25:19 -0700
> +Subject: [PATCH 1/1] fix ausearch path
> +
> +ausearch is installed in /usr/sbin not /sbin
> +
> +Signed-off-by: Adam Duskett <aduskett@gmail.com>

    $ ./utils/docker-run make check-package
    package/selinux-python/0001-fix-ausearch-path.patch:4: generate your patches with 'git format-patch -N'
    package/selinux-python/0001-fix-ausearch-path.patch:0: missing Upstream in the header (http://nightly.buildroot.org/#_additional_patch_documentation)

I changed the commit to an upstreamable one, and rewrote the commit log
with more in-depth explanations, so that fixed those two warnings.

Can you see into pushing that patch upstream, please?

Applied to master, thanks.

Regards,
Yann E. MORIN.

> +---
> + sepolgen/src/sepolgen/audit.py | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/sepolgen/src/sepolgen/audit.py b/sepolgen/src/sepolgen/audit.py
> +index 4adb851..5afe85d 100644
> +--- a/sepolgen/src/sepolgen/audit.py
> ++++ b/sepolgen/src/sepolgen/audit.py
> +@@ -41,7 +41,7 @@ def get_audit_boot_msgs():
> +     s = time.localtime(time.time() - off)
> +     bootdate = time.strftime("%x", s)
> +     boottime = time.strftime("%X", s)
> +-    output = subprocess.Popen(["/sbin/ausearch", "-m", "AVC,USER_AVC,MAC_POLICY_LOAD,DAEMON_START,SELINUX_ERR", "-ts", bootdate, boottime],
> ++    output = subprocess.Popen(["/usr/sbin/ausearch", "-m", "AVC,USER_AVC,MAC_POLICY_LOAD,DAEMON_START,SELINUX_ERR", "-ts", bootdate, boottime],
> +                               stdout=subprocess.PIPE).communicate()[0]
> +     if util.PY3:
> +         output = util.decode_input(output)
> +@@ -56,7 +56,7 @@ def get_audit_msgs():
> +        string contain all of the audit messages returned by ausearch.
> +     """
> +     import subprocess
> +-    output = subprocess.Popen(["/sbin/ausearch", "-m", "AVC,USER_AVC,MAC_POLICY_LOAD,DAEMON_START,SELINUX_ERR"],
> ++    output = subprocess.Popen(["/usr/sbin/ausearch", "-m", "AVC,USER_AVC,MAC_POLICY_LOAD,DAEMON_START,SELINUX_ERR"],
> +                               stdout=subprocess.PIPE).communicate()[0]
> +     if util.PY3:
> +         output = util.decode_input(output)
> +-- 
> +2.40.0
> +
> diff --git a/package/selinux-python/selinux-python.hash b/package/selinux-python/selinux-python.hash
> index 6ada3fee36..3592540703 100644
> --- a/package/selinux-python/selinux-python.hash
> +++ b/package/selinux-python/selinux-python.hash
> @@ -1,5 +1,5 @@
>  # https://github.com/SELinuxProject/selinux/wiki/Releases
> -sha256  8ad91061300387996ccb474962fb93dde263d924aa8f740618be16b22e2444ec  selinux-python-3.3.tar.gz
> +sha256  8245bb4dae59333461f19ca0c79a829081f07972fa5e3ad4c2b2b917dd71d96b  selinux-python-3.5.tar.gz
>  
>  # Hash for license file
> -sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
> +sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  LICENSE
> diff --git a/package/selinux-python/selinux-python.mk b/package/selinux-python/selinux-python.mk
> index 0cec602f3d..7505474aa4 100644
> --- a/package/selinux-python/selinux-python.mk
> +++ b/package/selinux-python/selinux-python.mk
> @@ -4,10 +4,10 @@
>  #
>  ################################################################################
>  
> -SELINUX_PYTHON_VERSION = 3.3
> +SELINUX_PYTHON_VERSION = 3.5
>  SELINUX_PYTHON_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(SELINUX_PYTHON_VERSION)
>  SELINUX_PYTHON_LICENSE = GPL-2.0
> -SELINUX_PYTHON_LICENSE_FILES = COPYING
> +SELINUX_PYTHON_LICENSE_FILES = LICENSE
>  SELINUX_PYTHON_DEPENDENCIES = python3
>  
>  SELINUX_PYTHON_MAKE_OPTS += \
> -- 
> 2.40.0
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
