From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Jan 2016 17:32:26 +0100
Subject: [Buildroot] [git commit] linux-headers: mark EOL versions deprecated
Message-ID: <20160111163526.8749C826D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a68224d0846debf538501a6999bc581683cddf6a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Follow the upstream EOL cycle and mark 4.2 as deprecated for 2016.02.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 9fabb9e..141811b 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -69,6 +69,7 @@ choice
 
 	config BR2_KERNEL_HEADERS_4_2
 		bool "Linux 4.2.x kernel headers"
+		depends on BR2_DEPRECATED_SINCE_2016_02
 		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_2
 
 	config BR2_KERNEL_HEADERS_4_3
