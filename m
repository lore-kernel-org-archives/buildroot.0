From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Apr 2015 11:51:34 +0200
Subject: [Buildroot] [git commit] package/uclibc: ignore missing hash for
	snapshots
Message-ID: <20150425095655.29CF780094@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=33e72a90f89afc008b20784482882df45be9a8b7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We can't have a hash for snapshots, so add them to the exclusion list.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Cc: Arnout Vandecappelle <arnout@mind.be>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uclibc/uclibc.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 07ff8e5..ce9b2b4 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -11,6 +11,7 @@ UCLIBC_LICENSE_FILES = COPYING.LIB
 
 ifeq ($(BR2_UCLIBC_VERSION_SNAPSHOT),y)
 UCLIBC_SITE = http://www.uclibc.org/downloads/snapshots
+BR_NO_CHECK_HASH_FOR += $(UCLIBC_SOURCE)
 else ifeq ($(BR2_UCLIBC_VERSION_NG),y)
 UCLIBC_SITE = http://downloads.uclibc-ng.org/releases/$(UCLIBC_VERSION)
 UCLIBC_SOURCE = uClibc-ng-$(UCLIBC_VERSION).tar.xz
