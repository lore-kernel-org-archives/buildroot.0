From: Tiago Brusamarello <tiago.brusamarello@datacom.ind.br>
Date: Tue, 19 Jul 2016 09:31:11 -0300
Subject: [Buildroot] [PATCH v2 1/3] package/python-protobuf: Allow
	generating host-python-protobuf
Message-ID: <1468931473-19614-1-git-send-email-tiago.brusamarello@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This change allows use of python-protobuf libraries on the host, so
'protoc-gen-lua' plugin for the 'protoc' tool can be run on host.

Signed-off-by: Tiago Brusamarello <tiago.brusamarello@datacom.ind.br>
---
 package/python-protobuf/python-protobuf.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-protobuf/python-protobuf.mk b/package/python-protobuf/python-protobuf.mk
index d8be76d..b328e3e 100644
--- a/package/python-protobuf/python-protobuf.mk
+++ b/package/python-protobuf/python-protobuf.mk
@@ -14,3 +14,4 @@ PYTHON_PROTOBUF_SETUP_TYPE = setuptools
 PYTHON_PROTOBUF_SUBDIR = python
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
1.9.1
