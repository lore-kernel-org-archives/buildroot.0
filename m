From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Nov 2016 23:01:42 +0100
Subject: [Buildroot] [git commit] Makefile: make exported variable
	definitions consistent
Message-ID: <20161201222139.56B837FD88@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3111f6a5109678fa08be44792b4708fd7d09eb4f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use a space before and after the equal sign when defining the TZ, LANG
and LC_ALL variables, as suggested by the Buildroot coding style.

Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 9e588da..7c582e5 100644
--- a/Makefile
+++ b/Makefile
@@ -248,9 +248,9 @@ endif
 
 # timezone and locale may affect build output
 ifeq ($(BR2_REPRODUCIBLE),y)
-export TZ=UTC
-export LANG=C
-export LC_ALL=C
+export TZ = UTC
+export LANG = C
+export LC_ALL = C
 export GZIP = -n
 BR2_VERSION_GIT_EPOCH = $(shell GIT_DIR=$(TOPDIR)/.git $(GIT) log -1 --format=%at)
 export SOURCE_DATE_EPOCH = $(if $(wildcard $(TOPDIR)/.git),$(BR2_VERSION_GIT_EPOCH),$(BR2_VERSION_EPOCH))
