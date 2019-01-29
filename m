From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Jan 2019 22:58:03 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] Revert "avrdude: add
 license information"
Message-ID: <20190129215804.3CC5A82641@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=541a8f407c6fd570c1465985d836ca9fc46b9bef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

This reverts commit d1f545004bf0533064363d87c2d7c71e7acf7435 from 2014
because the added variables already existed. The real problem at the
time was that one of the pre-existent variables had a typo, fixed in a
later commit.

Currently AVRDUDE_LICENSE and AVRDUDE_LICENSE_FILES are declared twice
with the same values for each one. So remove one of them.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Wojciech M. Zabolotny <wzab01@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d6bce837ec80b65a873e6c12ae1f813ed505e006)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/avrdude/avrdude.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/avrdude/avrdude.mk b/package/avrdude/avrdude.mk
index 0e34076e38..ae378dfbac 100644
--- a/package/avrdude/avrdude.mk
+++ b/package/avrdude/avrdude.mk
@@ -15,8 +15,6 @@ AVRDUDE_AUTORECONF = YES
 AVRDUDE_CONF_OPTS = --enable-linuxgpio
 AVRDUDE_DEPENDENCIES = elfutils libusb libusb-compat ncurses \
 	host-flex host-bison
-AVRDUDE_LICENSE = GPL-2.0+
-AVRDUDE_LICENSE_FILES = avrdude/COPYING
 
 ifeq ($(BR2_PACKAGE_LIBFTDI1),y)
 AVRDUDE_DEPENDENCIES += libftdi1
