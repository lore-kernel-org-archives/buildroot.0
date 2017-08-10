From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 10 Aug 2017 23:27:02 +0200
Subject: [Buildroot] [PATCH v1] gst1-validate: disable buliding
	documentation using sphinx
Message-ID: <20170810212702.12221-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix build failure in case (a non functional) sphinx documentation
system is installed on the host (reported [1] and fix tested [2]
by grunpferd at netscape.net).

Fixes:

  sphinx-build -b html -d ./doctrees   . ./html
  Error: Source directory doesn't contain a conf.py file.

[1] http://lists.busybox.net/pipermail/buildroot/2017-August/200021.html
[2] http://lists.busybox.net/pipermail/buildroot/2017-August/200033.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/gstreamer1/gst1-validate/gst1-validate.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/gstreamer1/gst1-validate/gst1-validate.mk b/package/gstreamer1/gst1-validate/gst1-validate.mk
index c5e3ec6fc9..c6e2ac9e15 100644
--- a/package/gstreamer1/gst1-validate/gst1-validate.mk
+++ b/package/gstreamer1/gst1-validate/gst1-validate.mk
@@ -18,4 +18,8 @@ GST1_VALIDATE_DEPENDENCIES = \
 	python \
 	$(if $(BR2_PACKAGE_CAIRO),cairo)
 
+# disabling building documentation in case sphinx
+# framework installed on host
+GST1_VALIDATE_CONF_ENV = ac_cv_prog_enable_sphinx_doc=no
+
 $(eval $(autotools-package))
-- 
2.11.0
