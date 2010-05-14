From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 May 2010 13:37:30 +0200
Subject: [Buildroot] [PATCH 7/8] avahi: needs IPv6
In-Reply-To: <cover.1273836748.git.thomas.petazzoni@free-electrons.com>
References: <cover.1273836748.git.thomas.petazzoni@free-electrons.com>
Message-ID: <a535d4a03f344d8b31ffe0d95fa4d2147e0d3eb8.1273836748.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Otherwise the build fails with:

socket.c: In function 'avahi_mdns_mcast_join_ipv6':
socket.c:159: error: 'IPV6_DROP_MEMBERSHIP' undeclared (first use in this function)
socket.c:159: error: (Each undeclared identifier is reported only once
socket.c:159: error: for each function it appears in.)
socket.c:161: error: 'IPV6_ADD_MEMBERSHIP' undeclared (first use in this function)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/avahi/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/avahi/Config.in b/package/avahi/Config.in
index 3386005..9ac1e55 100644
--- a/package/avahi/Config.in
+++ b/package/avahi/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_AVAHI
 	bool "avahi"
+	depends on BR2_INET_IPV6
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
 	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT
 	help
-- 
1.6.3.3
