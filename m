From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Jun 2014 20:56:22 +0200
Subject: [Buildroot] [PATCH] ghostscript-fonts: new package
In-Reply-To: <1402181235-25810-1-git-send-email-ps.report@gmx.net>
References: <1402181235-25810-1-git-send-email-ps.report@gmx.net>
Message-ID: <20140614205622.49018092@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On Sun,  8 Jun 2014 00:47:15 +0200, Peter Seiderer wrote:

>  comment "X libraries and helper libraries"
>  source "package/dejavu/Config.in"
> +source "package/ghostscript-fonts/Config.in"
>  source "package/liberation/Config.in"
>  source "package/libsexy/Config.in"
>  source "package/x11r7/xkeyboard-config/Config.in"

The package looks good, but I'm wondering if "X libraries and helper
libraries" is really the right places for fonts. I'm pretty sure
liberation fonts are usable outside of X.org. Regarding
ghostscript-fonts, I am not sure what programs are using them.
Depending on that, the package could be visible at a different location
in menuconfig.

Also:

 * Could you post an updated version on top of master. The entire
   package/Config.in file has changed in terms of indentation.

 * This patch makes the assumption the dejavu package is applied, but
   both patches are not part of the same series. So either make the
   patches independent of each other (in separate branches on your
   side), or post both of them together as a series.

The rest of the package looks good to me, it's really just this
location in menuconfig that annoys me a bit.

Maybe other developers will have some suggestions on this?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
