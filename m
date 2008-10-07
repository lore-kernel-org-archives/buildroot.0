From: Hamish Moffatt <hamish@cloud.net.au>
Date: Wed, 8 Oct 2008 10:17:41 +1100
Subject: [Buildroot] svn commit: trunk/buildroot/package
In-Reply-To: <20081007170827.CCA4AF801A@busybox.net>
References: <20081007170827.CCA4AF801A@busybox.net>
Message-ID: <20081007231741.GA7236@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Oct 07, 2008 at 10:08:27AM -0700, wberrier at uclibc.org wrote:
> Changeset:
> Modified: trunk/buildroot/package/Makefile.autotools.in
> ===================================================================
> --- trunk/buildroot/package/Makefile.autotools.in	2008-10-07 17:08:25 UTC (rev 23619)
> +++ trunk/buildroot/package/Makefile.autotools.in	2008-10-07 17:08:27 UTC (rev 23620)
> @@ -125,7 +125,7 @@
>  #	ACLOCAL="$(ACLOCAL)"
>  
>  # Automatically detect tar --strip-path/components option
> -TAR_STRIP_COMPONENTS = $(shell tar --help | grep strip-path > /dev/null ; if test $$? = 0 ; then echo '--strip-path' ; else echo '--strip-components' ; fi)
> +TAR_STRIP_COMPONENTS := $(shell $(CONFIG_SHELL) -c '$(TAR) --help | grep strip-path > /dev/null ; if test $$? = 0 ; then echo '--strip-path' ; else echo '--strip-components' ; fi')

Is there any reason we don't set SHELL=$(CONFIG_SHELL), rather than
using this $(shell $(CONFIG_SHELL) -c '...') construct everywhere?


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
