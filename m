From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 17 Jul 2017 11:28:58 +0200
Subject: [Buildroot] [git commit] python-coherence: bump to the latest
	upstream commit
Message-ID: <20170717092450.DE13C81F88@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bc801efacb298e2297024f83e960eaf8a45dd39f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

python-coherence is now orphaned, so unless a new maintainer
could be found, there is no ETA for the next release.

The setup.py file in the develop branch doesn't import other
Python packages, so no need for the build time dependencies.

This approach also fixes:

http://autobuild.buildroot.net/results/675/675721f773795987a2468daa33f299f7dc6ddb8a
http://autobuild.buildroot.net/results/cd9/cd99ac66af7a0cb24510bee78dd45884a8695776

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-coherence/python-coherence.hash | 2 +-
 package/python-coherence/python-coherence.mk   | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/python-coherence/python-coherence.hash b/package/python-coherence/python-coherence.hash
index f788ca3..533d0c6 100644
--- a/package/python-coherence/python-coherence.hash
+++ b/package/python-coherence/python-coherence.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  fd5a2db9661994a57232ace4a90d259b6554c43b8bf5bfbf8ec2518c03627922  python-coherence-0.6.6.2.tar.gz
+sha256  97c8b700b3fe73d48eacb259008f410d6567e5d7d1b8e96386f8cc2422135ca5  python-coherence-b7856985fd496689ca1f9024925ae737297c00d1.tar.gz
diff --git a/package/python-coherence/python-coherence.mk b/package/python-coherence/python-coherence.mk
index f9df37c..24da7f7 100644
--- a/package/python-coherence/python-coherence.mk
+++ b/package/python-coherence/python-coherence.mk
@@ -4,11 +4,10 @@
 #
 ################################################################################
 
-PYTHON_COHERENCE_VERSION = 0.6.6.2
-PYTHON_COHERENCE_SITE = $(call github,coherence-project,Coherence,Coherence-$(PYTHON_COHERENCE_VERSION))
+PYTHON_COHERENCE_VERSION = b7856985fd496689ca1f9024925ae737297c00d1
+PYTHON_COHERENCE_SITE = $(call github,coherence-project,Coherence,$(PYTHON_COHERENCE_VERSION))
 PYTHON_COHERENCE_SETUP_TYPE = setuptools
 PYTHON_COHERENCE_LICENSE = MIT
 PYTHON_COHERENCE_LICENSE_FILES = LICENCE
-PYTHON_COHERENCE_DEPENDENCIES = python-twisted python-zope-interface python-pyasn
 
 $(eval $(python-package))
