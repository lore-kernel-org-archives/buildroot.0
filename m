From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 6 Feb 2020 20:38:13 +0100
Subject: [Buildroot] [git commit] boot/at91bootstrap3: license files hashes
 only valid for latest version
Message-ID: <20200206193221.C13558D426@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=130329cb7b278e7b476eb3c9942099dcd991146d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We can only know the details of the license files for known versions.  For
custom, older or newer versions, the license files may change, or may be
moved around.

So, do for at91bootstrap3 as was done for other packages in the recent
past, and only define the list of license files for the latest version.

Reported-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Markus Mayer <mmayer@broadcom.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/at91bootstrap3/at91bootstrap3.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/boot/at91bootstrap3/at91bootstrap3.mk b/boot/at91bootstrap3/at91bootstrap3.mk
index 48c3a918a1..5cf865c681 100644
--- a/boot/at91bootstrap3/at91bootstrap3.mk
+++ b/boot/at91bootstrap3/at91bootstrap3.mk
@@ -20,7 +20,9 @@ AT91BOOTSTRAP3_SITE = $(call github,linux4sam,at91bootstrap,$(AT91BOOTSTRAP3_VER
 endif
 
 AT91BOOTSTRAP3_LICENSE = Atmel License
+ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION),y)
 AT91BOOTSTRAP3_LICENSE_FILES = main.c
+endif
 
 AT91BOOTSTRAP3_INSTALL_IMAGES = YES
 AT91BOOTSTRAP3_INSTALL_TARGET = NO
