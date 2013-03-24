From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Mar 2013 16:08:59 +0100
Subject: [Buildroot] [PATCH 2/3] iproute2: add missing host-flex dependency
In-Reply-To: <1364137740-21652-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1364137740-21652-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1364137740-21652-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.org/results/0931e622a0e80fc7321f0e26c96ae4607eaadd00/build-end.log.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/iproute2/iproute2.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 98a7da0..a83133b 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -10,7 +10,7 @@ IPROUTE2_TARGET_SBINS = ctstat genl ifstat ip lnstat nstat routef routel rtacct
 IPROUTE2_LICENSE = GPLv2
 IPROUTE2_LICENSE_FILES = COPYING
 
-IPROUTE2_DEPENDENCIES += host-bison
+IPROUTE2_DEPENDENCIES += host-bison host-flex
 
 # If both iproute2 and busybox are selected, make certain we win
 # the fight over who gets to have their utils actually installed.
-- 
1.7.9.5
