Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01CABC433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 16:00:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F62B84BF5;
	Sun, 12 Dec 2021 16:00:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7Va8FulSXb5o; Sun, 12 Dec 2021 16:00:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CAD3984BE8;
	Sun, 12 Dec 2021 16:00:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 190DF1BF3EC
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 16:00:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0866484BE3
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 16:00:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NCtWy8xoFDks for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 16:00:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0DF0A84BD8
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 16:00:49 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ccde:e15f:6f40:89e5])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id DCD012003DE;
 Sun, 12 Dec 2021 17:00:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1639324848;
 bh=y8Z9JfzrwanFgLxF6dQ89wcKd/wMZo3bRvaEXLHK6B0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X5vm++BowjwOt3/73CC+Pm5Fd3cCdIAUgiqCG1l5pTE4/SKFACsNP5HYTxpRyrZvL
 3ZtUBEl/1P0HO1+6ZhMmIGXHBeeKWRgQHOmHfZMTPw5K87PxHDggGlM20OePqLiA3F
 UoHoE19VE7UVNT3ZrMxNl2KB5FfyJPWjdPa3zuHeOH1xz/FoQiCfSHCMpItsS3SVbX
 swT5a2Q/RnJHxvVtSoUMWLNiEVu4qXFoDKQmNibtLG3wDpmYVoI8JjY0lIZL/3JAS/
 YrgEAfZggIs70c71OPsnVCsKKGff9RHsNsHeyz17vs9hVpTc5/0bUyFL/ml17w4IFH
 OY7Tw37SLKKaA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 12 Dec 2021 17:00:37 +0100
Date: Sun, 12 Dec 2021 17:00:37 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20211212160037.GY2603@scaer>
References: <20211212090107.2975294-1-christian@paral.in>
 <a230c701-8409-71bc-bb41-e48627160adc@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a230c701-8409-71bc-bb41-e48627160adc@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/go: security bump to 1.17.5
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
Cc: Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Christian, All,

On 2021-12-12 16:13 +0100, Arnout Vandecappelle spake thusly:
> 
> 
> On 12/12/2021 10:01, Christian Stewart via buildroot wrote:
> >go1.17.4 (released 2021-12-02) includes fixes to the compiler, linker, runtime,
> >and the go/types, net/http, and time packages.
> >
> >go1.17.5 (released 2021-12-09) includes security fixes to the syscall and
> >net/http packages:
> >
> >  - CVE-2021-44716
> >  - CVE-2021-44717
> >
> >https://go.dev/doc/devel/release#go1.17
> >
> >Signed-off-by: Christian Stewart <christian@paral.in>
> 
>  Applied to master, thanks.

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
> >  package/go/go.hash | 2 +-
> >  package/go/go.mk   | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> >diff --git a/package/go/go.hash b/package/go/go.hash
> >index 9031c33d8a..39f8226aae 100644
> >--- a/package/go/go.hash
> >+++ b/package/go/go.hash
> >@@ -1,3 +1,3 @@
> >  # From https://golang.org/dl/
> >-sha256  705c64251e5b25d5d55ede1039c6aa22bea40a7a931d14c370339853643c3df0  go1.17.3.src.tar.gz
> >+sha256  3defb9a09bed042403195e872dcbc8c6fae1485963332279668ec52e80a95a2d  go1.17.5.src.tar.gz
> >  sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
> >diff --git a/package/go/go.mk b/package/go/go.mk
> >index 59177e54db..0d9ceab2bb 100644
> >--- a/package/go/go.mk
> >+++ b/package/go/go.mk
> >@@ -4,7 +4,7 @@
> >  #
> >  ################################################################################
> >-GO_VERSION = 1.17.3
> >+GO_VERSION = 1.17.5
> >  GO_SITE = https://storage.googleapis.com/golang
> >  GO_SOURCE = go$(GO_VERSION).src.tar.gz
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
