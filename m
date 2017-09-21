From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 Sep 2017 13:18:27 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] supervisor: security bump
	to version 3.1.4
Message-ID: <20170921111148.1B899804EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=465aa6e58700c41b2b21d3ea4170c2ec881f6525
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Fixes CVE-2017-11610 - The XML-RPC server in supervisor before 3.0.1, 3.1.x
before 3.1.4, 3.2.x before 3.2.4, and 3.3.x before 3.3.3 allows remote
authenticated users to execute arbitrary commands via a crafted XML-RPC
request, related to nested supervisord namespace lookups.

For more details, see
https://github.com/Supervisor/supervisor/issues/964

While we're at it, add hashes for the license files.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 38a1c4821a163f932793a96e036f8fe451398506)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/supervisor/supervisor.hash | 4 +++-
 package/supervisor/supervisor.mk   | 4 ++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/supervisor/supervisor.hash b/package/supervisor/supervisor.hash
index 03f337e..0ebc663 100644
--- a/package/supervisor/supervisor.hash
+++ b/package/supervisor/supervisor.hash
@@ -1,2 +1,4 @@
 # Locally calculated
-sha256 e32c546fe8d2a6e079ec4819c49fd24534d4075a58af39118d04367918b3c282  supervisor-3.1.3.tar.gz
+sha256 82f75089f719a7a3ca87f35c89a03c20fd3c0912552c96eb6fa40274ced6604e  supervisor-3.1.4.tar.gz
+sha256 a85a622378c6a892ead1ce5d0488e446e106bf014d3b763fdbc1ad1ae38ee491  COPYRIGHT.txt
+sha256 27ba0b2357ed6974d755ed53232c5ab8595622b3111bb91682708ea188cc3696  LICENSES.txt
diff --git a/package/supervisor/supervisor.mk b/package/supervisor/supervisor.mk
index 4c62b66..9b93b44 100644
--- a/package/supervisor/supervisor.mk
+++ b/package/supervisor/supervisor.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SUPERVISOR_VERSION = 3.1.3
-SUPERVISOR_SITE = http://pypi.python.org/packages/source/s/supervisor
+SUPERVISOR_VERSION = 3.1.4
+SUPERVISOR_SITE = https://pypi.python.org/packages/12/50/cd330d1a0daffbbe54803cb0c4c1ada892b5d66db08befac385122858eee
 SUPERVISOR_LICENSE = BSD-like, rdflib (http_client.py), PSF (medusa), ZPL-2.1
 SUPERVISOR_LICENSE_FILES = COPYRIGHT.txt LICENSES.txt
 SUPERVISOR_SETUP_TYPE = setuptools
