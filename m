Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 493EFC433F5
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 09:49:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BCB6F4053C;
	Sat, 15 Jan 2022 09:49:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xxKWU-yiTU6y; Sat, 15 Jan 2022 09:49:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ACBE14010E;
	Sat, 15 Jan 2022 09:49:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 67BC61BF34B
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 09:49:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 511F782948
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 09:49:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bwn8LKdRy2H0 for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 09:49:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5BB278291C
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 09:49:31 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:edb9:18:17ad:29d4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 3BB8019F5A8;
 Sat, 15 Jan 2022 10:49:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1642240168;
 bh=m4qFpjqgdK6iGKXsj+5Z6izxQlqP1WVwkqmi7H4sbCw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tyzX9lrautuRdDBwEHThvR66KldcWt/KrAvGLz94U/DJ/wdFtSFs6MeA9dOwphm7r
 NrMjCxb/CYHfVoo2k+I5lWevdhwDBXXUkhhhLOfVMbeas3xQywu28mDVEZves3I+V/
 hHbZZV/G0Z7tBfvAYl8Fw9/5/cE51bzLEHScaEQr2hBD77bGDRAzK4Peys+JAfDYlI
 ih6O95kv2GXJi5QAU8dWYtjKulORtSNni/ujBX5bw9MWjtvAa3AoMFjBDhNKREDnky
 KWqohlmFAF/7Ag9lcNof0SydzRewqywEkaGQ9xVpMbcg+KqshkN+QWScF/B0Hxyu6a
 kisSLFbWcC+iA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 15 Jan 2022 10:49:25 +0100
Date: Sat, 15 Jan 2022 10:49:25 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220115094925.GF1945846@scaer>
References: <20220114171847.634174-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220114171847.634174-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/boost: enable system on host
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

On 2022-01-14 18:18 +0100, Fabrice Fontaine spake thusly:
> boost system (which provides boost asio) is needed by host-riscv-isa-sim
> since its addition in commit ea033cecf990ed3f86619647523a9ad2ccb09adb:
> 
> configure: error: Could not find a version of the Boost::Asio library!
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/6c33a66386ab2171454d8ea8c1bd17a5582e21dd
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/boost/boost.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/boost/boost.mk b/package/boost/boost.mk
> index 6d1046e9a2..2d2a8fb311 100644
> --- a/package/boost/boost.mk
> +++ b/package/boost/boost.mk
> @@ -17,7 +17,7 @@ HOST_BOOST_FLAGS = --without-icu --with-toolset=gcc \
>  	--without-libraries=$(subst $(space),$(comma),atomic chrono context \
>  	contract container coroutine date_time exception fiber filesystem graph \
>  	graph_parallel iostreams json locale log math mpi nowide program_options \
> -	python random serialization stacktrace system test thread timer \
> +	python random serialization stacktrace test thread timer \
>  	type_erasure wave)

I was wondering why we need to disable those, and the original commit
log is not very explicit about why this is so (429ffbd2253 boost: add
host variant), and the comment is not very helpful either...

So I did a test: remove all those exclusion (just exclude python [0]),
and build just host-boost (it has no dependency):

    master      : 54s
    no-exclusion: 2min 38s

So yes, this is a big increase. But considering that we have no way for
host packages to express dependencies on Boost features, I wonder if we
should not just build the whole stuff. For example, packages in a
br2-external have no way to say so...

Anyway, in the meantime: applied to master, thanks.

[0] building the Boost python module would require the python development
    files be installed on the host, or that we depend on host-python{,3},
    neither of which are acceptable

Regards,
Yann E. MORIN.

>  BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_ATOMIC),,atomic)
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
