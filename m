From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 8 Oct 2014 19:58:25 +0200
Subject: [Buildroot] [git commit] quota: don't try to strip binaries during
	installation
Message-ID: <20141008180330.193F5B16BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=61a7a3a2f7041723c76ddb185486de420e94d079
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

quota strips binaries during installation by default using 'install -s', but
that uses the host strip so doesn't work for cross compilation, and
stripping or not is handled globally in Buildroot during target-finalize, so
disable it here.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/quota/quota.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/quota/quota.mk b/package/quota/quota.mk
index 5011c0f..0e7a2b0 100644
--- a/package/quota/quota.mk
+++ b/package/quota/quota.mk
@@ -9,6 +9,7 @@ QUOTA_SITE = http://downloads.sourceforge.net/project/linuxquota/quota-tools/$(Q
 QUOTA_DEPENDENCIES = host-gettext
 QUOTA_AUTORECONF = YES
 QUOTA_LICENSE = GPLv2+
+QUOTA_CONF_OPTS = --disable-strip-binaries
 
 QUOTA_CFLAGS = $(TARGET_CFLAGS)
 QUOTA_LDFLAGS = $(TARGET_LDFLAGS)
