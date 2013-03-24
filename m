From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Mar 2013 09:26:40 +0100
Subject: [Buildroot] [PATCH 16/22] at: needs host-flex and host-bison
In-Reply-To: <1364113606-20836-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1364113606-20836-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1364113606-20836-17-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/at/at.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/at/at.mk b/package/at/at.mk
index 1cea39b..6432ae3 100644
--- a/package/at/at.mk
+++ b/package/at/at.mk
@@ -9,7 +9,7 @@ AT_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/a/at
 # missing deps for parsetime.l
 AT_MAKE = $(MAKE1)
 AT_AUTORECONF = YES
-AT_DEPENDENCIES = $(if $(BR2_PACKAGE_FLEX),flex)
+AT_DEPENDENCIES = $(if $(BR2_PACKAGE_FLEX),flex) host-bison host-flex
 
 AT_CONF_OPT = \
         --with-jobdir=/var/spool/cron/atjobs \
-- 
1.7.9.5
