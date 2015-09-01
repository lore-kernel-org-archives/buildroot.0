From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  2 Sep 2015 00:01:15 +0200
Subject: [Buildroot] [PATCHv3 14/15] directfb-examples: do not install to
	staging
In-Reply-To: <1441144876-2628-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1441144876-2628-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1441144876-2628-15-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

DirectFB examples are just examples, there is no reason to install
them to the staging directory.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/directfb-examples/directfb-examples.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/directfb-examples/directfb-examples.mk b/package/directfb-examples/directfb-examples.mk
index f40a030..ac8e61c 100644
--- a/package/directfb-examples/directfb-examples.mk
+++ b/package/directfb-examples/directfb-examples.mk
@@ -9,7 +9,6 @@ DIRECTFB_EXAMPLES_SITE = http://www.directfb.org/downloads/Extras
 DIRECTFB_EXAMPLES_SOURCE = DirectFB-examples-$(DIRECTFB_EXAMPLES_VERSION).tar.gz
 DIRECTFB_EXAMPLES_LICENSE = MIT
 DIRECTFB_EXAMPLES_LICENSE_FILES = COPYING
-DIRECTFB_EXAMPLES_INSTALL_STAGING = YES
 DIRECTFB_EXAMPLES_DEPENDENCIES = directfb
 
 ifeq ($(BR2_STATIC_LIBS),y)
-- 
2.5.1
