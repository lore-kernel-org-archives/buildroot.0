From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 10 Aug 2014 09:03:38 +0200
Subject: [Buildroot] [PATCH 1/1] odhcploc: new package
In-Reply-To: <1407607617-18039-1-git-send-email-bos@je-eigen-domein.nl>
References: <1407607617-18039-1-git-send-email-bos@je-eigen-domein.nl>
Message-ID: <6af06b44-fa6f-434f-ad4d-6acdb7fb4058@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Floris Bos <bos@je-eigen-domein.nl> schreef:
>Adds odhcploc, a network utility to scan for (rogue) DHCP servers.
>
>Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
>---
> package/Config.in            |  1 +
> package/odhcploc/Config.in   |  8 ++++++++
> package/odhcploc/odhcploc.mk | 21 +++++++++++++++++++++
> 3 files changed, 30 insertions(+)
> create mode 100644 package/odhcploc/Config.in
> create mode 100644 package/odhcploc/odhcploc.mk
>
>diff --git a/package/Config.in b/package/Config.in
>index 4520ba6..7bb8fc0 100644
>--- a/package/Config.in
>+++ b/package/Config.in
>@@ -1031,6 +1031,7 @@ endif
> 	source "package/noip/Config.in"
> 	source "package/ntp/Config.in"
> 	source "package/nuttcp/Config.in"
>+	source "package/odhcploc/Config.in"
> 	source "package/olsr/Config.in"
> 	source "package/openntpd/Config.in"
> 	source "package/openobex/Config.in"
>diff --git a/package/odhcploc/Config.in b/package/odhcploc/Config.in
>new file mode 100644
>index 0000000..74bf363
>--- /dev/null
>+++ b/package/odhcploc/Config.in
>@@ -0,0 +1,8 @@
>+config BR2_PACKAGE_ODHCPLOC
>+	bool "odhcploc"
>+	help
>+	  Open DHCP Locate (ODHCPLoc) is program to locate and
>+	  display active DHCP servers on a subnet.
>+	  Can be used to scan for rogue DHCP servers.
>+
>+	  http://odhcploc.sourceforge.net/
>diff --git a/package/odhcploc/odhcploc.mk b/package/odhcploc/odhcploc.mk
>new file mode 100644
>index 0000000..d99247c
>--- /dev/null
>+++ b/package/odhcploc/odhcploc.mk
>@@ -0,0 +1,21 @@
>+################################################################################
>+#
>+# odhcploc
>+#
>+################################################################################
>+
>+ODHCPLOC_VERSION = 20111021
>+ODHCPLOC_SOURCE = odhcploc-$(ODHCPLOC_VERSION).tar.gz

.tar.gz is the default, so this line can be removed.
