From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Oct 2016 13:01:02 +0200
Subject: [Buildroot] [git commit] core/br2-external: validate even more
Message-ID: <20161016110154.3CC8C8211D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f834b0ef2146d3cbf96b126767b2699e0c7ee823
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A br2-external tree must provide external.mk and Config.in.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
