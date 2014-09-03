From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 3 Sep 2014 12:23:05 +0300
Subject: [Buildroot] [PATCH 1/1] dos2unix: new package
In-Reply-To: <1409735578-25549-1-git-send-email-david.bachelart@bbright.com>
References: <1409735578-25549-1-git-send-email-david.bachelart@bbright.com>
Message-ID: <20140903092305.GC25921@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi David,

On Wed, Sep 03, 2014 at 11:12:57AM +0200, David Bachelart wrote:

[snip]

> diff --git a/package/dos2unix/dos2unix.mk b/package/dos2unix/dos2unix.mk
> new file mode 100644
> index 0000000..a976ffe
> --- /dev/null
> +++ b/package/dos2unix/dos2unix.mk
> @@ -0,0 +1,40 @@
> +################################################################################
> +#
> +# dos2unix
> +#
> +################################################################################
> +
> +DOS2UNIX_VERSION = 6.0.6
> +DOS2UNIX_SITE = http://waterlan.home.xs4all.nl/dos2unix/
> +
> +DOS2UNIX_LICENSE = BSD-2c
> +DOS2UNIX_LICENSE_FILES = COPYING.txt

dos2unix is also provided by busybox. You need to list busybox in 
DOS2UNIX_DEPENDENCIES to make sure dos2unix builds (and installs) after 
busybox, overriding the busybox applet.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
