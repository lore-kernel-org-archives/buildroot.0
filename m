From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 1 Mar 2021 22:35:51 +0100
Subject: [Buildroot] [git commit] package/util-linux: disable runuser for
 the host build
Message-ID: <20210301211321.A866081532@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=955d6c099b2035dcca47554a735a4c700b5d3e1e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

runuser allows running commands as another user, but needs to run as
root to be able to setuid(). But Buildroot does not require running as
root, and so runuser can't be used.

Incientally, that fixes host build in case unsuitable libs are found on
the system:
    http://lists.busybox.net/pipermail/buildroot/2021-February/304261.html

Reported-by: GA K <guyarkam@gmail.com>
Signed-off-by: Peter Seiderer <ps.report@gmx.net>
[yann.morin.1998 at free.fr:
  - expand the commit log with a more fundamental explanation that
    runuser can't be used anyway
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/util-linux/util-linux.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 0178c52bac..09acaca1a7 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -211,6 +211,7 @@ HOST_UTIL_LINUX_CONF_OPTS += \
 	--disable-nsenter \
 	--disable-pg \
 	--disable-rfkill \
+	--disable-runuser \
 	--disable-schedutils \
 	--disable-setpriv \
 	--disable-setterm \
