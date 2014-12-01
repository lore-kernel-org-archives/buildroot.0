From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Dec 2014 20:05:52 +0100
Subject: [Buildroot] [git commit] linux-headers: mark EOL versions deprecated
Message-ID: <20141201190932.52D867FFE7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f61e0a1fc8d1a0a0b088aa6f350c3f4b232000eb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Follow the upstream EOL cycle and mark 3.16 as deprecated for 2015.02.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index d765e3a..7e48309 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -56,6 +56,7 @@ choice
 
 	config BR2_KERNEL_HEADERS_3_16
 		bool "Linux 3.16.x kernel headers"
+		depends on BR2_DEPRECATED_SINCE_2015_02
 		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_16
 
 	config BR2_KERNEL_HEADERS_3_17
