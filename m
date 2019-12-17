From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Dec 2019 17:46:44 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/python-ecdsa:
 security bump to version 0.13.3
Message-ID: <20191217164102.CE96E8B876@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b7e2baee205de941296e9bea53a14dc96b9546ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes the following security vulnerabilities:

- CVE-2019-14853 - possible DoS caused by malformed signature decoding
- CVE-2019-14859 - signature malleability caused by insufficient checks of
  DER encoding

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d9b4aa065c2e2263eaac79f7ca1882ded1a4e28b)
[Peter: mention the security fixes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-ecdsa/python-ecdsa.hash | 4 ++--
 package/python-ecdsa/python-ecdsa.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-ecdsa/python-ecdsa.hash b/package/python-ecdsa/python-ecdsa.hash
index 62296de8cc..3e24783657 100644
--- a/package/python-ecdsa/python-ecdsa.hash
+++ b/package/python-ecdsa/python-ecdsa.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/ecdsa/json
-md5	0ce51d17c0751e5232be4eafd69b7f13  ecdsa-0.13.2.tar.gz
-sha256	5c034ffa23413ac923541ceb3ac14ec15a0d2530690413bff58c12b80e56d884  ecdsa-0.13.2.tar.gz
+md5	b1b33f7fe171eb1278de6f93eefc34f8  ecdsa-0.13.3.tar.gz
+sha256	163c80b064a763ea733870feb96f9dd9b92216cfcacd374837af18e4e8ec3d4d  ecdsa-0.13.3.tar.gz
 # Locally computed sha256 checksums
 sha256	3eca9845773d2e5b8cc9d8c119d345f00a4806e4bd660d4a3d6cdf9c0e9d8bb2  LICENSE
diff --git a/package/python-ecdsa/python-ecdsa.mk b/package/python-ecdsa/python-ecdsa.mk
index 3325f2b152..90e359f8b7 100644
--- a/package/python-ecdsa/python-ecdsa.mk
+++ b/package/python-ecdsa/python-ecdsa.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ECDSA_VERSION = 0.13.2
+PYTHON_ECDSA_VERSION = 0.13.3
 PYTHON_ECDSA_SOURCE = ecdsa-$(PYTHON_ECDSA_VERSION).tar.gz
-PYTHON_ECDSA_SITE = https://files.pythonhosted.org/packages/51/76/139bf6e9b7b6684d5891212cdbd9e0739f2bfc03f380a1a6ffa700f392ac
+PYTHON_ECDSA_SITE = https://files.pythonhosted.org/packages/8c/d8/9c3596fd0f18ae0a76333492a119c00183323d8e64de1a4f4bd642856963
 PYTHON_ECDSA_SETUP_TYPE = setuptools
 PYTHON_ECDSA_LICENSE = MIT
 PYTHON_ECDSA_LICENSE_FILES = LICENSE
