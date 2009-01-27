From: Daniel Laird <danieljlaird@hotmail.com>
Date: Tue, 27 Jan 2009 08:25:16 +0000
Subject: [Buildroot] svn commit: trunk/buildroot/package/webkit
In-Reply-To: <20090127002732.GB1083@cloud.net.au>
References: <20090123174908.81999769CC@busybox.osuosl.org>
	<20090127002732.GB1083@cloud.net.au>
Message-ID: <COL102-W811D43396757A885D85C94DCCB0@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Webkit does not rely on X either, I have building just on top of GTK and DirectFB.

Although I do have a slightly newer version of webkit running.

Daniel Laird


> Date: Tue, 27 Jan 2009 11:27:32 +1100
> From: hamish at cloud.net.au
> To: buildroot at busybox.net; buildroot at uclibc.org
> Subject: Re: [Buildroot] svn commit: trunk/buildroot/package/webkit
> 
> On Fri, Jan 23, 2009 at 05:49:08PM +0000, ulf at uclibc.org wrote:
> > Author: ulf
> > Date: 2009-01-23 17:49:07 +0000 (Fri, 23 Jan 2009)
> > New Revision: 24983
> > 
> > Log:
> > Disable webkit (with comment) if X is not available
> > 
> > Modified:
> >    trunk/buildroot/package/webkit/Config.in
> > 
> > 
> > Changeset:
> > Modified: trunk/buildroot/package/webkit/Config.in
> > ===================================================================
> > --- trunk/buildroot/package/webkit/Config.in	2009-01-23 17:48:49 UTC (rev 24982)
> > +++ trunk/buildroot/package/webkit/Config.in	2009-01-23 17:49:07 UTC (rev 24983)
> > @@ -1,13 +1,18 @@
> >  config BR2_PACKAGE_WEBKIT
> >  	bool "webkit"
> > -	select BR2_PACKAGE_LIBGTK2
> >  	select BR2_PACKAGE_ICU
> >  	select BR2_PACKAGE_CURL
> >  	select BR2_PACKAGE_LIBXML2
> >  	select BR2_PACKAGE_LIBXSLT
> > +	select BR2_PACKAGE_LIBGTK2
> >  	select BR2_PACKAGE_SQLITE
> > +	depends on !BR2_PACKAGE_XSERVER_none
> 
> That's not a good test of X availability. You should check for X
> libraries only, as the X server may be remote.
> 
> Hamish
> -- 
> Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

_________________________________________________________________
Check out the new and improved services from Windows Live. Learn more! 
http://clk.atdmt.com/UKM/go/132630768/direct/01/
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://lists.busybox.net/pipermail/buildroot/attachments/20090127/7d978ab8/attachment.htm 
