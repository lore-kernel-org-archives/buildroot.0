From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Aug 2016 16:01:19 +0200
Subject: [Buildroot] [git commit] package/systemd-bootchart: needs headers
	>= 3.17
Message-ID: <20160814140232.5410181E80@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5f56080f846f7a17dc42943e62482da5a440b166
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It uses GRND_NONBLOCK, introduced in 3.17.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/systemd-bootchart/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/systemd-bootchart/Config.in b/package/systemd-bootchart/Config.in
index 2a70b8d..8deb6b9 100644
--- a/package/systemd-bootchart/Config.in
+++ b/package/systemd-bootchart/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_SYSTEMD_BOOTCHART
 	bool "systemd-bootchart"
 	depends on BR2_INIT_SYSTEMD
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
 	help
 	  systemd-bootchart is a tool, usually run at system startup,
 	  that collects the CPU load, disk load, memory usage, as well
@@ -19,3 +20,7 @@ config BR2_PACKAGE_SYSTEMD_BOOTCHART
 	  these options are enabled.
 
 	  http://www.freedesktop.org/software/systemd/man/systemd-bootchart.html
+
+comment "systemd-bootchart needs a toolchain w/ headers >= 3.17"
+	depends on BR2_INIT_SYSTEMD
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
