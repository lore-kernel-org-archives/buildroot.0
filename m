From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 16 Aug 2014 00:30:10 +0200
Subject: [Buildroot] [git commit] package/infozip: Rename HOST_CC to HOSTCC
Message-ID: <20140815223131.9D8A99D462@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=00bd63a4efd6811a111525caf79003ec7e9be359
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Wrong variable name is used which can lead to build errors for the host variant:

[...] -I. -DUNIX" AS=" -c" -f unix/Makefile generic

c _match.s
make[1]: c: command not found

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/infozip/infozip.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/infozip/infozip.mk b/package/infozip/infozip.mk
index 42cd1db..229299c 100644
--- a/package/infozip/infozip.mk
+++ b/package/infozip/infozip.mk
@@ -29,7 +29,7 @@ endef
 define HOST_INFOZIP_BUILD_CMDS
 	$(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D) \
 		CFLAGS="$(HOST_CFLAGS) -I. -DUNIX" \
-		AS="$(HOST_CC) -c" \
+		AS="$(HOSTCC) -c" \
 		-f unix/Makefile generic
 endef
 
