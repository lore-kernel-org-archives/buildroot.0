From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Apr 2021 09:45:27 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] docs/manual: improve
 details about the Github macro
Message-ID: <20210403072557.02F6687826@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9376694a4a76bc414914950a09a8e6550f84bee8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

The Github macro example shows something that is now considered
incorrect: using v1.0 as the VERSION. This is not longer recommended
as it prevents from matching with release-monitoring.org details.

Let's update the example, and add a note to explain this in more
details.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit b7cd17eb09701c336d8fb73ee339639b61488c26)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/adding-packages-tips.txt | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/docs/manual/adding-packages-tips.txt b/docs/manual/adding-packages-tips.txt
index 95a1d599ef..6e4241d570 100644
--- a/docs/manual/adding-packages-tips.txt
+++ b/docs/manual/adding-packages-tips.txt
@@ -174,8 +174,8 @@ past, the 'github' helper function should be used as shown below.
 
 ------------------------
 # Use a tag or a full commit ID
-FOO_VERSION = v1.0
-FOO_SITE = $(call github,<user>,<package>,$(FOO_VERSION))
+FOO_VERSION = 1.0
+FOO_SITE = $(call github,<user>,<package>,v$(FOO_VERSION))
 ------------------------
 
 .Notes
@@ -184,6 +184,12 @@ FOO_SITE = $(call github,<user>,<package>,$(FOO_VERSION))
   Buildroot (e.g.: +foo-f6fb6654af62045239caed5950bc6c7971965e60.tar.gz+),
   so it is not necessary to specify it in the +.mk+ file.
 - When using a commit ID as version, you should use the full 40 hex characters.
+- When the tag contains a prefix such as +v+ in +v1.0+, then the
+  +VERSION+ variable should contain just +1.0+, and the +v+ should be
+  added directly in the +SITE+ variable, as illustrated above. This
+  ensures that the +VERSION+ variable value can be used to match
+  against http://www.release-monitoring.org/[release-monitoring.org]
+  results.
 
 If the package you wish to add does have a release section on GitHub, the
 maintainer may have uploaded a release tarball, or the release may just point
