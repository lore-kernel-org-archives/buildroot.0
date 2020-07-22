From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 22 Jul 2020 09:03:33 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/python-urllib3:
 security bump to 1.25.9
Message-ID: <20200722070120.7D0C3880C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5f97af53ee0462a8c1864494d5521ec3dd279813
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Fixes CVE-2020-7212 (1.25.2 - 1.25.7)
The _encode_invalid_chars function does not remove duplicate percent
encodings in the _percent_encodings array, which combined with the
normalization step could take O(N^2) time to compute for a URL of
length N. This results in a marginally higher CPU consumption
compared to the potential linear time achieved by deduplicating
the _percent_encodings array.

CC: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit fc57db8401b806494ceeb20e4c91d2be8a8456eb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-urllib3/python-urllib3.hash | 5 ++---
 package/python-urllib3/python-urllib3.mk   | 4 ++--
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/python-urllib3/python-urllib3.hash b/package/python-urllib3/python-urllib3.hash
index 91b9e44622..b1602350bd 100644
--- a/package/python-urllib3/python-urllib3.hash
+++ b/package/python-urllib3/python-urllib3.hash
@@ -1,5 +1,4 @@
-# md5, sha256 from https://pypi.org/pypi/urllib3/json
-md5	a7504a9fcb7ed4ffa482fe098c80b6d4  urllib3-1.25.6.tar.gz
-sha256	9a107b99a5393caf59c7aa3c1249c16e6879447533d0887f4336dde834c7be86  urllib3-1.25.6.tar.gz
+# sha256 from https://pypi.org/pypi/urllib3/json
+sha256	3018294ebefce6572a474f0604c2021e33b3fd8006ecd11d62107a5d2a963527  urllib3-1.25.9.tar.gz
 # Locally computed sha256 checksums
 sha256	7c0d136ee0585389adf2d25671bb99687a1f75929f465b7f16ee3f01da37255e  LICENSE.txt
diff --git a/package/python-urllib3/python-urllib3.mk b/package/python-urllib3/python-urllib3.mk
index 8383cbe8e8..b17a4c0cb6 100644
--- a/package/python-urllib3/python-urllib3.mk
+++ b/package/python-urllib3/python-urllib3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_URLLIB3_VERSION = 1.25.6
+PYTHON_URLLIB3_VERSION = 1.25.9
 PYTHON_URLLIB3_SOURCE = urllib3-$(PYTHON_URLLIB3_VERSION).tar.gz
-PYTHON_URLLIB3_SITE = https://files.pythonhosted.org/packages/ff/44/29655168da441dff66de03952880c6e2d17b252836ff1aa4421fba556424
+PYTHON_URLLIB3_SITE = https://files.pythonhosted.org/packages/05/8c/40cd6949373e23081b3ea20d5594ae523e681b6f472e600fbc95ed046a36
 PYTHON_URLLIB3_LICENSE = MIT
 PYTHON_URLLIB3_LICENSE_FILES = LICENSE.txt
 PYTHON_URLLIB3_SETUP_TYPE = setuptools
