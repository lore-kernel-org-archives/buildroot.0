Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BCC6C433F5
	for <buildroot@archiver.kernel.org>; Thu, 10 Feb 2022 20:48:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1124605AE;
	Thu, 10 Feb 2022 20:48:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3dVkonqWnb15; Thu, 10 Feb 2022 20:48:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40577600B4;
	Thu, 10 Feb 2022 20:48:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 80A101BF398
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 20:48:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6B01140129
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 20:48:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q5hdni-eXgJ6 for <buildroot@lists.busybox.net>;
 Thu, 10 Feb 2022 20:48:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4528F40122
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 20:48:22 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:d4e:c6ab:895c:dfc8])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 270EF13F81D;
 Thu, 10 Feb 2022 21:48:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1644526100;
 bh=kFsJiYFfUa28mzYtv7ejfKhR8BdapMvpi7RMMh9ZyG4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Dj1x43fJ2WPGbsz54zLTsHeWm/gxG84j6kNxwCboruiKS3Dw4FktRT+wFkoq9Wxqz
 Da9hZ6aHbxBYmyx9P3Qg9UA3LYYHIJMGG6YUfpbJAI/7QAeNtMFA04e0uFoe5tgxFv
 SPX2SSFiofIVUw2C1iWAdoXBrXnueXObaabUA6gKIiAz6UkcOQPN5SFnmRJe2D6Nol
 h2MV3WSNlrIixBnKBB6n+ykltndE0MKgOfqT3CfKKT39NPH2kFnx36Tld2c9AKLOEw
 PRnAgWJOCI7O6wmAQcYPLmt94zqkBCqlXcg/tMKFuy8Ymh4vgLmB2YnytWr83Fnq9g
 kPXi95DCWxYYg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 10 Feb 2022 21:48:16 +0100
Date: Thu, 10 Feb 2022 21:48:16 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220210204816.GC3752867@scaer>
References: <20220209224105.772909-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220209224105.772909-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/gtest: drop host python2 support
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
Cc: Stephan Hoffmann <sho@relinux.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2022-02-09 15:41 -0700, James Hilliard spake thusly:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Thanks for your patch. I've instead applied Peter's patch, that did
go the extra length of cleaning up now-unnecessary variables too.

Thanks! ;-)

Regards,
Yann E. MORIN.

> ---
>  package/gtest/gtest.mk | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/package/gtest/gtest.mk b/package/gtest/gtest.mk
> index 673e626c45..5bad1fb5f7 100644
> --- a/package/gtest/gtest.mk
> +++ b/package/gtest/gtest.mk
> @@ -19,13 +19,8 @@ endif
>  
>  HOST_GTEST_LICENSE = Apache-2.0
>  HOST_GTEST_LICENSE_FILES = googlemock/scripts/generator/LICENSE
> -ifeq ($(BR2_PACKAGE_PYTHON3),y)
>  HOST_GTEST_PYTHON_VERSION = $(PYTHON3_VERSION_MAJOR)
>  HOST_GTEST_DEPENDENCIES += host-python3
> -else
> -HOST_GTEST_PYTHON_VERSION = $(PYTHON_VERSION_MAJOR)
> -HOST_GTEST_DEPENDENCIES += host-python
> -endif
>  
>  HOST_GTEST_GMOCK_PYTHONPATH = \
>  	$(HOST_DIR)/lib/python$(HOST_GTEST_PYTHON_VERSION)/site-packages
> -- 
> 2.25.1
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
