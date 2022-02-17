Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AED3C433EF
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 20:41:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D88FD60AB3;
	Thu, 17 Feb 2022 20:41:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SeKD93BoNCNm; Thu, 17 Feb 2022 20:41:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0435A60625;
	Thu, 17 Feb 2022 20:41:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 74E7B1BF3B5
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 20:41:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6289441756
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 20:41:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GRWgUDKMIRQc for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 20:41:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 939A841753
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 20:41:24 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:d44f:202d:8a3e:695f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id BB55C13F861;
 Thu, 17 Feb 2022 21:41:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1645130482;
 bh=qu7ciYyIXXAmNb+9XdA/ol4BzRj3Ov7uOcREoaw4Lv4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hDQGu9h0mcQfHZYUgbHKxab6teuttrLXu/wBHcboM6YyTpglt6g1y54QJQhigLEwu
 iynnYoCyxnpgYJ+x/Is94eFdtPYifPd2wrV5K/yCt3cFnhhKYLzxQRoqQbKVu+hcK6
 X/dSjML2H23DfyBKaAnlZjfoYTlsLjji4XuO0zc5o3mwv8sXhp42A5nLudURkLYW1g
 0vkYqdTBsKMhCt1+MccjILLyN2LwMdSxS8qY8Ahtm9qz70e0xZdnEMTTDo3z1s+X/w
 6wUoi6ZWZAHjdg54ouTohmLAs8LccRoNsyXgfk6dkalL6gU1RCCqj3JGoZkoWMI1HE
 OGg74imCO0B/Q==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 17 Feb 2022 21:41:18 +0100
Date: Thu, 17 Feb 2022 21:41:18 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: moritz@h6t.eu
Message-ID: <20220217204118.GH522310@scaer>
References: <20220217074338.147889-1-moritz@h6t.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220217074338.147889-1-moritz@h6t.eu>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/cryptsetup: fix build failure
 with libgcrypt
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Moritz, All,

On 2022-02-17 08:43 +0100, Moritz Bitsch via buildroot spake thusly:
> From: Moritz Bitsch <moritz@h6t.eu>
> 
> The patch 0001-Add-check-program-for-symver-attribute.patch touches
> a autoconf relevant file which causes a configure --recheck in the
> make step without proper CONF_ENV. Running autoreconf prevents this.

I've added a reference to the commit sha1 that introduced the issue, as
the patch by Fabrice did (as pointed out by Giulio).

> Signed-off-by: Moritz Bitsch <moritz@h6t.eu>
> ---
>  package/cryptsetup/cryptsetup.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
> index 2e06047c56..8373f0ab74 100644
> --- a/package/cryptsetup/cryptsetup.mk
> +++ b/package/cryptsetup/cryptsetup.mk
> @@ -19,6 +19,7 @@ CRYPTSETUP_CPE_ID_VENDOR = cryptsetup_project
>  CRYPTSETUP_INSTALL_STAGING = YES
>  CRYPTSETUP_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)"
>  CRYPTSETUP_CONF_OPTS += --enable-blkid --enable-libargon2
> +CRYPTSETUP_AUTORECONF = YES

We also like to add a small comment to explain why autoreconf is needed,
in this case just the name of the patch is suficient.

Applied to master, thanks.

Regards,
Yann E. MORIN.

>  # cryptsetup uses libgcrypt by default, but can be configured to use OpenSSL
>  # or kernel crypto modules instead
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
