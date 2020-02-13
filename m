From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Feb 2020 22:03:36 +0100
Subject: [Buildroot] [git commit] package/bootstrap: security bump to
 version 4.3.1
Message-ID: <20200213205632.93BE08DF69@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bc31029617d122508cd379bc5973991e682ab5a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Fix CVE-2018-14042: In Bootstrap before 4.1.2, XSS is possible in the
  data-container property of tooltip.
- Fix an XSS vulnerability (CVE-2019-8331) in our tooltip and popover
  plugins by implementing a new HTML sanitizer
- Update indentation of hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bootstrap/bootstrap.hash | 4 ++--
 package/bootstrap/bootstrap.mk   | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/bootstrap/bootstrap.hash b/package/bootstrap/bootstrap.hash
index ed29f9c529..a9602f7e49 100644
--- a/package/bootstrap/bootstrap.hash
+++ b/package/bootstrap/bootstrap.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	75c0325fd82e29cf524e28d8be7716c216cc507ba85b087ab36868209236aa01  bootstrap-4.1.0-dist.zip
-sha256	0ce7fbe215cdf921ed87d00a374404681d5d24898589a7fe60e068d09289b4ba  css/bootstrap.css
+sha256  888ffd30b7e192381e2f6a948ca04669fdcc2ccc2ba016de00d38c8e30793323  bootstrap-4.3.1-dist.zip
+sha256  35fbb6dc3891aacaf1ffa07abec2344fdbc454aab533a2a03bcf93577eb7837b  css/bootstrap.css
diff --git a/package/bootstrap/bootstrap.mk b/package/bootstrap/bootstrap.mk
index 0699485f52..c9f6003b52 100644
--- a/package/bootstrap/bootstrap.mk
+++ b/package/bootstrap/bootstrap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BOOTSTRAP_VERSION = 4.1.0
+BOOTSTRAP_VERSION = 4.3.1
 BOOTSTRAP_SITE = https://github.com/twbs/bootstrap/releases/download/v$(BOOTSTRAP_VERSION)
 BOOTSTRAP_SOURCE = bootstrap-$(BOOTSTRAP_VERSION)-dist.zip
 BOOTSTRAP_LICENSE = MIT
@@ -12,6 +12,7 @@ BOOTSTRAP_LICENSE_FILES = css/bootstrap.css
 
 define BOOTSTRAP_EXTRACT_CMDS
 	$(UNZIP) $(BOOTSTRAP_DL_DIR)/$(BOOTSTRAP_SOURCE) -d $(@D)
+	mv $(@D)/bootstrap-$(BOOTSTRAP_VERSION)-dist/* $(@D)
 endef
 
 define BOOTSTRAP_INSTALL_TARGET_CMDS
