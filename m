From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 13 Mar 2021 16:05:26 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/util-linux:
 disable runuser for the host build
Message-ID: <20210313144532.8DDEB83BC8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d1745ffdece7201df26a17a2572c6a3570a6bec4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

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
(cherry picked from commit 955d6c099b2035dcca47554a735a4c700b5d3e1e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/util-linux/util-linux.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index b6ccaaa78d..49220d7329 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -193,6 +193,7 @@ HOST_UTIL_LINUX_CONF_OPTS += \
 	--disable-nsenter \
 	--disable-pg \
 	--disable-rfkill \
+	--disable-runuser \
 	--disable-schedutils \
 	--disable-setpriv \
 	--disable-setterm \
