From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Oct 2015 22:37:11 +0200
Subject: [Buildroot] [git commit] jq: disable maintainer mode
Message-ID: <20151021203813.1B91181EC9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d1597ffb2c44273b793adc7f28dbbcb1b9a30ab3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since version 1.5, maintainer mode is enabled by default. We don't need
this, and is in particular problematic because it requires bison 3.0.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/jq/jq.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/jq/jq.mk b/package/jq/jq.mk
index dd13276..8053e39 100644
--- a/package/jq/jq.mk
+++ b/package/jq/jq.mk
@@ -12,4 +12,7 @@ JQ_LICENSE_FILES = COPYING
 # uses c99 specific features
 JQ_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=c99"
 
+# jq explicitly enables maintainer mode, which we don't need/want
+JQ_CONF_OPTS += --disable-maintainer-mode
+
 $(eval $(autotools-package))
