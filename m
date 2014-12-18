From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 18 Dec 2014 22:59:57 +0100
Subject: [Buildroot] [git commit] package/snappy: add dependency on
	host-pkgconf
Message-ID: <20141218220056.8FCA27F925@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3a56d1b4a9fd8fa6fb8bd701ea065bb03079ef96
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Snappy doesn't configure without host pkg-config, causing this totally
unhelpful diagnostic from autoconf:

  configure.ac:42: error: possibly undefined macro: AC_DEFINE
        If this token and others are legitimate, please use m4_pattern_allow.
        See the Autoconf documentation.
  configure.ac:44: error: possibly undefined macro: AC_MSG_FAILURE

So add host-pkgconf to the package's DEPENDENCIES list.

Signed-off-by: Steve James <ste@junkomatic.net>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/snappy/snappy.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/snappy/snappy.mk b/package/snappy/snappy.mk
index fd89325..6bda7ce 100644
--- a/package/snappy/snappy.mk
+++ b/package/snappy/snappy.mk
@@ -10,6 +10,7 @@ SNAPPY_LICENSE = BSD-3c
 SNAPPY_LICENSE_FILES = COPYING
 # from git
 SNAPPY_AUTORECONF = YES
+SNAPPY_DEPENDENCIES = host-pkgconf
 SNAPPY_INSTALL_STAGING = YES
 
 $(eval $(autotools-package))
