From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 11 Oct 2011 16:10:30 +0200
Subject: [Buildroot] [git commit] radvd: show it in config menu when
	toolchain lacks ipv6
Message-ID: <20111011142358.996C58E305@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bde4564fa74cc25a088aa4173709894d2acf5844
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
