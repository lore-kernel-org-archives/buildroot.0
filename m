From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 04 Aug 2014 06:51:44 +0200
Subject: [Buildroot] [PATCH v2] bcache-tools: Adding package.
In-Reply-To: <1406839219-10929-1-git-send-email-jcd@tribudubois.net>
References: <1406839219-10929-1-git-send-email-jcd@tribudubois.net>
Message-ID: <d725ee82-8d5c-4660-98e8-4b896b43fe16@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jean-Christophe DUBOIS <jcd@tribudubois.net> schreef:
>This patch adds the bcache-tools package to buildroot.
>
>This is the bcache tools, required to setup the linux bcache
>feature of the Linux kernel.
>
>Signed-off-by: Jean-Christophe DUBOIS <jcd@tribudubois.net>
>---
>Changes v1 to v2
> * remove 'support' word from comment statement in Config.in.
> * use github helper to get the project site instead of hardcoded URL.
>---
> package/Config.in                    |  1 +
> package/bcache-tools/Config.in       | 11 +++++++++++
> package/bcache-tools/bcache-tools.mk | 34 ++++++++++++++++++++++++++++++++++
> 3 files changed, 46 insertions(+)
> create mode 100644 package/bcache-tools/Config.in
> create mode 100644 package/bcache-tools/bcache-tools.mk
>
>diff --git a/package/Config.in b/package/Config.in
>index 29b8e6b..7468b28 100644
>--- a/package/Config.in
>+++ b/package/Config.in
>@@ -279,6 +279,7 @@ endmenu
> 	source "package/a10disp/Config.in"
> 	source "package/acpid/Config.in"
> 	source "package/avrdude/Config.in"
>+	source "package/bcache-tools/Config.in"
> 	source "package/cdrkit/Config.in"
> 	source "package/cryptsetup/Config.in"
> 	source "package/cwiid/Config.in"
>diff --git a/package/bcache-tools/Config.in b/package/bcache-tools/Config.in
>new file mode 100644
>index 0000000..fbe4158
>--- /dev/null
>+++ b/package/bcache-tools/Config.in
>@@ -0,0 +1,11 @@
>+config BR2_PACKAGE_BCACHE_TOOLS
>+	bool "bcache tools"
>+	depends on BR2_PACKAGE_HAS_UDEV
>+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
>+	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
>+	help
>+	  This is the bcache tools, required to setup the linux bcache
>+	  feature of the Linux kernel.

I think a brief explanation of what this bcache feature is could be helpful for users that use the Buildroot menuconfig to detect useful packages.
