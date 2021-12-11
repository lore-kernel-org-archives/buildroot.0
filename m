Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEBE4C433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Dec 2021 09:02:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3D24442313;
	Sat, 11 Dec 2021 09:02:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sNdq6RZMFlto; Sat, 11 Dec 2021 09:02:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F3649401DC;
	Sat, 11 Dec 2021 09:02:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6E5481BF471
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 09:02:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 55E04401DC
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 09:02:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mMGWWEnerYjp for <buildroot@lists.busybox.net>;
 Sat, 11 Dec 2021 09:02:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D87E44018B
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 09:02:34 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id v1so37293416edx.2
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 01:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=LJnFx7L5Ilf+kF2q8teiTn0ndWZKclcBmdKcJPzcb58=;
 b=aBi+Rf2LG/65ffj88grZIKDm8mRyHN4yNhitLfQY59cJfX2DBWR7/OO4NWD4kw9Bc/
 v/2COxrqs/nLUFATaES/w/JKbsSMgZ4iLvdcDnO7+CzhxfMZeRQPyEjKVASclLmb1Hw5
 Y8XAnUocmOgx6iPXCy0QvvqIDYgpJ8lOBIHx2+8TE3D1S1iXu9Z2Yaj68AihbIdoHTm2
 TLPyziYKjDpAIUXbJGE4xKBhjdphTglbpN9IxkwW1bqulb2c94aeg9YHbiv0KUbnXP7A
 r4PNqP0q0geF3D4t8rUQpWL0OkLEN8b7eYnVhiDD74LIf6PNfqAwhQfFek4cSy4WoqBD
 MCDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=LJnFx7L5Ilf+kF2q8teiTn0ndWZKclcBmdKcJPzcb58=;
 b=72vhu4yPAweRSjb2q/koID1KWVQ+QV6LPk/wvmR966mJHG1qxGWPilMR2JcHaGuhcq
 3yp4D0ItFU44yt+2ig4FtLMECSJwqa9twxsfTBCO0Xrrlhz6uyOIqYoKPHBcHdMMr/0K
 +MUIn4LAr5y8dU2v7aZaLWAGWy3mxHdu18Sq1CKP0hCZfLPzZyySImN/z1cHTjiCMVtf
 lV1YgVMn/rsXzfWsj+d7C4BF5fLYqbge2Wyr90PzCM8DumQJ8sVHid4FAOTJe3729yPf
 PeHoYkAJGvyDZQ6YKcdpSqPZeJYOSUKdyCunQ7UoIB8C7IupZB/c6Zjhi3gQaQxxdEUS
 7z8w==
X-Gm-Message-State: AOAM530q8P8EDXVCUTlNT1lBf7ONCE3diLkYOtCCr2031ZdY7dmIEB2B
 qhC3FdUr3RQcDDxhXlm9i3YLlw==
X-Google-Smtp-Source: ABdhPJz0HDY//99L2f9QaZCK1WFoS1AeBH5a/VOrd+1qyZGF5CXe+T53ZTG8NJlB/6rrGxbBXdqGgw==
X-Received: by 2002:a17:906:c112:: with SMTP id
 do18mr30827105ejc.103.1639213352900; 
 Sat, 11 Dec 2021 01:02:32 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id t7sm2844419edi.90.2021.12.11.01.02.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Dec 2021 01:02:32 -0800 (PST)
Message-ID: <5c132e20-a74d-8505-18f5-9935d8cbca8d@mind.be>
Date: Sat, 11 Dec 2021 10:02:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Dario Binacchi <dariobin@libero.it>, buildroot@buildroot.org
References: <20211114175310.30573-1-dariobin@libero.it>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211114175310.30573-1-dariobin@libero.it>
Subject: Re: [Buildroot] [RESEND, 1/1] package/davinci-bootcount: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  I always think, a simple package like this, should be easy to apply...

