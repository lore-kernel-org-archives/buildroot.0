From: Lucas De Marchi <lucas.de.marchi@gmail.com>
Date: Fri, 10 Jan 2014 17:50:21 -0200
Subject: [Buildroot] [PATCH 2/3] psplash: use git repository
In-Reply-To: <1389383422-29665-1-git-send-email-lucas.de.marchi@gmail.com>
References: <1389383422-29665-1-git-send-email-lucas.de.marchi@gmail.com>
Message-ID: <1389383422-29665-2-git-send-email-lucas.de.marchi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

psplash doesn't see a new release for quite some time. The lattest
commits brought some nice bug fixes and a feature that allows to
easily customize the splash image.

Signed-off-by: Lucas De Marchi <lucas.de.marchi@gmail.com>
---
 package/psplash/psplash.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/psplash/psplash.mk b/package/psplash/psplash.mk
index cb1c54a..fe14f44 100644
--- a/package/psplash/psplash.mk
+++ b/package/psplash/psplash.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-PSPLASH_VERSION = 0.1
-PSPLASH_SITE = http://downloads.yoctoproject.org/releases/psplash
+PSPLASH_VERSION = afd4e228c606a9998feae44a3fed4474803240b7
+PSPLASH_SITE = git://git.yoctoproject.org/psplash
 PSPLASH_LICENSE = GPLv2+
 PSPLASH_LICENSE_FILES = COPYING
+PSPLASH_AUTORECONF = YES
 
 $(eval $(autotools-package))
-- 
1.8.5.2
