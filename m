From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Sun, 27 Oct 2019 05:54:33 -0500
Subject: [Buildroot] [PATCH v3] package/python-scapy3k: : remove 'v' prefix
Message-ID: <20191027105433.43464-1-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes version parsing for release-monitoring.org support.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

---
Changes
v2 -> v3
[Thomas
 - Fixed hash value

v1->v2
 - Fixup archive name in hashfile
---
 package/python-scapy3k/python-scapy3k.hash | 2 +-
 package/python-scapy3k/python-scapy3k.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-scapy3k/python-scapy3k.hash b/package/python-scapy3k/python-scapy3k.hash
index 36d5dfed3c..0faa3761f0 100644
--- a/package/python-scapy3k/python-scapy3k.hash
+++ b/package/python-scapy3k/python-scapy3k.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  a4c68ef2f787d82a3aec8640cac8dbab6f5b9e31ae4d89a1877efbb9150a9e25  python-scapy3k-v0.18.tar.gz
+sha256  3717913cb54f211918eccb65fad9ccf8a66bd542a4a659b2c0ac762db08eb766  python-scapy3k-0.18.tar.gz
diff --git a/package/python-scapy3k/python-scapy3k.mk b/package/python-scapy3k/python-scapy3k.mk
index e858dcc728..63f081e3fc 100644
--- a/package/python-scapy3k/python-scapy3k.mk
+++ b/package/python-scapy3k/python-scapy3k.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_SCAPY3K_VERSION = v0.18
-PYTHON_SCAPY3K_SITE = $(call github,phaethon,scapy,$(PYTHON_SCAPY3K_VERSION))
+PYTHON_SCAPY3K_VERSION = 0.18
+PYTHON_SCAPY3K_SITE = $(call github,phaethon,scapy,v$(PYTHON_SCAPY3K_VERSION))
 PYTHON_SCAPY3K_SETUP_TYPE = distutils
 PYTHON_SCAPY3K_LICENSE = GPL-2.0+
 
-- 
2.17.1
