From: Patrick Havelange <patrick.havelange@essensium.com>
Date: Fri, 14 Feb 2020 13:48:22 +0100
Subject: [Buildroot] [PATCH v2 05/10] docs/manual/adding-packages-generic:
 update for new FOO_PKGMGR value
In-Reply-To: <20200214124827.30767-1-patrick.havelange@essensium.com>
References: <20200214124827.30767-1-patrick.havelange@essensium.com>
Message-ID: <20200214124827.30767-5-patrick.havelange@essensium.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>
---
 docs/manual/adding-packages-generic.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index baa052e31c..7fd58ed9a7 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -265,6 +265,13 @@ not and can not work as people would expect it should:
     +LIBFOO_SITE=/opt/software/libfoo.tar.gz+ +
     +LIBFOO_SITE=$(TOPDIR)/../src/libfoo+
 
+* +LIBFOO_PKGMGR+ may contain the name of the second backend used
+  to complete the sources tarball. This second backend is called after
+  the first archive has been generated (e.g. git) or simply downloaded
+  (wget). It can be useful in the case where some other files are
+  needed for the build and require to be downloaded by a specific tool.
+  The value of this variable must end with a '|' (serves as a separator).
+
 * +LIBFOO_DL_OPTS+ is a space-separated list of additional options to
   pass to the downloader. Useful for retrieving documents with
   server-side checking for user logins and passwords, or to use a proxy.
-- 
2.17.1
