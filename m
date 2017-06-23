From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 23 Jun 2017 21:13:27 +0200
Subject: [Buildroot] [PATCH] util-linux: bump to version 2.30
In-Reply-To: <20170623025231.26094-1-casantos@datacom.ind.br>
References: <20170623025231.26094-1-casantos@datacom.ind.br>
Message-ID: <20170623211327.4c14d567@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 22 Jun 2017 23:52:31 -0300, Carlos Santos wrote:
> - Update the "basic set" description to include fincore, which is built
>   by default, and remove tailf, which was removed in this version.
> - Add configuration options for the new utilities "chmem" and "lsmem".
> - Add a patch to revert the assumption that ncursesw headers are under
>   /usr/include/ncursesw/ only. That's necessary to have both versions
>   for ABI/API compatibility but does not make sense on embedded systems.
> - Drop autoreconf, since the patch on term-utils/Makemodule.am is gone.
> 
> The patch is a bit drastic but it solves the problem of using ncursews
> while we discuss a better solution in the util-linux mailing list.
> 
> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
> ---
>  ...-Revert-build-sys-ncurses-headers-cleanup.patch | 191 +++++++++++++++++++++
>  ...-sys-use-lm-for-scriptreplay-if-necessary.patch |  30 ----
>  package/util-linux/Config.in                       |  24 ++-
>  package/util-linux/util-linux.hash                 |   4 +-
>  package/util-linux/util-linux.mk                   |  12 +-
>  5 files changed, 218 insertions(+), 43 deletions(-)
>  create mode 100644 package/util-linux/0001-Revert-build-sys-ncurses-headers-cleanup.patch
>  delete mode 100644 package/util-linux/0001-build-sys-use-lm-for-scriptreplay-if-necessary.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
