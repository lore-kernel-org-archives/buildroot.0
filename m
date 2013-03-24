From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 24 Mar 2013 13:43:44 +0100
Subject: [Buildroot] [git commit] libpcap: add missing flex/bison
	dependencies
Message-ID: <20130324130051.5F8949B258@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2f55f8e440ea6040ec7fc9ba0692dd0980a36bd9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In preparation for the removal of the flex/bison mandatory
dependencies, make sure libpcap builds host-flex/host-bison.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libpcap/libpcap.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
index 06aec0f..5e077a2 100644
--- a/package/libpcap/libpcap.mk
+++ b/package/libpcap/libpcap.mk
@@ -20,7 +20,7 @@ LIBPCAP_INSTALL_STAGING = YES
 # configure script correctly handles --enable-shared/--disable-shared.
 LIBPCAP_AUTORECONF = YES
 
-LIBPCAP_DEPENDENCIES = zlib
+LIBPCAP_DEPENDENCIES = zlib host-flex host-bison
 LIBPCAP_CONF_ENV = ac_cv_linux_vers=2 \
 		ac_cv_header_linux_wireless_h=yes # configure misdetects this
 LIBPCAP_CONF_OPT = --disable-yydebug --with-pcap=linux
