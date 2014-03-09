From: Samuel Martin <s.martin49@gmail.com>
Date: Sun,  9 Mar 2014 19:54:35 +0100
Subject: [Buildroot] [PATCH] pkg-download: update the github helper
Message-ID: <1394391275-27735-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Once again, github updates the source download url.
Even if only the zip archive link is advertised on the repositories'
page, the *.tar.gz is still available.

It is worthy to note that the tarball's content differs depending if
it has been fetched from the former and the new url (the root directory
name changes).

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/pkg-download.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 85842de..192b9e0 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -56,7 +56,7 @@ notdomain=$(patsubst $(call domain,$(1),$(2))$(call domainseparator,$(2))%,%,$(c
 domainseparator=$(if $(1),$(1),/)
 
 # github(user,package,version): returns site of github repository
-github = https://github.com/$(1)/$(2)/tarball/$(3)
+github = https://github.com/$(1)/$(2)/archive/$(3)
 
 ################################################################################
 # The DOWNLOAD_* helpers are in charge of getting a working copy
-- 
1.9.0
