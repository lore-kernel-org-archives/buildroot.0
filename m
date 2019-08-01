From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 Aug 2019 20:21:27 +0200
Subject: [Buildroot] [git commit] package/iputils: drop setuid on arping
Message-ID: <20190801181958.070848B4EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d413204a32352258d8a94fc9d00e2abbe793d6d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

arping can be used for arp poisoning, so it should really not be setuid.

Reported-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Acked-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
