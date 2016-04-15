From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 15 Apr 2016 10:53:23 +0300
Subject: [Buildroot] [PATCH] shared-mime-info: disable parallel build
Message-ID: <c203666fa4b52c9f1dac0327a188d42dc5c18237.1460706803.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/f93/f93b988335320669e184e0ddc9c1a1feb072d539/
http://autobuild.buildroot.net/results/4a9/4a98d3961d59ab2f1ff7210d0f8b15fee9086219/
http://autobuild.buildroot.net/results/3a2/3a20787f66a85b0e02caf101d79aa4134f5625fe/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/shared-mime-info/shared-mime-info.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/shared-mime-info/shared-mime-info.mk b/package/shared-mime-info/shared-mime-info.mk
index a70bc9a1c49c..4588d8ec2f12 100644
--- a/package/shared-mime-info/shared-mime-info.mk
+++ b/package/shared-mime-info/shared-mime-info.mk
@@ -16,6 +16,7 @@ SHARED_MIME_INFO_CONF_OPTS = \
 HOST_SHARED_MIME_INFO_CONF_OPTS = \
 	--disable-update-mimedb \
 	--disable-default-make-check
+SHARED_MIME_INFO_MAKE = $(MAKE1)
 SHARED_MIME_INFO_LICENSE = GPLv2
 SHARED_MIME_INFO_LICENSE_FILES = COPYING
 
-- 
2.8.0.rc3
