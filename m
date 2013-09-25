From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 25 Sep 2013 07:59:26 +0200
Subject: [Buildroot] [PATCH] jq: new package
In-Reply-To: <1380070714-1795-1-git-send-email-danomimanchego123@gmail.com>
References: <1380070714-1795-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <bb47a7f9-6e83-4203-a8be-7038e346998c@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Danomi Manchego <danomimanchego123@gmail.com> wrote:
>jq is like sed for JSON data - you can use it to slice and filter
>and map and transform structured data with the same ease that sed,
>awk, grep and friends let you play with text.
>
>Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
>
>---
>
>The package description is as per the author - not my words.
>---
> package/Config.in    |    1 +
> package/jq/Config.in |    8 ++++++++
> package/jq/jq.mk     |   13 +++++++++++++
> 3 files changed, 22 insertions(+)
> create mode 100644 package/jq/Config.in
> create mode 100644 package/jq/jq.mk
>
>diff --git a/package/Config.in b/package/Config.in
>index 1dd60d1..ce18ec7 100644
>--- a/package/Config.in
>+++ b/package/Config.in
>@@ -108,6 +108,7 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
> source "package/grep/Config.in"
> endif
> source "package/intltool/Config.in"
>+source "package/jq/Config.in"
> source "package/make/Config.in"
> source "package/libtool/Config.in"
> source "package/m4/Config.in"
>diff --git a/package/jq/Config.in b/package/jq/Config.in
>new file mode 100644
>index 0000000..9329b2f
>--- /dev/null
>+++ b/package/jq/Config.in
>@@ -0,0 +1,8 @@
>+config BR2_PACKAGE_JQ
>+	bool "jq"
>+	help
>+	  jq is like sed for JSON data - you can use it to slice and filter
>+	  and map and transform structured data with the same ease that sed,
>+	  awk, grep and friends let you play with text.
>+
>+	  http://stedolan.github.io/jq/
>diff --git a/package/jq/jq.mk b/package/jq/jq.mk
>new file mode 100644
>index 0000000..b0436bb
>--- /dev/null
>+++ b/package/jq/jq.mk
>@@ -0,0 +1,13 @@
>+################################################################################
>+#
>+# jq
>+#
>+################################################################################
>+
>+JQ_VERSION = 1.3
>+JQ_SITE = http://github.com/stedolan/jq/archive

The buildroot manual talks about a slightly different url for github packages. It's there a specific reason you're not using that one?

>+JQ_AUTORECONF = YES
>+JQ_LICENSE = jq license
>+JQ_LICENSE_FILES = COPYING
>+
>+$(eval $(autotools-package))

Are there no dependencies?
No need for threads, c++, or any of that?

Best regards,
Thomas
