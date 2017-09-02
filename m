From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 02 Sep 2017 13:13:45 -0000
Subject: [Buildroot] [git commit] package/jq: install to staging
Message-ID: <20170902130617.739E0818F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=968fd3d8f95e61f02bb3e1a2216e2190cffa5357
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Install the libraries to staging to be usable by other packages.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/jq/jq.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/jq/jq.mk b/package/jq/jq.mk
index 9a094ba..aecdba2 100644
--- a/package/jq/jq.mk
+++ b/package/jq/jq.mk
@@ -8,6 +8,7 @@ JQ_VERSION = 1.5
 JQ_SITE = https://github.com/stedolan/jq/releases/download/jq-$(JQ_VERSION)
 JQ_LICENSE = MIT (code), CC-BY-3.0 (documentation)
 JQ_LICENSE_FILES = COPYING
+JQ_INSTALL_STAGING = YES
 
 # uses c99 specific features
 JQ_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=c99"
