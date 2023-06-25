Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D6AEB64DC
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 07:56:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3687160F08;
	Sun, 25 Jun 2023 07:56:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3687160F08
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4qkp3j8qa1rV; Sun, 25 Jun 2023 07:56:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B39E60F6C;
	Sun, 25 Jun 2023 07:56:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B39E60F6C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6AB1F1BF3C1
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 07:55:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4F3484159D
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 07:55:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F3484159D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fI-aTTio0l8d for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 07:55:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9FC4641583
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9FC4641583
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 07:55:56 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:36ab:e848:bc86:4439])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 76EBAB0054E;
 Sun, 25 Jun 2023 09:55:50 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 25 Jun 2023 09:55:50 +0200
Date: Sun, 25 Jun 2023 09:55:50 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Andreas Dannenberg <dannenberg@ti.com>
Message-ID: <20230625075550.GI24952@scaer>
References: <20230622160212.2063472-1-dannenberg@ti.com>
 <20230622160212.2063472-8-dannenberg@ti.com>
 <CAEg67Gn7OeVDCwthzRTBdKj=QeYFku1JT3t=Rm9hUf59k52+4A@mail.gmail.com>
 <20230623145350.265zxot3uvidzur5@dasso>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230623145350.265zxot3uvidzur5@dasso>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1687679753;
 bh=DUYz3CM+2FmZ1O4vqkiB7/qZ8htUAAJdeB10veaPmK0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=a4NJXmzD6mYPWUJQw5rZCnJw0TmCZxQt3wcnoMq9bueDJ04Yx25EJrE5SL0XoBXfY
 oGWKt5xM4FhGuwWpsH+40Hzvj7T7yTAVpSplrP0YzpgHELVKBUTCIFhNgjqGotAasI
 ggDSj2b9YaUdRrBrJR3ymCqz9CLO1Xk7FRsOSbLyQZTK3IzP1otDxH6dL0BiSQZlwm
 wbnof43gU/biKiO8OQ78SK2GAh180ihhSCvw506Meqa0/asuxF7xvlecBJXTC3a1Nl
 4RkB8uBOdv3XFb5ITE9gPM3rdSecn9I6sw8+gQts8T/FZHPF2lrt2CGvf+4C/+R5eC
 mQSRCJZyb6mcg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=a4NJXmzD
Subject: Re: [Buildroot] [PATCH v9 07/11] package/ti-core-secdev-k3: new
 package
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
Cc: Patrick Oppenlander <patrick.oppenlander@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Andreas, Patrick, All,

On 2023-06-23 09:53 -0500, Andreas Dannenberg via buildroot spake thusly:
> On Fri, Jun 23, 2023 at 01:48:30PM +1000, Patrick Oppenlander wrote:
[--SNIP--]
> > > diff --git a/package/ti-core-secdev-k3/ti-core-secdev-k3.mk b/package/ti-core-secdev-k3/ti-core-secdev-k3.mk
> > > new file mode 100644
> > > index 0000000000..c388af2865
> > > --- /dev/null
> > > +++ b/package/ti-core-secdev-k3/ti-core-secdev-k3.mk
> > > @@ -0,0 +1,31 @@
> > > +################################################################################
> > > +#
> > > +# ti-core-secdev-k3
> > > +#
> > > +################################################################################
> > > +
> > > +TI_CORE_SECDEV_K3_VERSION = 08.06.00.007

I see this version present (either used or referenced) in multiple
packages. Would it be possible, and would it make sense to share a
it in a single location?

This is going to be a bit tricky, because the variable must be set
_before_ any package that uses it gets parsed. WE usually ensure this by
having all packages in a common directory (like the Qt5 stuff in
package/qt5/), but here we have packages in package/ and in boot/, so I
can see a little issue...

