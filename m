From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Mar 2013 19:17:07 +0100
Subject: [Buildroot] [PATCH] conntrack-tools: add missing dependencies on
	host-flex/host-bison
Message-ID: <1364235428-25080-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.org/results/fd739aa0028fac1418ed33bc0ea831b6fc17a853/build-end.log.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/conntrack-tools/conntrack-tools.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/conntrack-tools/conntrack-tools.mk b/package/conntrack-tools/conntrack-tools.mk
index a961c6f..bbf6eae 100644
--- a/package/conntrack-tools/conntrack-tools.mk
+++ b/package/conntrack-tools/conntrack-tools.mk
@@ -9,7 +9,7 @@ CONNTRACK_TOOLS_SOURCE = conntrack-tools-$(CONNTRACK_TOOLS_VERSION).tar.bz2
 CONNTRACK_TOOLS_SITE = http://www.netfilter.org/projects/conntrack-tools/files
 CONNTRACK_TOOLS_DEPENDENCIES = host-pkgconf \
 	libnetfilter_conntrack libnetfilter_cthelper libnetfilter_cttimeout \
-	libnetfilter_queue
+	libnetfilter_queue host-bison host-flex
 CONNTRACK_TOOLS_LICENSE = GPLv2
 CONNTRACK_TOOLS_LICENSE_FILES = COPYING
 
-- 
1.7.9.5
