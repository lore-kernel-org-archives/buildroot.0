From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 22 Jan 2014 21:48:19 +0100
Subject: [Buildroot] [git commit] linux/Config.in: clarify longterm 2.6 URL
	exception
Message-ID: <20140122204854.B02559C5C6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a1ede0a51366a3418666f4cb1afd445fb969b967
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As this question has popped up multiple times on the mailing list, clarify
that selecting longterm 2.6 kernels requires the 'custom tarball' option
instead of 'custom version'.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 583735e..be619d3 100644
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
