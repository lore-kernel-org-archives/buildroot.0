From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 25 Mar 2013 19:32:58 +0100
Subject: [Buildroot] [git commit] conntrack-tools: add missing dependencies
	on host-flex/host-bison
Message-ID: <20130325191506.4461E9B2D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fe2bcc9ea903365d9c8f86ed5785cbd9f6228899
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.org/results/fd739aa0028fac1418ed33bc0ea831b6fc17a853/build-end.log.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/conntrack-tools/conntrack-tools.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
 
