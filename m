From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun,  5 May 2013 10:51:17 -0300
Subject: [Buildroot] [PATCH] audiofile: regenerate configure to fix issues
Message-ID: <1367761877-20061-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Audiofile's shipped configure script is outdated so regenerate to fix
issues like:
http://autobuild.buildroot.net/results/659fd28b0a3fa15ecd1b32e8a08dd441465459c1/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/audiofile/audiofile.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/audiofile/audiofile.mk b/package/audiofile/audiofile.mk
index 51173e6..e49106e 100644
--- a/package/audiofile/audiofile.mk
+++ b/package/audiofile/audiofile.mk
@@ -10,6 +10,8 @@ AUDIOFILE_INSTALL_STAGING = YES
 AUDIOFILE_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 AUDIOFILE_CONF_OPT = --disable-examples --disable-docs
 AUDIOFILE_DEPENDENCIES = host-pkgconf
+# configure is outdated and has old bugs because of it
+AUDIOFILE_AUTORECONF = YES
 AUDIOFILE_LICENSE = GPLv2+ LGPLv2.1+
 AUDIOFILE_LICENSE_FILES = COPYING COPYING.GPL
 
-- 
1.8.1.5
