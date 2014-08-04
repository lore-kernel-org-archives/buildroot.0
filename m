From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Aug 2014 18:27:02 +0200
Subject: [Buildroot] [git commit] pcmanfm: add mmu depends
Message-ID: <20140804162706.732C29D389@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=67db10339d964792ae14d8c5b2e4894ef136df7e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Otherwise it shows up indirectly when toolchain options aren't enough
and then vanishes when they are fulfilled.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pcmanfm/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/pcmanfm/Config.in b/package/pcmanfm/Config.in
index cf77e36..b3baa4c 100644
--- a/package/pcmanfm/Config.in
+++ b/package/pcmanfm/Config.in
@@ -17,3 +17,4 @@ config BR2_PACKAGE_PCMANFM
 comment "pcmanfm needs a toolchain w/ wchar, threads"
 	depends on BR2_PACKAGE_XORG7 && BR2_PACKAGE_LIBGTK2
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU
