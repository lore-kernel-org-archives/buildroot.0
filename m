From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 25 Sep 2016 16:52:51 +0200
Subject: [Buildroot] [PATCH 04/10] core/br2-external: validate even more
In-Reply-To: <cover.1474815151.git.yann.morin.1998@free.fr>
References: <cover.1474815151.git.yann.morin.1998@free.fr>
Message-ID: <c47117733180b69082eddf1f7e9b641739614a52.1474815151.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A br2-external tree must provide external.mk and Config.in.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Romain Naour <romain.naour@openwide.fr>
---
 support/scripts/br2-external | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/support/scripts/br2-external b/support/scripts/br2-external
index 63287be..ce0eefb 100755
--- a/support/scripts/br2-external
+++ b/support/scripts/br2-external
@@ -72,6 +72,12 @@ do_validate() {
     if [ ! -d "${br2_ext}" ]; then
         error "'%s': no such file or directory\n" "${br2_ext}"
     fi
+    if [ ! -f "${br2_ext}/external.mk" ]; then
+        error "'%s/external.mk': no such file or directory\n" "${br2_ext}"
+    fi
+    if [ ! -f "${br2_ext}/Config.in" ]; then
+        error "'%s/Config.in': no such file or directory\n" "${br2_ext}"
+    fi
 
     BR2_EXT="$(cd "${br2_ext}"; pwd -P )"
 }
-- 
2.7.4
