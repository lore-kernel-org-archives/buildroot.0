Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B3A9ECAAD3
	for <buildroot@archiver.kernel.org>; Wed,  7 Sep 2022 07:01:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE4504077D;
	Wed,  7 Sep 2022 07:01:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE4504077D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 81H1akmSO9C6; Wed,  7 Sep 2022 07:01:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67AF940492;
	Wed,  7 Sep 2022 07:01:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67AF940492
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ECDD81BF957
 for <buildroot@lists.busybox.net>; Wed,  7 Sep 2022 07:01:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D58D640393
 for <buildroot@lists.busybox.net>; Wed,  7 Sep 2022 07:01:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D58D640393
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JANG17bNbsHg for <buildroot@lists.busybox.net>;
 Wed,  7 Sep 2022 07:01:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D68B40328
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7D68B40328
 for <buildroot@buildroot.org>; Wed,  7 Sep 2022 07:01:49 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:f72e:cac9:64c4:382d])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id EBF0F13F892;
 Wed,  7 Sep 2022 09:01:42 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 07 Sep 2022 09:01:42 +0200
Date: Wed, 7 Sep 2022 09:01:42 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Christian Stewart <christian@paral.in>
Message-ID: <20220907070142.GE1490660@scaer>
References: <20220907052157.156275-1-christian@paral.in>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220907052157.156275-1-christian@paral.in>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1662534106;
 bh=qXF6u3DlraBPU4z4KcWGrNob8GYrfoiQS1etnHNzBvY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FHrPx4NLCFJREug+aDXeVkcv8Eo9qXcqdXxv1gw2QIzw4fI5G3t2thvSVMm8RlF6x
 k36AbbomnhlXdipSjVgIyugYPM3noDl1JJe9kOM0o43lstntigqI6giUKjF708p796
 lWsPPnUlVmrtXrfkACLtKZ27Tvm7Oh/Ywb7fCX0jxH+sTzDCgQV2z/muhOFbq1fY8b
 SIveYn+PQGpGShpFzTQAbwzSa+vr4y/TV55l9uPp6OYJVIsELJv+clx4CL7dtu4XE/
 wditjN3+Hv1oVTf0o8XxOm8E4Qx7h+B1URL0bo23Ckosthq0YbCSQwW7A0eofNnlIw
 l4gfme2gLORgw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FHrPx4NL
Subject: Re: [Buildroot] [PATCH-NEXT v1 1/1] package/go: security bump to
 version 1.19.1
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Christian, All,

On 2022-09-06 22:21 -0700, Christian Stewart via buildroot spake thusly:
> go1.19.1 includes security fixes to the net/http and net/url packages, as well
> as bug fixes to the compiler, the go command, the pprof command, the linker, the
> runtime, and the crypto/tls and crypto/x509 packages.
> 
> https://github.com/golang/go/issues?q=milestone%3AGo1.19.1+label%3ACherryPickApproved
> 
> Signed-off-by: Christian Stewart <christian@paral.in>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/go/go.hash | 2 +-
>  package/go/go.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/go/go.hash b/package/go/go.hash
> index 2b877145e9..657475adef 100644
> --- a/package/go/go.hash
> +++ b/package/go/go.hash
> @@ -1,3 +1,3 @@
>  # From https://go.dev/dl
> -sha256  9419cc70dc5a2523f29a77053cafff658ed21ef3561d9b6b020280ebceab28b9  go1.19.src.tar.gz
> +sha256  27871baa490f3401414ad793fba49086f6c855b1c584385ed7771e1204c7e179  go1.19.1.src.tar.gz
>  sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
> diff --git a/package/go/go.mk b/package/go/go.mk
> index 2220953e55..9f0fbbde00 100644
> --- a/package/go/go.mk
> +++ b/package/go/go.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -GO_VERSION = 1.19
> +GO_VERSION = 1.19.1
>  GO_SITE = https://storage.googleapis.com/golang
>  GO_SOURCE = go$(GO_VERSION).src.tar.gz
>  
> -- 
> 2.37.3
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
