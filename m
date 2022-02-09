Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1060C433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 08:44:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 463268135D;
	Wed,  9 Feb 2022 08:44:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WXIEcln-Jk9e; Wed,  9 Feb 2022 08:44:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4748681370;
	Wed,  9 Feb 2022 08:44:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A05061BF3A3
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 08:44:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C2B7410E7
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 08:44:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=orange.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 28niyief1V7n for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 08:44:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.66.41])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 74EBD410E0
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 08:44:10 +0000 (UTC)
Received: from opfedar03.francetelecom.fr (unknown [xx.xx.xx.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfedar22.francetelecom.fr (ESMTP service) with ESMTPS id 4Jtthm2rRLz2xwg; 
 Wed,  9 Feb 2022 09:44:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orange.com;
 s=ORANGE001; t=1644396248;
 bh=9pxjt8/x+GYdt9D7sio/0dfWXn4Hi6UJffEXr2cNLM8=;
 h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
 b=U7FlOidzt+40t8LpGyKQUIjTwQkFomYnI6HwjL3G7TciII4oh2HAKfCQV816KRvq4
 LfxRxK1JrrD8Z0Nn5y3HXYwvf4JsTTQt4DuQQhS6xQueQtnTD/mWAXO/DGvVZx0UYc
 ML5VjhHzuCpACvOSBagR68jYlf/Ps+hVCZtBm2LQfVJoE3vXQz09gCAJrnb0TxgGbn
 O6KrBnZjCo8rFxD+bYLs2tKExm7QU/4MyL3mLcS340jqRzxUoY3PyCPQQZ+80Bru29
 0nlOGbsynILHZV8p0iPqxafiWKi51DvZpQ70LDpMdAoFRr7sdztMVMG5OBEIPZqMyJ
 5bgpG6xdiPE8Q==
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Wed, 09 Feb 2022 09:44:05 +0100
Date: Wed, 9 Feb 2022 09:44:05 +0100
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Message-ID: <5856_1644396248_62037ED8_5856_45_6_20220209084405.GA3766@tl-lnx-nyma7486>
References: <cover.1644343524.git.yann.morin@orange.com>
 <61674c9d53c678f60a82c5c347147c31b9a29ba6.1644343524.git.yann.morin@orange.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <61674c9d53c678f60a82c5c347147c31b9a29ba6.1644343524.git.yann.morin@orange.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Originating-IP: [10.115.27.51]
X-ClientProxiedBy: OPE16NORMBX102.corporate.adroot.infra.ftgroup (10.115.26.3)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
Subject: Re: [Buildroot] [PATCH 3/3] package/pkg-cargo: allow building in a
 sub-directory
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All,

On 2022-02-08 19:05 +0100, yann.morin@orange.com spake thusly:
> From: "Yann E. MORIN" <yann.morin@orange.com>
> Some packages have their rust sources as a sub-directory, rather
> than at the root of the source tree.
> 
> Do like we do for autotools-package, and use the package's _SRCDIR
> rather than the top-level directory $(@D).
> 
> Additionally, in such a situation, it is more than probable that
> the Cargo.toml is also present in that sub-directory, so use that
> when vendoring the package, unless the package took extra precautions
> to specify an alternate location.
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/pkg-cargo.mk | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
> index 66bea513e0..68e15e066c 100644
> --- a/package/pkg-cargo.mk
> +++ b/package/pkg-cargo.mk
> @@ -71,6 +71,14 @@ $(2)_DOWNLOAD_DEPENDENCIES += host-rustc
>  $(2)_DOWNLOAD_POST_PROCESS = cargo
>  $(2)_DL_ENV += CARGO_HOME=$$(HOST_DIR)/share/cargo
>  
> +# If building in a sub directory, use that to find the Cargo.toml, unless
> +# the package already provided its location.
> +ifneq ($$($(2)_SUBDIR),)
> +ifneq ($$(filter BR_CARGO_MANIFEST_PATH=%,$$($(2)_DL_ENV)))
                                                       ------^
I forgot to git commit --amend to add the missing comma.

Sorry for the noise... :-(

Regards,
Yann E. MORIN.

> +$(2)_DL_ENV += BR_CARGO_MANIFEST_PATH=$$($(2)_SUBDIR)/Cargo.toml
> +endif
> +endif
> +
>  # Due to vendoring, it is pretty likely that not all licenses are
>  # listed in <pkg>_LICENSE.
>  $(2)_LICENSE += , vendored dependencies licenses probably not listed
> @@ -97,7 +105,7 @@ $(2)_LICENSE += , vendored dependencies licenses probably not listed
>  ifndef $(2)_BUILD_CMDS
>  ifeq ($(4),target)
>  define $(2)_BUILD_CMDS
> -	cd $$(@D) && \
> +	cd $$($$(PKG)_SRCDIR) && \
>  	$$(TARGET_MAKE_ENV) \
>  		$$(TARGET_CONFIGURE_OPTS) \
>  		$$(PKG_CARGO_ENV) \
> @@ -111,7 +119,7 @@ define $(2)_BUILD_CMDS
>  endef
>  else # ifeq ($(4),target)
>  define $(2)_BUILD_CMDS
> -	cd $$(@D) && \
> +	cd $$($$(PKG)_SRCDIR) && \
>  	$$(HOST_MAKE_ENV) \
>  		RUSTFLAGS="$$(addprefix -C link-args=,$$(HOST_LDFLAGS))" \
>  		$$(HOST_CONFIGURE_OPTS) \
> @@ -133,7 +141,7 @@ endif # ifndef $(2)_BUILD_CMDS
>  #
>  ifndef $(2)_INSTALL_TARGET_CMDS
>  define $(2)_INSTALL_TARGET_CMDS
> -	cd $$(@D) && \
> +	cd $$($$(PKG)_SRCDIR) && \
>  	$$(TARGET_MAKE_ENV) \
>  		$$(TARGET_CONFIGURE_OPTS) \
>  		$$(PKG_CARGO_ENV) \
> @@ -152,7 +160,7 @@ endif
>  
>  ifndef $(2)_INSTALL_CMDS
>  define $(2)_INSTALL_CMDS
> -	cd $$(@D) && \
> +	cd $$($$(PKG)_SRCDIR) && \
>  	$$(HOST_MAKE_ENV) \
>  		RUSTFLAGS="$$(addprefix -C link-args=,$$(HOST_LDFLAGS))" \
>  		$$(HOST_CONFIGURE_OPTS) \
> -- 
> 2.25.1
> 

-- 
                                        ____________
.-----------------.--------------------:       _    :------------------.
|  Yann E. MORIN  | Real-Time Embedded |    __/ )   | /"\ ASCII RIBBON |
| +33 534.541.179 | Software  Designer |  _/ - /'   | \ / CAMPAIGN     |
| +33 638.411.245 '--------------------: (_    `--, |  X  AGAINST      |
|      yann.morin (at) orange.com      |_="    ,--' | / \ HTML MAIL    |
'--------------------------------------:______/_____:------------------'


_________________________________________________________________________________________________________________________

Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
