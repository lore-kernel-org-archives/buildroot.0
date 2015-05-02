From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 May 2015 15:11:01 +0200
Subject: [Buildroot] [git commit] package/xenomai: ignore custom versions
Message-ID: <20150502131735.957EE81734@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=26dc3587e39d1bbbb200a32135b62bdda71056b7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We can safely reference XENOMAI_SOURCE, even though it is defined later,
because BR_NO_CHECK_HASH_FOR is a recursively-expanded variable, so its
content is only evaluated when the variable is referenced.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xenomai/xenomai.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index ccbae35..aa3b007 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -7,6 +7,8 @@
 XENOMAI_VERSION = $(call qstrip,$(BR2_PACKAGE_XENOMAI_VERSION))
 ifeq ($(XENOMAI_VERSION),)
 XENOMAI_VERSION = 2.6.4
+else
+BR_NO_CHECK_HASH_FOR += $(XENOMAI_SOURCE)
 endif
 
 XENOMAI_SITE = http://download.gna.org/xenomai/stable
