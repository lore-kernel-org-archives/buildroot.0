From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 5 May 2013 21:01:56 +0200
Subject: [Buildroot] [git commit] audiofile: regenerate configure to fix
	issues
Message-ID: <20130505191201.B669D99B4C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5ee57c60ce6547fcb0750080e80b2a145cf91b09
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Audiofile's shipped configure script is outdated so regenerate to fix
issues like:
http://autobuild.buildroot.net/results/659fd28b0a3fa15ecd1b32e8a08dd441465459c1/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/audiofile/audiofile.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

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
 
