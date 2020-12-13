From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 Dec 2020 10:38:46 +0100
Subject: [Buildroot] [PATCH] package/qemu: bump to version 5.2.0
In-Reply-To: <20201211224710.4151147-1-romain.naour@gmail.com>
References: <20201211224710.4151147-1-romain.naour@gmail.com>
Message-ID: <20201213103846.4f1a778c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 11 Dec 2020 23:47:10 +0100
Romain Naour <romain.naour@gmail.com> wrote:

> From [1]:
> "The build system is now partly based on Meson. However, building is
> still done with configure and make as in previous versions of QEMU."
> 
> Qemu requires meson >= 0.55.3, Buildroot use the latest version 0.56.0.
> In order to add host-meson dependency we have to remove --python option
> since it requires to use the meson bundled into Qemu sources [2].
> 
> Even without --python, python3 is used. See config-host.mak:
> PYTHON=output/host/bin/python3 -B
> 
> See config-host.mak to check if meson and ninja from HOST_DIR are used:
> MESON=output/host/bin/meson
> NINJA=output/host/bin/ninja
> 
> Since the switch to meson is partial and still requires using the
> configure script, keep using generic-package infra.
> 
> Disable new options introduced in Qemu 5.2.0:
> --disable-virtiofsd
> --disable-vhost-user-blk-server
> 
> Runtime tested on gitlab [3]
> 
> [1] https://wiki.qemu.org/ChangeLog/5.2#Build_Information
> [2] https://git.qemu.org/?p=qemu.git;a=blob;f=configure;h=18c26e0389741643748c70ac7788a996ef006834;hb=553032db17440f8de011390e5a1cfddd13751b0b#l1895
> [3] https://gitlab.com/kubu93/buildroot/-/pipelines/228214205
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  ...age-of-mcontext-structure-on-ARM-uCl.patch |  4 ++--
>  package/qemu/qemu.hash                        |  6 +++---
>  package/qemu/qemu.mk                          | 20 ++++++++++++++-----
>  3 files changed, 20 insertions(+), 10 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
