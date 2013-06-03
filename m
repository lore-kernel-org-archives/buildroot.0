From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 3 Jun 2013 23:17:02 +0200
Subject: [Buildroot] [git commit] logrotate: workaround wget issue with
	wildcard ssl certificates
Message-ID: <20130603212030.3D5659A8A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4486455c5d31eaab6367160648f487b27f4c7621
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/815/815e2759f4961805d768efe79f0d83d13b16e706/build-end.log

Certain wget versions dislike downloading from fedorahosted.org which
provides a SSL certificate for *.fedorahosted.org. Work around it by
instead downloading from www.fedorahosted.org instead.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/logrotate/logrotate.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/logrotate/logrotate.mk b/package/logrotate/logrotate.mk
index c920b46..82dde39 100644
--- a/package/logrotate/logrotate.mk
+++ b/package/logrotate/logrotate.mk
@@ -5,7 +5,7 @@
 #############################################################
 LOGROTATE_VERSION = 3.8.4
 LOGROTATE_SOURCE = logrotate-$(LOGROTATE_VERSION).tar.gz
-LOGROTATE_SITE = https://fedorahosted.org/releases/l/o/logrotate/
+LOGROTATE_SITE = https://www.fedorahosted.org/releases/l/o/logrotate/
 LOGROTATE_LICENSE = GPLv2+
 LOGROTATE_LICENSE_FILES = COPYING
 
