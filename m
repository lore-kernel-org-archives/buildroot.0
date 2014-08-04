From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Aug 2014 18:29:40 +0200
Subject: [Buildroot] [git commit] libgail: add comment mmu depends
Message-ID: <20140804163002.7ED0D9D1A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2c97317e14bd3899323e817084e192202e1ebd51
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Otherwise it shows up indirectly when toolchain options aren't enough
and then vanishes when they are fulfilled.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libgail/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/libgail/Config.in b/package/libgail/Config.in
index e997532..512f228 100644
--- a/package/libgail/Config.in
+++ b/package/libgail/Config.in
@@ -23,3 +23,4 @@ config BR2_PACKAGE_LIBGAIL
 comment "libgail needs a toolchain w/ wchar, threads"
 	depends on BR2_PACKAGE_LIBGTK2
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU
