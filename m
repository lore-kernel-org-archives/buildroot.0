From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Aug 2015 17:17:19 +0200
Subject: [Buildroot] [git commit] apitrace: bump to version 7.0
Message-ID: <20150824152137.96BD5818B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2c1e3a1a79e600ebb863aa67a2d06f4479e28b2a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Our current apitrace version can't detect the host-python version
correctly, so if both host-python and host-python3 where installed, it
will take the last one and it will fail with an "invalid syntax" error.
The latest apitrace version has this problem solved and it detects the
host-python version correctly.

Fixes:

  http://autobuild.buildroot.net/results/22a/22a73b4ba0adcc874ecc153917ae6edcfd4d37af/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/apitrace/apitrace.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/apitrace/apitrace.mk b/package/apitrace/apitrace.mk
index b164367..28a40e4 100644
--- a/package/apitrace/apitrace.mk
+++ b/package/apitrace/apitrace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-APITRACE_VERSION = c181b7fbf4b1c3912424761fec8ac7124640543a
+APITRACE_VERSION = 7.0
 APITRACE_SITE = $(call github,apitrace,apitrace,$(APITRACE_VERSION))
 APITRACE_LICENSE = MIT
 APITRACE_LICENSE_FILES = LICENSE
