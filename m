From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Dec 2020 14:09:19 +0100
Subject: [Buildroot] [git commit] package/tcpdump: add SELinux module
Message-ID: <20201229134644.272278383C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e6f3e8c49338783194a0b19dd7cdd81f62a8eb00
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Support for tcpdump is added by the admin/netutils module in the SELinux
refpolicy.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/tcpdump/tcpdump.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tcpdump/tcpdump.mk b/package/tcpdump/tcpdump.mk
index 8db35694ea..23e9333a8f 100644
--- a/package/tcpdump/tcpdump.mk
+++ b/package/tcpdump/tcpdump.mk
@@ -17,6 +17,7 @@ TCPDUMP_CONF_OPTS = \
 	--with-system-libpcap \
 	$(if $(BR2_PACKAGE_TCPDUMP_SMB),--enable-smb,--disable-smb)
 TCPDUMP_DEPENDENCIES = libpcap
+TCPDUMP_SELINUX_MODULES = netutils
 
 # 0001-PPP-When-un-escaping-don-t-allocate-a-too-large-buffer.patch
 TCPDUMP_IGNORE_CVES += CVE-2020-8037
