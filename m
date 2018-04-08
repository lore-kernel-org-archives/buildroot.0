From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 8 Apr 2018 21:26:00 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] python-webpy: needs
 hashlib support in python
Message-ID: <20180408194523.2CD8C80428@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=20703bd010329195263544a4bbbbdbb30750d308
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

webpy uses hashlib for session handling, so ensure it is available:

web/session.py:    import hashlib
web/session.py:    sha1 = hashlib.sha1

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 543b0d50fbbb552296749d0cf18443aacfc6e58d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-webpy/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-webpy/Config.in b/package/python-webpy/Config.in
index 12dbe61723..5f4df7832b 100644
--- a/package/python-webpy/Config.in
+++ b/package/python-webpy/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_WEBPY
 	bool "python-webpy"
 	depends on BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON_HASHLIB
 	help
 	  web.py is a web framework for Python that is as simple as it
 	  is powerful.
