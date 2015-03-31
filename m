From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  1 Apr 2015 00:15:07 +0200
Subject: [Buildroot] [PATCH 7/7 v4] support/download: warn when there's no
	.hash file
In-Reply-To: <cover.1427840060.git.yann.morin.1998@free.fr>
References: <cover.1427840060.git.yann.morin.1998@free.fr>
Message-ID: <4a4bae18e06b5e4205eb64c1384485c920325aa3.1427840060.git.yann.morin.1998@free.fr>
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
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
---
 support/download/check-hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/download/check-hash b/support/download/check-hash
index 13a76b8..3483077 100755
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
