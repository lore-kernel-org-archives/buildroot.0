From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 26 Nov 2018 22:02:09 +0100
Subject: [Buildroot] [PATCH v3 1/5] grub2: separate target and host
 builds
In-Reply-To: <20180926223719.12604-2-nunes.erico@gmail.com>
References: <20180926223719.12604-1-nunes.erico@gmail.com>
 <20180926223719.12604-2-nunes.erico@gmail.com>
Message-ID: <20181126220209.196ddbe6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 27 Sep 2018 00:37:15 +0200, Erico Nunes wrote:
> grub2 requires the host grub2-mkimage tool to build some of its target
> images. The current way of building this tool in the grub2 package is to
> perform a simultaneous host-tools/target-bootloader build during the
> grub2 build step.
> This method makes the recipe complex to understand, and proved to be a
> complication during work to enable grub2 support for other architectures
> than x86.
> This patch tries to do a better separation between the build of grub2
> host tools and target boot loader image, as a partial step to enable
> grub2 to build for other architectures.
> 
> Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
> ---
>  boot/grub2/grub2.mk | 48 +++++++++++++++++++++++----------------------
>  1 file changed, 25 insertions(+), 23 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
