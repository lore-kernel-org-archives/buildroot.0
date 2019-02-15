From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 15 Feb 2019 22:08:00 +0100
Subject: [Buildroot] [PATCHv4 5/8] Config.in: reintroduce BR2_SSH
In-Reply-To: <20190215210803.8969-1-patrickdepinguin@gmail.com>
References: <20190215210803.8969-1-patrickdepinguin@gmail.com>
Message-ID: <20190215210803.8969-5-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

The BR2_SSH command was removed in commit
db9473bf6cd7bd12aa1f9faad0a917c973c33827 ("core/download: drop the SSH
command") but will be needed again to support 'source-check' for the scp
download backend.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 Config.in               | 4 ++++
 package/pkg-download.mk | 1 +
 2 files changed, 5 insertions(+)

v4: no changes
v3: no changes

diff --git a/Config.in b/Config.in
index d58d8dc04a..91d56907fe 100644
--- a/Config.in
+++ b/Config.in
@@ -136,6 +136,10 @@ config BR2_SCP
 	string "Secure copy (scp) command"
 	default "scp"
 
+config BR2_SSH
+	string "Secure shell (ssh) command"
+	default "ssh"
+
 config BR2_HG
 	string "Mercurial (hg) command"
 	default "hg"
diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 5384fc2af4..17d1ca99ee 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -15,6 +15,7 @@ export BZR := $(call qstrip,$(BR2_BZR))
 export GIT := $(call qstrip,$(BR2_GIT))
 export HG := $(call qstrip,$(BR2_HG))
 export SCP := $(call qstrip,$(BR2_SCP))
+export SSH := $(call qstrip,$(BR2_SSH))
 export LOCALFILES := $(call qstrip,$(BR2_LOCALFILES))
 
 DL_WRAPPER = support/download/dl-wrapper
-- 
2.19.2
