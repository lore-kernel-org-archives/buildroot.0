From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 24 Aug 2015 09:54:50 +0100
Subject: [Buildroot] [PATCH] apitrace: bump to version 7.0
Message-ID: <1440406490-15855-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Our current apitrace version can't detect the host-python version
correctly, so if both host-python and host-python3 where installed, it
will take the last one and it will fail with an "invalid syntax" error.
The latest apitrace version has this problem solved and it detects the
host-python version correctly.

Fixes:

  http://autobuild.buildroot.net/results/22a/22a73b4ba0adcc874ecc153917ae6edcfd4d37af/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
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
-- 
1.7.1
