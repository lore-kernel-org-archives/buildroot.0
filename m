Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EDB0C43334
	for <buildroot@archiver.kernel.org>; Sun, 12 Jun 2022 15:50:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0C16F405E6;
	Sun, 12 Jun 2022 15:50:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kCzjSFzHFkva; Sun, 12 Jun 2022 15:50:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6D7FE40162;
	Sun, 12 Jun 2022 15:50:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 49A631BF3D0
 for <buildroot@lists.busybox.net>; Sun, 12 Jun 2022 15:50:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3206560B37
 for <buildroot@lists.busybox.net>; Sun, 12 Jun 2022 15:50:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PekmNY7eX3us for <buildroot@lists.busybox.net>;
 Sun, 12 Jun 2022 15:50:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2CBD860B2D
 for <buildroot@buildroot.org>; Sun, 12 Jun 2022 15:50:51 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e0a2:2157:6a43:27a1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 642CA780373;
 Sun, 12 Jun 2022 17:50:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1655049047;
 bh=XEkmedeEMVJs/0eq0NcFy8myobPI1mFzsjPHQPiidVE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tUqkcejxodigbIPqbnTV5MfGn2Lo8sOkHTtWAdvCbqrwBo6K3VLwEYfrKAltSGccn
 IXu0iPXE2Fhpsh6DThUxPRa1nWtHi6Y4Jla+L5Wg1TYdeGqUzg/A4HrqYjyKyGOdDP
 1rGte+T4RyvsEQcW6ZeHZOWbKWCeFN25GYKsBMiuFkBGhVGEWZ6xEhMx6mDOAgWXBa
 VJxT+2P8HaHpgwmsKT/J9C+gANvNh1Pox4Iz432MorgUFuqGqv7U5Mk1T180oVIEIM
 U8A/kbfnkKSPIOt+tV+rfVlY1g8oi1zQcETkLScwvwMXrIqNu6lUEP8uWtkyYkF2YW
 0o3o9GyOBdLAw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 12 Jun 2022 17:50:43 +0200
Date: Sun, 12 Jun 2022 17:50:43 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220612155043.GG427639@scaer>
References: <20220611145715.879538-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220611145715.879538-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/libnetconf2: doesn't build with
 libressl
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>,
 Jan =?utf-8?Q?Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-06-11 16:57 +0200, Fabrice Fontaine spake thusly:
> libnetconf2 doesn't build with libressl which doesn't provide
> X509_STORE_CTX_get1_certs resulting in the following build failure with
> netopeer2:
> 
> [100%] Linking C executable netopeer2-server
> /home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/microblaze-buildroot-linux-gnu/11.2.0/../../../../microblaze-buildroot-linux-gnu/bin/ld: /home/buildroot/autobuild/instance-3/output-1/host/microblaze-buildroot-linux-gnu/sysroot/usr/lib/libnetconf2.so: undefined reference to `X509_STORE_CTX_get1_certs'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/7f9a114a477e859dfbc62a53ab66c58eddb2318b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libnetconf2/libnetconf2.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libnetconf2/libnetconf2.mk b/package/libnetconf2/libnetconf2.mk
> index 11a1995ea1..00d2c08f63 100644
> --- a/package/libnetconf2/libnetconf2.mk
> +++ b/package/libnetconf2/libnetconf2.mk
> @@ -23,7 +23,7 @@ else
>  LIBNETCONF2_CONF_OPTS += -DENABLE_SSH=OFF
>  endif
>  
> -ifeq ($(BR2_PACKAGE_OPENSSL), y)
> +ifeq ($(BR2_PACKAGE_LIBOPENSSL), y)

I was wondering if libnetconf2 should instead just select
BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL so that it is obvious in the
menuconfig.

I mena, by selecting BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL, a user who
enables openssl will see that libressl is not availble, while with your
solution, openssl is enabled with libressl, yet libnetconf2 is not built
with ssl support, which can be a bit confusing to some.

Yet, I am not sure what the proper solution is, and I cold not find a
precedent either way. So, applied to master, thanks.

Regards,
Yann E. MORIN.

>  LIBNETCONF2_CONF_OPTS += -DENABLE_TLS=ON
>  LIBNETCONF2_DEPENDENCIES += openssl
>  else
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
