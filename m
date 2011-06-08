From: Steve Calfee <stevecalfee@gmail.com>
Date: Wed, 08 Jun 2011 15:30:02 -0700
Subject: [Buildroot] [Feature Request] script to run after build
	completion
In-Reply-To: <BANLkTinE6NPRM67GbdAXutwxOfeHGS_P_g@mail.gmail.com>
References: <BANLkTinE6NPRM67GbdAXutwxOfeHGS_P_g@mail.gmail.com>
Message-ID: <4DEFF7EA.6080701@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/08/11 13:40, Alper Y?ld?r?m wrote:
> Hello,
> 
> A feature i want to see in buildroot is to have a post build script to
> run after image creation process, in other words just before "make"
> returns to console. This way i can put my post build commands inside
> this script. It will definitely ease my buildroot usage.
> 

Hi Alper,

Yes a post build script is useful. enter your script path in menuconfig
target_filesystem_options -->

It becomes in your .config something like:
BR2_ROOTFS_POST_BUILD_SCRIPT=
"$(TOPDIR)/target/device/beagleboard/patchrootfs.sh"

Regards, Steve
