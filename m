From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Aug 2014 18:29:40 +0200
Subject: [Buildroot] [git commit] sispmctl: add comment mmu depends
Message-ID: <20140804163002.AEE5D9D3A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d3235c4054550754598f9fdf2b061b3c27ec3b2c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Otherwise it shows up indirectly when toolchain options aren't enough
and then vanishes when they are fulfilled.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sispmctl/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/sispmctl/Config.in b/package/sispmctl/Config.in
index 8070802..3b8f60e 100644
--- a/package/sispmctl/Config.in
+++ b/package/sispmctl/Config.in
@@ -15,3 +15,4 @@ config BR2_PACKAGE_SISPMCTL
 
 comment "sispmctl needs a toolchain w/ threads, wchar"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
+	depends on BR2_USE_MMU