On 14/11/2021 18:53, Dario Binacchi via buildroot wrote:
> U-Boot implements a boot count scheme that can be used to detect
> multiple failed attempts to boot Linux. On Davinci platform (TI AM 335x)
> the `bootcount' value is stored in the RTC SCRATCH2 register. This tool
> allows to read and write this register from userspace.
> 
> Signed-off-by: Dario Binacchi <dariobin@libero.it>

  Applied to master, thanks, but with quite some changes.


> ---
>   package/Config.in                                |  1 +
>   package/davinci-bootcount/Config.in              | 11 +++++++++++
>   package/davinci-bootcount/davinci-bootcount.hash |  2 ++
>   package/davinci-bootcount/davinci-bootcount.mk   | 15 +++++++++++++++

  It would be nice to add yourself to the DEVELOPERS file [1] for this package. 
This way, you'll get an e-mail if the package fails in the autobuilders, or when 
a new version is released if the package is registered on release-monitoring.org.

>   4 files changed, 29 insertions(+)
>   create mode 100644 package/davinci-bootcount/Config.in
>   create mode 100644 package/davinci-bootcount/davinci-bootcount.hash
>   create mode 100644 package/davinci-bootcount/davinci-bootcount.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index cb94e30be3..49a53d44da 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -452,6 +452,7 @@ endmenu
>   	source "package/cwiid/Config.in"
>   	source "package/dahdi-linux/Config.in"
>   	source "package/dahdi-tools/Config.in"
> +	source "package/davinci-bootcount/Config.in"
>   	source "package/dbus/Config.in"
>   	source "package/dbus-cpp/Config.in"
>   	source "package/dbus-glib/Config.in"
> diff --git a/package/davinci-bootcount/Config.in b/package/davinci-bootcount/Config.in
> new file mode 100644
> index 0000000000..da3b3605a0
> --- /dev/null
> +++ b/package/davinci-bootcount/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_DAVINCI_BOOTCOUNT
> +	bool "davinci bootcount"

  Unless there's a really good reason not to, the prompt should be identical to 
the package name.

> +	default n

  This is the default so it shouldn't be there.

> +	help
> +	  U-Boot implements a boot count scheme that can be used to
> +	  detect multiple failed attempts to boot Linux. On Davinci
> +	  platform (TI AM 335x) the `bootcount' is stored in the RTC
> +	  SCRATCH2 register. This tool allows to read and write this
> +	  register from userspace.

  Great description!

  Since this package is poking directly into /dev/mem, perhaps it would be good 
to add an arch dependency to Config.in so it can only be built if it's the 
davinci CPU. I have no idea what the appropriate dependency would be, so I left 
it unchanged.

> +
> +	  https://github.com/VoltServer/uboot-davinci-bootcount
> diff --git a/package/davinci-bootcount/davinci-bootcount.hash b/package/davinci-bootcount/davinci-bootcount.hash
> new file mode 100644
> index 0000000000..32140c6e62
> --- /dev/null
> +++ b/package/davinci-bootcount/davinci-bootcount.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256 4e4243bfc773cf983db4b901520b0eb2728934d52d26fcf99f5e22f673373f6a  davinci-bootcount-0973689c7556a953d2b468e4d8d46758c6d467b4-br1.tar.gz

  Please use two spaces between the columns in the hash file (this is something 
we haven't documented yet, unfortunately).

  Also, you must include a hash for the license files.

> diff --git a/package/davinci-bootcount/davinci-bootcount.mk b/package/davinci-bootcount/davinci-bootcount.mk
> new file mode 100644
> index 0000000000..434da494d7
> --- /dev/null
> +++ b/package/davinci-bootcount/davinci-bootcount.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# davinci-bootcount
> +#
> +################################################################################
> +
> +DAVINCI_BOOTCOUNT_VERSION = 0973689c7556a953d2b468e4d8d46758c6d467b4
> +DAVINCI_BOOTCOUNT_SITE = "https://github.com/VoltServer/uboot-davinci-bootcount"

  No quotes are needed.

  Also, please use the github helper (which BTW also makes the SITE_METHOD 
redundant, and of course changes the has).

> +DAVINCI_BOOTCOUNT_SITE_METHOD = git
> +DAVINCI_BOOTCOUNT_INSTALL_TARGET = YES

  This is redundant because it is default. check-package reports that. Please 
use check-package.

> +DAVINCI_BOOTCOUNT_LICENSE = GPL-3.0
> +DAVINCI_BOOTCOUNT_LICENSE_FILES = COPYING
> +DAVINCI_BOOTCOUNT_AUTORECONF = YES

  We (almost) always put a comment before the AUTORECONF to explain why it is 
needed.

# sources fetched from github, no configure script


  I made all of those changes, so please double-check that what is in master is 
still OK. I did not, however, add you to DEVELOPERS or add an arch dependency.

> +
> +$(eval $(autotools-package))
> 

[1] https://buildroot.org/downloads/manual/manual.html#DEVELOPERS

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
