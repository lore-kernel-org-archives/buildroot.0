From: michal.lyszczek at bofc.pl <michal.lyszczek@bofc.pl>
Date: Wed, 06 Feb 2019 09:45:26 +0100
Subject: [Buildroot] [PATCH] boot/arm-trusted-firmware: add new version
In-Reply-To: <20190206054529.gmjy5a6q6cnyjld7@sapphire.tkos.co.il>
References: <20190205221414.23720-1-michal.lyszczek@bofc.pl>
 <20190206054529.gmjy5a6q6cnyjld7@sapphire.tkos.co.il>
Message-ID: <20190206084526.23nxxk4sfzomoxsj@c-ml-p3510.redembedded.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

On 2019-02-06 07:45:29, Baruch Siach wrote:
> Hi Micha?,
> 
> On Tue, Feb 05, 2019 at 11:14:14PM +0100, Micha? ?yszczek wrote:
> > Allow user to choose specific version of ATF apart from latest or custom
> > version.
> > 
> > Signed-off-by: Micha? ?yszczek <michal.lyszczek@bofc.pl>
> > ---
> >  boot/arm-trusted-firmware/Config.in                 | 10 +++++++++-
> >  boot/arm-trusted-firmware/arm-trusted-firmware.hash |  1 +
> >  2 files changed, 10 insertions(+), 1 deletion(-)
> > 
> > diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
> > index 885d93e62f..646ca1dee2 100644
> > --- a/boot/arm-trusted-firmware/Config.in
> > +++ b/boot/arm-trusted-firmware/Config.in
> > @@ -14,6 +14,12 @@ choice
> >  	  Select the specific ATF version you want to use
> >  
> >  config BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION
> > +	bool "Latest (v2.0)"
> > +
> > +config BR2_TARGET_ARM_TRUSTED_FIRMWARE_2_0
> > +	bool "v2.0"
> > +
> > +config BR2_TARGET_ARM_TRUSTED_FIRMWARE_1_4
> >  	bool "v1.4"
> 
> Any specific reason to keep 1.4 as a config choice?

Yes, backward compatibility. arm_juno_defconfig and rock64_defconfig use v1.4
version of ATF, but juno specifies it in custom repo version field and this
patch is to enable rock64 (which is not yet merged) to chose specific v1.4
version. Now it could be good to modify juno config to use v1.4 instead of
custom repo version with string "v1.4", but according to the rule - if it works
don't change it - I didn't change it. If you wish I can prepare v2 patch that
changes it.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 488 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190206/3f6e9150/attachment.asc>
