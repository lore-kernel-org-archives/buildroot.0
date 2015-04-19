From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Apr 2015 14:45:00 +0200
Subject: [Buildroot] [PATCH 7/7 v5] support/download: restore mandatory
	check of hashes
In-Reply-To: <cover.1429447148.git.yann.morin.1998@free.fr>
References: <cover.1429447148.git.yann.morin.1998@free.fr>
Message-ID: <92db9d9c24d6a53fa0db2aa7b3bff1456498d690.1429447148.git.yann.morin.1998@free.fr>
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
Cc: Arnout Vandecappelle <arnout@mind.be>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/download/check-hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/download/check-hash b/support/download/check-hash
index 1280322..383bd5c 100755
--- a/support/download/check-hash
+++ b/support/download/check-hash
@@ -106,5 +106,5 @@ if [ ${nb_checks} -eq 0 ]; then
         ;;
     esac
     printf "ERROR: No hash found for %s\n" "${base}" >&2
-    exit 0
+    exit 3
 fi
-- 
1.9.1
