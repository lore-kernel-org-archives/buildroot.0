From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu,  1 Aug 2019 18:22:32 +0200
Subject: [Buildroot] [PATCH 1/2 v7] package/iputils: drop setuid on arping
In-Reply-To: <cover.1564676540.git.yann.morin.1998@free.fr>
References: <cover.1564676540.git.yann.morin.1998@free.fr>
Message-ID: <f9b8b678e88316d6b572dc87e5080896cd8a84c7.1564676540.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

arping can be used for arp poisoning, so it should really not be setuid.

Reported-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/iputils/iputils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index b28222138f..7482bbdca1 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -80,7 +80,7 @@ IPUTILS_POST_INSTALL_TARGET_HOOKS += IPUTILS_CREATE_PING6_SYMLINK
 # handle permissions ourselves
 IPUTILS_CONF_OPTS += -DNO_SETCAP_OR_SUID=true
 define IPUTILS_PERMISSIONS
-	/usr/sbin/arping      f 4755 0 0 - - - - -
+	/usr/sbin/arping      f  755 0 0 - - - - -
 	/usr/bin/clockdiff    f 4755 0 0 - - - - -
 	/bin/ping             f 4755 0 0 - - - - -
 	/usr/bin/traceroute6  f 4755 0 0 - - - - -
-- 
2.20.1
