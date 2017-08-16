From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Aug 2017 23:15:01 +0200
Subject: [Buildroot] [git commit] gst1-validate: disable building
	documentation using sphinx
Message-ID: <20170816210907.EBA9A821DA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bcca31aff6d0a65f680f6fb19cce458a7a4980a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix a build failure in case (a non functional) sphinx documentation
system is installed on the host (reported [1] and fix tested [2]
by grunpferd at netscape.net).

Fixes:

  sphinx-build -b html -d ./doctrees   . ./html
  Error: Source directory doesn't contain a conf.py file.

[1] http://lists.busybox.net/pipermail/buildroot/2017-August/200021.html
[2] http://lists.busybox.net/pipermail/buildroot/2017-August/200267.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Cc: grunpferd at netscape.net
[Arnout:
 - use --disable-sphinx-doc instead of a cv variable
 - remove the comment, it speaks for itself]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gstreamer1/gst1-validate/gst1-validate.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gstreamer1/gst1-validate/gst1-validate.mk b/package/gstreamer1/gst1-validate/gst1-validate.mk
index c5e3ec6..31b01ef 100644
--- a/package/gstreamer1/gst1-validate/gst1-validate.mk
+++ b/package/gstreamer1/gst1-validate/gst1-validate.mk
@@ -18,4 +18,6 @@ GST1_VALIDATE_DEPENDENCIES = \
 	python \
 	$(if $(BR2_PACKAGE_CAIRO),cairo)
 
+GST1_VALIDATE_CONF_OPTS += --disable-sphinx-doc
+
 $(eval $(autotools-package))
