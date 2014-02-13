From: Romain Naour <romain.naour@openwide.fr>
Date: Thu, 13 Feb 2014 22:17:55 +0100
Subject: [Buildroot] [PATCH 2/2] nut: disable parallel builds
In-Reply-To: <1392326275-25992-1-git-send-email-romain.naour@openwide.fr>
References: <1392326275-25992-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1392326275-25992-2-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The build system has a race condition causing build failure,
so ensure make -j1 is used.

Fixes:
http://autobuild.buildroot.net/results/0dd/0ddd856bcbec2db0500791fd428ba053d6e4fa1b/build-end.log

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/nut/nut.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/nut/nut.mk b/package/nut/nut.mk
index 47367e1..3985daa 100644
--- a/package/nut/nut.mk
+++ b/package/nut/nut.mk
@@ -14,6 +14,9 @@ NUT_DEPENDENCIES = host-pkgconf
 # Our patch changes m4 macros, so we need to autoreconf
 NUT_AUTORECONF = YES
 
+# Disable parallel builds
+NUT_MAKE = $(MAKE1)
+
 # Put the PID files in a read-write place (/var/run is a tmpfs)
 # since the default location (/var/state/ups) maybe readonly.
 NUT_CONF_OPT = \
-- 
1.8.5.3
