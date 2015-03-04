From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Wed,  4 Mar 2015 17:00:10 +0100
Subject: [Buildroot] [PATCH v3 3/4] python-cheetah: add host-package support
In-Reply-To: <1425484811-26238-1-git-send-email-gwenj@trabucayre.com>
References: <1425484811-26238-1-git-send-email-gwenj@trabucayre.com>
Message-ID: <1425484811-26238-3-git-send-email-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Some packages, like GNURadio for VOLK, needs cheetah on host at buildtime.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 package/python-cheetah/python-cheetah.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-cheetah/python-cheetah.mk b/package/python-cheetah/python-cheetah.mk
index 08076b5..faf2436 100644
--- a/package/python-cheetah/python-cheetah.mk
+++ b/package/python-cheetah/python-cheetah.mk
@@ -9,5 +9,7 @@ PYTHON_CHEETAH_SOURCE = Cheetah-$(PYTHON_CHEETAH_VERSION).tar.gz
 PYTHON_CHEETAH_SITE = http://pypi.python.org/packages/source/C/Cheetah
 PYTHON_CHEETAH_LICENSE = MIT
 PYTHON_CHEETAH_SETUP_TYPE = setuptools
+PYTHON_CHEETAH_DEPENDENCIES += host-python-markdown
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.0.5
