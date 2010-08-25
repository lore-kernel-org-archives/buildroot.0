From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Aug 2010 17:30:38 +0200
Subject: [Buildroot] [git commit master 1/1] netcat: prevent build system
	from adding a prefix to binaries
Message-ID: <20100825153145.58EA689016@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c56087e65c60ac13f7853d67de8e70d15b811df5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes bug #2239.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/netcat/netcat.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/netcat/netcat.mk b/package/netcat/netcat.mk
index 31f6b71..f8263ef 100644
--- a/package/netcat/netcat.mk
+++ b/package/netcat/netcat.mk
@@ -10,5 +10,6 @@ NETCAT_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/netc
 NETCAT_AUTORECONF:=NO
 NETCAT_INSTALL_STAGING:=NO
 NETCAT_INSTALL_TARGET:=YES
+NETCAT_CONF_OPT = --program-prefix=''
 
 $(eval $(call AUTOTARGETS,package,netcat))
-- 
1.7.1
