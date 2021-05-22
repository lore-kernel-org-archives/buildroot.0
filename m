From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 22 May 2021 19:41:59 +0200
Subject: [Buildroot] [PATCH 4/4] package/python-pillow: security bump to
 version 8.2.0
In-Reply-To: <20210522174159.278657-1-fontaine.fabrice@gmail.com>
References: <20210522174159.278657-1-fontaine.fabrice@gmail.com>
Message-ID: <20210522174159.278657-4-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Fix numerous CVEs:
  https://pillow.readthedocs.io/en/stable/releasenotes/8.2.0.html#security
  https://pillow.readthedocs.io/en/stable/releasenotes/8.1.2.html#security
  https://pillow.readthedocs.io/en/stable/releasenotes/8.1.1.html#security
  https://pillow.readthedocs.io/en/stable/releasenotes/8.1.0.html#security
- Update license to HPND:
  https://github.com/python-pillow/Pillow/commit/81078e8a0d26c9094446a64aadfa8047b8af3484

https://pillow.readthedocs.io/en/stable/releasenotes/index.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-pillow/python-pillow.hash | 7 ++++---
 package/python-pillow/python-pillow.mk   | 6 +++---
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/python-pillow/python-pillow.hash b/package/python-pillow/python-pillow.hash
index 0849577f66..562cb2c1a2 100644
--- a/package/python-pillow/python-pillow.hash
+++ b/package/python-pillow/python-pillow.hash
@@ -1,4 +1,5 @@
-# md5, sha256 from https://pypi.org/project/Pillow/
-sha256	11c5c6e9b02c9dac08af04f093eb5a2f84857df70a7d4a6a6ad461aca803fb9e  Pillow-8.0.1.tar.gz
+# md5, sha256 from https://pypi.org/pypi/pillow/json
+md5  21c03274a9f59b9c00419852a8faebe7  Pillow-8.2.0.tar.gz
+sha256	a787ab10d7bb5494e5f76536ac460741788f1fbce851068d73a87ca7c35fc3e1  Pillow-8.2.0.tar.gz
 # Locally computed sha256 checksums
-sha256	37de42abe33a247e8f03d2313657a0f174a239a198f526add6544ff3e2643b81  LICENSE
+sha256	5bb11d96b393a698df70018069a986248021f286344c437a13f299c3daf1dfd4  LICENSE
diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
index 61f386df07..9529f54633 100644
--- a/package/python-pillow/python-pillow.mk
+++ b/package/python-pillow/python-pillow.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_PILLOW_VERSION = 8.0.1
-PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/2b/06/93bf1626ef36815010e971a5ce90f49919d84ab5d2fa310329f843a74bc1
+PYTHON_PILLOW_VERSION = 8.2.0
+PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/21/23/af6bac2a601be6670064a817273d4190b79df6f74d8012926a39bc7aa77f
 PYTHON_PILLOW_SOURCE = Pillow-$(PYTHON_PILLOW_VERSION).tar.gz
-PYTHON_PILLOW_LICENSE = PIL Software License
+PYTHON_PILLOW_LICENSE = HPND
 PYTHON_PILLOW_LICENSE_FILES = LICENSE
 PYTHON_PILLOW_CPE_ID_VENDOR = python
 PYTHON_PILLOW_CPE_ID_PRODUCT = pillow
-- 
2.30.2
