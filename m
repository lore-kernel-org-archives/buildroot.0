From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Apr 2021 16:08:55 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/python-flup:
 update dependency to python3
Message-ID: <20210426141046.1E1458110B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5358858ac905922e24db4bba2fdfc9db3b302cfd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Since version flup-1.0.3.dev20151210, flup needs Python 3. This was
apparently missed in Buildroot commit
ff0f53c04db8cc6eb5ce2eb92b7e7d1fe17297ae, which bumped flup from
1.0.3.dev-20110405 to 1.0.3.dev20161029.

Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
Signed-off-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 1d1c0925422de43348c4c0124c5405b631d7c65f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-flup/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-flup/Config.in b/package/python-flup/Config.in
index 2c21323515..f40f250163 100644
--- a/package/python-flup/Config.in
+++ b/package/python-flup/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PYTHON_FLUP
 	bool "python-flup"
-	depends on BR2_PACKAGE_PYTHON
+	depends on BR2_PACKAGE_PYTHON3
 	help
 	  flup provides of a collection of WSGI modules for Python.
 	  It allows a webserver to use scgi-mod and fastcgi-mod
