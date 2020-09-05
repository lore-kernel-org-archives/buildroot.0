From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 5 Sep 2020 14:25:41 +0200
Subject: [Buildroot] [git commit branch/2020.08.x] package/systemd: disable
 zstd for host-systemd
Message-ID: <20200905123344.DA38D8028C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=95b43db6e94e5c7c236e58a6f00edb0333a2256d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

systemd 246 added support for zstd compression of large fields in
journal files [1]. Since zstd is only used at runtime, we don't
need it to enable its support in host-systemd.

[1] https://github.com/systemd/systemd/blob/v246/NEWS#L323-L331

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit f5b89563d7e1c507b565676bbce72c06830ae74f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/systemd/systemd.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 81fa2bd0f0..65541f6b1f 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -701,7 +701,8 @@ HOST_SYSTEMD_CONF_OPTS = \
 	-Dkernel-install=false \
 	-Dsystemd-analyze=false \
 	-Dlibcryptsetup=false \
-	-Daudit=false
+	-Daudit=false \
+	-Dzstd=false
 
 HOST_SYSTEMD_DEPENDENCIES = \
 	$(BR2_COREUTILS_HOST_DEPENDENCY) \
