From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  2 May 2015 11:05:04 +0200
Subject: [Buildroot] [PATCH 5/7 v2] package/xenomai: ignore custom versions
In-Reply-To: <cover.1430557268.git.yann.morin.1998@free.fr>
References: <cover.1430557268.git.yann.morin.1998@free.fr>
Message-ID: <45d2ee30bd5fbcf979c095dac083125626182d80.1430557268.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We can safely reference XENOMAI_SOURCE, even though it is defined later,
because BR_NO_CHECK_HASH_FOR is a recursively-expanded variable, so its
content is only evaluated when the variable is referenced.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/xenomai/xenomai.mk | 2 ++
 1 file changed, 2 insertions(+)

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
-- 
1.9.1
