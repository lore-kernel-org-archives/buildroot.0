From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 13 May 2013 13:24:59 +0200
Subject: [Buildroot] [git commit] quota: fix dependencies
Message-ID: <20130513112616.DE5EB9A1A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=13d91f18a3dc1692241fa41b0bab1b6d384e1d6c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/quota/quota.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/quota/quota.mk b/package/quota/quota.mk
index c89ed9b..9afc9e3 100644
--- a/package/quota/quota.mk
+++ b/package/quota/quota.mk
@@ -14,7 +14,7 @@ QUOTA_CFLAGS = $(TARGET_CFLAGS)
 QUOTA_LDFLAGS = $(TARGET_LDFLAGS)
 
 ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
-QUOTA_DEPENDENCIES = gettext
+QUOTA_DEPENDENCIES += gettext
 QUOTA_LDFLAGS += -lintl
 endif
 
