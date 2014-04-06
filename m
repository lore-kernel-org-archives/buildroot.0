From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Apr 2014 14:32:37 +0200
Subject: [Buildroot] [git commit] pkg-download: update the github helper
Message-ID: <20140406123344.59E6B9C5C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=507d6a637ba51e9799acd4c8a0b614fc9842b4e2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Once again, github updates the source download url.
Even if only the zip archive link is advertised on the repositories'
page, the *.tar.gz is still available.

It is worthy to note that the tarball's content differs depending if
it has been fetched from the former and the new url (the root directory
name changes).

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-download.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
