From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 12 Aug 2020 16:29:04 +0200
Subject: [Buildroot] [PATCH 6/7] support/docker: use python3-flake8
In-Reply-To: <20200812142906.598755-1-thomas.petazzoni@bootlin.com>
References: <20200812142906.598755-1-thomas.petazzoni@bootlin.com>
Message-ID: <20200812142906.598755-7-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

support/scripts/pkg-stats now uses some Python 3.x only constructs
("async" and related keywords), so we must use the Python 3.x flake8.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/docker/Dockerfile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
index 03acde85d2..8c555dcf7a 100644
--- a/support/docker/Dockerfile
+++ b/support/docker/Dockerfile
@@ -36,10 +36,10 @@ RUN apt-get install -y --no-install-recommends \
         libncurses5-dev \
         locales \
         mercurial \
-        python-flake8 \
         python-nose2 \
         python-pexpect \
         python3 \
+        python3-flake8 \
         python3-nose2 \
         python3-pexpect \
         qemu-system-arm \
-- 
2.26.2
