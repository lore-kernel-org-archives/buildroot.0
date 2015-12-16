From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Dec 2015 23:42:23 +0100
Subject: [Buildroot] [PATCH] xutil_util-macros: move outside x11r7 scope
In-Reply-To: <1449096338-8006-1-git-send-email-gustavo@zacarias.com.ar>
References: <1449096338-8006-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20151216234223.6abe26c3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo,

On Wed,  2 Dec 2015 19:45:38 -0300, Gustavo Zacarias wrote:
> Move to package/util-macros and rename all symbols.
> They don't really require x11r7 infrastructure and are in fact needed by
> libepoxy which can be made x11r7-less.
> 
> Also add missing select in xfont_encoding for util-macros.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Since you're renaming the Config.in option, some Config.in.legacy
handling is needed.


> diff --git a/package/util-macros/Config.in b/package/util-macros/Config.in
> new file mode 100644
> index 0000000..de0b5bb
> --- /dev/null
> +++ b/package/util-macros/Config.in
> @@ -0,0 +1,4 @@
> +config BR2_PACKAGE_UTIL_MACROS
> +	bool "util-macros"
> +	help
> +	  X.Org autotools utility macros

I am wondering if util-macros isn't too generic. Should we name it
xorg-util-macros ? xorg-autotools-macros ? But admittedly, that's not
matching the upstream name.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
