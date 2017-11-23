From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Thu, 23 Nov 2017 20:36:41 +0100
Subject: [Buildroot] [PATCH] shairport-sync: security bump to version 3.1.4
Message-ID: <20171123193641.6609-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The bundled tinysvcmdns library is affected by CVE-2017-12087 [1]:

> An exploitable heap overflow vulnerability exists in the tinysvcmdns library
> version 2016-07-18. A specially crafted packet can make the library overwrite
> an arbitrary amount of data on the heap with attacker controlled values. An
> attacker needs send a dns packet to trigger this vulnerability.

shairport-sync has incorparated upstreams fixes in [2].

[1] https://bugs.launchpad.net/bugs/cve/2017-12087
[2] https://github.com/mikebrady/shairport-sync/commit/1dbdf94811b8315705dbac5ba9199d417231c5d3

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/shairport-sync/shairport-sync.hash | 2 +-
 package/shairport-sync/shairport-sync.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/shairport-sync/shairport-sync.hash b/package/shairport-sync/shairport-sync.hash
index eac39138db..08f22a0cf3 100644
--- a/package/shairport-sync/shairport-sync.hash
+++ b/package/shairport-sync/shairport-sync.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  dd0484d7e8ee7631aee78c78b3762abbdba7ec3f2ee8cd6c1e361544c1414da3  shairport-sync-3.1.3.tar.gz
+sha256  4c5a2ab40ef49896f5b6e59b20df4f621ebce47ee64d8571336f59820ae66379  shairport-sync-3.1.4.tar.gz
diff --git a/package/shairport-sync/shairport-sync.mk b/package/shairport-sync/shairport-sync.mk
index acca45c121..63289d4398 100644
--- a/package/shairport-sync/shairport-sync.mk
+++ b/package/shairport-sync/shairport-sync.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SHAIRPORT_SYNC_VERSION = 3.1.3
+SHAIRPORT_SYNC_VERSION = 3.1.4
 SHAIRPORT_SYNC_SITE = $(call github,mikebrady,shairport-sync,$(SHAIRPORT_SYNC_VERSION))
 
 SHAIRPORT_SYNC_LICENSE = MIT, BSD-3-Clause
-- 
2.15.0