> > > +TI_CORE_SECDEV_K3_SITE = https://git.ti.com/cgit/security-development-tools/core-secdev-k3/snapshot
> > > +TI_CORE_SECDEV_K3_LICENSE = TI TSPA License
> > > +TI_CORE_SECDEV_K3_LICENSE_FILES = manifest/k3-secdev-0.2-manifest.html
> > > +TI_CORE_SECDEV_K3_SOURCE = core-secdev-k3-$(TI_CORE_SECDEV_K3_VERSION).tar.gz
[--SNIP--]
> > Would it make sense to support user customisation of this via Kconfig
> > instead of using the magic TI_SECURE_DEV_PKG environment variable?
[--SNIP--]
> > Could we support configuring the location of the custMpk.pem key and
> > have the build process replace the default key in
> > build/host-ti-core-secdev-k3-08.06.00.007/keys?
> Well, this is how the "TI secure dev package" has been for the last 10+
> years, and that's how it's being used by 100% of our customers today
> doing Linux image builds. It's hard-wired into Yocto builds, even the
> official U-Boot tree...
> https://source.denx.de/u-boot/u-boot/-/blob/master/doc/README.ti-secure
> I agree improvements could be made for example to point to just a
> private key via Kconfig but this would also create an inconsistency with
> all solutions currently in production, and with what folks are used to,
> and go against enabling an easier and more seamless "switch" from Yocto
> for example, which is what I'd like people to do.
> 
> This doesn't say it should not or never be improved, but I think such
> changes could be managed more smoothly by establishing a known baseline
> first (which is what this entire series intends to do, based on a
> comparable variant of the official TI production SDK), and then over
> time improve things, also as Yocto, U-Boot, and other projects evolve
> (there's constant development on those including on the security front,
> so what we have here will not be the "forever solution).
>  
> > Is there a reason why a customer is expected to replace (or, more
> > likely, duplicate) the scripts rather than just supply a key?
> The key is the most obvious thing, but often customers also want to
> customize the certificate to add additional items for example to control
> certain device features such as whether JTAG should be locked or
> unlocked, etc., all things not readily controllable through some knobs
> but needing to be done through customization of sripts / templates.

I've read the whole exchange, and it was very instructive, thanks!

I'd side with Andreas here: let's get the basic support in, which does
behave like people are currently used to.

If it then is possible to customise the security settings (key, certs,
etc...), either following future upstream changes, or in a
Buildroot-specific way, then we can improve later on.

> +TI_CORE_SECDEV_K3_INSTALL_DIR = $(HOST_DIR)/opt/ti-core-secdev-k3

This variable is set unconditionally, even if the package is not
enabled. So, the conditional blocks you added in the other packages will
always hit.

Here's one sich block below:

> +ifneq ($(TI_CORE_SECDEV_K3_INSTALL_DIR),)

As said above, this condition will always be true.

> +# Only set TI_SECURE_DEV_PKG make option if not already defined in the
> +# environment, thus allowing the user to unconditionally override this
> +# setting with a custom location on their build machine containing their
> +# private keys, etc.
> +ifeq ($(TI_SECURE_DEV_PKG),)
> +UBOOT_MAKE_OPTS += TI_SECURE_DEV_PKG=$(TI_CORE_SECDEV_K3_INSTALL_DIR)
> +endif
> +endif

So, as I understand it, the user has two options:

  - enable BR2_PACKAGE_HOST_TI_CORE_SECDEV_K3=y and use it as a signing
    tool,

  - disable BR2_PACKAGE_HOST_TI_CORE_SECDEV_K3 and set TI_SECURE_DEV_PKG
    in their environment, to point to their signing tool

My suggestion would be the following:

 - if the user enables BR2_PACKAGE_HOST_TI_CORE_SECDEV_K3=y then we use
   that as a signing tool, and forcefully set TI_SECURE_DEV_PKG;

  - otherwise, we do nothing: if they have TI_SECURE_DEV_PKG set in
    their environment, it will be used as a signing tool;

  - otherwise, no signing will be done.

I.e. the code blocks would look like (e.g. for uboot):

    ifeq ($(BR2_PACKAGE_HOST_TI_CORE_SECDEV_K3),y)
    UBOOT_MAKE_OPTS += TI_SECURE_DEV_PKG=$(TI_CORE_SECDEV_K3_INSTALL_DIR)
    endif

Regards,
Yann E. MORIN.

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
