Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30DD7C46CD2
	for <buildroot@archiver.kernel.org>; Sat, 27 Jan 2024 20:09:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0BFA8322E;
	Sat, 27 Jan 2024 20:09:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0BFA8322E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y0Ss0i1Dl3om; Sat, 27 Jan 2024 20:09:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F240B827D8;
	Sat, 27 Jan 2024 20:09:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F240B827D8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5040A1BF280
 for <buildroot@lists.busybox.net>; Sat, 27 Jan 2024 20:09:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2839382D04
 for <buildroot@lists.busybox.net>; Sat, 27 Jan 2024 20:09:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2839382D04
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x__A052om-hG for <buildroot@lists.busybox.net>;
 Sat, 27 Jan 2024 20:09:15 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ED38C826A8
 for <buildroot@buildroot.org>; Sat, 27 Jan 2024 20:09:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED38C826A8
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 3AE4E13F81D;
 Sat, 27 Jan 2024 21:09:11 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 27 Jan 2024 21:09:10 +0100
Date: Sat, 27 Jan 2024 21:09:10 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <ZbVi5sy69XqopvaT@landeda>
References: <20240126093441.2130693-1-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240126093441.2130693-1-peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1706386153;
 bh=Kqt+LLZwXXq1EvF/K7+qbR3uhPnTZIva/iOLTTVZ9w0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f5/rczhhSphEkFhU6oL5/Ae97ANCHc7FWMugJ7gKH1m/Iw16Mr/T5/tdRt3CeSrKn
 0UBrTP9vSqoE6vG3N83YrEzfoU3Wl8CpiwAZoqeL6lBz7u5KXCj/aI7Vgg5tIYS9ck
 4C+JO5VLmC/ij+oYgmYVtyO505c/AKPsMjl8CdlcDfdSC3qBYDtS7oJ+i8fjJg5jI6
 XiuXIthmC82kRSZQL0JGWjIXtYLlgFFUzCdY0UW3Od1NtLH+ktuCkC39a2FCqMaq6e
 h2bUn9B7QVli5bzuzjO+53+UmrGk0CZ4SrMRUzoonQhr2KEO5GE/C/w8yEDiuuSCf1
 9Oce+qgsZVwTA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=f5/rczhh
Subject: Re: [Buildroot] [PATCH] package/environment-setup: do not export
 GIT_DIR
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

Peter, All,

On 2024-01-26 10:34 +0100, Peter Korsgaard spake thusly:
> Commit c07aafa08792 (package/Makefile.in: set GIT_DIR=.  in {HOST,
> TARGET}_MAKE_ENV) added GIT_DIR=.  to TARGET_MAKE_ENV (which is included in
> TARGET_CONFIGURE_OPTS) to work around issues with packages getting confused
> when building in a subdir of the Buildroot git repo.
> 
> This unfortunately also causes git commands to fail when
> output/host/environment-setup is sourced:
> 
> git status
> fatal: not a git repository: '.'
> 
> So strip GIT_DIR= from TARGET_CONFIGURE_OPTS when generating
> environment-setup.
> 
> Reported-by: Mircea Gliga <gliga.mircea@gmail.com>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/environment-setup/environment-setup.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/environment-setup/environment-setup.mk b/package/environment-setup/environment-setup.mk
> index 29ec5a9a95..069ee25f9f 100644
> --- a/package/environment-setup/environment-setup.mk
> +++ b/package/environment-setup/environment-setup.mk
> @@ -8,7 +8,7 @@ ENVIRONMENT_SETUP_FILE = $(HOST_DIR)/environment-setup
>  
>  define HOST_ENVIRONMENT_SETUP_INSTALL_CMDS
>  	cp package/environment-setup/environment-setup $(ENVIRONMENT_SETUP_FILE)
> -	for var in $(TARGET_CONFIGURE_OPTS); do \
> +	for var in $(filter-out GIT_DIR=%,$(TARGET_CONFIGURE_OPTS)); do \
>  		printf "export \"$$var\"\n" >> $(ENVIRONMENT_SETUP_FILE); \
>  	done
>  	printf "export \"ARCH=$(NORMALIZED_ARCH)\"\n" >> $(ENVIRONMENT_SETUP_FILE)
> -- 
> 2.39.2
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
