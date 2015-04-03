From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri,  3 Apr 2015 14:19:58 +0200
Subject: [Buildroot] [PATCH] support/download: quick fix to avoid breaking
	on custom toolchains
Message-ID: <1428063598-27902-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When the user selects a custom toolchain to be downloaded, there's no
hash for that toolchain, so the download fails, now that hashes are
mandatory.

Fix that by simply exiting as if there was no error, until we have a
better fix...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 support/download/check-hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/download/check-hash b/support/download/check-hash
index 3483077..67c1780 100755
--- a/support/download/check-hash
+++ b/support/download/check-hash
@@ -96,5 +96,5 @@ done <"${h_file}"
 
 if [ ${nb_checks} -eq 0 ]; then
     printf "ERROR: No hash found for %s\n" "${base}" >&2
-    exit 3
+    exit 0
 fi
-- 
1.9.1
