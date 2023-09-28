Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED7D9E743C0
	for <buildroot@archiver.kernel.org>; Thu, 28 Sep 2023 20:45:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A708A6150B;
	Thu, 28 Sep 2023 20:45:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A708A6150B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HFOQV75EX6wz; Thu, 28 Sep 2023 20:45:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D83DC61142;
	Thu, 28 Sep 2023 20:45:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D83DC61142
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DC80F1BF287
 for <buildroot@lists.busybox.net>; Thu, 28 Sep 2023 20:44:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B7C5740C20
 for <buildroot@lists.busybox.net>; Thu, 28 Sep 2023 20:44:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B7C5740C20
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PStx8VYnrbP7 for <buildroot@lists.busybox.net>;
 Thu, 28 Sep 2023 20:44:54 +0000 (UTC)
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 13DE440C1E
 for <buildroot@buildroot.org>; Thu, 28 Sep 2023 20:44:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13DE440C1E
Received: from ymorin.is-a-geek.org (unknown [92.184.106.19])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id A0B5E19F58A;
 Thu, 28 Sep 2023 22:44:47 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 28 Sep 2023 22:44:47 +0200
Date: Thu, 28 Sep 2023 22:44:47 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Brandon Maier <brandon.maier@collins.com>
Message-ID: <20230928204447.GC14593@scaer>
References: <20230928002728.2402-1-brandon.maier@collins.com>
 <20230928002728.2402-2-brandon.maier@collins.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230928002728.2402-2-brandon.maier@collins.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1695933892;
 bh=ZMkfUKiC8EIFYA6VOz/r5uCdDSULgaNJW+9sOArOSP0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZSsBr2GF6+z4g0ZkEmU4ReRtJIhZa9MMU8ihUPerITTYwWKYsqvQb5kq0/mzDOpVc
 GFcZ88WAquQaNSWLMdY39kJq+vWmDzPc4pINQowTqAcqWQF0jbuCt85Ll5vWFk0mZu
 G2EPDhQA2z2bEJKOmQgNwG5HMpwdudpCJKBXYt3xEc6dq1SO6HpLZTIRmkMOJCPJCg
 BXw7fd/44BX7Ft77+HyO/63/gGXgb+V4pVQO0vAedQuIoHMJ2Oe+bla9+3q55eP6rP
 dFSJfJ7A2pixM/dGTwj0EYMHV4geRoB0EVB3/Q+s0IYj+9rTnAoJnEr881MJv9g6fU
 zXWCfBzoE/kaw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ZSsBr2GF
Subject: Re: [Buildroot] [PATCH v2 2/2] unifdef: add target package
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Brandon, All,

On 2023-09-28 00:27 +0000, Brandon Maier via buildroot spake thusly:
> Signed-off-by: Brandon Maier <brandon.maier@collins.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Change v1 -> v2:
>   - Move from Misc packages to Dev packages
> ---
>  DEVELOPERS                 | 1 +
>  package/Config.in          | 1 +
>  package/unifdef/Config.in  | 9 +++++++++
>  package/unifdef/unifdef.mk | 9 +++++++++
>  4 files changed, 20 insertions(+)
>  create mode 100644 package/unifdef/Config.in
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index e8b78a8d46..defeb502ab 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -513,6 +513,7 @@ F:	package/iftop/
>  F:	package/ncdu/
>  
>  N:	Brandon Maier <brandon.maier@collins.com>
> +F:	package/unifdef/
>  F:	package/vmtouch/
>  
>  N:	Brock Williams <brock@cottonwoodcomputer.com>
> diff --git a/package/Config.in b/package/Config.in
> index e8dbadadf3..e70479059e 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -201,6 +201,7 @@ menu "Development tools"
>  	source "package/sed/Config.in"
>  	source "package/subversion/Config.in"
>  	source "package/tree/Config.in"
> +	source "package/unifdef/Config.in"
>  	source "package/yasm/Config.in"
>  endmenu
>  
> diff --git a/package/unifdef/Config.in b/package/unifdef/Config.in
> new file mode 100644
> index 0000000000..a1a44d9f5a
> --- /dev/null
> +++ b/package/unifdef/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_UNIFDEF
> +	bool "unifdef"
> +	help
> +	  The unifdef utility selectively processes conditional C
> +	  preprocessor #if and #ifdef directives. It removes from a file
> +	  both the #directives and the additional text that they
> +	  delimit, while otherwise leaving the file alone.
> +
> +	  http://dotat.at/prog/unifdef/
> diff --git a/package/unifdef/unifdef.mk b/package/unifdef/unifdef.mk
> index fd74455894..6761e32b69 100644
> --- a/package/unifdef/unifdef.mk
> +++ b/package/unifdef/unifdef.mk
> @@ -9,6 +9,14 @@ UNIFDEF_SITE = https://dotat.at/prog/unifdef
>  UNIFDEF_LICENSE = BSD-2-Clause, BSD-3-Clause
>  UNIFDEF_LICENSE_FILES = COPYING
>  
> +define UNIFDEF_BUILD_CMDS
> +	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
> +endef
> +
> +define UNIFDEF_INSTALL_TARGET_CMDS
> +	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) prefix=$(TARGET_DIR) install
> +endef
> +
>  define HOST_UNIFDEF_BUILD_CMDS
>  	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)
>  endef
> @@ -17,4 +25,5 @@ define HOST_UNIFDEF_INSTALL_CMDS
>  	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) prefix=$(HOST_DIR) install
>  endef
>  
> +$(eval $(generic-package))
>  $(eval $(host-generic-package))
> -- 
> 2.41.0
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
