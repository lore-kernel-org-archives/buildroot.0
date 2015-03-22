From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Mar 2015 16:21:06 +0100
Subject: [Buildroot] [PATCH 7/7 v3] support/download: warn when there's no
	.hash file
In-Reply-To: <cover.1427037564.git.yann.morin.1998@free.fr>
References: <cover.1427037564.git.yann.morin.1998@free.fr>
Message-ID: <a30751a9b30f9cc2b22bacffa659ef311622e180.1427037564.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Instead of silently accepting a missing .hash file, print a warning.

This can be grepped from a build log, to find packages that still have
no hash, with the long-term goal of adding hashes for all packages.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/download/check-hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/download/check-hash b/support/download/check-hash
index d200868..82cc750 100755
--- a/support/download/check-hash
+++ b/support/download/check-hash
@@ -33,6 +33,7 @@ base="${3}"
 
 # Does the hash-file exist?
 if [ -z "${h_file}" -o ! -f "${h_file}" ]; then
+    printf "WARNING: no hash file for %s\n" "${base}" >&2
     exit 0
 fi
 
-- 
1.9.1
