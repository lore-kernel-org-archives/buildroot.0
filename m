From: Olivier Schonken <olivier.schonken@gmail.com>
Date: Sat, 11 May 2013 11:42:46 +0200
Subject: [Buildroot] [PATCH 1/1] Disable building of cups driver in
	host-gutenprint
In-Reply-To: <1368259049-27252-1-git-send-email-olivier.schonken@gmail.com>
References: <1368259049-27252-1-git-send-email-olivier.schonken@gmail.com>
Message-ID: <1368265366-24526-1-git-send-email-olivier.schonken@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This should fix http://autobuild.buildroot.org/results/d2e386b50744aeda7257a0b78aafe90ba4da697c/
Because there is no host-cups package, host-gutenprint cant build the
host-cups drivers - missing includes and libs.  Host gutenprint only
built to get the xml. Thus not a loss.

Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>

Corrected absent minded mistake. Thanks Thomas
---
 package/gutenprint/gutenprint.mk |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/gutenprint/gutenprint.mk b/package/gutenprint/gutenprint.mk
index 0463771..072fada 100644
--- a/package/gutenprint/gutenprint.mk
+++ b/package/gutenprint/gutenprint.mk
@@ -51,7 +51,8 @@ HOST_GUTENPRINT_CONF_OPT = --disable-libgutenprintui2 \
                            --without-foomatic3 \
                            --disable-escputil \
                            --disable-test \
-                           --disable-testpattern
+                           --disable-testpattern \
+			   --without-cups
 
 # Needed by autoreconf
 define GUTENPRINT_CREATE_M4_DIR
-- 
1.7.10.4
