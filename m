Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F09A7C433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Apr 2022 19:05:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB4ED8266A;
	Sun,  3 Apr 2022 19:05:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Up9RL7wHNU1q; Sun,  3 Apr 2022 19:05:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE5F281B72;
	Sun,  3 Apr 2022 19:05:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 990401BF36B
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 19:05:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 969D360E22
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 19:05:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MYDAGcEZ7hFr for <buildroot@lists.busybox.net>;
 Sun,  3 Apr 2022 19:05:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 51A9260ACE
 for <buildroot@buildroot.org>; Sun,  3 Apr 2022 19:05:25 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:314c:79b0:cf44:9021])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id B4D1A13F81D;
 Sun,  3 Apr 2022 21:05:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1649012722;
 bh=N7OP8v2GDx+1q1SpMAA+U5SxS9xv7qUC0MAxttqRUco=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hu1ywmCHnTerIOqH7akMzbQR33Un92gkKTXFSpjcF/sM7n+0AoFNxrXJqAZrto1Sp
 mOUbBRSpTKwedMswq6vzy2vLDew4JDsAA7xWV5Co/hCZ8brE7rhWJyjY/1XGMgbenB
 DUcQTmx4LRGpZ1qCB6LHHOci/ZLSP6jOO7VDCh9Q1n87fm7/thDWOCQAAKgd9wTM14
 gLseTaicii15sPicBetkvgj1RKR1Kja117SYIUptcScqrUCEWtv19i9X+idBcJSFiZ
 kh0f5T6h9m5s5pb7/wsVeJmG3Ek/RiFdBjOopFPjPw91DGiOsEHHnsLNxFgVFvME3W
 q70L7YfwEkJ6Q==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 03 Apr 2022 21:05:20 +0200
Date: Sun, 3 Apr 2022 21:05:20 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220403190520.GI1811301@scaer>
References: <20220403154612.4158174-1-fontaine.fabrice@gmail.com>
 <20220403154612.4158174-4-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220403154612.4158174-4-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 4/4] package/cppcms: bump to version
 2.0.0-beta2
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

Fabrice, All,

On 2022-04-03 17:46 +0200, Fabrice Fontaine spake thusly:
> - Update indentation in hash file (two spaces)
> - This bump will fix the following build failure if python2 is not
>   available on host (while at it, add host-python3 dependency):
> 
> Traceback (most recent call last):
>   File "/home/autobuild/autobuild/instance-4/output-1/build/cppcms-1.2.1/bin/cppcms_tmpl_cc", line 14, in <module>
>     import StringIO
> ModuleNotFoundError: No module named 'StringIO'
> 
> http://cppcms.com/wikipp/en/page/cppcms_2_0_whats_new
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/00482ee24deae95a91f8499f499b18e15f14b51a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Series of 4 patches applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/cppcms/cppcms.hash | 14 +++++++-------
>  package/cppcms/cppcms.mk   |  6 +++---
>  2 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/package/cppcms/cppcms.hash b/package/cppcms/cppcms.hash
> index 86f86d94af..a8d04ff36f 100644
> --- a/package/cppcms/cppcms.hash
> +++ b/package/cppcms/cppcms.hash
> @@ -1,8 +1,8 @@
> -# From http://sourceforge.net/projects/cppcms/files/cppcms/1.2.1/
> -sha1	9cb25cc5d507d2f4235326ba3815eba252b4ac77	cppcms-1.2.1.tar.bz2
> -md5	2bb259fefb86532e404207c71c094a0c	cppcms-1.2.1.tar.bz2
> +# From http://sourceforge.net/projects/cppcms/files/cppcms/2.0.0-beta2/
> +sha1  746cc5e3f58565d91d9ded6e2616399d60e9d01d  cppcms-2.0.0.beta2.tar.bz2
> +md5  ef561d13ee92d2053151cab073feba10  cppcms-2.0.0.beta2.tar.bz2
>  # Locally computed:
> -sha256  10fec7710409c949a229b9019ea065e25ff5687103037551b6f05716bf6cac52	cppcms-1.2.1.tar.bz2
> -sha256  fb7c15ddf590037d4cd18ebd61148a2304b9243369d238a64f599182377e32db	COPYING.TXT
> -sha256	3e4012cc5950e05bedfdd2f00ceffe1ef71c46ac8c79f07e237ecb23c773f65f	MIT.TXT
> -sha256	d6ce062e5cf4f7e3c536d7d2fee84c882c45245f1848ed3162401f2b29fa2b4b	THIRD_PARTY_SOFTWARE.TXT
> +sha256  697031c7d141fdd215c6be5090b66e2106a63bb3e52f09ee8120e8efc6c08a21  cppcms-2.0.0.beta2.tar.bz2
> +sha256  fb7c15ddf590037d4cd18ebd61148a2304b9243369d238a64f599182377e32db  COPYING.TXT
> +sha256  3e4012cc5950e05bedfdd2f00ceffe1ef71c46ac8c79f07e237ecb23c773f65f  MIT.TXT
> +sha256  d6ce062e5cf4f7e3c536d7d2fee84c882c45245f1848ed3162401f2b29fa2b4b  THIRD_PARTY_SOFTWARE.TXT
> diff --git a/package/cppcms/cppcms.mk b/package/cppcms/cppcms.mk
> index c560b5d0fa..8a59990a8d 100644
> --- a/package/cppcms/cppcms.mk
> +++ b/package/cppcms/cppcms.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -CPPCMS_VERSION = 1.2.1
> -CPPCMS_SOURCE = cppcms-$(CPPCMS_VERSION).tar.bz2
> +CPPCMS_VERSION = 2.0.0-beta2
> +CPPCMS_SOURCE = cppcms-$(subst -,.,$(CPPCMS_VERSION)).tar.bz2
>  CPPCMS_LICENSE = MIT, BSL-1.0 (boost), Public Domain (json2.js), Zlib (md5)
>  CPPCMS_LICENSE_FILES = COPYING.TXT MIT.TXT THIRD_PARTY_SOFTWARE.TXT
>  CPPCMS_SITE = http://downloads.sourceforge.net/project/cppcms/cppcms/$(CPPCMS_VERSION)
> @@ -18,7 +18,7 @@ CPPCMS_CONF_OPTS = \
>  	-DCMAKE_SKIP_RPATH=ON \
>  	-DCMAKE_CXX_FLAGS="$(CPPCMS_CXXFLAGS)"
>  
> -CPPCMS_DEPENDENCIES = pcre
> +CPPCMS_DEPENDENCIES = host-python3 pcre
>  
>  ifeq ($(BR2_PACKAGE_CPPCMS_ICU),y)
>  CPPCMS_CONF_OPTS += -DDISABLE_ICU_LOCALE=OFF
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
