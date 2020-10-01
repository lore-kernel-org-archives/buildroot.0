From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu,  1 Oct 2020 17:56:18 +0200
Subject: [Buildroot] [PATCH 2/4] support/scripts/gen-bootlin-toolchains: add
 support for more PowerPC toolchains
In-Reply-To: <20201001155621.367441-1-thomas.petazzoni@bootlin.com>
References: <20201001155621.367441-1-thomas.petazzoni@bootlin.com>
Message-ID: <20201001155621.367441-2-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The 2020.08-1 release of Bootlin toolchains has brought support for 3
additional architecture variants, so let's support them.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/gen-bootlin-toolchains | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/support/scripts/gen-bootlin-toolchains b/support/scripts/gen-bootlin-toolchains
index ac1a19b3c0..a572279cf4 100755
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
-- 
2.26.2
