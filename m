From: Charlie Turner <cturner@igalia.com>
Date: Mon, 13 May 2019 10:44:40 +0100
Subject: [Buildroot] [PATCH 1/1] docs/manual: Clarify location of local.mk
Message-ID: <20190513094440.20712-1-cturner@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In particular, the manual was incorrect when the user had selected an
out-of-tree build.

Signed-off-by: Charlie Turner <cturner@igalia.com>
---
 docs/manual/using-buildroot-development.txt | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/docs/manual/using-buildroot-development.txt b/docs/manual/using-buildroot-development.txt
index 3389a37b39..3e0f4be287 100644
--- a/docs/manual/using-buildroot-development.txt
+++ b/docs/manual/using-buildroot-development.txt
@@ -29,9 +29,18 @@ Therefore, Buildroot provides a specific mechanism for this use case:
 the +<pkg>_OVERRIDE_SRCDIR+ mechanism. Buildroot reads an _override_
 file, which allows the user to tell Buildroot the location of the
 source for certain packages. By default this _override_ file is named
-+local.mk+ and located in the top directory of the Buildroot source
-tree, but a different location can be specified through the
-+BR2_PACKAGE_OVERRIDE_FILE+ configuration option.
++local.mk+ and is located where your Buildroot configuration file is.
+By default this location is in the top-level directory of the
+buildroot source tree.
+
+However, if the user has selected an out-of-tree build (using the
++O=path/to/my_output_dir+ make option) then you should place +local.mk+ in
++path/to/my_output_dir+, since that is where this out-of-tree build's
++.config+ file is located.
+
+If a different location than these defaults is required, it can be
+specified through the +BR2_PACKAGE_OVERRIDE_FILE+ configuration
+option.
 
 In this _override_ file, Buildroot expects to find lines of the form:
 
-- 
2.17.1
