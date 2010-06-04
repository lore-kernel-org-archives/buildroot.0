From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 4 Jun 2010 10:32:32 +0200
Subject: [Buildroot] [PATCH 07/46] u-boot: remove option to
 configuredownload site
In-Reply-To: <002101cb0223$38af8910$aa0e9b30$@pauljones.id.au>
References: <cover.1275343447.git.thomas.petazzoni@free-electrons.com>
	<fd8347fd9ea408c4150f9358521a5dfceca92bc4.1275343447.git.thomas.petazzoni@free-electrons.com>
	<002101cb0223$38af8910$aa0e9b30$@pauljones.id.au>
Message-ID: <20100604103232.3f415c39@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 2 Jun 2010 17:14:18 +1000
"Paul Jones" <paul@pauljones.id.au> wrote:

> It would be good if we could keep this feature - I'm in the process of
> adding support for the Mini2440 ARM boards and there is no mainline support
> for them in uboot, so buildroot needs to get uboot from
> http://repo.or.cz/w/u-boot-openmoko/mini2440.git/snapshot/HEAD.tar.gz or the
> git equivalent when git support is added.
> 
> I guess another way is to just put an #ifdef equivilant in u-boot.mk to
> change the download location but that's a bit ugly.

Thanks for the feedback. I'll add something that allows to download
arbitrary tarballs. That's something that I also did for my Linux
kernel code cleanup in Buildroot, so I'll reuse the same scheme. I'll
post an updated version of this patch probably during this WE.

However, I don't think having a Buildroot configuration that depends on
something as "unstable" as an arbitrary development snapshot is a good
idea. I'd prefer if the Buildroot configuration was using a particular
tag or commit, so that the build is reproducible.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
