From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 14 Oct 2020 23:57:54 +0200
Subject: [Buildroot] [git commit] support/scripts/gen-bootlin-toolchains:
 add support for more PowerPC toolchains
Message-ID: <20201014215744.28D558762B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1f3e5e6b3dfa641b59abf73fce2ee7a77dd56705
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The 2020.08-1 release of Bootlin toolchains has brought support for 3
additional architecture variants, so let's support them.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/gen-bootlin-toolchains | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/support/scripts/gen-bootlin-toolchains b/support/scripts/gen-bootlin-toolchains
index 62cdb48478..fce75c51c2 100755
--- a/support/scripts/gen-bootlin-toolchains
+++ b/support/scripts/gen-bootlin-toolchains
@@ -123,6 +123,16 @@ arches = {
         'conditions': ['BR2_or1k'],
         'prefix': 'or1k',
     },
+    'powerpc-440fp': {
+        # Not sure it could be used by other powerpc variants?
+        'conditions': ['BR2_powerpc', 'BR2_powerpc_440fp'],
+        'prefix': 'powerpc',
+    },
+    'powerpc-e300c3': {
+        # Not sure it could be used by other powerpc variants?
+        'conditions': ['BR2_powerpc', 'BR2_powerpc_e300c3'],
+        'prefix': 'powerpc',
+    },
     'powerpc-e500mc': {
         # Not sure it could be used by other powerpc variants?
         'conditions': ['BR2_powerpc', 'BR2_powerpc_e500mc'],
@@ -132,6 +142,10 @@ arches = {
         'conditions': ['BR2_powerpc64', 'BR2_powerpc_e5500'],
         'prefix': 'powerpc64',
     },
+    'powerpc64-e6500': {
+        'conditions': ['BR2_powerpc64', 'BR2_powerpc_e6500'],
+        'prefix': 'powerpc64',
+    },
     'powerpc64-power8': {
         'conditions': ['BR2_powerpc64', 'BR2_powerpc_power8'],
         'prefix': 'powerpc64',
