From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Mon, 17 Oct 2016 13:06:23 -0300
Subject: [Buildroot] [PATCH 36/93] 4th: use $(TARGET_MAKE_ENV) when calling
	$(MAKE)
In-Reply-To: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476720440-22239-37-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/4th/4th.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/4th/4th.mk b/package/4th/4th.mk
index 071c2d4..7828592 100644
--- a/package/4th/4th.mk
+++ b/package/4th/4th.mk
@@ -17,9 +17,9 @@
 4TH_CFLAGS = $(TARGET_CFLAGS) -DUNIX -fsigned-char
 
 ifeq ($(BR2_STATIC_LIBS),y)
-4TH_MAKE_ENV = STATIC=1
+4TH_MAKE_ENV = $(TARGET_MAKE_ENV) STATIC=1
 else
-4TH_MAKE_ENV = SHARED=1
+4TH_MAKE_ENV = $(TARGET_MAKE_ENV) SHARED=1
 4TH_CFLAGS += -fPIC
 endif
 
-- 
2.7.3
