From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 6 Jun 2017 13:37:14 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] systemd: add upstream
	security fix
Message-ID: <20170606113734.D2CCC825DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=11a3e7ce6efc8f1f59b981671b3b3feba17458b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Fixes CVE-2017-9217: remote DoS (daemon crash) via a crafted DNS response with
an empty question section.

Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit dabd28a4be71e6d8f5a33d4fa34a3515e5fad177)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/systemd/systemd.hash | 1 +
 package/systemd/systemd.mk   | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
index 0acaa3c..2b78207 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,2 +1,3 @@
 # sha256 locally computed
 sha256 1172c7c7d5d72fbded53186e7599d5272231f04cc8b72f9a0fb2c5c20dfc4880  systemd-232.tar.gz
+sha256 eed8fef0045876e9efa0ba6725ed9ea93654bf24d67bb5aad467a341ad375883  a924f43f30f9c4acaf70618dd2a055f8b0f166be.patch
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index fce5d84..f1ddfaf 100644
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
