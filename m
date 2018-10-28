From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 28 Oct 2018 11:22:35 +0100
Subject: [Buildroot] [PATCH 1/1] openswan: security bump to version 2.6.50.1
Message-ID: <20181028102235.16817-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Fixes CVE-2018-15836 (a Bleichenbacher-style signature forgery which
  involves RSA padding attack)
- Add hash for license files

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/openswan/openswan.hash | 4 +++-
 package/openswan/openswan.mk   | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/openswan/openswan.hash b/package/openswan/openswan.hash
index 805ab948fb..02fe0f90c6 100644
--- a/package/openswan/openswan.hash
+++ b/package/openswan/openswan.hash
@@ -1,2 +1,4 @@
 # Locally calculated
-sha256 9a3eb041084c3ab125dd645c40e8f5563efe73e18a3881cf2ce3582001daafc5  openswan-2.6.50.tar.gz
+sha256 ec6bc5c7ff0b807482a95ca368bb273f35da2863c5069fbf7539e87a8bab8af4  openswan-2.6.50.1.tar.gz
+sha256 1c36ae1e7b0f6cce4b4ffe969b71f83635734804acdd38544443564b00f8783a  COPYING
+sha256 d7d012ef3be47faffba4d97a83d4986c9f4a63ac997ebf5961d33852e5f1801a  LICENSE
diff --git a/package/openswan/openswan.mk b/package/openswan/openswan.mk
index 928eb9bb6f..e3c947317e 100644
--- a/package/openswan/openswan.mk
+++ b/package/openswan/openswan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENSWAN_VERSION = 2.6.50
+OPENSWAN_VERSION = 2.6.50.1
 OPENSWAN_SITE = https://download.openswan.org/openswan
 OPENSWAN_LICENSE = GPL-2.0+, BSD-3-Clause
 OPENSWAN_LICENSE_FILES = COPYING LICENSE
-- 
2.17.1
