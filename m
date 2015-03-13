From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 Mar 2015 22:38:27 +0100
Subject: [Buildroot] [git commit] python-cheetah: add host-package support
Message-ID: <20150313214018.C3B468186E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dbdb8512fb6c86537bc54bd5333a463d0163a0be
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some packages, like GNURadio for VOLK, needs cheetah on host at buildtime.

The dependency on host-python-markdown is needed to avoid that setuptools
downloads markdown if it is not installed yet.

[Thomas: add comment in the .mk file.]

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-cheetah/python-cheetah.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/python-cheetah/python-cheetah.mk b/package/python-cheetah/python-cheetah.mk
index 08076b5..7354190 100644
--- a/package/python-cheetah/python-cheetah.mk
+++ b/package/python-cheetah/python-cheetah.mk
@@ -10,4 +10,9 @@ PYTHON_CHEETAH_SITE = http://pypi.python.org/packages/source/C/Cheetah
 PYTHON_CHEETAH_LICENSE = MIT
 PYTHON_CHEETAH_SETUP_TYPE = setuptools
 
+# The dependency on host-python-markdown is needed to prevent
+# setuptools from downloading markdown if it is not installed yet.
+HOST_PYTHON_CHEETAH_DEPENDENCIES = host-python-markdown
+
 $(eval $(python-package))
+$(eval $(host-python-package))
