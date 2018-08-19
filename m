From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 19 Aug 2018 23:13:03 +0200
Subject: [Buildroot] [git commit] core: drop useless assignments to BISON
 and FLEX
Message-ID: <20180819210558.9B8A68D6D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a8cea94d5a6a63b6dd766068dd867670c1fb99f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

They were added back in 5432f26f0 (Adding Central config.cache options),
supposedly to be able to cache the result of configure tests, but they
were never, ever referenced anywhere in our code... Besides, we dropped
the idea of getting a configure cache long ago now (it does not work)...

They are causing spurious error messages on some distros (e.g. Fedora)
which use GNU's which (whatever package that comes from), while it is
silent on other distros (e.g. Ubuntu) which use debianutils' which.

Drop them.

Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Makefile.in | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index f2962767cc..91b3e8f936 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -219,8 +219,6 @@ TARGET_STRIP = /bin/true
 STRIPCMD = $(TARGET_STRIP)
 endif
 INSTALL := $(shell which install || type -p install)
-FLEX := $(shell which flex || type -p flex)
-BISON := $(shell which bison || type -p bison)
 UNZIP := $(shell which unzip || type -p unzip) -q
 
 APPLY_PATCHES = PATH=$(HOST_DIR)/bin:$$PATH support/scripts/apply-patches.sh $(if $(QUIET),-s)
