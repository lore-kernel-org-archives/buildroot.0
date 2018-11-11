From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Date: Sun, 11 Nov 2018 16:06:52 +0100
Subject: [Buildroot] [PATCH] systemd: Explicitly configure split-usr=false
 and split-bin=true
In-Reply-To: <20181111150652.17459-1-alexander.sverdlin@gmail.com>
References: <20181111150652.17459-1-alexander.sverdlin@gmail.com>
Message-ID: <20181111150652.17459-7-alexander.sverdlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

bison-based build of systemd runs couple of checks on the structure of the
*host* system which will incorrectly configure systemd if build host
configuration doesn't match Buildroot target.

One can also find the following in the NEWS file:

* A new -Dsplit-bin= build configuration switch may be used to specify
  whether bin and sbin directories are merged, or if they should be
  included separately in $PATH and various listings of executable
  directories. The build configuration scripts will try to autodetect
  the proper values of -Dsplit-usr= and -Dsplit-bin= based on build
  system, but distributions are encouraged to configure this
  explicitly.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 package/systemd/systemd.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 4813496670..ecbf7e97ff 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -29,6 +29,8 @@ SYSTEMD_CONF_OPTS += \
 	-Dldconfig=false \
 	-Ddefault-dnssec=no \
 	-Dtests=false \
+	-Dsplit-bin=true \
+	-Dsplit-usr=false \
 	-Dsystem-uid-max=999 \
 	-Dsystem-gid-max=999 \
 	-Dtelinit-path=$(TARGET_DIR)/sbin/telinit \
-- 
2.19.1
