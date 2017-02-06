From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon,  6 Feb 2017 22:59:33 +0100
Subject: [Buildroot] [PATCH] docs/manual: centralize recommendations about
	BR2_DL_DIR
Message-ID: <1486418373-26759-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We currently have two places where we recommend where BR2_DL_DIR
should be set: "Environment variables" and "Location of downloaded
packages". The former recommends setting BR2_DL_DIR in the .config,
the latter kind of endorses using ~/.bashrc.

We prefer suggesting the ~/.bashrc way since it avoids downloading the
same file multiple times, and anyway ot's wise to have all the details
in a unique place. So remove the .config suggestion from "Environment
variables" and let it just point to "Location of downloaded packages".

Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 docs/manual/common-usage.txt      | 5 +++--
 docs/manual/download-location.txt | 2 ++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/docs/manual/common-usage.txt b/docs/manual/common-usage.txt
index 7602260bab4f..8dd99a6dacc3 100644
--- a/docs/manual/common-usage.txt
+++ b/docs/manual/common-usage.txt
@@ -91,8 +91,9 @@ to +make+ or set in the environment:
   Buildroot stores/retrieves downloaded files
   +
   Note that the Buildroot download directory can also be set from the
-  configuration interface, so through the Buildroot +.config+ file; this
-  is the recommended way of setting it.
+  configuration interface, so through the Buildroot +.config+ file. See
+  xref:download-location[] for more details on how you can set the download
+  directory.
 * +BR2_GRAPH_ALT+, if set and non-empty, to use an alternate color-scheme in
   build-time graphs
 * +BR2_GRAPH_OUT+ to set the filetype of generated graphs, either +pdf+ (the
diff --git a/docs/manual/download-location.txt b/docs/manual/download-location.txt
index 0b53f54ca14e..d485df94f59a 100644
--- a/docs/manual/download-location.txt
+++ b/docs/manual/download-location.txt
@@ -1,6 +1,8 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
+[[download-location]]
+
 ==== Location of downloaded packages
 
 The various tarballs that are downloaded by Buildroot are all stored
-- 
2.7.4
