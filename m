From: Lionel Flandrin <lionel@svkt.org>
Date: Tue,  5 Feb 2019 11:28:14 +0100
Subject: [Buildroot] [PATCH 2/2] package/python-pyzmq: Enable draft APIs
 when supported by ZeroMQ
In-Reply-To: <20190205102814.11288-1-lionel@svkt.org>
References: <20190205102814.11288-1-lionel@svkt.org>
Message-ID: <20190205102814.11288-2-lionel@svkt.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This doesn't introduce a new config flag, instead it just automatically enables
draft support if it's configured in the zeromq package itself.

Signed-off-by: Lionel Flandrin <lionel@svkt.org>
---
 package/python-pyzmq/python-pyzmq.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/python-pyzmq/python-pyzmq.mk b/package/python-pyzmq/python-pyzmq.mk
index 1f7cb5d613..b977cca927 100644
--- a/package/python-pyzmq/python-pyzmq.mk
+++ b/package/python-pyzmq/python-pyzmq.mk
@@ -22,4 +22,8 @@ endef
 
 PYTHON_PYZMQ_POST_PATCH_HOOKS += PYTHON_PYZMQ_PATCH_ZEROMQ_VERSION
 
+ifeq ($(BR2_PACKAGE_ZEROMQ_DRAFTS),y)
+PYTHON_PYZMQ_BUILD_OPTS += --enable-drafts
+endif
+
 $(eval $(python-package))
-- 
2.20.1
