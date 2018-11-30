From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Fri, 30 Nov 2018 10:07:49 +0100
Subject: [Buildroot] [PATCH 1/1] boot/arm-trusted-firmware: support
 debug mode
In-Reply-To: <20181129230554.079f209a@windsurf>
References: <1542900158-17272-1-git-send-email-etienne.carriere@linaro.org>
 <20181129230554.079f209a@windsurf>
Message-ID: <CAN5uoS_3rS7CL2b_3YhQoJTfX6r5ff13+Xkx4HAMYAUp=-qRZQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 29 Nov 2018 at 23:06, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Thu, 22 Nov 2018 16:22:38 +0100, Etienne Carriere wrote:
> > When the trusted firmware is built with debug support (DEBUG defined),
> > the generated images are located at a specific path. The non debug
> > images are located in generated directory build/<platform>/release/
> > while the debug images are located in generated directory
> > build/<platform>/debug/.
> >
> > This change introduces boolean BR2_TARGET_ARM_TRUSTED_FIRMWARE_DEBUG
> > to define whether the release or debug configuration is used to build
> > trusted firmware. Note that enabling trusted firmware debug support, i.e
> > BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="... DEBUG=1 ..."
> > without enabling BR2_TARGET_ARM_TRUSTED_FIRMWARE_DEBUG will fail since
> > buildroot will get generated files from the wrong path.
> >
> > Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
>
> What is this debug mode doing exactly ?

Hello Thomas,

This enable few debug support in ATF: disable compilation optims,
generate debug symbols, enable assertions, increase trace level.
... and it also makes the generates  boot binary images be located at
a specific path (compared to when not in debug mode).

> We already have a global BR2_ENABLE_DEBUG option to enable building
> with debugging symbols. I am wondering if we should use that option as
> well, or like you did, introduce a separate option. Perhaps for
> something like ATF, that is very low-level and HW-specific, a separate
> debug option is OK.

I think this feature is quite specific to people interested in want
happens during the boot stages and/or the ATF specific runtime
services.
One may want specific ATF traces without forcing debug mode for the
whole system.

Yet I not that used the BR conventions and habits and I let you decide
whether such debug should be driven from the BR generic  debug
directive or not.
I have no strong opinion on this.

> > +config BR2_TARGET_ARM_TRUSTED_FIRMWARE_DEBUG
> > +     bool "Debug mode of the trusted firmware"
> > +     default n
>
> "default n" is not needed, since it's the default. Not need to resend
> just for that, we can fixup when applying.

Ok. Feel free to fix straight if you agree with the other changes.

regards,
etienne

> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
