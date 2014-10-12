From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Oct 2014 07:46:29 +0200
Subject: [Buildroot] [git commit] libxslt: add upstream patch to fix
	--maxvars handling
Message-ID: <20141012072420.65930B1909@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f1ade06b84fcfb4623e22299ef3ce86b77e78a25
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Needed to build the manual in PDF format if the host doesn't have a fixed
xsltproc.

(by make host-libxsltproc; PATH=output/host/usr/bin:$PATH make manual-pdf)

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../libxslt/0001-Make-maxvars-option-work.patch    |   30 ++++++++++++++++++++
 1 files changed, 30 insertions(+), 0 deletions(-)

diff --git a/package/libxslt/0001-Make-maxvars-option-work.patch b/package/libxslt/0001-Make-maxvars-option-work.patch
new file mode 100644
index 0000000..d37cf62
--- /dev/null
+++ b/package/libxslt/0001-Make-maxvars-option-work.patch
@@ -0,0 +1,30 @@
+From 5af7ad745323004984287e48b42712e7305de35c Mon Sep 17 00:00:00 2001
+From: Per Hedeland <per@hedeland.org>
+Date: Fri, 13 Dec 2013 14:43:06 +0100
+Subject: [PATCH] Make --maxvars option work
+
+From upstream: https://gitorious.org/libxslt/libxslt/commit/5af7ad745323004984287e48b42
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ xsltproc/xsltproc.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/xsltproc/xsltproc.c b/xsltproc/xsltproc.c
+index b22df37..66d8cbb 100644
+--- a/xsltproc/xsltproc.c
++++ b/xsltproc/xsltproc.c
+@@ -803,6 +803,10 @@ main(int argc, char **argv)
+             (!strcmp(argv[i], "--maxdepth"))) {
+             i++;
+             continue;
++        } else if ((!strcmp(argv[i], "-maxvars")) ||
++            (!strcmp(argv[i], "--maxvars"))) {
++            i++;
++            continue;
+         } else if ((!strcmp(argv[i], "-maxparserdepth")) ||
+             (!strcmp(argv[i], "--maxparserdepth"))) {
+             i++;
+-- 
+2.1.0
+
