From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 25 Apr 2012 13:57:15 +0200
Subject: [Buildroot] [git commit] tcpdump: fix build with ipv6 after 2a10c9
	(pass --enable-ipv6 to autotargets configure)
Message-ID: <20120425115812.0663196BBF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=83b064e3afeed94b1a7930795bff08147a5626a9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/tcpdump/tcpdump.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/tcpdump/tcpdump.mk b/package/tcpdump/tcpdump.mk
index cf23df3..ab9d4f1 100644
--- a/package/tcpdump/tcpdump.mk
+++ b/package/tcpdump/tcpdump.mk
@@ -9,7 +9,7 @@
 TCPDUMP_VERSION = 4.2.1
 TCPDUMP_SITE = http://www.tcpdump.org/release
 TCPDUMP_SOURCE = tcpdump-$(TCPDUMP_VERSION).tar.gz
-TCPDUMP_CONF_ENV = ac_cv_linux_vers=2
+TCPDUMP_CONF_ENV = ac_cv_linux_vers=2 td_cv_buggygetaddrinfo=no
 TCPDUMP_CONF_OPT = --without-crypto \
 		$(if $(BR2_PACKAGE_TCPDUMP_SMB),--enable-smb,--disable-smb)
 TCPDUMP_DEPENDENCIES = zlib libpcap
