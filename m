From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Tue, 8 Oct 2013 16:03:25 -0500
Subject: [Buildroot] [PATCH 1/1] manual: update review process and patchwork
Message-ID: <1381266205-29322-1-git-send-email-rjbarnet@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adding more documentaiton based on discussion from the mailing list
in regards the buildroot review process and how patchworks can be
used to pull in patches for testing purposes.

Mailing list discussion:
http://lists.busybox.net/pipermail/buildroot/2013-September/078170.html

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
---
 docs/manual/contribute.txt   |   12 +++++++++++-
 docs/manual/get-involved.txt |   37 ++++++++++++++++++++++++++++++++++---
 2 files changed, 45 insertions(+), 4 deletions(-)

diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
index 2b2783d..fa0aa13 100644
--- a/docs/manual/contribute.txt
+++ b/docs/manual/contribute.txt
@@ -132,9 +132,15 @@ $ git format-patch --subject-prefix "PATCH v4" \
 Reviewing/Testing patches
 -------------------------
 
+The review process for new patches is done over the mailing list. Once
+a patch is submitted to the mailing list, other developers will provide
+feedback to the patch via emails sent through the mailing list.
+
 In the review process, do not hesitate to respond to patch submissions
 for remarks, suggestions or anything that will help everyone to
-understand the patches and make them better.
+understand the patches and make them better. Please use internet
+style replies in plain text emails when responding to patch
+submissions.
 
 Some tags are used to help following the state of any patch posted on
 the mailing-list:
@@ -144,6 +150,10 @@ Acked-by:: Indicates that the patch can be committed.
 Tested-by:: Indicates that the patch has been tested. It is useful
   but not necessary to add a comment about what has been tested.
 
+The patchworks website can be used to pull in patches for testing
+purposes. Please see xref:apply-patches-patchwork[] for more
+information on using the patchworks website to apply patches.
+
 Autobuild
 ---------
 
diff --git a/docs/manual/get-involved.txt b/docs/manual/get-involved.txt
index 8515d34..09b2314 100644
--- a/docs/manual/get-involved.txt
+++ b/docs/manual/get-involved.txt
@@ -55,11 +55,42 @@ using a code sharing website.
 Patchwork
 ---------
 
-The Buildroot patch management interface is at
+Patchwork is a web-based patch tracking system designed to facilitate
+the contribution and management of contributions to an open-source
+project. Patches that have been sent to a mailing list are \'caught' by
+the system, and appear on a web page. Any comments posted that
+reference the patch are appended to the patch page too. For more
+information on Patchwork see
+http://jk.ozlabs.org/projects/patchwork[].
+
+Buildroot utilizes this tool to ensure patches aren't missed
+along with exposing all patches and their corresponding review comments
+in a clean web interface.
+
+The Buildroot patch management interface is available at
 http://patchwork.buildroot.org[].
 
-All patches and comments sent through the mailing list are
-automatically indexed in http://patchwork.buildroot.org[patchwork].
+[[apply-patches-patchwork]]
+Applying Patches from Patchwork
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+The patchwork website can be used to pull patches into a developer's
+local git repository for testing purpose.
+
+When browsing patches in the patchwork management interface, a +mbox+
+link is provided at the top of the page. Copy this link address and
+run the following commands:
+
+---------------------
+$ git checkout -b <test-branch-name>
+$ wget -O - <mbox-url> | git am
+---------------------
+
+Another option for applying patches is to create a bundle. A bundle is
+a set of patches that you can group together using the patchwork
+interface. Once the bundle is created and the bundle is made public,
+you can copy the +mbox+ link for the bundle and apply the bundle
+using the above commands.
 
 [[bugtracker]]
 Bugtracker
-- 
1.7.1
