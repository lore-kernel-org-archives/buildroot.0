Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2F85CA9EC7
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 21:24:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BAAA605E4;
	Sun, 11 Oct 2026 21:24:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dEh4cvGVKLlB; Sun, 11 Oct 2026 21:24:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6F74C6060B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791753865;
	b=tScA80B4nmkLDFNdeBzWowrF9QPLhe4ViElplVN+/WN5dLXLcmQ2cIToHqnQGmc2Ij5Y
	 AGtvdzR7Eoe//kz5Olc7O99mfaYVESePUmGwfQl+JKVGtKly6FDDq2YQKSAyUOeJf2BQV
	 038eTPj7FhU+b1gp3fLmTNArsCBOZIf9vM0zo4me0ucDls9eV+8JU6Np3zQg/Xyq5Bv7X
	 8g365FHFDZUaDqFiT/oaCxJJB79tEL+yy5RtrJ7V+zijojEcKS5fitEfTlrJF1Hdutgrv
	 HJHYggYzKuMRq/3+it9ZMFo9I//3ek3WrH0VF2UL6QjHFnyFFl1KeVYWNra4SswyQng==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791753865;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:References:
	 Content-Language:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=2kwyn/zhf1LEMMrHB7xtCnYInoVcnmCWMtrPxtunUj4=;
	b=qyQ+EkuI8Lb6odY/RHUIE9eqnVTnO98f4TETmTYlALcaaYJEkFDbL5vWVyBEvkqw44oT
	 fA0oP4+rqUgGu/WYse1czYK70pmKjW+123oKlqPBYnMw7Q7jsnxsbb9BVUtNFjyv23hqI
	 pb00YqLOXVvsQRp1BEk1RNHFPR5w+XcKPirm3qC63D6PKiiP/cgiBi1Elw9kqt30RgW2I
	 Igov0hiri8RVjcOANUbPI2gvl7wekeOu6PvjYmR6psJskEHlDzCjvQeSekwkj+lL29FK+
	 wSoaUTRnrHLvjnXCneWT5OfOQrfGxtj5CN3qSgMv7tYWFWaiee76wO3ySGoqDs08mMw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791753865;
	bh=2kwyn/zhf1LEMMrHB7xtCnYInoVcnmCWMtrPxtunUj4=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=PuIKTdFbmuCQtbp4W+8bS/16p7tn72X1eiHhnBObo3O25eL5s6HGjj+QkKk+3eF5/
	 A9norPWLx1Qci78sYoW1ckFU6mKY1YIbEWsX6rSfq+hE/ojX2EwNq3td2yYZzabenB
	 M8VvsANxd4+XFzBf/xbsSOr7t5GszAPQELSnYsTk0TA92806lgJ1gYGNZkpbmg6+WM
	 pOYjwVAJTi4H8/qhKhvpba8Sfbjp8ZJoKjdtLZ5ycnIbQpzP+vRF9/mm/4HXYjElJJ
	 DyeBoMGFTf0qEqTxVeYseAbNHHW7+hgS8TmTI2Ow77l+qUvWINo+YAmi0HC/79Z/t2
	 pkENpq6bBjxVA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F74C6060B;
	Sun, 11 Oct 2026 21:24:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E81EF2E0
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 21:24:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D981980C1C
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 21:24:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rMyx-8g5BQBT for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 21:24:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1B89680C1A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791753864;
 b=aJXmFB4S3pnuLMHsqxgDVwXFsQ0IY+HnrMTqgwCxq7+C7v4CrMJ+MDXIPt/GQLItdsXz
 9fA5RqKrtain7Bsu8uP8lstEypyLy3djBCfhvCuH0La+i6hdMfliNWBCn11+9CoJ433LV
 iMKJspHyHGYvsEG+AQp6o+CtzYQ/J5R77UTJqWEbWDHe2hiwoHoSnyDiZjhxfVgG+jwY4
 V8pw3Sals8NVzofupqhCKOWufXP/Aub/W60ee72/1G7Qexptoubi/ugXc1TvEQrl//iS/
 hR6wIMBl8+XhDranF9RivfQ8YYWIXUE30KCrXKzyKTq8QhBZ4DU2697r9OQMoTDlYbw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791753864;
 h=Received-SPF:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
 User-Agent:Subject:To:References:From:Content-Language:In-Reply-To:
 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=3Cxbq3eZatzqCJ4LHrYEVpCwmkRrThjZgp6ov5dmzdM=;
 b=M6uC/zhPhsdE//zuaPchpmfQRA0DyE3pQDkIF9fDGz/FgI6z8rKQOC+DyXgK5V7nNZry
 DhVoNE44xD5TRnwntCk0af2szyed3fOr1gMTJCjvJYPzBwBIRNVAc1+xTypVDvxuIEUAC
 E7W+EmAIYQYpPz/RZWzxU5tMnirrRGZT+TaWek2tMSPsD+0duRMjcBHIMVF0RfUzVX0Nx
 RQuzdaaXl782fdihlhh9WmBsSK3VeqGuU1SuGmHyy/Sg9C5rSF8SFgNfljST/RzakJGKV
 klv2bz7VQ9Kj11RMNl86UQuqmBHjW/SN0k9W6TJelF9OeRNSlfxK4tkLdIIIcTyt7Og==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=rnout.be;
 dkim=pass header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=Xujcaxsr; 
 arc=none smtp.remote-ip=79.99.201.12
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
Received: from mail.nubo.coop (mail.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1B89680C1A
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 21:24:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 51D0CB97A0DA; Sun, 11 Oct 2026 23:24:20 +0200 (CEST)
Message-ID: <7ddf4fe5-15d2-4c02-8a42-34c132a68ce4@rnout.be>
Date: Sun, 11 Oct 2026 23:24:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Roy Kollen Svendsen <roykollensvendsen@gmail.com>, buildroot@buildroot.org
References: <20260602114732.1957638-1-roykollensvendsen@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260602114732.1957638-1-roykollensvendsen@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/readline: link host shared library
 against ncurses
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Roy,

On 02/06/2026 13:47, Roy Kollen Svendsen wrote:
> readline builds its shared library without linking the curses/termcap
> library, so termcap symbols (UP, BC, PC) are left undefined.

  We can achieve the same, I think, by setting

HOST_READLINE_CONF_OPTS = --with-curses --with-shared-termcap-library

(which is what we do on the target). That would be much simpler and more 
understandle.

  Regards,
  Arnout

> host-gdb pulls in host-readline, installing this libreadline.so into the
> host directory. buildroot runs its fakeroot finalization script with
> /bin/sh, and fakeroot puts $(HOST_DIR)/lib in LD_LIBRARY_PATH; so when
> /bin/sh is linked against readline (e.g. bash) it loads this host
> libreadline.so rather than the system one, and because UP is a data
> symbol the loader aborts before /bin/sh can start:
> 
>    /bin/sh: symbol lookup error: libreadline.so.8: undefined symbol: UP
> 
> This only happens when the host's /bin/sh links readline and host-gdb is
> enabled; otherwise the host libreadline.so is never loaded, which is why
> it is not seen on every build host.
> 
> Pass SHLIB_LIBS so readline's own build links the host shared library
> against the libncursesw that host-ncurses already provides (it carries
> the termcap symbols), making the host libreadline.so self-contained.
> Only the host library is changed: the target library is never loaded
> during the build, so it cannot break image generation.
> 
> Fixes: d98e15a3639d ("package/gdb: really fix build with GCC 15.x by using external readline")
> Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
> ---
>   package/readline/readline.mk | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/package/readline/readline.mk b/package/readline/readline.mk
> index f69cbe45e2..99d3711e7b 100644
> --- a/package/readline/readline.mk
> +++ b/package/readline/readline.mk
> @@ -30,5 +30,14 @@ define READLINE_INSTALL_INPUTRC
>   endef
>   READLINE_POST_INSTALL_TARGET_HOOKS += READLINE_INSTALL_INPUTRC
>   
> +# readline does not link its shared library against the curses/termcap
> +# library, leaving termcap symbols (UP, BC, PC) undefined. fakeroot runs
> +# its finalization script with $(HOST_DIR)/lib in LD_LIBRARY_PATH, so a
> +# readline-linked /bin/sh loads this host libreadline.so during root
> +# filesystem generation and aborts on the undefined symbols. Link it
> +# against the libncursesw that host-ncurses provides (it carries those
> +# symbols) via readline's SHLIB_LIBS.
> +HOST_READLINE_MAKE_OPTS += SHLIB_LIBS="-L$(HOST_DIR)/lib -lncursesw"
> +
>   $(eval $(autotools-package))
>   $(eval $(host-autotools-package))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
