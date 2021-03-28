From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 28 Mar 2021 21:13:48 +0200
Subject: [Buildroot] [PATCH 1/7] docs/manual: improve details about the
 Github macro
In-Reply-To: <20210328191355.778786-1-thomas.petazzoni@bootlin.com>
References: <20210328191355.778786-1-thomas.petazzoni@bootlin.com>
Message-ID: <20210328191355.778786-2-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Github macro example shows something that is now considered
incorrect: using v1.0 as the VERSION. This is not longer recommended
as it prevents from matching with release-monitoring.org details.

Let's update the example, and add a note to explain this in more
details.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
-- 
2.30.2
