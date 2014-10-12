From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 12 Oct 2014 21:39:18 +0200
Subject: [Buildroot] [PATCH v3] mongrel2: Add comments to avoid use of
	github call
Message-ID: <1413142758-3356-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As the comment says, we don't want to uses the github helper, as we
would end up with a generated tarball, which is not the same one as the
one linked with the releases.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
v2 -> v3:
   - fix typo
v1 -> v2:
   - Do not change the URL but add a comments instead
---
 package/mongrel2/mongrel2.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/mongrel2/mongrel2.mk b/package/mongrel2/mongrel2.mk
index 14e3a80..23cec50 100644
--- a/package/mongrel2/mongrel2.mk
+++ b/package/mongrel2/mongrel2.mk
@@ -5,6 +5,8 @@
 ################################################################################
 
 MONGREL2_VERSION = v1.9.1
+# Do not use the github helper here, the generated tarball is *NOT* the same
+# as the one uploaded by upstream for the release.
 MONGREL2_SITE = https://github.com/zedshaw/mongrel2/releases/download/$(MONGREL2_VERSION)
 MONGREL2_LICENSE = BSD-3c
 MONGREL2_LICENSE_FILES = LICENSE
-- 
2.1.1
