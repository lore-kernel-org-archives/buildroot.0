From: Sonic Zhang <sonic.adi@gmail.com>
Date: Thu, 6 Jun 2013 16:47:30 +0800
Subject: [Buildroot] [PATCH] doc: Add txt document for the new
	package-specific FLAT_STACKSIZE option.
Message-ID: <1370508450-4897-1-git-send-email-sonic.adi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Sonic Zhang <sonic.zhang@analog.com>

Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
---
 docs/manual/adding-packages-generic.txt |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index a615ae2..20d5483 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -330,6 +330,12 @@ information is (assuming the package name is +libfoo+) :
   non-opensource packages: Buildroot will not save the source code for this
   package when collecting the +legal-info+.
 
+* +LIBFOO_FLAT_STACKSIZE+ defines the stack size of an application built into
+  the FLAT binary format. The application stack size on the NOMMU architecture
+  processors can't be enlarged at run time. The default stack size for the
+  FLAT binary format is only 4k bytes. If the application consumes more stack,
+  append the required number here.
+
 The recommended way to define these variables is to use the following
 syntax:
 
-- 
1.7.0.4
