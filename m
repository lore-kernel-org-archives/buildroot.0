From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Sep 2014 00:11:20 +0200
Subject: [Buildroot] [git commit] libelf: Removes the package
Message-ID: <20140913221240.626759D67F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=52fac6a2f7bba55fb78a7a1354eef7be5bba9f78
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The elfutils package provides a more recent version of the
libelf. Some packages such as ltrace need this more recent
version. Having two packages providing the same library leads to some
conflicts or dependency problems. For instance at the end we had only
one libelf.a when the 2 packages were selected.

Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                                |    9 +
 package/Config.in                               |    1 -
 package/libelf/Config.in                        |    7 -
 package/libelf/libelf-0.8.10-Elf64-fixups.patch |12361 -----------------------
 package/libelf/libelf.mk                        |   23 -
 5 files changed, 9 insertions(+), 12392 deletions(-)

Patch is too large, so refusing to show it
