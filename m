From: Patrick Williams <iawillia@us.ibm.com>
Date: Thu, 13 Nov 2014 13:48:00 -0600
Subject: [Buildroot] [PATCH] Update github helper URL.
Message-ID: <1415908080-19350-1-git-send-email-iawillia@us.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Github changed the URL syntax from 'archive' back to 'tarball'.

Signed-off-by: Patrick Williams <iawillia@us.ibm.com>
---
 package/pkg-download.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 4cfb913..03907f1 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -56,7 +56,7 @@ notdomain=$(patsubst $(call domain,$(1),$(2))$(call domainseparator,$(2))%,%,$(c
 domainseparator=$(if $(1),$(1),/)
 
 # github(user,package,version): returns site of GitHub repository
-github = https://github.com/$(1)/$(2)/archive/$(3)
+github = https://github.com/$(1)/$(2)/tarball/$(3)
 
 ################################################################################
 # The DOWNLOAD_* helpers are in charge of getting a working copy
-- 
2.1.1
