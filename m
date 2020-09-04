From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 4 Sep 2020 22:13:31 +0200
Subject: [Buildroot] [git commit] package/systemd: disable zstd for
 host-systemd
Message-ID: <20200904200652.520B6818C9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f5b89563d7e1c507b565676bbce72c06830ae74f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

systemd 246 added support for zstd compression of large fields in
journal files [1]. Since zstd is only used at runtime, we don't
need it to enable its support in host-systemd.

[1] https://github.com/systemd/systemd/blob/v246/NEWS#L323-L331

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/systemd/systemd.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index c132f36663..d72cb58693 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -700,7 +700,8 @@ HOST_SYSTEMD_CONF_OPTS = \
 	-Dkernel-install=false \
 	-Dsystemd-analyze=false \
 	-Dlibcryptsetup=false \
-	-Daudit=false
+	-Daudit=false \
+	-Dzstd=false
 
 HOST_SYSTEMD_DEPENDENCIES = \
 	$(BR2_COREUTILS_HOST_DEPENDENCY) \
