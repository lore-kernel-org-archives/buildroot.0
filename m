From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 08 Aug 2015 10:56:04 -0000
Subject: [Buildroot] [git commit branch/next] linux-headers: mark EOL
	versions deprecated
Message-ID: <20150808105603.B92F281778@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3eb61964640bc40b3a2106aaa525f62926920ef6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Follow the upstream EOL cycle and mark 3.19 as deprecated for 2015.08.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index d81cd36..653209e 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -79,6 +79,7 @@ choice
 
 	config BR2_KERNEL_HEADERS_3_19
 		bool "Linux 3.19.x kernel headers"
+		depends on BR2_DEPRECATED_SINCE_2015_08
 		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_19
 
 	config BR2_KERNEL_HEADERS_4_0
