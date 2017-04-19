From: James Balean <james@balean.com.au>
Date: Tue, 18 Apr 2017 23:00:39 -0500
Subject: [Buildroot] [PATCH] Restore .git directory in git package downloads
Message-ID: <1492574439-4617-1-git-send-email-james@balean.com.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removing the .git directory during package download and caching prevents
Builroot users from making and testing changes to external software
packages using Buildroot. This patch enables users to commit locally,
make patches and contribute back to the projects they are using.

Signed-off-by: James Balean <james@balean.com.au>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/download/git | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/support/download/git b/support/download/git
index 056057c..a7f307c 100755
--- a/support/download/git
+++ b/support/download/git
@@ -85,10 +85,6 @@ if [ ${recurse} -eq 1 ]; then
     _git submodule update --init --recursive
 fi
 
-# We do not need the .git dir; we keep other .git files, in case they
-# are the only files in their directory.
-rm -rf .git
-
 popd >/dev/null
 
 # Generate the archive, sort with the C locale so that it is reproducible
-- 
2.7.4
