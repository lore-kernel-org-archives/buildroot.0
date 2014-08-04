From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Aug 2014 18:29:40 +0200
Subject: [Buildroot] [git commit] modem-manager: add comment mmu depends
Message-ID: <20140804163002.982029D3A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=30f7bf401a2bb0a6ba0e7d85e19306ba18a63983
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Otherwise it shows up indirectly when toolchain options aren't enough
and then vanishes when they are fulfilled.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/modem-manager/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/modem-manager/Config.in b/package/modem-manager/Config.in
index fe60850..7768f1f 100644
--- a/package/modem-manager/Config.in
+++ b/package/modem-manager/Config.in
@@ -32,3 +32,4 @@ endif
 comment "modemmanager needs udev /dev management and a toolchain w/ largefile, wchar, threads, IPv6"
 	depends on !BR2_INET_IPV6 || !BR2_LARGEFILE || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_PACKAGE_HAS_UDEV
+	depends on BR2_USE_MMU
