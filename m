From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Mar 2013 09:26:35 +0100
Subject: [Buildroot] [PATCH 11/22] libpcap: add missing flex/bison
	dependencies
In-Reply-To: <1364113606-20836-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1364113606-20836-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1364113606-20836-12-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In preparation for the removal of the flex/bison mandatory
dependencies, make sure libpcap builds host-flex/host-bison.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libpcap/libpcap.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
1.7.9.5
