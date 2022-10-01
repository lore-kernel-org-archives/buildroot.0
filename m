Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8290BC433F5
	for <buildroot@archiver.kernel.org>; Sat,  1 Oct 2022 16:30:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E782D41936;
	Sat,  1 Oct 2022 16:30:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E782D41936
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c4u5-Sh8f9tf; Sat,  1 Oct 2022 16:30:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C8DB41931;
	Sat,  1 Oct 2022 16:30:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C8DB41931
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3B66F1BF59C
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 16:30:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2429F608D8
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 16:30:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2429F608D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A0ijRLS_p_hf for <buildroot@lists.busybox.net>;
 Sat,  1 Oct 2022 16:30:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28E11605AC
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 28E11605AC
 for <buildroot@buildroot.org>; Sat,  1 Oct 2022 16:30:18 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9961:1217:61e8:73cc])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 5CD0978035B;
 Sat,  1 Oct 2022 18:30:12 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 01 Oct 2022 18:30:12 +0200
Date: Sat, 1 Oct 2022 18:30:12 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20221001163012.GE30794@scaer>
References: <20220929111816.497911-1-giulio.benetti@benettiengineering.com>
 <ca88cebe-45fb-8ba3-f37d-f223c7a94a5f@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ca88cebe-45fb-8ba3-f37d-f223c7a94a5f@benettiengineering.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1664641816;
 bh=ALpCxOWwAaPBWjumu3ZhPL1VcQlpBiPLC8lLSmR95MI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MPZCjT8dyl6gOeoZjM8rFUPYmCIkZkCSB267tah2lNx1h5PE6iGd4GCgjiB5zox7e
 zkyk2oRceunRM7DUG1rG6xcFigT7olEALGdQIOe/PshKT1B1Ks099XvlFJI8opfrRx
 Pc+NjNflUgt/pY5hjWTcVww9aDAKk+kYtOeX55/Zc6c2LrcEnBtWRlZ7KfEP56RXj4
 FKDFMjjPvlId03cRWSdXURGdzSdTieK0ZunHcu9nvRa4/cOOhaSOMHX6JSfEh1QX+g
 v9CPVBGO7HP6CgVr1OJ0/rcOYesL8jUAS40MLwAVJTDu2KvKXhlPKh/lBP4bdjQSAF
 yy6G6D+yodRZw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MPZCjT8d
Subject: Re: [Buildroot] [PATCH] package/gitlab-runner: fix forcing openssl
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Giulio, All,

On 2022-09-29 13:20 +0200, Giulio Benetti spake thusly:
> Forgotten,
> 
> On 29/09/22 13:18, Giulio Benetti wrote:
> >BR2_PACKAGE_LIBOPENSSL doesn't force selecting libopenssl, to achieve this
> >we need to use BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL. So let's modify
> >accordingly and improve a bit the comment.
> >
> >Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> 
> Suggested-by: Yann E. MORIN <yann.morin.1998@free.fr>

Thanks, I added that, but as a Reported-by tag, because that's a bug
that I reported.

Regards,
Yann E. MORIN.

> -- 
> Giulio Benetti
> CEO/CTO@Benetti Engineering sas
> 
> >---
> >  package/gitlab-runner/Config.in | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >diff --git a/package/gitlab-runner/Config.in b/package/gitlab-runner/Config.in
> >index 72c2742562..bfa79ac80e 100644
> >--- a/package/gitlab-runner/Config.in
> >+++ b/package/gitlab-runner/Config.in
> >@@ -13,7 +13,7 @@ config BR2_PACKAGE_GITLAB_RUNNER
> >  	select BR2_PACKAGE_LIBCURL_CURL # runtime
> >  	select BR2_PACKAGE_LIBCURL_OPENSSL # runtime, for ca-certificates.
> >  	select BR2_PACKAGE_OPENSSL # runtime
> >-	select BR2_PACKAGE_LIBOPENSSL # runtime
> >+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL # runtime, force using libopenssl
> >  	select BR2_PACKAGE_LIBOPENSSL_BIN # runtime
> >  	select BR2_PACKAGE_TAR # runtime
> >  	help
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
