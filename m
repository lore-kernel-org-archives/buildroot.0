Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5921E606A31D
	for <buildroot@archiver.kernel.org>; Sun, 15 Nov 2026 18:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=HrBLDdRo
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2AB6B6067A;
	Sun, 15 Nov 2026 18:50:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JbnTx1WV07Yr; Sun, 15 Nov 2026 18:50:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org BA927605FF
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794768646;
	b=QI05ks3xcs4AZY/5bBy5GSnQccNx1Vsx4fjGYDNq9ILshUVzsdKMti7EtaCetakzRFPe
	 1hofOAdGNNM/NMPIU7X+UlDB0n57PKCBxtdhaCpJ5KqgeSVjv5AwWOoIphp8Nm03fIjRH
	 gobXnp/02H5BSnwX/jXCX0IPnqA1SLLqltnvaKDWAQBZf7XSP/AynJbO31bFp3CDpVYg7
	 ABSqcSvYiGqqia74CqGYH1owMyN/ij6EwXeN9hOVNRu9bYLVYGqIXGL2PQzwE6pcozg1Z
	 4Fh8XraCOce71f+EL2fZH2nhYBtYeSff7vs3q7DoklB8wDyKev4qhUgiRR2dPuW3+VQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794768646;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Cc:In-Reply-To:References:User-Agent:Date:Message-ID:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Oof/98QiT+nz9uZAWw0Pzwf4g9Nkvske7971MH/xBV0=;
	b=nbkqpEWRMzAdTOnwI902Vd6zX8GkfPTQJbXhqHThlE3FJVpo6cR7oD6ad5GHuUXxpOxS
	 TEsm5iHhu7/72MQ1e6c1T3SwqadyU/WzdEZPwQGHjBrwcXQJSz9KuqIfk8E75SMQKDR26
	 6lL2IbpyCXBmvBHWYzMSjBlphPjRdbybVCqh7UYwR0NXJTgXAGtcaAcWrxiMHKy7l9BTj
	 ZRedfi7uVezys46NqldwcV4pjavBv+oI9KosUE/PMAUQDOVJJQbaeC5LufZhFJZ/blfrN
	 d3HegohHhea0EzEnoNbuH3Cf5S8IduYJtV+t0LULXmBXQ6WGRUlOux42RXVFPeb8qwQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794768646;
	bh=Oof/98QiT+nz9uZAWw0Pzwf4g9Nkvske7971MH/xBV0=;
	h=To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HrBLDdRoih1FPxlVq0fO3hgaEABMpa62oRXPjhteTTjoKBhNmW4m/cB9URTUF6+qq
	 URrLcqrMfvaR9kWhdUDmrCMaGG1OGQQNDM6XFJOKyn8tdbzO9WjnhGGNcuJjrLmh6N
	 Z4Z8BnzttgfWTqdNuCtAPDz2MjCs4RRLm8zpRp6obwPL5olUYbJwKWb+4k6nEl11Z+
	 s1tbMCmRZ3HX8Oj/t7C5GxTY2d7qmpDcvaAvbPtxzC76LEd/Qhf2CYsRMgC2Qg7fsw
	 34VU9yAxD95hqoA585201zx9bEVCuNopZQ56+nHmHb4xZjgXi+hPyrmfC6s3sd0wVl
	 bl/FeJPEXdxeQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA927605FF;
	Sun, 15 Nov 2026 18:50:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A0ED1E7
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 18:50:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 58ECD40623
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 18:50:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1-38BO_3lP0T for <buildroot@buildroot.org>;
 Sun, 15 Nov 2026 18:50:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1234B405E8
Received-SPF: Permerror (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
Received: from mail.tkos.co.il (mail.tkos.co.il [84.110.109.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1234B405E8
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 18:50:43 +0000 (UTC)
Received: from localhost (unknown [10.0.8.3])
 by mail.tkos.co.il (Postfix) with ESMTP id 533164409B0;
 Sun, 15 Nov 2026 20:48:42 +0200 (IST)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20261115174621.3986836-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sun, 15 Nov 2026 18:46:21 +0100")
References: <20261115174621.3986836-1-bernd@kuhls.net>
User-Agent: mu4e 1.14.2; emacs 30.2
Date: Sun, 15 Nov 2026 20:50:39 +0200
Message-ID: <877biedj40.fsf@tarshish>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/strace: add optional dependency
 to ncurses
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Bernd,

Thanks for the patch.

One question below.

On Sun, Nov 15 2026, Bernd Kuhls wrote:
> Buildroot commit aa5e3eec6384cb73d902a4de3fffc279683ea5a5 bumped the
> package to 7.0 which includes upstream commit
> https://github.com/strace/strace/commit/19642150d613312dc4bed27695a83320dcd5133e
> that adds optional support for ncurses.
>
> There is no configure option to disable ncurses support so we need to
> use ac_cv_search_tgetnum=no.
>
> Configure during runtime test finds ncurses:
> checking for termcap.h... yes
> checking for library containing tgetnum... -lncurses

Do you have an idea how this symbol test found ncurses in CI test?

baruch

> Configure log with this patch:
> checking for termcap.h... yes
> checking for library containing tgetnum... (cached) no
>
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/18033158691
>
> [BRTEST# strace --version
> strace: error while loading shared libraries: libncurses.so.6: cannot
>  open shared object file: No such file or directory
>
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/strace/strace.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/package/strace/strace.mk b/package/strace/strace.mk
> index 8eadb7eba4..97f2ddb6e5 100644
> --- a/package/strace/strace.mk
> +++ b/package/strace/strace.mk
> @@ -19,6 +19,12 @@ else
>  STRACE_CONF_OPTS += --without-libunwind
>  endif
>  
> +ifeq ($(BR2_PACKAGE_NCURSES),y)
> +STRACE_DEPENDENCIES += ncurses
> +else
> +STRACE_CONF_OPTS += ac_cv_search_tgetnum=no
> +endif
> +
>  # Demangling symbols in stack trace needs libunwind and libiberty.
>  ifeq ($(BR2_PACKAGE_BINUTILS)$(BR2_PACKAGE_LIBUNWIND),yy)
>  STRACE_DEPENDENCIES += binutils

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
