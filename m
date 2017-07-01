From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  1 Jul 2017 14:51:20 +0200
Subject: [Buildroot] [PATCH 2/3] core: simplify the condition to set the
	strip command
In-Reply-To: <cover.1498913468.git.yann.morin.1998@free.fr>
References: <cover.1498913468.git.yann.morin.1998@free.fr>
Message-ID: <9df4b2ae79e5d2f696a5d960d958dbf7f2d30558.1498913468.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since BR2_STRIP_strip and BR2_STRIP_noine are mutually exclusive (being
part of a choice), we can simplify the logic.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.in | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 4a3eb26963..9566567fbf 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -205,8 +205,7 @@ ifeq ($(BR2_STRIP_strip),y)
 STRIP_STRIP_DEBUG := --strip-debug
 TARGET_STRIP = $(TARGET_CROSS)strip
 STRIPCMD = $(TARGET_CROSS)strip --remove-section=.comment --remove-section=.note
-endif
-ifeq ($(BR2_STRIP_none),y)
+else
 TARGET_STRIP = true
 STRIPCMD = $(TARGET_STRIP)
 endif
-- 
2.11.0
