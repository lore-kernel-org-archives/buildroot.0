From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Sun, 27 Oct 2019 01:39:29 -0500
Subject: [Buildroot] [PATCH] package/softether: remove 'v' prefix from
 github-fetched packages
Message-ID: <20191027063929.14361-1-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes version parsing for release-monitoring.org support.

Cc: Heiko Thiery <heiko.thiery@kontron.com>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

---
Thanks Heiko for the script that found this one!
---
 package/softether/softether.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/softether/softether.mk b/package/softether/softether.mk
index 1a31abd4bd..b7c6738b9a 100644
--- a/package/softether/softether.mk
+++ b/package/softether/softether.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SOFTETHER_VERSION = v4.28-9669-beta
-SOFTETHER_SITE = $(call github,SoftEtherVPN,SoftEtherVPN_stable,$(SOFTETHER_VERSION))
+SOFTETHER_VERSION = 4.28-9669-beta
+SOFTETHER_SITE = $(call github,SoftEtherVPN,SoftEtherVPN_stable,v$(SOFTETHER_VERSION))
 SOFTETHER_LICENSE = GPL-2.0
 SOFTETHER_LICENSE_FILES = LICENSE
 SOFTETHER_DEPENDENCIES = host-pkgconf host-softether libopenssl readline
-- 
2.17.1
