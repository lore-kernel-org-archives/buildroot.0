From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 23 Apr 2015 00:08:41 +0200
Subject: [Buildroot] [PATCH v7 8/8] support/download: restore mandatory
	check of hashes
In-Reply-To: <1429740521-31943-1-git-send-email-arnout@mind.be>
References: <1429740521-31943-1-git-send-email-arnout@mind.be>
Message-ID: <1429740521-31943-9-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Now that custom external toolchains to be downloaded properly instruct
to not fail on a missing hash, restore the mandatory hash check for
everything else.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/download/check-hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/download/check-hash b/support/download/check-hash
index 6b0372e..c1ff53c 100755
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
2.1.4
