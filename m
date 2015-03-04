From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Mar 2015 22:13:00 +0100
Subject: [Buildroot] [git commit] linux-headers: mark EOL versions deprecated
Message-ID: <20150304211938.A5B7F817F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7dd9214db6f92dce89d8642d80be86a84bdc98f8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Follow the upstream EOL cycle and mark 3.17 as deprecated for 2015.05.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-headers/Config.in.host |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 9ebf48a..e2bc05a 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -68,6 +68,7 @@ choice
 
 	config BR2_KERNEL_HEADERS_3_17
 		bool "Linux 3.17.x kernel headers"
+		depends on BR2_DEPRECATED_SINCE_2015_05
 		depends on !BR2_nios2
 		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
 
