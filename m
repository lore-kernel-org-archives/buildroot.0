From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Mar 2015 19:46:50 +0100
Subject: [Buildroot] [git commit] python-cheetah: fix python host dependency
Message-ID: <20150316184656.96CE9817EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=141928bc1010627f2663b61b119415033102b8d6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

python-cheetah can't be used with python3. host-python-cheetah has the same
limitation.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-cheetah/python-cheetah.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/python-cheetah/python-cheetah.mk b/package/python-cheetah/python-cheetah.mk
index 7354190..af7d1f5 100644
--- a/package/python-cheetah/python-cheetah.mk
+++ b/package/python-cheetah/python-cheetah.mk
@@ -10,6 +10,8 @@ PYTHON_CHEETAH_SITE = http://pypi.python.org/packages/source/C/Cheetah
 PYTHON_CHEETAH_LICENSE = MIT
 PYTHON_CHEETAH_SETUP_TYPE = setuptools
 
+HOST_PYTHON_CHEETAH_NEEDS_HOST_PYTHON = python2
+
 # The dependency on host-python-markdown is needed to prevent
 # setuptools from downloading markdown if it is not installed yet.
 HOST_PYTHON_CHEETAH_DEPENDENCIES = host-python-markdown
