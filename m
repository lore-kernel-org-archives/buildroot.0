From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 19 Apr 2015 19:55:57 +0200
Subject: [Buildroot] [PATCH v6 7/8] package/uclibc: ignore missing hash for
	snapshots
In-Reply-To: <1429466158-28878-1-git-send-email-arnout@mind.be>
References: <cover.1429447148.git.yann.morin.1998@free.fr>
 <1429466158-28878-1-git-send-email-arnout@mind.be>
Message-ID: <1429466158-28878-7-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

We can't have a hash for snapshots, so add them to the exclusion list.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[Arnout: use the correct file name]
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Cc: Arnout Vandecappelle <arnout@mind.be>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
Changes v1 -> v6: (Arnout)
 - use $(UCLIBC_SOURCE) instead of a wrong filename

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/uclibc/uclibc.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 72a46d9..72261f3 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -11,6 +11,7 @@ UCLIBC_LICENSE_FILES = COPYING.LIB
 
 ifeq ($(BR2_UCLIBC_VERSION_SNAPSHOT),y)
 UCLIBC_SITE = http://www.uclibc.org/downloads/snapshots
+BR_NO_CHECK_HASH_FOR += $(UCLIBC_SOURCE)
 else ifeq ($(BR2_UCLIBC_VERSION_NG),y)
 UCLIBC_SITE = http://downloads.uclibc-ng.org/releases/$(UCLIBC_VERSION)
 UCLIBC_SOURCE = uClibc-ng-$(UCLIBC_VERSION).tar.xz
-- 
2.1.4
