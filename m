From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Apr 2014 23:14:11 +0200
Subject: [Buildroot] [git commit] omniorb: force python interperter
Message-ID: <20140414211452.A3E689C601@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bd67fdee7925ed9773d60cfa22932a1f6f9542ba
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Omniorb build-system requires python2 interpreter.

By default, it looks for python program, which may fallback on the system
python interpreter in case python is disabled and python3 is enabled.

So, this patch enforces the python interpreter to python2 built by
Buildroot.

Fixes:
  http://autobuild.buildroot.org/results/b4f/b4f3a2602ba0224ac3253c4bf6ed87ec045df772/

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/omniorb/omniorb.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/omniorb/omniorb.mk b/package/omniorb/omniorb.mk
index fa2492f..5b58da5 100644
--- a/package/omniorb/omniorb.mk
+++ b/package/omniorb/omniorb.mk
@@ -14,6 +14,10 @@ OMNIORB_DEPENDENCIES = host-omniorb
 HOST_OMNIORB_DEPENDENCIES = host-python
 OMNIORB_INSTALL_TARGET = YES
 
+# omniorb is not python3 friendly, so force the python interpreter
+OMNIORB_CONF_OPT = ac_cv_path_PYTHON=$(HOST_DIR)/usr/bin/python2
+HOST_OMNIORB_CONF_OPT = ac_cv_path_PYTHON=$(HOST_DIR)/usr/bin/python2
+
 # Defaulting long double support to a safe option for the
 # mix of embedded targets, this could later be automated
 # based on checking the capability of the cross toolchain
