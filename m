From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  5 Apr 2012 08:41:57 -0300
Subject: [Buildroot] [PATCH] bind: needs MMU
Message-ID: <1333626117-20618-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/bind/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/bind/Config.in b/package/bind/Config.in
index 9b9c7ee..2944f1f 100644
--- a/package/bind/Config.in
+++ b/package/bind/Config.in
@@ -2,6 +2,8 @@ config BR2_PACKAGE_BIND
 	bool "bind"
 	depends on BR2_INET_IPV6
 	depends on BR2_LARGEFILE
+	# fork()
+	depends on BR2_USE_MMU
 	help
 	  BIND (Berkeley Internet Name Domain) is an implementation of
 	  the Domain Name System (DNS) protocols and provides an openly
-- 
1.7.3.4
