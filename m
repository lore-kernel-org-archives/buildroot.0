From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jul 2015 22:48:40 +0200
Subject: [Buildroot] [git commit] linux-headers: mark EOL versions deprecated
Message-ID: <20150728204851.250188181F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dda478689fe7b00720c26aca569e201f262a37aa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Follow the upstream EOL cycle and mark 4.0 as deprecated for 2015.08.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-headers/Config.in.host |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 2fcc39b..41ba27f 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -84,6 +84,7 @@ choice
 
 	config BR2_KERNEL_HEADERS_4_0
 		bool "Linux 4.0.x kernel headers"
+		depends on BR2_DEPRECATED_SINCE_2015_08
 		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0
 
 	config BR2_KERNEL_HEADERS_4_1
