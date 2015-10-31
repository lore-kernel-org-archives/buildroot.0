From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 31 Oct 2015 16:01:35 +0100
Subject: [Buildroot] [git commit] package/dvblast: needs threads
Message-ID: <20151031150258.D7EAF81910@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ce9e577306eee1f01d19338abe0b0fbb4cf2a294
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes;
    http://autobuild.buildroot.org/results/c25/c25143fd1363d162de6733bc55a84289543f4da3/
    http://autobuild.buildroot.org/results/09d/09d9a962b20295d09d7777f873f7bb1c8130dbf1/
    ...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Julian Scheel <julian@jusst.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dvblast/Config.in |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/dvblast/Config.in b/package/dvblast/Config.in
index da78943..1ea8f93 100644
--- a/package/dvblast/Config.in
+++ b/package/dvblast/Config.in
@@ -4,8 +4,13 @@ config BR2_PACKAGE_DVBLAST
 	select BR2_PACKAGE_LIBEV
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	depends on !BR2_bfin  # libev
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  DVBlast is a simple and powerful MPEG-2/TS demux and
 	  streaming application.
 
 	  http://www.videolan.org/projects/dvblast.html
+
+comment 'dvblast needs a toolchain w/ threads'
+	depends on !BR2_bfin  # libev
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
