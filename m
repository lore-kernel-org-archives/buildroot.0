From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Aug 2010 12:52:06 +0200
Subject: [Buildroot] [PATCH 14/20] netcat: prevent build system from adding
	a prefix to binaries
In-Reply-To: <cover.1282471311.git.thomas.petazzoni@free-electrons.com>
References: <cover.1282471311.git.thomas.petazzoni@free-electrons.com>
Message-ID: <86047c4c4a4d951bfe590291c88a3d5b3f911180.1282471311.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes bug #2239.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/netcat/netcat.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/netcat/netcat.mk b/package/netcat/netcat.mk
index 31f6b71..c8b2a02 100644
--- a/package/netcat/netcat.mk
+++ b/package/netcat/netcat.mk
@@ -10,5 +10,6 @@ NETCAT_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/netc
 NETCAT_AUTORECONF:=NO
 NETCAT_INSTALL_STAGING:=NO
 NETCAT_INSTALL_TARGET:=YES
+NETCAT_CONF_OPT=--program-prefix=
 
 $(eval $(call AUTOTARGETS,package,netcat))
-- 
1.7.0.4
