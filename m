From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 21 May 2020 15:44:55 +0200
Subject: [Buildroot] [git commit] package/python-pycryptodomex: add host
 variant
Message-ID: <20200521133209.301E891BD3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3db1e5fbcbde9f78f9cac99614fefc243545094e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adding a host variant will allow to replace host-python-pycrypto by
host-python-pycryptodomex for the crda and optee-os packages.

From [1]:
"PyCryptodome is a fork of PyCrypto, which is not maintained any more
(the last release dates back to 2013 [2]). It exposes almost the same
API, but there are a few incompatibilities [3]."

[1] https://github.com/OP-TEE/optee_os/commit/90ad2450436fdd9fc0d28a3f92f3fbcfd89a38f0
[2] https://pypi.org/project/pycrypto/#history
[3] https://pycryptodome.readthedocs.io/en/latest/src/vs_pycrypto.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pycryptodomex/python-pycryptodomex.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-pycryptodomex/python-pycryptodomex.mk b/package/python-pycryptodomex/python-pycryptodomex.mk
index 7bc871678a..1459bb8fc3 100644
--- a/package/python-pycryptodomex/python-pycryptodomex.mk
+++ b/package/python-pycryptodomex/python-pycryptodomex.mk
@@ -15,3 +15,4 @@ PYTHON_PYCRYPTODOMEX_LICENSE = \
 PYTHON_PYCRYPTODOMEX_LICENSE_FILES = LICENSE.rst Doc/LEGAL/COPYRIGHT.pycrypto
 
 $(eval $(python-package))
+$(eval $(host-python-package))
