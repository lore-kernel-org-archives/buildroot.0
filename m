From: William A. Kennington III <wak@google.com>
Date: Wed, 16 Nov 2016 22:12:12 -0800
Subject: [Buildroot] [PATCH 1/1] python-protobuf: Allow host building
Message-ID: <20161117061212.4638-1-wak@google.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently python-protobuf does not allow the building as a host package
during a cross compile. We would like to be able to build nanopb as a
host package but can't without host-python-protobuf.

Google-Bug-Id: 28000875
Change-Id: Id09f461bda3f9c7a0bd6b5c36a6a8fa92e4adb27
Signed-off-by: William A. Kennington III <wak@google.com>
---
  package/python-protobuf/python-protobuf.mk | 1 +
  1 file changed, 1 insertion(+)

diff --git a/package/python-protobuf/python-protobuf.mk  
b/package/python-protobuf/python-protobuf.mk
index d8be76d..d46bda2 100644
--- a/package/python-protobuf/python-protobuf.mk
+++ b/package/python-protobuf/python-protobuf.mk
@@ -13,4 +13,5 @@ PYTHON_PROTOBUF_DEPENDENCIES = host-protobuf
  PYTHON_PROTOBUF_SETUP_TYPE = setuptools
  PYTHON_PROTOBUF_SUBDIR = python

+$(eval $(host-python-package))
  $(eval $(python-package))
-- 
2.10.2
