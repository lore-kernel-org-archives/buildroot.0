Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5828FC433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Apr 2022 20:15:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 01C104028D;
	Sun,  3 Apr 2022 20:15:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T2LRpSvlcsJc; Sun,  3 Apr 2022 20:15:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F0ADE4011D;
	Sun,  3 Apr 2022 20:15:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3EC5A1BF31F
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 20:15:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C93482A53
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 20:15:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cr5yVW5u8Xsq for <buildroot@lists.busybox.net>;
 Sun,  3 Apr 2022 20:15:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5C8078275C
 for <buildroot@buildroot.org>; Sun,  3 Apr 2022 20:15:36 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:314c:79b0:cf44:9021])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id AEBCD13F84C;
 Sun,  3 Apr 2022 22:15:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1649016934;
 bh=4PaROxRwQUYY15rjvxSv6psUUpmtNmO55A42Z2ny+9w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Pycz7iKPLIBT30KKdf1CLZOYPz7/droKlPhKSugblnrco5JyKov5JN5MNd6gfRgGg
 Ac8LTGIncecJcuS4UDjpXmGNHCkHoElRjHcG7ymhl4aFAi+KZigDCTUsbzJGEJMlC4
 QH4OwICcpX33m8bmY2+Fkw/cV6935Y7pAQsq1/+7Xmw4mdbo1efSbwB1ToFnq38+4Q
 4z6y6vy+of1wsAvduF3uEKdeWVk9N7eJiy1vsAz3RWL8bpAxgMlEAp8E93KYrUAmex
 IkfHFJirjCKkbQE1a0/WpmOCvzsF+clwp89gdDUczYatkA+SQK7sesAUUpkjeTsO6q
 hMjV84JH8VFgg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 03 Apr 2022 22:15:30 +0200
Date: Sun, 3 Apr 2022 22:15:30 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220403201530.GB2354230@scaer>
References: <20220403185306.928833-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220403185306.928833-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/fetchmail: fix build with
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-04-03 20:53 +0200, Fabrice Fontaine spake thusly:
> Fix the following build failure with libressl raised since bump to
> version 6.4.29 in commit ba6fd52195f2e3d0b04baae40cfe084226824d31 and
> https://gitlab.com/fetchmail/fetchmail/-/commit/340d00bf9910ed55163be26435f70baf65a64f9d:
> 
> configure: error: fetchmail cannot legally be linked against LibreSSL for lack of GPL2 clause 2b exception. See COPYING.

This sentence is incorrect. It is legally not possible to *distribute*
fetchmail when linked against LibreSSL, as the GPL conditions in that
case only trigger at the moment of distribution.

So, there should be no issue with linking fetchmail to LibreSSL for
private use without redistribution.

But: IANAL, TINLA, TTYL...

> Fixes:
>  - http://autobuild.buildroot.org/results/95ca66091efa0dafb7c4e8e8c7da1f929ef32d76
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/fetchmail/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/fetchmail/Config.in b/package/fetchmail/Config.in
> index a4bf5a7c20..1017df34b2 100644
> --- a/package/fetchmail/Config.in
> +++ b/package/fetchmail/Config.in
> @@ -3,6 +3,7 @@ config BR2_PACKAGE_FETCHMAIL
>  	depends on BR2_USE_MMU # fork()
>  	select BR2_PACKAGE_CA_CERTIFICATES
>  	select BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
>  	help
>  	  Fetchmail - the mail-retrieval daemon
>  	  Client daemon to move mail from POP and IMAP to your local
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
