Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1223C433EF
	for <buildroot@archiver.kernel.org>; Thu, 27 Jan 2022 21:18:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 586CB8141C;
	Thu, 27 Jan 2022 21:18:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dKmLBuB95nV0; Thu, 27 Jan 2022 21:18:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9BEB081255;
	Thu, 27 Jan 2022 21:18:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7FC081BF369
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 21:18:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6DB13416F6
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 21:18:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uOwq1E1glwQ2 for <buildroot@lists.busybox.net>;
 Thu, 27 Jan 2022 21:18:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 41B8F416F5
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 21:18:25 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:cc8e:5bc6:13d0:52a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 94BA720039E;
 Thu, 27 Jan 2022 22:18:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1643318303;
 bh=eNHTpkWNtn0MtHRJspKQsxmSuEKdI74ISnizg4Q/+18=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Dn65vHrMISXl6yFG2wipTeGo9fPTbuyL++UfTirHuGS1pOv42xaWBXSTpba8H1ZYo
 oQKnMVeagYAJYgqfTcAFydLH4hS/Uk0alEt2PGw8DsQ7ClZpeht2cUvAk5xsHoSiYe
 B6TTj2TGMSulcAkKFxkeU6ajViQ3tt8jq+vedZGG8FNU55It/tG7cDDd+kXBD/1Ln+
 eHm5FB9xXCPjfD2kj8jHdHqyJj5VjWo4ZqEcfhx2jA9RnE6AyMzBQms5yudhD7R6F4
 eEo3TP8lSNv9aZN1/CZWwNZN+RdLzDjkCs1zcq/R4GP4kQO2vERa7x3NXPg64o8c8i
 tdtf7xlD2JPlQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 27 Jan 2022 22:18:19 +0100
Date: Thu, 27 Jan 2022 22:18:19 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Jonathan Borne <jborne@kalray.eu>
Message-ID: <20220127211819.GR457876@scaer>
References: <20220127135339.25430-1-jborne@kalray.eu>
 <20220127135339.25430-2-jborne@kalray.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220127135339.25430-2-jborne@kalray.eu>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/binutils: remove libiberty from
 target install
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
Cc: ysionneau@kalray.eu, jmaselbas@kalray.eu, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Jonathan, All,

Thanks for this new iteration. :-)

On 2022-01-27 14:53 +0100, Jonathan Borne via buildroot spake thusly:
> In BINUTILS_INSTALL_TARGET_CMDS, libiberty is installed
> to STAGING_DIR
> 
> This is not necessary since libiberty is already
> unconditionally installed to staging in
> BINUTILS_INSTALL_STAGING_CMDS. Furthermore the presence
> of STAGING_DIR path in TARGET_CMDS is confusing.
> 
> Moreover libiberty is static only. Static libraries
> are only used at build time, not at run time so
> we do not want to install libiberty on target.
> 
> This commit removes the unnecessary libiberty
> install in TARGET_CMDS and add a comment to clarify
> why we do not see libiberty installed on target.

I've slightly reworded the commit log, and rewrapped it closer to the
usual 72-char width.

> Signed-off-by: Jonathan Borne <jborne@kalray.eu>
> ---
>  package/binutils/binutils.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
> index 13f61be035..32ca70d325 100644
> --- a/package/binutils/binutils.mk
> +++ b/package/binutils/binutils.mk
> @@ -95,6 +95,8 @@ BINUTILS_MAKE_ENV = $(TARGET_CONFIGURE_ARGS)
>  
>  # We just want libbfd, libiberty and libopcodes,
>  # not the full-blown binutils in staging
> +# Static-only libraries such as libiberty are used at buildtime in staging
> +# but are not installed to target.

I believe the comment in fact makes more sense closer to the
_ISNTALL_TARGET_CMDS, so I moved it there, and reworded it
appropriately.

Applied to master, thanks.

Regards,
Yann E. MORIN.

>  define BINUTILS_INSTALL_STAGING_CMDS
>  	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/bfd DESTDIR=$(STAGING_DIR) install
>  	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/opcodes DESTDIR=$(STAGING_DIR) install
> @@ -106,7 +108,6 @@ ifneq ($(BR2_PACKAGE_BINUTILS_TARGET),y)
>  define BINUTILS_INSTALL_TARGET_CMDS
>  	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/bfd DESTDIR=$(TARGET_DIR) install
>  	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/opcodes DESTDIR=$(TARGET_DIR) install
> -	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libiberty DESTDIR=$(STAGING_DIR) install
>  endef
>  endif
>  
> -- 
> 2.17.1
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
