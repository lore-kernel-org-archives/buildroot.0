From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  5 Feb 2020 15:48:42 +0100
Subject: [Buildroot] [PATCH 5/6 v2] boot/at91bootstrap3: license files
 hashes only valid for latest version
In-Reply-To: <cover.1580914115.git.yann.morin.1998@free.fr>
References: <cover.1580914115.git.yann.morin.1998@free.fr>
Message-ID: <87654888e86275f2ac6638c64ad048c1bda172df.1580914115.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We can only know the path to the license files for the known version.
For custom, older or newer, versions may change, or may be moved
around.

So, do for at91bootstrap3 as was done for other packages in the recent
past, and only define the list of license files for the latest version.

Reported-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Markus Mayer <mmayer@broadcom.com>
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
-- 
2.20.1
