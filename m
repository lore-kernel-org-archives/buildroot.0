From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Jul 2017 23:15:49 +0200
Subject: [Buildroot] [PATCH 1/1] sngrep: remove ncurses wchar support
In-Reply-To: <20170714153835.3117-1-aduskett@gmail.com>
References: <20170714153835.3117-1-aduskett@gmail.com>
Message-ID: <20170715231549.46c4bcc5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 14 Jul 2017 11:38:35 -0400, Adam Duskett wrote:
> sngrep currently doesn't really use wchar support anyways, and when
> checking for wchar support, it's checking the host systems ncurses
> libraries.
> 
> Remove support for ncurses wchar until it's used in sngrep, and remove
> the patches used to fix ncurses wchar detection.
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
>  ...001-autotools-fix-ncurses-wchar-detection.patch | 158 ---------------------
>  ...002-autotools-fix-ncurses-wchar-detection.patch |  45 ------
>  package/sngrep/sngrep.mk                           |   4 -
>  3 files changed, 207 deletions(-)
>  delete mode 100644 package/sngrep/0001-autotools-fix-ncurses-wchar-detection.patch
>  delete mode 100644 package/sngrep/0002-autotools-fix-ncurses-wchar-detection.patch

I found out it was possible to fix the build issues by passing the
appropriate
SNGREP_NCURSESxyz_CONFIG_SCRIPT=$(STAGING_DIR)/usr/bin/ncursesxyz-config,
but since you say wchar isn't really used by sngrep anyway, I don't
think it's worth adding even more complexity, and I'm happy to see
patches being removed.

Therefore: applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
