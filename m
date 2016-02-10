From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Tue, 09 Feb 2016 22:10:35 -0200
Subject: [Buildroot] [PATCH] package/x11r7/xapp_xf86dga: remove
 dependencies on Xt/Xaw/Xmu
References: <1455055451-19200-1-git-send-email-arnout@mind.be>
Message-ID: <56ba7ffbb97c6_5caf1b5a92c61834@ultri2.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Feb 09, 2016 at 08:04 PM, Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> wrote:
> Since the bump to 1.0.3, xapp_xf86dga no longer uses libXt, libXaw and
> libXmu. So these dependencies should be removed from the .mk file.
> 
> They were already removed from Config.in, leading to messages like:
> Makefile:475: *** xlib_libXaw is in the dependency chain of xapp_xf86dga
> that has added it to its _DEPENDENCIES variable without selecting it or
> depending on it from Config.in.  Stop.

You can add if you want:

Fixes:
http://autobuild.buildroot.net/results/aee/aee4a895c74647292715705bfcdf742f3ea2f76f/

> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Tested-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Build test for the autobuild issue using minimal config
BR2_TOOLCHAIN_EXTERNAL=y # easy for toolchain w/ MMU support
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_XAPP_XF86DGA=y

Regards,
Ricardo
