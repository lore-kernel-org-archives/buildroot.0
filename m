From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Dec 2015 14:11:11 +0100
Subject: [Buildroot] [git commit] package/wireshark: Fix libpcap detection
Message-ID: <20151213131114.EE66D80478@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=81b9e989e8182feb7fa85346cdcff8e5494042f3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To reproduce the build error I had to install libpcap0.8-dev on my host
system, then wireshark configure picks up

checking for pcap-config... /usr/bin/pcap-config

and fails.

Fixes
http://autobuild.buildroot.net/results/7e3/7e363d18866057df0db3d0d95fa8d9116728f6ce//
and many others

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wireshark/wireshark.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 534131b..2b06699 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -24,6 +24,7 @@ WIRESHARK_CONF_OPTS = \
 	--enable-static=no \
 	--with-libsmi=no \
 	--with-lua=no \
+	--with-pcap=$(STAGING_DIR)/usr \
 	--includedir=$(STAGING_DIR)/usr/include
 
 # wireshark GUI options
