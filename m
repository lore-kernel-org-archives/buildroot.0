From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 23 Jan 2014 22:24:57 +0100
Subject: [Buildroot] [git commit] tcpreplay: cross-compile with tcpdump
	support
Message-ID: <20140123213211.CD7709C5F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=340ba1bec04a87eae00b49098070d01e77457819
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If tcpdump is enabled set ac_cv_path_tcpdump_path so that verbose output
is enabled on the target.

Signed-off-by: Chris Packham <judge.packham@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tcpreplay/tcpreplay.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/tcpreplay/tcpreplay.mk b/package/tcpreplay/tcpreplay.mk
index 0939c6c..a2cd16e 100644
--- a/package/tcpreplay/tcpreplay.mk
+++ b/package/tcpreplay/tcpreplay.mk
@@ -18,4 +18,10 @@ TCPREPLAY_DEPENDENCIES = libpcap
 TCPREPLAY_LIBS = -lpcap $(if $(BR2_PACKAGE_LIBUSB),-lusb-1.0)
 TCPREPLAY_CONF_ENV += ac_cv_search_pcap_close='$(TCPREPLAY_LIBS)'
 
+ifeq ($(BR2_PACKAGE_TCPDUMP),y)
+TCPREPLAY_CONF_ENV += ac_cv_path_tcpdump_path=/usr/sbin/tcpdump
+else
+TCPREPLAY_CONF_ENV += ac_cv_path_tcpdump_path=no
+endif
+
 $(eval $(autotools-package))
