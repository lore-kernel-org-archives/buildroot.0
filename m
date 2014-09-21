From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Sep 2014 19:41:12 +0200
Subject: [Buildroot] [git commit] manual/developer guide: minor rework of
	'adding board support' section
Message-ID: <20140921174201.2DB339D488@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1ee5dccdc234d133e59d28a67286a4ec2912c058
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Minor rework of the section 'Creating your own board support', as follows:
- Rename section into 'Adding support for a particular board'
- Modify introduction
- Refer to Project-specific customizations chapter

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-board-support.txt |   13 +++++++------
 docs/manual/customize.txt            |    1 +
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/docs/manual/adding-board-support.txt b/docs/manual/adding-board-support.txt
index 88fd290..f6d74ae 100644
--- a/docs/manual/adding-board-support.txt
+++ b/docs/manual/adding-board-support.txt
@@ -1,12 +1,13 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-[[customize-store-board-support]]
-== Creating your own board support
+[[adding-board-support]]
+== Adding support for a particular board
 
-Creating your own board support in Buildroot allows users of a
-particular hardware platform to easily build a system that is known to
-work.
+Buildroot contains basic configurations for several publicly available
+hardware boards, so that users of such a board can easily build a system
+that is known to work. You are welcome to add support for other boards
+to Buildroot too.
 
 To do so, you need to create a normal Buildroot configuration that
 builds a basic system for the hardware: toolchain, kernel, bootloader,
@@ -34,4 +35,4 @@ configuration or patches specific to your target platform. To do so,
 create a directory +board/<manufacturer>+ and a subdirectory
 +board/<manufacturer>/<boardname>+. You can then store your patches
 and configurations in these directories, and reference them from the main
-Buildroot configuration.
+Buildroot configuration. Refer to xref:customize[] for more details.
diff --git a/docs/manual/customize.txt b/docs/manual/customize.txt
index 4807656..4051ae0 100644
--- a/docs/manual/customize.txt
+++ b/docs/manual/customize.txt
@@ -1,6 +1,7 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
+[[customize]]
 == Project-specific customization
 
 Typical actions you may need to perform for a given project are:
