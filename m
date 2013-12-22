From: Noam Camus <noamc@ezchip.com>
Date: Sun, 22 Dec 2013 17:31:38 +0200
Subject: [Buildroot] [PATCH 03/29] ARC: [eznps] fix STRIP_none for uclibc
Message-ID: <264C179F799EF24AB26D5319053335E80E59B737BE@ezexch.ezchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It was with reversed logic

Signed-off-by: Noam Camus <noamc@ezchip.com>
---
 package/uclibc/uclibc.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk index def5388..5555bf5 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -403,6 +403,8 @@ endif
 #
 
 ifeq ($(BR2_STRIP_none),y)
+UCLIBC_STRIP_CONFIG = $(call UCLIBC_OPT_UNSET,DOSTRIP,$(@D)) else
 UCLIBC_STRIP_CONFIG = $(call UCLIBC_OPT_SET,DOSTRIP,y,$(@D))  endif
 
--
1.7.1
