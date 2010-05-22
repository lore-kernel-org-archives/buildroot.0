From: Thomas <tokant@gmx.net>
Date: Sat, 22 May 2010 10:33:24 +0200
Subject: [Buildroot] buildroot-2010.05-rc2, problem with binutils-2.20.1
In-Reply-To: <20100522003018.1ef13985@surf>
References: <1274422785.5719.8.camel@bernd-desktop>
	<20100521122542.5c4b0907@surf> <1274479497.25288.3.camel@bernd-desktop>
	<20100522003018.1ef13985@surf>
Message-ID: <1274517204.15163.3.camel@bernd-desktop>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 2010-05-22 at 00:30 +0200, Thomas Petazzoni wrote:

> Ok. Could you try the below patch and report the result ? Thanks!
> 
> diff --git a/package/Makefile.in b/package/Makefile.in
> index 7ac429c..33eeeeb 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -81,7 +81,7 @@ endif
>  # in $(HOST_DIR)/usr/lib. As we cannot add $(HOST_DIR)/usr/lib to
>  # LD_LIBRARY_PATH when building target packages because it causes
>  # libtool breakage, we force a rpath to be added to host binaries.
> -HOST_CFLAGS+=-Wl,-rpath -Wl,$(HOST_DIR)/usr/lib
> +HOST_LDFLAGS+=-Wl,-rpath -Wl,$(HOST_DIR)/usr/lib
>  
>  #########################################################################
>  ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
> 

yes it works :-)

Thanks, Thomas.
