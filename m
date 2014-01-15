From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Jan 2014 14:11:05 +0100
Subject: [Buildroot] [git commit] uclibc: fix STRIP_none handling
Message-ID: <20140115131134.5697D9C4E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e090aeaa87c1ede3c10869d2aef4f7a2a936ad54
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It was with reversed logic

Signed-off-by: Noam Camus <noamc@ezchip.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/uclibc/uclibc.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index bf1de05..1978bbd 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -398,6 +398,8 @@ endif
 #
 
 ifeq ($(BR2_STRIP_none),y)
+UCLIBC_STRIP_CONFIG = $(call UCLIBC_OPT_UNSET,DOSTRIP,$(@D))
+else
 UCLIBC_STRIP_CONFIG = $(call UCLIBC_OPT_SET,DOSTRIP,y,$(@D))
 endif
 
