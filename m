Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3014AC47DD3
	for <buildroot@archiver.kernel.org>; Sun, 21 Jan 2024 09:14:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB2AA82102;
	Sun, 21 Jan 2024 09:14:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB2AA82102
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZuHYRTrMT_vO; Sun, 21 Jan 2024 09:14:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBC6482107;
	Sun, 21 Jan 2024 09:14:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DBC6482107
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CFB801BF4E7
 for <buildroot@lists.busybox.net>; Sun, 21 Jan 2024 09:14:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A8B0F60E53
 for <buildroot@lists.busybox.net>; Sun, 21 Jan 2024 09:14:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8B0F60E53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H2OGKcJCLe9N for <buildroot@lists.busybox.net>;
 Sun, 21 Jan 2024 09:14:38 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3EFCA60E32
 for <buildroot@buildroot.org>; Sun, 21 Jan 2024 09:14:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3EFCA60E32
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 2F4A713F838;
 Sun, 21 Jan 2024 10:14:32 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 21 Jan 2024 10:14:31 +0100
Date: Sun, 21 Jan 2024 10:14:31 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <Zazgd8sRYiHBY1CB@landeda>
References: <20240117210756.265708-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240117210756.265708-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1705828475;
 bh=Y5Bt36N+bWAHewdQdy5wRfyyDCjyajuhCqMBLrwxJjY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=t+P/QKKov+bL1SH2E9v6Lh9UrKQDMGNkBssEmNjf/1yQYFN85zj5VFTSDKp9qJuRF
 F8se6gTuM8h3ofuviQKyak+Y8+pZEf2BGwzTQpqNAFr6scVQqELfmRrqsn+i33rg7/
 0oSETEk7FmhPTrAsfvtNCFKgsFgcUUA1pULeEAtFLmBdDISzTME2Dmc1muOtQFLx09
 3ASeCU3TXmb/Hw/aJp90mCyXxIGz1B3hdXjOBCqiOIzXSRcipKMHwBlSi5AM4SiQZi
 1JRSzHtv5rIZuIT9Z+OPY6ZnMBXcRtrbk3PZEDmKE70aMVNAgNn/dp86guGUkXvF7Q
 z4g4yjl/g++gQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=t+P/QKKo
Subject: Re: [Buildroot] [PATCH 1/1] package/postgresql: fix service runtime
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Julien, All,

On 2024-01-17 22:07 +0100, Julien Olivain spake thusly:
> Since commit 2a8065e "package/postgresql: bump version to 16.1", the
> postgresql service fail to start at runtime with an error:
> 
>     FATAL:  could not load library "/usr/lib/postgresql/dict_snowball.so": /usr/lib/postgresql/dict_snowball.so: undefined symbol: CurrentMemoryContext
> 
> This is due to the Posgresql autotool configure script trying to
> detect whether the toolchain linker needs --export-dynamic or not.
> This test is done with a runtime execution of a test program, and
> therefore cannot run in cross-compilation. In that case, the
> configure script assumes it is not needed. See commit [1], included
> in PostgreSQL v16.0.
> 
> This commit fixes the issue by forcing the value in _CONF_ENV. The
> package has already a Kconfig dependency on !BR2_STATIC_LIBS, so the
> value can be unconditionally set.
> 
> [1] https://git.postgresql.org/gitweb/?p=postgresql.git;a=commitdiff;h=9db49fc5bfdc0126be03f4b8986013e59d93b91d

I've added references to the ML thread upstream, with their position
that cross-compiling is not really a supoprted thing.

> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> This patch was tested on branch master at commit b200632, and also
> with patch from:
> https://patchwork.ozlabs.org/project/buildroot/patch/20240111224003.243443-1-ju.o@free.fr/
> 
> with command:
> 
>     support/testing/run-tests \
>         -d dl -o output_folder \
>         tests.package.test_postgresql
>     ...
>     OK
> ---
>  package/postgresql/postgresql.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
> index ec5b61b932..644f93d88a 100644
> --- a/package/postgresql/postgresql.mk
> +++ b/package/postgresql/postgresql.mk
> @@ -15,6 +15,7 @@ POSTGRESQL_INSTALL_STAGING = YES
>  POSTGRESQL_CONFIG_SCRIPTS = pg_config
>  POSTGRESQL_CONF_ENV = \
>  	ac_cv_type_struct_sockaddr_in6=yes \
> +	pgac_cv_prog_cc_LDFLAGS_EX_BE__Wl___export_dynamic=yes \
>  	LIBS=$(TARGET_NLS_LIBS)
>  POSTGRESQL_CONF_OPTS = --disable-rpath
>  POSTGRESQL_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
> -- 
> 2.43.0
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
