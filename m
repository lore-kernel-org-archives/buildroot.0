From: Peter Seiderer <ps.report@gmx.net>
Date: Mon,  2 Nov 2020 17:29:48 +0100
Subject: [Buildroot] [Do-Not-Apply v1] package/mosquitto: disable -fPIC
 compile option
Message-ID: <20201102162948.23132-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- add hack/patch to disable '-fPIC' compile option (for BINFMT_FLAT)

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/mosquitto/0001-disable-fpic.patch | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 package/mosquitto/0001-disable-fpic.patch

diff --git a/package/mosquitto/0001-disable-fpic.patch b/package/mosquitto/0001-disable-fpic.patch
new file mode 100644
index 0000000000..a9df4c4435
--- /dev/null
+++ b/package/mosquitto/0001-disable-fpic.patch
@@ -0,0 +1,15 @@
+diff --git a/config.mk b/config.mk
+index 80e02f9..67c2891 100644
+--- a/config.mk
++++ b/config.mk
+@@ -187,8 +187,8 @@ ifeq ($(UNAME),SunOS)
+ 		LIB_CXXFLAGS:=$(LIB_CXXFLAGS) -fPIC
+ 	endif
+ else
+-	LIB_CFLAGS:=$(LIB_CFLAGS) -fPIC
+-	LIB_CXXFLAGS:=$(LIB_CXXFLAGS) -fPIC
++	LIB_CFLAGS:=$(LIB_CFLAGS)
++	LIB_CXXFLAGS:=$(LIB_CXXFLAGS)
+ endif
+ 
+ ifneq ($(UNAME),SunOS)
-- 
2.29.1
