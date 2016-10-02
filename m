From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  2 Oct 2016 11:09:53 +0200
Subject: [Buildroot] [PATCH 04/10] core/br2-external: validate even more
In-Reply-To: <cover.1475399381.git.yann.morin.1998@free.fr>
References: <cover.1475399381.git.yann.morin.1998@free.fr>
Message-ID: <9dcd8625d6ff5bc65c897146c6f5cce29cba85f6.1475399381.git.yann.morin.1998@free.fr>
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
index b2bff64..1a0c743 100755
--- a/support/scripts/br2-external
+++ b/support/scripts/br2-external
@@ -67,6 +67,12 @@ do_validate() {
     if [ ! -r "${br2_ext}" -o ! -x "${br2_ext}" ]; then
         error "'%s': permission denied\n" "${br2_ext}"
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
