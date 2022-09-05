Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC950ECAAD5
	for <buildroot@archiver.kernel.org>; Mon,  5 Sep 2022 21:23:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6498640145;
	Mon,  5 Sep 2022 21:23:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6498640145
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tOzka55Hpyxe; Mon,  5 Sep 2022 21:23:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 780A140297;
	Mon,  5 Sep 2022 21:23:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 780A140297
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 42CA31BF3DC
 for <buildroot@lists.busybox.net>; Mon,  5 Sep 2022 21:23:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1E6C460FD2
 for <buildroot@lists.busybox.net>; Mon,  5 Sep 2022 21:23:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E6C460FD2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sf0pzeH0GO08 for <buildroot@lists.busybox.net>;
 Mon,  5 Sep 2022 21:23:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF8B9605AF
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CF8B9605AF
 for <buildroot@buildroot.org>; Mon,  5 Sep 2022 21:23:02 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:5e76:18ec:e237:5279])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 97BDEB00595;
 Mon,  5 Sep 2022 23:22:56 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 05 Sep 2022 23:22:56 +0200
Date: Mon, 5 Sep 2022 23:22:56 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220905212256.GK1490660@scaer>
References: <20220904205004.53601-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220904205004.53601-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1662412979;
 bh=3mbZoNmJdvzIb/nhDVDspTloAP42sclwNP1k60vs9jg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oupNIURuTM4rMAc97x/r5OHpDqJnxjnRRMd6QATibclwGfSz29pGhcmBB83Nw841w
 PLEsBlmm+9V6hYbxy8t9xnDZvhsBcqSYSkQUfd0F99R/oWQMQeQG/KrtKpr/NVeplA
 YnproOs0DsFds32DKq1AE2Oiz2R1Zja91XKj4cSBuqrfs4WUe7OnB0D4ToIuIIF9iA
 bFC4QCOSvymdqFlsDGrqL/8RqRmrHODh30wGbjOARSorlHU6ycy/V8R5fxOZPnfu1p
 v/9/BejHLwtvqWgBwZNRD0D58RJT8cR9IYZxnGZ7+H7Ro3GVdtqXcMWjRcUk4XhF+s
 hiKABVgUPJcvg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=oupNIURu
Subject: Re: [Buildroot] [PATCH 1/1] package/sconeserver: fix build with gcc
 4.8
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
Cc: Simon Dawson <spdawson@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-09-04 22:50 +0200, Fabrice Fontaine spake thusly:
> Fix the following build failure with gcc 4.8 raised since commit
> 8b42bbf30a914b0fd40a4518e61ac7bc511a7deb:
> 
> /home/buildroot/autobuild/run/instance-1/output-1/build/sconeserver-8d1935919a2013358993a8e9dfa992cbde56e503/http/AuthRealmDB.cpp: In member function 'virtual std::string http::AuthRealmDB::lookup_hash(const string&)':
> /home/buildroot/autobuild/run/instance-1/output-1/build/sconeserver-8d1935919a2013358993a8e9dfa992cbde56e503/http/AuthRealmDB.cpp:93:3: error: 'unique_ptr' is not a member of 'std'
>    std::unique_ptr<scx::DbQuery> query(m_db->object()->new_query(
>    ^
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/198c23f1de5cc90efe2d3b4ce053939457e003f7
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/sconeserver/sconeserver.mk | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/package/sconeserver/sconeserver.mk b/package/sconeserver/sconeserver.mk
> index d15b112801..bfbd5dc6ed 100644
> --- a/package/sconeserver/sconeserver.mk
> +++ b/package/sconeserver/sconeserver.mk
> @@ -17,14 +17,10 @@ SCONESERVER_DEPENDENCIES = \
>  # https://github.com/sconemad/sconeserver/tree/master/markdown
>  # has no cross-compile support provided by the sconeserver build system
>  SCONESERVER_CONF_OPTS += \
> +	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -std=c++11" \
>  	-DWITH_IMAGE=OFF \
>  	-DWITH_MARKDOWN=OFF
>  
> -ifeq ($(BR2_PACKAGE_LIBXML2),y)
> -# Needed to fix build failure when icu is enabled in libxml2
> -SCONESERVER_CONF_OPTS += -DCMAKE_CXX_FLAGS="-std=c++11"
> -endif
> -
>  ifeq ($(BR2_PACKAGE_OPENSSL),y)
>  SCONESERVER_DEPENDENCIES += openssl
>  SCONESERVER_CONF_OPTS += -DWITH_SSL=ON
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
