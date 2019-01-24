From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Jan 2019 11:50:36 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] docs/manual: document the
 new get-developers -e option
Message-ID: <20190124105008.482998E395@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=15f373aff8b3e60af7b55ab30fbed444db29bbc3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Explain how this can be used with git send-email, and how git can be
configured to use it automatically.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 507d56a6be67b7b4e5c40b55c2e56ffbb4ff0386)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/contribute.txt | 22 ++++++++++++++++++++++
 docs/manual/developers.txt |  3 ++-
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
index 8bbc2b9eb7..077562133a 100644
--- a/docs/manual/contribute.txt
+++ b/docs/manual/contribute.txt
@@ -304,6 +304,28 @@ Use the output of +get-developers+ to send your patches:
 $ git send-email --to buildroot at buildroot.org --cc bob --cc alice outgoing/*
 ---------------------
 
+Alternatively, +get-developers -e+ can be used directly with the
++--cc-cmd+ argument to +git send-email+ to automatically CC the
+affected developers:
+
+---------------------
+$ git send-email --to buildroot at buildroot.org \
+      --cc-cmd './utils/get-developers -e' origin/master
+---------------------
+
++git+ can be configured to automatically do this out of the box with:
+
+---------------------
+$ git config sendemail.to buildroot at buildroot.org
+$ git config sendemail.ccCmd "$(pwd)/utils/get-developers -e"
+---------------------
+
+And then just do:
+
+---------------------
+$ git send-email origin/master
+---------------------
+
 Note that +git+ should be configured to use your mail account.
 To configure +git+, see +man git-send-email+ or google it.
 
diff --git a/docs/manual/developers.txt b/docs/manual/developers.txt
index a0a3668dbc..0da499e100 100644
--- a/docs/manual/developers.txt
+++ b/docs/manual/developers.txt
@@ -31,7 +31,8 @@ the +DEVELOPERS+ file for various tasks:
 
 - When passing one or several patches as command line argument,
   +get-developer+ will return the appropriate +git send-email+
-  command.
+  command. If the +-e+ option is passed, only the email addresses are
+  printed in a format suitable for +git send-email --cc-cmd+.
 
 - When using the +-a <arch>+ command line option, +get-developer+ will
   return the list of developers in charge of the given architecture.
