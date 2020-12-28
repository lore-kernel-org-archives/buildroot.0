From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Date: Mon, 28 Dec 2020 17:11:32 +0100
Subject: [Buildroot] [PATCH v2 12/14] package/tcpdump: add SELinux module
In-Reply-To: <20201228161134.303992-1-maxime.chevallier@bootlin.com>
References: <20201228161134.303992-1-maxime.chevallier@bootlin.com>
Message-ID: <20201228161134.303992-13-maxime.chevallier@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Support for tcpdump is added by the admin/netutils module in the SELinux
refpolicy.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
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
-- 
2.25.4
