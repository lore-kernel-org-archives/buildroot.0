From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  3 Jul 2016 11:49:58 +0200
Subject: [Buildroot] [PATCH 10/13] tz: remove SOURCE variable
In-Reply-To: <1467539401-3411-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1467539401-3411-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1467539401-3411-10-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that the package infrastructure doen't attempt to download a package
that has an empty version string, there's no need to define the SOURCE
variable in the tz package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tz/tz.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/tz/tz.mk b/package/tz/tz.mk
index 7a756eb..f0daf46 100644
--- a/package/tz/tz.mk
+++ b/package/tz/tz.mk
@@ -4,7 +4,6 @@
 #
 ################################################################################
 
-TZ_SOURCE =
 TZ_DEPENDENCIES = host-tzdata host-tzdump
 TZ_LICENSE = Public domain
 
-- 
2.7.4
