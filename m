Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73624C433F5
	for <buildroot@archiver.kernel.org>; Sun, 20 Feb 2022 09:55:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DB3881402;
	Sun, 20 Feb 2022 09:55:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MnKym--R-P5r; Sun, 20 Feb 2022 09:55:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BE7A813FF;
	Sun, 20 Feb 2022 09:55:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D9D361BF3F3
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 09:55:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C7359813EE
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 09:55:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sm1mP3UYZout for <buildroot@lists.busybox.net>;
 Sun, 20 Feb 2022 09:55:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6DA68813FF
 for <buildroot@buildroot.org>; Sun, 20 Feb 2022 09:55:04 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:7478:162b:1cf3:1d5b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id CB10A5FFA1;
 Sun, 20 Feb 2022 10:54:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1645350901;
 bh=kRSq99BmOUF4hn8Z8fotLm8xNlV36VcFgZo91cEAdUI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EUGLEBCBqEJXVNoIuEV9xrvBt+5+4xptvg8Gdkt5RqmzYg0bRKso5cB3e6I3UPrTR
 WOkYKkmGFQpXNMC23+SxtDeR0Z85e3USp+UeuZMDrZDODrARa3zKTQ6hWGTzIpWYa6
 RfMcdUwyrpaiTeMGHBkQ7vHFj/VZUh7VHZw9KZITY2a1x9rFwSKozGu93WrT4y2xtl
 meHIK68xpuhPMa2+OUTBXwLjtzxVR5IcfJRHS6baw5vhcjdU4sfV4/LHFyCxg9qr11
 MstPYHuDWZ9JzzxlBGMWJ7AGkQL6PH8kRS4FtzNRVxDgOWnPiZNke8LJCJ6ngRGOFZ
 T7p8oyR5J7mng==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 20 Feb 2022 10:54:58 +0100
Date: Sun, 20 Feb 2022 10:54:58 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220220095458.GP522310@scaer>
References: <20220219122831.2961097-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220219122831.2961097-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/2] package/expat: fix tarball sha256
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

On 2022-02-19 13:28 +0100, Fabrice Fontaine spake thusly:
> Commit ab71ac15ddd7ed6a8ca83cbc23ea0b0cbb343f0f forgot to update sha256
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/expat/expat.hash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/expat/expat.hash b/package/expat/expat.hash
> index 3129801668..a6f43af291 100644
> --- a/package/expat/expat.hash
> +++ b/package/expat/expat.hash
> @@ -3,5 +3,5 @@ md5  a712d23b7afb32e7527cf0b3fd8f12ac  expat-2.4.4.tar.xz
>  sha1  6028b04d3505fc519c4c7c6bd67e1ad1a08cd7b6  expat-2.4.4.tar.xz
>  
>  # Locally calculated
> -sha256  b1f9f1b1a5ebb0acaa88c9ff79bfa4e145823b78aa5185e5c5d85f060824778a  expat-2.4.3.tar.xz
> +sha256  b1f9f1b1a5ebb0acaa88c9ff79bfa4e145823b78aa5185e5c5d85f060824778a  expat-2.4.4.tar.xz

... and so it seems you akso forgot to update the hash. ;-)

Applied to master with the hash fixed for real, thanks.

Regards,
Yann E. MORIN.

>  sha256  8c6b5b6de8fae20b317f4992729abc0e520bfba4c7606cd1e9eeb87418eebdec  COPYING
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
