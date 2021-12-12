Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C362DC433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 16:00:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6860160E97;
	Sun, 12 Dec 2021 16:00:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WvUpsb_btngO; Sun, 12 Dec 2021 16:00:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B340760E91;
	Sun, 12 Dec 2021 16:00:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A58EC1BF3EC
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 16:00:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8DBE14061F
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 16:00:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wxgw3RcgKhN9 for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 16:00:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B1A78403C4
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 16:00:24 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ccde:e15f:6f40:89e5])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id E416620036C;
 Sun, 12 Dec 2021 17:00:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1639324823;
 bh=tKEd59jv7EBfJPnQU8wU60q+H0B9ZJ8ubrvyQ9e2+/8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tIOUNkOmtL3H9XyGEbnxG0R6cEuwpCUVczPhFup3/8w1GOtcQ3XXKzAw3W6beeCsQ
 0GFS6PWKnwGLx2X03HJoUlC8zdaku5rwdYLwXW6u/TRJvzLDYdp01jKmolMzK1cpcv
 CEKwhocVUOptHMVzQqPTlT3UZ7b60mpsIymgKYc4ZP1daXs1gP9bgjU7/ewU5n0hqv
 qdH6h+2hM16wOLt2sK3c1CCllnK31F3hJc3MIY+8/IV/I6sL9OzSsUPT2EnsrE0h0T
 vk15tbMO0I7estY1u/n6ZALxvR5P9HsP7W1W1KKoVVWp1JPHPkF4qHDXgHSjNRCH8v
 lsIo9GhVdlW3A==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 12 Dec 2021 17:00:16 +0100
Date: Sun, 12 Dec 2021 17:00:16 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20211212160016.GX2603@scaer>
References: <20211212084857.127023-1-bernd.kuhls@t-online.de>
 <cb7842ff-b3a0-c115-6078-98c012a65d59@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cb7842ff-b3a0-c115-6078-98c012a65d59@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/2] package/x11r7/xapp_xauth: bump version
 to 1.1.1
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

Bernd, All,

On 2021-12-12 16:12 +0100, Arnout Vandecappelle spake thusly:
> 
> 
> On 12/12/2021 09:48, Bernd Kuhls wrote:
> >Removed md5 and sha1 license hashes.
> >
> >Release notes:
> >https://lists.x.org/archives/xorg-announce/2021-November/003118.html
> >
> >Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> 
>  Both applied to master, thanks.

Arnout and I stepped on each other's toe when applying, and Arnout ran
away before he got the opportunity to push the patches he applied. So I
did.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> 
>  Regards,
>  Arnout
> 
> >---
> >  package/x11r7/xapp_xauth/xapp_xauth.hash | 9 ++++-----
> >  package/x11r7/xapp_xauth/xapp_xauth.mk   | 2 +-
> >  2 files changed, 5 insertions(+), 6 deletions(-)
> >
> >diff --git a/package/x11r7/xapp_xauth/xapp_xauth.hash b/package/x11r7/xapp_xauth/xapp_xauth.hash
> >index 0251c083a7..22ea4cadfd 100644
> >--- a/package/x11r7/xapp_xauth/xapp_xauth.hash
> >+++ b/package/x11r7/xapp_xauth/xapp_xauth.hash
> >@@ -1,7 +1,6 @@
> >-# From https://lists.x.org/archives/xorg-announce/2019-July/003005.html
> >-md5 e50587c1bb832aafd1a19d91a0890a0b  xauth-1.1.tar.bz2
> >-sha1 16180e36d75a23cb182cb91e78f24273f1a63967  xauth-1.1.tar.bz2
> >-sha256 6d1dd1b79dd185107c5b0fdd22d1d791ad749ad6e288d0cdf80964c4ffa7530c  xauth-1.1.tar.bz2
> >-sha512 b6ecd59a853a491ef45bf8cfbff63bed36645f81cb79ae9d18458b57f7502bccf92f0d979d3337578518646f680ad379e67b1dac15a927cbb11372733e7a3a0c  xauth-1.1.tar.bz2
> >+# From https://lists.x.org/archives/xorg-announce/2021-November/003118.html
> >+sha256  164ea0a29137b284a47b886ef2affcb0a74733bf3aad04f9b106b1a6c82ebd92  xauth-1.1.1.tar.bz2
> >+sha512  998c3158378fff50d368959c29335173b8d98e02591cb3d7b2f9534b5a44b19deb4cb7da9bf291ca5a37f69f833d72839b2c6611723306d10c1b4968ae4d4120  xauth-1.1.1.tar.bz2
> >+
> >  # Locally computed
> >  sha256 dcdf5fa36a652efbe61a21def1301739b0010334ae3f049f1cff433221a8c7a5  COPYING
> >diff --git a/package/x11r7/xapp_xauth/xapp_xauth.mk b/package/x11r7/xapp_xauth/xapp_xauth.mk
> >index cd900f0055..64b064d3bd 100644
> >--- a/package/x11r7/xapp_xauth/xapp_xauth.mk
> >+++ b/package/x11r7/xapp_xauth/xapp_xauth.mk
> >@@ -4,7 +4,7 @@
> >  #
> >  ################################################################################
> >-XAPP_XAUTH_VERSION = 1.1
> >+XAPP_XAUTH_VERSION = 1.1.1
> >  XAPP_XAUTH_SOURCE = xauth-$(XAPP_XAUTH_VERSION).tar.bz2
> >  XAPP_XAUTH_SITE = http://xorg.freedesktop.org/releases/individual/app
> >  XAPP_XAUTH_LICENSE = MIT
> >
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
