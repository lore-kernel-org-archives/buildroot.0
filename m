From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Feb 2017 19:22:08 +0100
Subject: [Buildroot] [git commit] openntpd: fix Config.in comment dependency
Message-ID: <20170206182321.2D2DA7FC3A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=00f5c60b5bc33b30074d1f50af107b9eb29c780e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

BR2_PACKAGE_OPENNTPD has a "depends on !BR2_PACKAGE_NTP" because the
openntpd package conflicts with the ntp package.

So the Config.in comment of openntpd should also not be visible when ntp
is selected. Otherwise the comment will show up when the user has a
non-NPTL toolchain, and once he enables NPTL support, the comment
disappears, but the package option doesn't appear.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/openntpd/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/openntpd/Config.in b/package/openntpd/Config.in
index 1433b09..1b856c0 100644
--- a/package/openntpd/Config.in
+++ b/package/openntpd/Config.in
@@ -13,4 +13,5 @@ config BR2_PACKAGE_OPENNTPD
 
 comment "openntpd needs a toolchain w/ NPTL"
 	depends on BR2_USE_MMU
+	depends on !BR2_PACKAGE_NTP
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
