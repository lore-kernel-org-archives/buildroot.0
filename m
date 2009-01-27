From: Hamish Moffatt <hamish@cloud.net.au>
Date: Tue, 27 Jan 2009 11:26:46 +1100
Subject: [Buildroot] svn commit: trunk/buildroot/package/libsexy
In-Reply-To: <87mydhkgdx.fsf@macbook.be.48ers.dk>
References: <20090123174850.A9B52769CC@busybox.osuosl.org>
	<87mydhkgdx.fsf@macbook.be.48ers.dk>
Message-ID: <20090127002646.GA1083@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jan 23, 2009 at 07:48:42PM +0100, Peter Korsgaard wrote:
> >>>>> "ulf" == ulf  <ulf@uclibc.org> writes:
> 
>  ulf> Author: ulf
>  ulf> Date: 2009-01-23 17:48:49 +0000 (Fri, 23 Jan 2009)
>  ulf> New Revision: 24982
> 
>  ulf> Log:
>  ulf> Disable libsexy (with comment) if X is not available
> 
>  ulf> Modified:
>  ulf>    trunk/buildroot/package/libsexy/Config.in
> 
>  ulf> Changeset:
>  ulf> Modified: trunk/buildroot/package/libsexy/Config.in
>  ulf> ===================================================================
>  ulf> --- trunk/buildroot/package/libsexy/Config.in	2009-01-23 13:12:57 UTC (rev 24981)
>  ulf> +++ trunk/buildroot/package/libsexy/Config.in	2009-01-23 17:48:49 UTC (rev 24982)
>  ulf> @@ -1,6 +1,7 @@
>  ulf>  config BR2_PACKAGE_LIBSEXY
>  ulf>  	bool "libsexy"
>  ulf>  	depends on BR2_PACKAGE_LIBGTK2
>  ulf> +	depends on !BR2_PACKAGE_XSERVER_none
> 
> According to the makefile it seems like there's a:
> 
> select BR2_PACKAGE_XLIB_LIBX11
> 
> missing.
> 
> But from doing a quick grep in the libsexy sources I don't see
> any X includes, so are you sure it doesn't work with
> gtk-over-directfb?

Also, remember that X is client/server and lack of an X server doesn't
mean you can't run any X clients.


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
