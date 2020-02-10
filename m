From: Gervais, Francois <FGervais@distech-controls.com>
Date: Mon, 10 Feb 2020 14:30:13 +0000
Subject: [Buildroot] [EXT] Re: [PATCH v4 5/9] boot/arm-trusted-firmware:
 introduce two new options
Message-ID: <DM6PR01MB58491DFF606B05CFFFD84A01F3190@DM6PR01MB5849.prod.exchangelabs.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> > two new options for arm-trusted-firmware:
> > 1. BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_TARGETS
> >?????? - for additional targets, E.G. "pbl".
> 
> This option was already added in commit
> 05b8c7da6de863561d66717735a4870f2766454c, which is part of Buildroot
> master.

Somebody reported a problem with my patch last week. I'm still investigating with
him but it seems that the qstrip wrapping might be required which
05b8c7da6de863561d66717735a4870f2766454c is missing.

Jerry maybe you can try on your side? You could rebase your v5 on top
of master and try to build arm-trusted-firmware from scratch with 
BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_TARGETS empty.

You might see this error message:

make: *** empty string invalid as file name.  Stop.
