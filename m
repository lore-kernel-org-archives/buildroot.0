From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Mar 2020 11:32:59 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/gst1-validate:
 disable introspection
Message-ID: <20200315102148.5CF1685239@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=69c4d36d839c9e2dccf5ab98f71d13b776958125
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

- disable introspection unconditionally (as already done for all
  other original gstreamer1 packages)
- use '=' instead of '+=' for the first usage of GST1_VALIDATE_CONF_OPTS

Fixes:

  http://autobuild.buildroot.net/results/e6e43fb85c71af9bb599ea8bbe2e805b392cf1ad

    GEN      GstValidate-1.0.gir
  Couldn't find include 'GstPbutils-1.0.gir' (search path: '['/nvmedata/autobuild/instance-6/output-1/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/bin/../share/gir-1.0', '/usr/share/gir-1.0', '/usr/share/gir-1.0', '/usr/share/gir-1.0', '/usr/share/gir-1.0', '/usr/share/gir-1.0', '/nvmedata/autobuild/instance-6/output-1/host/share', 'gir-1.0', '/nvmedata/autobuild/instance-6/output-1/host/share/gir-1.0', '/usr/share/gir-1.0']')
  make[5]: *** [Makefile:1612: GstValidate-1.0.gir] Error 1

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 4f64face1fdbe7a7c84fc0cf19a0958e623b5074)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-validate/gst1-validate.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/gstreamer1/gst1-validate/gst1-validate.mk b/package/gstreamer1/gst1-validate/gst1-validate.mk
index e9522e1568..8e894bf463 100644
--- a/package/gstreamer1/gst1-validate/gst1-validate.mk
+++ b/package/gstreamer1/gst1-validate/gst1-validate.mk
@@ -22,6 +22,8 @@ else
 GST1_VALIDATE_DEPENDENCIES += host-python python
 endif
 
-GST1_VALIDATE_CONF_OPTS += --disable-sphinx-doc
+GST1_VALIDATE_CONF_OPTS = \
+	--disable-introspection \
+	--disable-sphinx-doc
 
 $(eval $(autotools-package))
