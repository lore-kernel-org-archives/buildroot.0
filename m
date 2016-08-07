From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Aug 2016 22:57:40 +0200
Subject: [Buildroot] [git commit] ntp: disable debugging
Message-ID: <20160807205759.1C69D7FFF1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a2ce4167e230415e0dbc1349112790b07e104e88
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When running ntp it randomly aborts at ntp-4.2.8p8/libntp/recvbuff.c:326
which seems to be a debugging feature. This patch just disables
debugging, it does not fix the root cause of the problem.

Signed-off-by: Vicente Bergas <vicencb@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ntp/ntp.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index 7d203a5..0b6304b 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -15,6 +15,7 @@ NTP_CONF_OPTS = \
 	--with-shared \
 	--program-transform-name=s,,, \
 	--disable-tickadj \
+	--disable-debugging \
 	--with-yielding-select=yes \
 	--disable-local-libevent
 # 0002-ntp-syscalls-fallback.patch
