From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 6 Feb 2019 17:19:53 +0100
Subject: [Buildroot] [git commit] package/python-pyzmq: enable draft APIs
 when supported by ZeroMQ
Message-ID: <20190206162018.9A88487F62@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1c1d6b8248d95f398d50d6b05db1050b4e3fde0a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This doesn't introduce a new config flag, instead it just automatically enables
draft support if it's configured in the zeromq package itself.

Signed-off-by: Lionel Flandrin <lionel@svkt.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
