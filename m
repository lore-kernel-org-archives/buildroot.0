From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  6 Apr 2015 14:13:11 +0200
Subject: [Buildroot] [PATCH 6/6 v3] support/download: restore mandatory
	check of hashes
In-Reply-To: <cover.1428322317.git.yann.morin.1998@free.fr>
References: <cover.1428322317.git.yann.morin.1998@free.fr>
Message-ID: <21c6a4cd9d79b9279ba50426a2d0baaa1bc3f0b0.1428322317.git.yann.morin.1998@free.fr>
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
index a091c61..96d12a5 100755
--- a/support/download/check-hash
+++ b/support/download/check-hash
@@ -104,5 +104,5 @@ if [ ${nb_checks} -eq 0 ]; then
         exit 0
     fi
     printf "ERROR: No hash found for %s\n" "${base}" >&2
-    exit 0
+    exit 3
 fi
-- 
1.9.1
