From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 24 Mar 2013 11:54:13 +0100
Subject: [Buildroot] [git commit] dosfstools: fix host variant dependencies
Message-ID: <20130324105605.B52509B259@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fc53ebdca51a88aae44a4d33aa143916450873dc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

host-dosfstools shouldn't pull host-libiconv in since that's for
uClibc-based toolchains and we don't have that package anyway.
Fixes:
http://autobuild.buildroot.net/results/7637985bfb0afdd9217c297e9b0ac5de797c137d/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/dosfstools/dosfstools.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/dosfstools/dosfstools.mk b/package/dosfstools/dosfstools.mk
index 332f2ee..79d1c7a 100644
--- a/package/dosfstools/dosfstools.mk
+++ b/package/dosfstools/dosfstools.mk
@@ -10,6 +10,9 @@ DOSFSTOOLS_LICENSE = GPLv3+
 DOSFSTOOLS_LICENSE_FILES = COPYING
 DOSFSTOOLS_LDFLAGS = $(TARGET_LDFLAGS)
 
+# Avoid target dosfstools dependencies, no host-libiconv
+HOST_DOSFSTOOLS_DEPENDENCIES =
+
 ifneq ($(BR2_ENABLE_LOCALE),y)
 DOSFSTOOLS_DEPENDENCIES += libiconv
 DOSFSTOOLS_LDFLAGS += -liconv
