From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Apr 2018 07:34:52 +0200
Subject: [Buildroot] [git commit] openntpd: don't test if the binary exists
 in the init script
Message-ID: <20180416053718.A70B588325@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0100c6962d8c91d1c9e0fe1c08790d6778f881ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The test doesn't make sense. It just exits without any error if the
binary doesn't exist, which is silly.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openntpd/S49ntp | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/openntpd/S49ntp b/package/openntpd/S49ntp
index c211ac835e..7ce46eba28 100755
--- a/package/openntpd/S49ntp
+++ b/package/openntpd/S49ntp
@@ -1,6 +1,5 @@
 #!/bin/sh
 
-[ -x /usr/sbin/ntpd ] || exit 0
 [ -f /etc/ntpd.conf ] || exit 0
 
 case "$1" in
