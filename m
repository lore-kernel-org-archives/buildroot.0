From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Aug 2014 18:29:40 +0200
Subject: [Buildroot] [git commit] libxmlpp: add comment mmu depends
Message-ID: <20140804163002.870189D1A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7e201670b63d4fb16c26335c189815209343a7bd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Otherwise it shows up indirectly when toolchain options aren't enough
and then vanishes when they are fulfilled.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libxmlpp/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/libxmlpp/Config.in b/package/libxmlpp/Config.in
index 69bd220..cb5f3c0 100644
--- a/package/libxmlpp/Config.in
+++ b/package/libxmlpp/Config.in
@@ -14,3 +14,4 @@ config BR2_PACKAGE_LIBXMLPP
 comment "libxml++ needs a toolchain w/ C++, wchar, threads"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 	!BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU
