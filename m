From: Nicolas Carrier <nicolas.carrier@orolia.com>
Date: Sun, 27 Oct 2019 13:36:53 +0000
Subject: [Buildroot] [PATCH v3 2/4] support/docker: add python3
In-Reply-To: <20191027133630.7706-1-nicolas.carrier@orolia.com>
References: <20191027133630.7706-1-nicolas.carrier@orolia.com>
Message-ID: <20191027133630.7706-2-nicolas.carrier@orolia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Ricardo Martincoski <ricardo.martincoski@gmail.com>

The test infra will soon be converted to Python 3 only.
So add the interpreter and also the Python 3 variant of modules nose2
and pexpect to the docker image used to run runtime tests.

Keep the Python 2 variant of those modules to allow a gradual
transition.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Nicolas Carrier <nicolas.carrier@orolia.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>

---

This is a re-submit of Ricardo Martincoski's original patch since it's a
requirement the next patch (from Ricardo) which itself is required for the last
patch of the series, which relies on python 3.6+ features (notably f-strings).

The 3 first patches of Ricardo's original series have already been applied, the
two resubmitted here are the only ones left.

---
 support/docker/Dockerfile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
index 36cd3b28a4..03acde85d2 100644
--- a/support/docker/Dockerfile
+++ b/support/docker/Dockerfile
@@ -39,6 +39,9 @@ RUN apt-get install -y --no-install-recommends \
         python-flake8 \
         python-nose2 \
         python-pexpect \
+        python3 \
+        python3-nose2 \
+        python3-pexpect \
         qemu-system-arm \
         qemu-system-x86 \
         rsync \
-- 
2.20.1
