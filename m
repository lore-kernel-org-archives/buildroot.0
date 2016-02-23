From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 23 Feb 2016 22:56:49 +0100
Subject: [Buildroot] [git commit branch/next] linux-headers: mark EOL
	versions deprecated
Message-ID: <20160223215936.728E880300@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e81b166ec1744a6a5a6ebb87988441397db07d8a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Follow the upstream EOL cycle and mark 4.3 as deprecated for 2016.05.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index ad5ee2e..dc58637 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -73,6 +73,7 @@ choice
 
 	config BR2_KERNEL_HEADERS_4_3
 		bool "Linux 4.3.x kernel headers"
+		depends on BR2_DEPRECATED_SINCE_2016_05
 		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3
 
 	config BR2_KERNEL_HEADERS_4_4
