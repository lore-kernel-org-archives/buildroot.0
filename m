From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Mar 2020 23:46:58 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] boot/barebox-aux: store
 downloads in same dir as bare barebox
Message-ID: <20200327225336.5A25688744@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0f30ebcc1021f769e5fd1b7b7d6000dae0f67f09
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

barebox and barebox-aux are really the same package, from the same URL
and the same version. They deserve being stored in the same directory.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Tested-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit ca7fa117b168e0de81dda35c8cabb615c352a0e9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/barebox/barebox.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index 52178d89c8..814e21f945 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -31,6 +31,8 @@ $(1)_SOURCE = barebox-$$($(1)_VERSION).tar.bz2
 $(1)_SITE = https://www.barebox.org/download
 endif
 
+$(1)_DL_SUBDIR = barebox
+
 $(1)_DEPENDENCIES = host-lzop
 $(1)_LICENSE = GPL-2.0 with exceptions
 $(1)_LICENSE_FILES = COPYING
