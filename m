Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA6FAECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 19:38:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5DA7C404A9;
	Sun, 30 Oct 2022 19:38:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5DA7C404A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 71EEj82TizEm; Sun, 30 Oct 2022 19:38:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6CBCB401AD;
	Sun, 30 Oct 2022 19:38:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6CBCB401AD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2674E1BF2A1
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 19:38:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0159681288
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 19:38:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0159681288
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AVwnjJNEhxVd for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 19:38:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0AB7481286
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0AB7481286
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 19:38:27 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:afdc:c5f1:f1be:8b47])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 49E41B00535;
 Sun, 30 Oct 2022 20:38:23 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 30 Oct 2022 20:38:23 +0100
Date: Sun, 30 Oct 2022 20:38:23 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20221030193822.GE1058960@scaer>
References: <20221026125836.3910730-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221026125836.3910730-1-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1667158706;
 bh=i2GtD1mb/jTbVc6lw6KKCRYfX1bDzXkQQBR6Gkzt9us=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X3dtql6v7lgoyN847Z/r2DHNyMRopnaLh2j27D1wW7A0LRtkepN3RIuBBMCsjd9bP
 LC3PxJwpqjqy8ZyHEmThKstQhBZkz8KzyoviuQQF1/xsBt3S3SwDiTqwAQxzYsWOJW
 p9zAB+S/cs74E8HaPwYkXtWo2pEQziEDHvXXoN9Skpt+pHSx0xH94ZgfRaE7nF0/DF
 pUqNTeuHp8DHsmwSqRMVIFGDmv0+kZoldeNTTN7KVO98je4yZUfNgptqe1OTWYyntY
 q6F0kcTpPmHHNE4V9jhGJ9/cOa4JqSzepKKitpqFqMGNEHmro1eqV/PEbyXxW6BuZB
 U9pDoZqQV/HPg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=X3dtql6v
Subject: Re: [Buildroot] [PATCH] package/musl: fixup the dynamic loader
 symlink
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
Cc: hello.skyclo@gmail.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2022-10-26 14:58 +0200, Thomas Petazzoni via buildroot spake thusly:
> The musl Makefile installs the dynamic loader as a symlink to libc.so
> with the following rule:
> 
> $(DESTDIR)$(LDSO_PATHNAME): $(DESTDIR)$(libdir)/libc.so
>         $(INSTALL) -D -l $(libdir)/libc.so $@ || true
> 
> While it works, the drawback is that ld-musl-<arch>.so ends up being a
> symlink to /lib/libc.so. While it works on the target, it means we
> have a broken symlink in $(STAGING_DIR) and $(TARGET_DIR) as
> /lib/libc.so doesn't make sense on the build machine. This generally
> doesn't cause any problem *except* when we tell Qemu to use
> $(STAGING_DIR) as the library directory when running target programs
> through the Qemu user emulation mode. This is for example node inside
> the NodeJS build. Due to this broken symlink, Qemu can't find libc.so
> that is pointed to be the dynamic loader symlink causing this build
> error:
> 
> qemu-arm: Could not open '/lib/ld-musl-armhf.so.1': No such file or directory
> 
> Since this is not really a bug in the musl build system, we address
> this issue by overriding the symlink to be a relative path. The
> dynamic loader is always installed in /lib, and libc.so is also always
> installed in /lib because we pass libdir=/lib when configuring
> musl. So we can simply have a ld-musl* -> libc.so symbolic link. We
> use ld-musl* as a wildcard so that we don't need to have extra logic
> to determine the exact name of the dynamic loader symlink, and simply
> override the one that exists.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/9ff23f2e3c97e9af410617de3e7376f9d45a7d63/
>   https://bugs.busybox.net/show_bug.cgi?id=15061
> 
> Cc: hello.skyclo@gmail.com
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, after adding a summary of the explanations you
provided Yann about the external toolchain case. Thanks.

Regards,
Yann E. MORIN.

> ---
>  package/musl/musl.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/musl/musl.mk b/package/musl/musl.mk
> index 44c79da6f7..30c3c2fbc0 100644
> --- a/package/musl/musl.mk
> +++ b/package/musl/musl.mk
> @@ -60,12 +60,14 @@ endef
>  define MUSL_INSTALL_STAGING_CMDS
>  	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
>  		DESTDIR=$(STAGING_DIR) install-libs install-tools install-headers
> +	ln -sf libc.so $(STAGING_DIR)/lib/ld-musl*
>  endef
>  
>  define MUSL_INSTALL_TARGET_CMDS
>  	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
>  		DESTDIR=$(TARGET_DIR) install-libs
>  	$(RM) $(addprefix $(TARGET_DIR)/lib/,crt1.o crtn.o crti.o rcrt1.o Scrt1.o)
> +	ln -sf libc.so $(TARGET_DIR)/lib/ld-musl*
>  endef
>  
>  $(eval $(generic-package))
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
