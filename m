From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 11 Oct 2011 11:02:55 -0300
Subject: [Buildroot] [PATCH 4/5] radvd: show it in config menu when
	toolchain lacks ipv6
In-Reply-To: <1318341776-19358-1-git-send-email-gustavo@zacarias.com.ar>
References: <1318341776-19358-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1318341776-19358-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/radvd/Config.in |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/radvd/Config.in b/package/radvd/Config.in
index c7753f0..20e7e55 100644
--- a/package/radvd/Config.in
+++ b/package/radvd/Config.in
@@ -7,3 +7,6 @@ config BR2_PACKAGE_RADVD
 	  IPv6 Router Advertisement Daemon.
 
 	  http://www.litech.org/radvd/
+
+comment "radvd requires a toolchain with IPV6 support"
+	depends on !BR2_INET_IPV6
-- 
1.7.3.4
