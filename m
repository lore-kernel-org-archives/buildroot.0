From: Simon Rowe <simon.rowe@citrix.com>
Date: Wed, 20 Nov 2019 13:09:11 +0000
Subject: [Buildroot] [PATCH 1/1] package/tini: compile executable static
Message-ID: <1574255351-23642-1-git-send-email-simon.rowe@citrix.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tini is intended to be used as the init process within containers and
therefore needs to be independent of the C runtime library.

Signed-off-by: Simon Rowe <simon.rowe@citrix.com>
---
 package/tini/tini.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tini/tini.mk b/package/tini/tini.mk
index 5dd9877..986e612 100644
--- a/package/tini/tini.mk
+++ b/package/tini/tini.mk
@@ -10,6 +10,7 @@ TINI_LICENSE = MIT
 TINI_LICENSE_FILES = LICENSE
 
 TINI_CFLAGS = $(TARGET_CFLAGS) \
+	-static \
 	-DTINI_VERSION=\"$(TINI_VERSION)\" \
 	-DTINI_GIT=\"\"
 
-- 
1.8.3.1
