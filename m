From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 26 Jul 2014 09:22:06 +0200
Subject: [Buildroot] [PATCH] x11vnc: needs MMU
In-Reply-To: <1406289530-2622-1-git-send-email-yuvaraj.patil@wipro.com>
References: <1406289530-2622-1-git-send-email-yuvaraj.patil@wipro.com>
Message-ID: <20140726092206.1f78c0a4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yuvaraj Patil,

On Fri, 25 Jul 2014 17:28:50 +0530, Yuvaraj Patil wrote:
> This package needs MMU. Hence added dependency on BR2_USE_MMU
> 
> Fixes:
> http://autobuild.buildroot.net/results/b9d/b9d27977a231d186fe5289232f5d3995ec756266//
> Signed-off-by: Yuvaraj Patil <yuvaraj.patil@wipro.com>

There should have been one empty new line before the Signed-off-by line.

>  package/x11vnc/Config.in |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/x11vnc/Config.in b/package/x11vnc/Config.in
> index 5693754..f27cc8a 100644
> --- a/package/x11vnc/Config.in
> +++ b/package/x11vnc/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_X11VNC
>  	bool "x11vnc"
>  	depends on BR2_PACKAGE_XORG7
> +	depends on BR2_USE_MMU #fork()

Nit: space between # and fork().

I've fixed both of those minor issues, and applied your patch.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
