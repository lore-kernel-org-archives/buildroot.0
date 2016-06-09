From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Jun 2016 10:16:26 +0200
Subject: [Buildroot] [PATCH] odroid-mali: New Package
In-Reply-To: <20160609074119.4288-1-daggs@gmx.com>
References: <20160609074119.4288-1-daggs@gmx.com>
Message-ID: <20160609101626.6239350e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for re-submitting with your full name, we can now merge your
patches! \o/

On Thu,  9 Jun 2016 10:41:19 +0300, Dagg Stompler wrote:
> Signed-off-by: Dagg Stompler <daggs@gmx.com>
> ---
>  package/Config.in                        |   1 +
>  package/odroid-mali/10-odroidc2_fb.rules |   8 ++
>  package/odroid-mali/Config.in            |  20 +++++
>  package/odroid-mali/S50odroidc2_fb       |  20 +++++
>  package/odroid-mali/odroid-mali.hash     |   3 +
>  package/odroid-mali/odroid-mali.mk       |  56 ++++++++++++++
>  package/odroid-mali/odroidc2_fb.service  |  14 ++++
>  package/odroid-mali/odroidc2_init_fb.sh  | 125 +++++++++++++++++++++++++++++++
>  8 files changed, 247 insertions(+)

There is one thing I'm not really happy with however: this package is
mixing installing the OpenGL implementation (for the GPU) with the
initialization of the display.

Wouldn't it make more sense to have one package for the OpenGL
implementation, and one package installing all the init scripts and
udev rules related to the display? (Attention: some udev rules are
needed for the GPU).

Another thing that bothers me is that it's called "odroid-mali", where
"odroid" is the name of the board. I really find it weird that an
OpenGL implementation is board specific. It should be SoC specific for
sure, but not board-specific. If there are other Amlogic S905 SoC
boards added in Buildroot, wouldn't they be able to use the same OpenGL
implementation ?

That being said, we already have rpi-userland for RPi, but well, RPi is
the only board that will ever be made with this funky Broadcom SoC.

But in the Allwinner land, we have the sunxi-mali package, which works
with various boards.

But maybe I'm being too annoying with this aspect: this OpenGL stuff
is usually a big mess, so it's probably fine if we have a odroid-mali
package.

But I would nonetheless like to have the thing split in two packages.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
