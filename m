From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Aug 2014 18:29:40 +0200
Subject: [Buildroot] [git commit] samba4: add comment mmu depends
Message-ID: <20140804163002.A73CE9D3A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cd62e507404887154a3cbd1b178ddb67d6fe0b87
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Otherwise it shows up indirectly when toolchain options aren't enough
and then vanishes when they are fulfilled.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/samba4/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/samba4/Config.in b/package/samba4/Config.in
index 7008ba2..60e0f55 100644
--- a/package/samba4/Config.in
+++ b/package/samba4/Config.in
@@ -22,3 +22,4 @@ config BR2_PACKAGE_SAMBA4
 comment "samba4 needs a toolchain w/ IPv6, wchar, largfile, threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_LARGEFILE || \
 		!BR2_USE_WCHAR || !BR2_INET_IPV6
+	depends on BR2_USE_MMU
