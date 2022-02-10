Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31B0AC433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Feb 2022 15:08:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83AA94027E;
	Thu, 10 Feb 2022 15:08:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ehcNc64saBbu; Thu, 10 Feb 2022 15:08:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7D0D40222;
	Thu, 10 Feb 2022 15:08:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F1A691BF3DB
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 15:08:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E04A960B79
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 15:08:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=orange.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xlbus-Q4dWer for <buildroot@lists.busybox.net>;
 Thu, 10 Feb 2022 15:08:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.66.40])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7462360B1B
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 15:08:54 +0000 (UTC)
Received: from opfedar03.francetelecom.fr (unknown [xx.xx.xx.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfedar27.francetelecom.fr (ESMTP service) with ESMTPS id 4JvgBD0kGBz2xT0; 
 Thu, 10 Feb 2022 16:08:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orange.com;
 s=ORANGE001; t=1644505732;
 bh=8Pl7o0nxkX2k3Nd4Dyh95Bz/NV0tNSEM3FpRrdDjyh0=;
 h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
 b=YLbpe0cUutlaQnHDnMKoT5ifIqMLMLQe80F+r9b/mg1w2BA8iyM6XXmOm7HIJIxpr
 23zIqI7W8c72h7GOBHFREMx/fdg18FRwtZQzpWXXqQsLUCdtgD7yCpa2ojwYYFgA1W
 SHuTqgrZEo2PellUeWXA5cvzTcaVMluaKwY4CWeZqgykHUL9inKx4tPcmMrKG+7tU/
 6ygidAEyCIj+XRRCkF47c9582qjnpFEULPMQwBOqUfe8Xc8HzkVIxmHvN7/VeD41YA
 N6oJXPKqqOPBIMPlB5wmJ4jtIVkJJxS26iM/aB7opEmPL9nDlrgD8v04xkw7H6SfBu
 qO1bXnfrPfTZA==
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Thu, 10 Feb 2022 16:08:50 +0100
Date: Thu, 10 Feb 2022 16:08:50 +0100
From: <yann.morin@orange.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <11338_1644505732_62052A83_11338_59_1_20220210150850.GA2599@tl-lnx-nyma7486>
References: <fea7d1545892211e01cb6660dc5fba16b0851c47.1644422916.git.yann.morin@orange.com>
 <20220209205410.071f193a@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220209205410.071f193a@windsurf>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Originating-IP: [10.115.26.51]
X-ClientProxiedBy: OPE16NORMBX502.corporate.adroot.infra.ftgroup
 (10.115.26.26) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
Subject: Re: [Buildroot] [PATCH 2/5 v2] package/pkg-cargo: allow building in
 a sub-directory
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

Thomas, All,

On 2022-02-09 20:54 +0100, Thomas Petazzoni spake thusly:
> On Wed, 9 Feb 2022 17:08:44 +0100
> <yann.morin@orange.com> wrote:
> > +# If building in a sub directory, use that to find the Cargo.toml, unless
> > +# the package already provided its location.
> > +ifneq ($$($(2)_SUBDIR),)
> > +ifeq ($$(filter BR_CARGO_MANIFEST_PATH=%,$$($(2)_DL_ENV)),)
> > +$(2)_DL_ENV += BR_CARGO_MANIFEST_PATH=$$($(2)_SUBDIR)/Cargo.toml
> 
> I find that a bit "meh".

I too am not fond of it, to be honest... But I am not a rust/cargo
expert, by far, I wanted not to break any existing setup.

However, the cargo infra is brand new, and BR_CARGO_MANIFEST_PATH was
not even advertised either, so we should probably not have to expect any
package to actually use it already.

> Should we have an explicit package variable
> that tells the location of the Cargo.toml, instead of directly have
> packages pass this "magic" BR_CARGO_MANIFEST_PATH variable ?

I was wondering if that would even make sense to have a different
_SUBDIR and BR_CARGO_MANIFEST_PATH to begin with?

We have a package here that seems to be in such a situation, though:
    https://github.com/Orange-OpenSource/its-client

The Cargo.toml is in rust/ but we need to do the build in
rust/its-client/ ("cargo build" works perfectly well with a virtual
workspace, like is used here, but "cargo install" refuses to work,
muahaha...)

Still, because of a missing Cargo.lock in that package, vendoring by
Buildroot does not work eother (we'll fix that later).

So, for now, I suggest we just expect that BR_CARGO_MANIFEST_PATH is the
same as _SUBDIR, and thus the conditional assignment is not needed.

If in the future we do have an actual, working situation where they
differ, then we may add the necessary infra, seems like a plan?

In the meantime, I'll respin the series with the ugly conditional
removed.

> Should $(2)_SUBDIR be documented for the cargo-package infra in the
> documentation ?

It is not documented for any of the other infras that make use of it
(autotools, cmake, python, etc...).

The only mention of _SUBDIR in the manual is about _SUBDIRS (plural) for
the kernel-module sub-infra.

Thanks for the review!

Regards,
Yann E. MORIN.

> Thomas
> -- 
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com

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
