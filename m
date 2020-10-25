From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Oct 2020 15:55:47 +0100
Subject: [Buildroot] [PATCH 1/1] package/rpm: bump to version 4.16.0
In-Reply-To: <20201025142205.1184247-1-fontaine.fabrice@gmail.com>
References: <20201025142205.1184247-1-fontaine.fabrice@gmail.com>
Message-ID: <20201025155547.0543e792@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 25 Oct 2020 15:22:05 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop patch (already in version) and so autoreconf
> - Update hash of COPYING (explicitly mention that the rpmio/ sub dir is
>   under LGPL:
>   https://github.com/rpm-software-management/rpm/commit/d5c69756cf6cd16e7c2e8b81fba19bf81f3dd1ba)
> - sqlite is an optional dependency since
>   https://github.com/rpm-software-management/rpm/commit/07129b641b733ab30995c93e2b08d0673b9d218c
> - rpm can be built without berkeleydb since
>   https://github.com/rpm-software-management/rpm/commit/4c7323f69b4fddf928245e9db2d1c9ca9b277ef2
>   It should be noted that berkeleydb is deprecated since
>   https://github.com/rpm-software-management/rpm/commit/fc0169eb03c893d63dc44f2ada954d42e0e759ed
> - Update indentation in hash file (two spaces)
> 
> https://rpm.org/wiki/Releases/4.16.0.html
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...-prefer-pkg-config-to-find-libgcrypt.patch | 52 -------------------
>  ...1-lib-rpmdb-c-include-fcntl-h-for-O_.patch | 29 +++++++++++
>  ...2-lib-rpmrc.c-include-fcntl.h-for-O_.patch | 31 +++++++++++
>  package/rpm/Config.in                         |  1 -
>  package/rpm/rpm.hash                          |  6 +--
>  package/rpm/rpm.mk                            | 21 ++++++--
>  6 files changed, 79 insertions(+), 61 deletions(-)
>  delete mode 100644 package/rpm/0001-configure-ac-prefer-pkg-config-to-find-libgcrypt.patch
>  create mode 100644 package/rpm/0001-lib-rpmdb-c-include-fcntl-h-for-O_.patch
>  create mode 100644 package/rpm/0002-lib-rpmrc.c-include-fcntl.h-for-O_.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
