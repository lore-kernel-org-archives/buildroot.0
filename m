From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Jan 2016 22:25:59 +0100
Subject: [Buildroot] [git commit] package/radvd: fix musl build
Message-ID: <20160201224707.882D57F8C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=80e8e75f2a07407e07afc6208f7fd2cfb4343584
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The autobuilders did not catch the error yet because they failed
earlier with other packages, but I am continuing the build using the
defconfig from:
http://autobuild.buildroot.net/results/6cc/6cc0f8c067e07deea688b9b97284601a596b898c/

[Thomas: replace with upstream patch directly, fetched from Github.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/radvd/radvd.hash | 1 +
 package/radvd/radvd.mk   | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/package/radvd/radvd.hash b/package/radvd/radvd.hash
index 7324c31..3ace4fc 100644
--- a/package/radvd/radvd.hash
+++ b/package/radvd/radvd.hash
@@ -1,2 +1,3 @@
 # From http://www.litech.org/radvd/dist/radvd-2.11.tar.gz.sha256
 sha256	04636288fc79fa151260eeb2bea1b05942f59c31f01358c57f930a4eb45b5acc	radvd-2.11.tar.xz
+sha256	01d12bd2970fedf5695d9177a5ea45483d5e3c709ecceed636972c3049c47d0d	1d8973e13d89802eee0b648451e2b97ac65cf9e0.patch
diff --git a/package/radvd/radvd.mk b/package/radvd/radvd.mk
index 872eac0..503b62d 100644
--- a/package/radvd/radvd.mk
+++ b/package/radvd/radvd.mk
@@ -7,6 +7,8 @@
 RADVD_VERSION = 2.11
 RADVD_SOURCE = radvd-$(RADVD_VERSION).tar.xz
 RADVD_SITE = http://www.litech.org/radvd/dist
+RADVD_PATCH = \
+	https://github.com/reubenhwk/radvd/commit/1d8973e13d89802eee0b648451e2b97ac65cf9e0.patch
 RADVD_DEPENDENCIES = host-bison flex host-flex host-pkgconf
 RADVD_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 # We're patching configure.ac/Makefile.am.
