From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Jul 2015 01:55:34 +0200
Subject: [Buildroot] [PATCH 1/4] initscripts: new package
In-Reply-To: <1436821211-4446-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1436821211-4446-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20150714015534.04420154@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Mon, 13 Jul 2015 23:00:08 +0200, Maxime Hadjinlian wrote:
> The folder init.d is currently installed by default since it's part of
> our skeleton.
> This patch creates a package out of it and make busybox/sysvinit depends
> on it.
> 
> This way, if you chose another init, you don't end up with a useless
> init.d folder.
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
> v4 -> v5:
>     - Move inittab to their specifi packages (sysvinit and busybox)
>     - Make BR2_INIT_SYSV and BR2_INIT_BUSYBOX select initscripts
>     - Initscripts depends on BR2_INIT_SYSV or BR2_INIT_BUSYBOX so it
>       can't be selected by anything else.
> v3 -> v4:
>     - Fix bug with busybox
> v2 -> v3:
>     - Fix rebase issues
> v1 -> v2:
>     - Redo the patch using git format-patch -M
> ---
>  package/Config.in                                         |  1 +
>  package/busybox/busybox.mk                                |  7 +++++++
>  {system/skeleton/etc => package/busybox}/inittab          |  0
>  package/initscripts/Config.in                             |  5 +++++
>  .../etc => package/initscripts}/init.d/S20urandom         |  0
>  .../etc => package/initscripts}/init.d/S40network         |  0
>  {system/skeleton/etc => package/initscripts}/init.d/rcK   |  0
>  {system/skeleton/etc => package/initscripts}/init.d/rcS   |  0
>  package/initscripts/initscripts.mk                        | 15 +++++++++++++++
>  package/sysvinit/sysvinit.mk                              |  6 ++----
>  system/Config.in                                          |  2 ++
>  11 files changed, 32 insertions(+), 4 deletions(-)
>  rename {system/skeleton/etc => package/busybox}/inittab (100%)
>  create mode 100644 package/initscripts/Config.in
>  rename {system/skeleton/etc => package/initscripts}/init.d/S20urandom (100%)
>  rename {system/skeleton/etc => package/initscripts}/init.d/S40network (100%)
>  rename {system/skeleton/etc => package/initscripts}/init.d/rcK (100%)
>  rename {system/skeleton/etc => package/initscripts}/init.d/rcS (100%)
>  create mode 100644 package/initscripts/initscripts.mk

Applied after some changes:

    [Thomas:
      - make the initscripts package selectable via a hidden bool
      - remove some unneeded changes in sysvinit.mk.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
