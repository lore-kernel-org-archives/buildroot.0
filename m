From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 22 Jan 2014 20:35:56 +0100
Subject: [Buildroot] [PATCH] linux/Config.in: clarify longterm 2.6 URL
	exception
Message-ID: <ea7bf317a8079ef7ce6b.1390419356@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As this question has popped up multiple times on the mailing list, clarify
that selecting longterm 2.6 kernels requires the 'custom tarball' option
instead of 'custom version'.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 linux/Config.in |  5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -40,6 +40,11 @@ config BR2_LINUX_KERNEL_CUSTOM_VERSION
 	  This option allows to use a specific official version from
 	  kernel.org, like 2.6.x, 2.6.x.y, 3.x.y, ...
 
+	  Note: you cannot use this option to select a _longterm_ 2.6
+	  kernel, because these kernels are not located at the standard
+	  URL at kernel.org. Instead, select "Custom tarball" and
+	  specify the right URL directly.
+
 config BR2_LINUX_KERNEL_CUSTOM_TARBALL
 	bool "Custom tarball"
 	help
