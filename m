From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Jun 2017 11:18:01 +0200
Subject: [Buildroot] [git commit] systemd: add upstream security fix
Message-ID: <20170605091924.D167382929@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dabd28a4be71e6d8f5a33d4fa34a3515e5fad177
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2017-9217: remote DoS (daemon crash) via a crafted DNS response with
an empty question section.

Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/systemd/systemd.hash | 1 +
 package/systemd/systemd.mk   | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
index 17f4c0f..b5cb1ca 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,2 +1,3 @@
 # sha256 locally computed
 sha256 8b3e99da3d4164b66581830a7f2436c0c8fe697b5fbdc3927bdb960646be0083  systemd-233.tar.gz
+sha256 eed8fef0045876e9efa0ba6725ed9ea93654bf24d67bb5aad467a341ad375883  a924f43f30f9c4acaf70618dd2a055f8b0f166be.patch
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 5112d53..0b62cf0 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -19,6 +19,9 @@ SYSTEMD_DEPENDENCIES = \
 SYSTEMD_PROVIDES = udev
 SYSTEMD_AUTORECONF = YES
 
+SYSTEMD_PATCH = \
+	https://github.com/systemd/systemd/commit/a924f43f30f9c4acaf70618dd2a055f8b0f166be.patch
+
 # Make sure that systemd will always be built after busybox so that we have
 # a consistent init setup between two builds
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
