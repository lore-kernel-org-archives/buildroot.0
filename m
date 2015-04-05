From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  5 Apr 2015 22:56:22 +0200
Subject: [Buildroot] [PATCH 3/4 v2] support/download: restore mandatory
	check of hashes
In-Reply-To: <cover.1428267362.git.yann.morin.1998@free.fr>
References: <cover.1428267362.git.yann.morin.1998@free.fr>
Message-ID: <b8c2a622aad5694425ff17f8c481a374feac0b8c.1428267362.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that custom external toolchains to be downloaded proprely instruct
to not fail on a missing hash, restore the mandatory hash check for
everything else.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 support/download/check-hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/download/check-hash b/support/download/check-hash
index 1276290..c24d26b 100755
--- a/support/download/check-hash
+++ b/support/download/check-hash
@@ -100,5 +100,5 @@ if [ ${nb_checks} -eq 0 ]; then
         exit 0
     fi
     printf "ERROR: No hash found for %s\n" "${base}" >&2
-    exit 0
+    exit 3
 fi
-- 
1.9.1
