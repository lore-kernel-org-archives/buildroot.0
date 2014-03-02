From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Mar 2014 16:24:36 +0100
Subject: [Buildroot] [git commit] samba4: add comment arch dependencies
Message-ID: <20140302152442.29BE6903C9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d2544c019bd865736f5d9d5d1a49ec98bf8239e4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Hide the comment for unsupported architectures.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/samba4/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/samba4/Config.in b/package/samba4/Config.in
index fcc03df..bea26cb 100644
--- a/package/samba4/Config.in
+++ b/package/samba4/Config.in
@@ -20,5 +20,6 @@ config BR2_PACKAGE_SAMBA4
 	  http://www.samba.org/
 
 comment "samba4 needs a toolchain w/ IPv6, wchar, largfile, threads"
+	depends on BR2_arm || BR2_powerpc || BR2_x86_64
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_LARGEFILE || \
 		!BR2_USE_WCHAR || !BR2_INET_IPV6
