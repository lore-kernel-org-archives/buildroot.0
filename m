From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 25 Aug 2013 11:17:12 +0200
Subject: [Buildroot] [PATCH 1/1] Phonon needs libglib2 or else it's
 functionality tests will fail.
In-Reply-To: <1377299653-9977-1-git-send-email-sagaert.johan@skynet.be>
References: <1377299653-9977-1-git-send-email-sagaert.johan@skynet.be>
Message-ID: <20130825111712.6a96f399@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sagaert Johan,

On Sat, 24 Aug 2013 01:14:13 +0200, Sagaert Johan wrote:
> Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
> ---
>  package/qt/Config.in | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/package/qt/Config.in b/package/qt/Config.in
> index 35e8208..2541875 100644
> --- a/package/qt/Config.in
> +++ b/package/qt/Config.in
> @@ -264,7 +264,8 @@ source "package/qt/Config.keyboard.in"
>  
>  config BR2_PACKAGE_QT_PHONON
>  	bool "Phonon Module"
> -	depends on BR2_PACKAGE_GSTREAMER
> +	depends on BR2_PACKAGE_GSTREAMER 
> +	depends on BR2_PACKAGE_LIBGLIB2

Hum, I'm not sure to understand. BR2_PACKAGE_QT_PHONON already depends
on BR2_PACKAGE_GSTREAMER. And BR2_PACKAGE_GSTREAMER selects
BR2_PACKAGE_LIBGLIB2. So, if BR2_PACKAGE_GSTREAMER is enabled, then
you're sure BR2_PACKAGE_LIBGLIB2 is enabled.

So unless I'm missing something, your patch does nothing, and I don't
quite see how it could fix any issue. Can you give the .config that
exhibits your build problem?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
