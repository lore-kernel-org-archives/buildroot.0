From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 29 Mar 2020 22:43:27 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/cegui: rename and bump
 version
In-Reply-To: <20200323180330.486956-1-b.bilas@grinn-global.com>
References: <20200323180330.486956-1-b.bilas@grinn-global.com>
Message-ID: <20200329224327.619ec3a2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 23 Mar 2020 19:03:30 +0100
Bartosz Bilas <b.bilas@grinn-global.com> wrote:

> Since spice ver. 0.12.6 doesn't depend on cegui anymore
> let's bump to the latest stable version and rename package.
> 
> Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
> ---
> Changes v2 -> v3:
> 	- update DEVELOPERS package entry
> 	- add dependency on BR2_USE_WCHAR
> 	- add libiconv dependency if package is selected (suggested by
> 	  Yann)
> Changes v1 -> v2:
>         - fix compiling errors when uClibc is used (reported by Thomas)
>         - force to set dependency options explicitly (suggested by Thomas)
>  Config.in.legacy                              |   8 ++
>  DEVELOPERS                                    |   2 +-
>  package/Config.in                             |   2 +-
>  ...pp-check-if-execinfo-header-is-avail.patch |  33 +++++
>  package/{cegui06 => cegui}/Config.in          |  17 +--
>  package/cegui/cegui.hash                      |   3 +
>  package/cegui/cegui.mk                        | 117 ++++++++++++++++++
>  package/cegui06/0001-stddef.h.patch           |  26 ----
>  package/cegui06/cegui06.hash                  |   3 -
>  package/cegui06/cegui06.mk                    |  36 ------
>  10 files changed, 172 insertions(+), 75 deletions(-)
>  create mode 100644 package/cegui/0001-src-Exceptions.cpp-check-if-execinfo-header-is-avail.patch
>  rename package/{cegui06 => cegui}/Config.in (68%)
>  create mode 100644 package/cegui/cegui.hash
>  create mode 100644 package/cegui/cegui.mk
>  delete mode 100644 package/cegui06/0001-stddef.h.patch
>  delete mode 100644 package/cegui06/cegui06.hash
>  delete mode 100644 package/cegui06/cegui06.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
