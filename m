From: Jonathan Ben Avraham <yba@tkos.co.il>
Date: Tue, 2 Sep 2014 19:32:05 +0300 (IDT)
Subject: [Buildroot] [PATCH] libphidget: needs dynamic library support
In-Reply-To: <1409617011-24433-1-git-send-email-gustavo@zacarias.com.ar>
References: <1409617011-24433-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <alpine.DEB.2.02.1409021930440.5899@tavas.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo,
Thanks for the fix.
What should I have known or tested to find this myself at the time that I 
added the package?

  - yba


On Mon, 1 Sep 2014, Gustavo Zacarias wrote:

> Date: Mon,  1 Sep 2014 21:16:51 -0300
> From: Gustavo Zacarias <gustavo@zacarias.com.ar>
> To: buildroot at busybox.net
> Subject: [Buildroot] [PATCH] libphidget: needs dynamic library support
> 
> Fixes:
> http://autobuild.buildroot.net/results/932/9322c930a545bb500b5193a84b26895a03a6b7f7/
>
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
> package/libphidget/Config.in        | 4 +++-
> package/phidgetwebservice/Config.in | 4 +++-
> 2 files changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/package/libphidget/Config.in b/package/libphidget/Config.in
> index 9f3e4bf..18a3207 100644
> --- a/package/libphidget/Config.in
> +++ b/package/libphidget/Config.in
> @@ -1,6 +1,7 @@
> config BR2_PACKAGE_LIBPHIDGET
> 	bool "libphidget"
> 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
> +	depends on !BR2_PREFER_STATIC_LIB
> 	select BR2_PACKAGE_LIBUSB
> 	help
> 	  The libphidget library provides an API for controlling Phidgets
> @@ -20,5 +21,6 @@ config BR2_PACKAGE_LIBPHIDGET
>
> 	  http://phidgets.com/
>
> -comment "libphidget needs a toolchain w/ threads"
> +comment "libphidget needs a toolchain w/ threads, dynamic library"
> 	depends on !BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_PREFER_STATIC_LIB
> diff --git a/package/phidgetwebservice/Config.in b/package/phidgetwebservice/Config.in
> index 7bb6f33..b85166e 100644
> --- a/package/phidgetwebservice/Config.in
> +++ b/package/phidgetwebservice/Config.in
> @@ -1,6 +1,7 @@
> config BR2_PACKAGE_PHIDGETWEBSERVICE
> 	bool "phidgetwebservice"
> 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb, libphidget
> +	depends on !BR2_PREFER_STATIC_LIB # libphidget
> 	select BR2_PACKAGE_LIBPHIDGET
> 	help
>           phidgetwebservice (the Phidget WebService) provides an HTTP
> @@ -15,5 +16,6 @@ config BR2_PACKAGE_PHIDGETWEBSERVICE
>
> 	  http://phidgets.com/
>
> -comment "phidgetwebservice needs a toolchain w/ threads"
> +comment "phidgetwebservice needs a toolchain w/ threads, dynamic library"
> 	depends on !BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_PREFER_STATIC_LIB
>

-- 
  9590 8E58 D30D 1660 C349  673D B205 4FC4 B8F5 B7F9  ~. .~  Tk Open Systems
=}-------- Jonathan Ben-Avraham ("yba") ----------ooO--U--Ooo------------{=
mailto:yba at tkos.co.il tel:+972.52.486.3386 http://tkos.co.il skype:benavrhm
