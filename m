From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Tue, 26 Aug 2008 15:48:56 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/libgtk2
In-Reply-To: <87k5e3gbne.fsf@macbook.be.48ers.dk>
References: <20080826121930.77B8B3C79C@busybox.net>
	<87k5e3gbne.fsf@macbook.be.48ers.dk>
Message-ID: <20080826134856.GK2213@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Aug 26, 2008 at 03:15:49PM +0200, Peter Korsgaard wrote:
>>>>>> "laird" == laird  <laird@uclibc.org> writes:
>
> laird> Author: laird
> laird> Date: 2008-08-26 05:19:29 -0700 (Tue, 26 Aug 2008)
> laird> New Revision: 23204
>
>Welcome!
>
> laird> Log:
> laird> The changes below add better support for DirectFB and libgtk2.
> laird> Should be no different for X builds.
>
>Could you please check these things in seperately?
>
> laird> Changeset:
> laird> Modified: trunk/buildroot/package/libgtk2/Config.in
> laird> ===================================================================
> laird> --- trunk/buildroot/package/libgtk2/Config.in	2008-08-26 01:32:33 UTC (rev 23203)
> laird> +++ trunk/buildroot/package/libgtk2/Config.in	2008-08-26 12:19:29 UTC (rev 23204)
> laird> @@ -2,14 +2,13 @@
> laird>  	bool "libgtk2"
> laird>  	select BR2_PACKAGE_ATK
> laird>  	select BR2_PACKAGE_CAIRO
> laird> -	select BR2_PACKAGE_CUPS
>
>Shouldn't that instead be something like:
>
>select BR2_PACKAGE_CUPS if BR2_PACKAGE_XORG||BR2_PACKAGE_XORG7||BR2_PACKAGE_TINYX

This was recently changed (for the bad, imho).
Previously, we had a "choice" for either of

 XSERVER_none
 XSERVER_xorg7
 XSERVER_tinyx
 XSERVER_xggi

With this scheme, you could quickly distinguish if and if yes then which
xserver was selected:

  depends on !BR2_XSERVER_none
to depend on any xserver etc.

Peter, was it you who changed this xserver choice? What was
the rationale?
