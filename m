From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 15 Oct 2013 15:21:47 +0200
Subject: [Buildroot] [PATCH 1/1 V3] new package : jquery-mobile
In-Reply-To: <1381839602-22797-1-git-send-email-sagaert.johan@skynet.be>
References: <1381839602-22797-1-git-send-email-sagaert.johan@skynet.be>
Message-ID: <7b32c0d7-601f-4a3d-8b10-cc454cff75e7@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Johan,

Sagaert Johan <sagaert.johan@skynet.be> wrote:
>jQuery-Mobile is a unified, HTML5-based user interface system
>for all popular mobile device platforms, built on the rock-solid
>jQuery and jQuery UI foundation.
>Its lightweight code is built with progressive enhancement,
>and has a flexible, easily themeable design.
>
>Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
>---
>Changes V1->V2 :
>	simplified file copying.
>	
>Changes V2->V3 :
>	used lowercase for the menu entry.
>
> package/Config.in                      |  1 +
> package/jquery-mobile/Config.in        | 23 ++++++++++++++++
> package/jquery-mobile/jquery-mobile.mk | 48 ++++++++++++++++++++++++++++++++++
> 3 files changed, 72 insertions(+)
> create mode 100644 package/jquery-mobile/Config.in
> create mode 100644 package/jquery-mobile/jquery-mobile.mk
>
>diff --git a/package/Config.in b/package/Config.in
>index 142454d..857ae9e 100644
>--- a/package/Config.in
>+++ b/package/Config.in
>@@ -576,6 +576,7 @@ source "package/explorercanvas/Config.in"
> source "package/flot/Config.in"
> source "package/jquery/Config.in"
> source "package/jquery-keyboard/Config.in"
>+source "package/jquery-mobile/Config.in"
> source "package/jquery-sparkline/Config.in"
> source "package/jquery-ui/Config.in"
> source "package/jquery-ui-themes/Config.in"
>diff --git a/package/jquery-mobile/Config.in b/package/jquery-mobile/Config.in
>new file mode 100644
>index 0000000..776becf
>--- /dev/null
>+++ b/package/jquery-mobile/Config.in
>@@ -0,0 +1,23 @@
>+config BR2_PACKAGE_JQUERY_MOBILE
>+	bool "jquery-mobile"
>+	help
>+	  jQuery-Mobile is a unified, HTML5-based user interface system
>+	  for all popular mobile device platforms, built on the rock-solid
>+	  jQuery and jQuery UI foundation.
>+	  Its lightweight code is built with progressive enhancement,
>+	  and has a flexible, easily themeable design.
>+
>+	  http://jquerymobile.com
>+	  
>+if BR2_PACKAGE_JQUERY_MOBILE
>+config BR2_PACKAGE_JQUERY_MOBILE_FULL
>+	bool "jquery-mobile development files"
>+	help
>+		Installs the development versions.

ThomasP already mentioned this wrong indentation in the previous version of your patch. I think you missed that..

Best regards,
Thomas
