From: Florian La Roche <florian.laroche@googlemail.com>
Date: Tue, 08 May 2018 20:10:25 +0000
Subject: [Buildroot] [PATCH 1/1] socrates_cyclone5_defconfig: adjust to
 current kernel and u-boot
In-Reply-To: <20180508150818.447d1920@windsurf.home>
References: <20180507202238.2499-1-Florian.LaRoche@googlemail.com>
 <20180508150818.447d1920@windsurf.home>
Message-ID: <CANZrA2aU5srAa5q67yUTE91x3fGukeYkshN_A=ZGs69yjnt+Vg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas and Buildroot'ler,


Am Di., 8. Mai 2018 um 15:08 Uhr schrieb Thomas Petazzoni <
thomas.petazzoni@bootlin.com>:

> Hello,

> Thanks for this patch, see below for some comments.

> On Mon,  7 May 2018 22:22:38 +0200, Florian La Roche wrote:
> > Adjust socrates_cyclone5_defconfig to current Altera/upstream sources.

> It would be nice to be a bit more explicit: the Linux kernel version is
> still from a vendor-specific Git repository, while the U-Boot version
> used is now the upstream version.


Given that all Cyclone5-Support is in the mainline kernel, I think the
correct
thing is to switch over to the mainline kernel. I will send in a new patch
for this.


> > -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call
github,altera-opensource,linux-socfpga,rel_socfpga-4.1.33-ltsi_17.07.02_pr)/linux-rel_socfpga-4.1.33-ltsi_17.07.02_pr.tar.gz"
> > +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call
github,altera-opensource,linux-socfpga,socfpga-4.16)/linux-socfpga_socfpga-4.16.tar.gz"

> 'socfpga-4.16' is the name of a branch, so using that makes the build
> non-reproducible, since the actual contents will depend on when it is
> being fetched.

> Since they don't provide tags apparently, we don't have any other
> choice but to use a full commit SHA1. Could you adjust that ?


This is not needed given a mainline kernel then.


> > +# BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> > +# BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"

> Please don't keep this in comments.


Ok, will remove them.


> Could you adjust your patch, and send an updated version ?

New patch is coming along soon.

best regards,

Florian La Roche
