Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B7AC433F5
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 22:44:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2070D4040D;
	Sun, 13 Feb 2022 22:44:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QCqHxaZJnGEQ; Sun, 13 Feb 2022 22:44:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 15824403FD;
	Sun, 13 Feb 2022 22:44:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5E50A1BF834
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 22:44:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5A29C606CB
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 22:44:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q6FvqJL4dYvU for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 22:44:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpweb147.aruba.it (smtpweb147.aruba.it [62.149.158.147])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1DFBD60598
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 22:44:49 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id JNbsniMdiXmFAJNbsnv5VT; Sun, 13 Feb 2022 23:44:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644792288; bh=LK5v9jsMjGnwCGhpsXOEhnWImKMMNxH4N1gOK+uBXZA=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=aXZFn5XOSgsXf7PZAfWchaAh5rQedseTXlsvMGYdMzYn9J6RYJ6lfoZMhGonuEyXi
 8CZ/rLPQ5ByiLY6fQlm6SJIO/yVSNehGbSrNwVmIMO2+57UNlEdCTThM91DIBk15yO
 bSzySmNJ2TDgncymEEB7luchmvOVpZmX1bAm02awJadmUvSZcRd86ygpumnoG1sJDY
 ox6YZLLBEvN/ca/BxWHmSmUGD3SEZC0N6Yck0I8W6fHSBZEl3OkpkwOecwBI+9sK0V
 fkTn6NPHHp1+3150p61Kybjd5AZRs3tW7M/3ISN0mDUvR3fRWdS9bsk/8N6svG6FXQ
 azATF2GyQduOg==
Message-ID: <4145b9b9-a71a-f763-2211-529cf916b91d@benettiengineering.com>
Date: Sun, 13 Feb 2022 23:44:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220213212909.1504992-1-fontaine.fabrice@gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220213212909.1504992-1-fontaine.fabrice@gmail.com>
X-CMAE-Envelope: MS4wfLn627ZiOHwMCnN7VYi/bub79WJyZ7uBqgMwkksObH+mrurpekOYDuMU9Xv7a6pURE2rmnH8gge5oqiD6udpQgkS+4KpssCW3PDDu/aF6h3/b0Gh6f6B
 1MEuQBPvRA6/IAiD1TytDDZBkz/GdTnRi7rxDn2n/VWw5LMIZLeYS2KtQXQ6T/UMG7+yhBjtCKrLtdzfbb6ANdjIYDx6QYwceTeDVuYk2yex+JqxnITa5Umo
 C1yfGw4neTjzmx/kdvT1gQ==
Subject: Re: [Buildroot] [PATCH 1/1] package/cryptsetup: openssl is the
 default crypto backend
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Fabrice,

thanks a lot!

On 13/02/22 22:29, Fabrice Fontaine wrote:
> openssl is the default crypto backend since version 2.1.0 and
> https://github.com/mbroz/cryptsetup/commit/bc3d0feb5cd33f9181102b418cc7bf44fe112e82
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Tested-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

> ---
>   package/cryptsetup/cryptsetup.mk | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
> index 55cc70576c..b50ac698bb 100644
> --- a/package/cryptsetup/cryptsetup.mk
> +++ b/package/cryptsetup/cryptsetup.mk
> @@ -22,15 +22,15 @@ CRYPTSETUP_AUTORECONF = YES
>   CRYPTSETUP_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)"
>   CRYPTSETUP_CONF_OPTS += --enable-blkid --enable-libargon2
>   
> -# cryptsetup uses libgcrypt by default, but can be configured to use OpenSSL
> +# cryptsetup uses OpenSSL by default, but can be configured to use libgcrypt
>   # or kernel crypto modules instead
> -ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
> +ifeq ($(BR2_PACKAGE_OPENSSL),y)
> +CRYPTSETUP_DEPENDENCIES += openssl
> +CRYPTSETUP_CONF_OPTS += --with-crypto_backend=openssl
> +else ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
>   CRYPTSETUP_DEPENDENCIES += libgcrypt
>   CRYPTSETUP_CONF_ENV += LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
>   CRYPTSETUP_CONF_OPTS += --with-crypto_backend=gcrypt
> -else ifeq ($(BR2_PACKAGE_OPENSSL),y)
> -CRYPTSETUP_DEPENDENCIES += openssl
> -CRYPTSETUP_CONF_OPTS += --with-crypto_backend=openssl
>   else
>   CRYPTSETUP_CONF_OPTS += --with-crypto_backend=kernel
>   endif

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
