From: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
Date: Sat,  8 Oct 2016 16:34:52 +0200
Subject: [Buildroot] [PATCH 3/3] package/targetcli-fb: update URL to the
	open-iscsi organization
In-Reply-To: <20161008143452.31637-1-cvubrugier@fastmail.fm>
References: <20161008143452.31637-1-cvubrugier@fastmail.fm>
Message-ID: <20161008143452.31637-3-cvubrugier@fastmail.fm>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add a comment to indicate that python-rtslib-fb and
python-configshell-fb should be bumped every time targetcli-fb is bumped
because upstream usually upgrades all of these packages at the same
time.

Signed-off-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
---
 package/targetcli-fb/Config.in       | 2 +-
 package/targetcli-fb/targetcli-fb.mk | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/targetcli-fb/Config.in b/package/targetcli-fb/Config.in
index b655938..24ff314 100644
--- a/package/targetcli-fb/Config.in
+++ b/package/targetcli-fb/Config.in
@@ -12,4 +12,4 @@ config BR2_PACKAGE_TARGETCLI_FB
 	  LIO generic SCSI target, present in 3.x Linux kernel
 	  versions.
 
-	  https://github.com/agrover/targetcli-fb
+	  https://github.com/open-iscsi/targetcli-fb
diff --git a/package/targetcli-fb/targetcli-fb.mk b/package/targetcli-fb/targetcli-fb.mk
index cf7f29f..4057592 100644
--- a/package/targetcli-fb/targetcli-fb.mk
+++ b/package/targetcli-fb/targetcli-fb.mk
@@ -4,8 +4,10 @@
 #
 ################################################################################
 
+# When upgrading the version, be sure to also upgrade python-rtslib-fb
+# and python-configshell-fb at the same time.
 TARGETCLI_FB_VERSION = v2.1.fb41
-TARGETCLI_FB_SITE = $(call github,agrover,targetcli-fb,$(TARGETCLI_FB_VERSION))
+TARGETCLI_FB_SITE = $(call github,open-iscsi,targetcli-fb,$(TARGETCLI_FB_VERSION))
 TARGETCLI_FB_LICENSE = Apache-2.0
 TARGETCLI_FB_LICENSE_FILES = COPYING
 TARGETCLI_FB_SETUP_TYPE = setuptools
-- 
2.9.3
