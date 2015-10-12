From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Oct 2015 22:02:21 +0200
Subject: [Buildroot] [PATCH 1/1] package/vlc: Add optional dependency to
 libtaglib
In-Reply-To: <1444669674-23736-1-git-send-email-bernd.kuhls@t-online.de>
References: <1444669674-23736-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20151012220221.4f6a6a6e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Mon, 12 Oct 2015 19:07:54 +0200, Bernd Kuhls wrote:

> diff --git a/package/vlc/Config.in b/package/vlc/Config.in
> index 71e4f34..e2b8da9 100644
> --- a/package/vlc/Config.in
> +++ b/package/vlc/Config.in
> @@ -13,6 +13,7 @@ config BR2_PACKAGE_VLC
>  	select BR2_PACKAGE_LIBVORBIS if BR2_PACKAGE_OPUS
>  	select BR2_PACKAGE_VLC_OPENCV_BACKEND if BR2_PACKAGE_OPENCV
>  	select BR2_PACKAGE_VLC_OPENCV3_BACKEND if BR2_PACKAGE_OPENCV3
> +	select BR2_PACKAGE_ZLIB if BR2_PACKAGE_TAGLIB

To be honest, I wasn't sure if we should be doing what you propose here
(select zlib when taglib is enabled), or in the .mk file, do:

ifeq ($(BR2_PACKAGE_TAGLIB)$(BR2_PACKAGE_ZLIB),yy)

But since we don't have a very strict policy about this in Buildroot, I
just applied your patch as-is. If some people think it should be done
otherwise, we can fix it up.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
