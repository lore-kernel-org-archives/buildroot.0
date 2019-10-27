From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 27 Oct 2019 08:41:14 +0100
Subject: [Buildroot] [PATCH 1/1] package/supervisor: fix license
Message-ID: <20191027074114.29195-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

trackrefs module has been removed since version 4.0.0 and
https://github.com/Supervisor/supervisor/commit/6c1c0adadaf190e77dc017a8a40c90249f0a055b

Since this removal, supervisor does not contain any ZPL-2.1 code
anymore, see
https://github.com/Supervisor/supervisor/commit/abff4cd872d2cbd1b999c1f439fdf83b4695cc6c

Fixes:
 - http://autobuild.buildroot.org/results/540303f884d9f891f58c660da22e2273956a92a6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/supervisor/supervisor.hash | 4 ++--
 package/supervisor/supervisor.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/supervisor/supervisor.hash b/package/supervisor/supervisor.hash
index 95d7dfb76b..98a03aa1be 100644
--- a/package/supervisor/supervisor.hash
+++ b/package/supervisor/supervisor.hash
@@ -1,4 +1,4 @@
 # Locally calculated
 sha256 2dc86fe0476e945e61483d614ceb2cf4f93b95282eb243bdf792621994360383  supervisor-4.1.0.tar.gz
-sha256 a85a622378c6a892ead1ce5d0488e446e106bf014d3b763fdbc1ad1ae38ee491  COPYRIGHT.txt
-sha256 27ba0b2357ed6974d755ed53232c5ab8595622b3111bb91682708ea188cc3696  LICENSES.txt
+sha256 7b8dbd54ab1543b07b2fc5f6f5ab50d89d26c1c4952af93a579d8c52c56b8de4  COPYRIGHT.txt
+sha256 4c35fda9f70bb7883fd94e5a4d5addd88ad1a6d5d15e21c9d17c4d96fdc5e369  LICENSES.txt
diff --git a/package/supervisor/supervisor.mk b/package/supervisor/supervisor.mk
index 6cf5163096..e99a9b18ce 100644
--- a/package/supervisor/supervisor.mk
+++ b/package/supervisor/supervisor.mk
@@ -6,7 +6,7 @@
 
 SUPERVISOR_VERSION = 4.1.0
 SUPERVISOR_SITE = https://files.pythonhosted.org/packages/de/87/ee1ad8fa533a4b5f2c7623f4a2b585d3c1947af7bed8e65bc7772274320e
-SUPERVISOR_LICENSE = BSD-like, rdflib (http_client.py), PSF (medusa), ZPL-2.1
+SUPERVISOR_LICENSE = BSD-like, rdflib (http_client.py), PSF (medusa)
 SUPERVISOR_LICENSE_FILES = COPYRIGHT.txt LICENSES.txt
 SUPERVISOR_SETUP_TYPE = setuptools
 
-- 
2.23.0
