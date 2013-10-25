From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 25 Oct 2013 18:50:35 +0200
Subject: [Buildroot] [PATCH 1/1] Added pyusb as a package
In-Reply-To: <1382705646-20583-1-git-send-email-wzab01@gmail.com>
References: <1382705646-20583-1-git-send-email-wzab01@gmail.com>
Message-ID: <1256826d-31b9-4b85-8834-35694e372fac@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"Wojciech M. Zabolotny" <wzab01@gmail.com> wrote:
>Signed-off-by: Wojciech M. Zabolotny <wzab01@gmail.com>
>---
> package/Config.in       |  1 +
> package/pyusb/Config.in | 10 ++++++++++
> package/pyusb/pyusb.mk  | 22 ++++++++++++++++++++++
> 3 files changed, 33 insertions(+)
> create mode 100644 package/pyusb/Config.in
> create mode 100644 package/pyusb/pyusb.mk
>
>diff --git a/package/Config.in b/package/Config.in
>index 0e6f86c..591cc04 100644
>--- a/package/Config.in
>+++ b/package/Config.in
>@@ -404,6 +404,7 @@ source "package/python-pyzmq/Config.in"
> source "package/python-serial/Config.in"
> source "package/python-setuptools/Config.in"
> source "package/python-thrift/Config.in"
>+source "package/pyusb/Config.in"
> endmenu
> endif
> source "package/python3/Config.in"
>diff --git a/package/pyusb/Config.in b/package/pyusb/Config.in
>new file mode 100644
>index 0000000..b0c714a
>--- /dev/null
>+++ b/package/pyusb/Config.in
>@@ -0,0 +1,10 @@
>+config BR2_PACKAGE_PYUSB
>+	bool "pyusb"
>+	depends on BR2_PACKAGE_PYTHON
>+	select BR2_PACKAGE_LIBUSB
>+	help
>+          The PyUSB module provides for Python easy access to the host
>+          machine's Universal Serial Bus (USB) system.
>+
>+	  http://sourceforge.net/apps/trac/pyusb/
>+
>diff --git a/package/pyusb/pyusb.mk b/package/pyusb/pyusb.mk
>new file mode 100644
>index 0000000..fde10c9
>--- /dev/null
>+++ b/package/pyusb/pyusb.mk
>@@ -0,0 +1,22 @@
>+################################################################################
>+#
>+# pyusb
>+#
>+################################################################################
>+
>+PYUSB_VERSION = 0546cad8980783c39f96db717005a550059b730f
>+PYUSB_SITE = git://github.com/walac/pyusb/

Packages that come from github can be downloaded directly as a tarball. This has the advantage of not needing git. Please refer to the buildroot manual for instructions on this.

Best regards,
Thomas
