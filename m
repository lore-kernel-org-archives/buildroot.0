From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Tue, 27 Jan 2009 08:30:29 +0100
Subject: [Buildroot] svn commit: trunk/buildroot:
	docs	target	target/device/Atmel target/ etc...
In-Reply-To: <20090127002621.GQ25952@mx.loc>
References: <20090126235232.92CF677458@busybox.osuosl.org>
	<20090127002621.GQ25952@mx.loc>
Message-ID: <1233041429.2298.144.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tis 2009-01-27 klockan 01:26 +0100 skrev Bernhard Reutner-Fischer:
> On Mon, Jan 26, 2009 at 11:52:32PM +0000, ulf at uclibc.org wrote:
> >Author: ulf
> >Date: 2009-01-26 23:52:31 +0000 (Mon, 26 Jan 2009)
> >New Revision: 25071
> 
> >This is overridden by BUILDROOT_COPYTO,
> >if set into the environment.
> 
> >+COPYTO=$(strip $(subst ",,$(BUILDROOT_COPYTO)))
> 
> What i like about stuff like that is that it is so obvious that it
> _will_ bite sombody sooner or later. Surely you will call that
> case constructed, but there is no need to add brittle stuff if
> it would be so easy to do it "right".
> 
> $ grep _COPYTO ~/.bashrc
> BUILDROOT_COPYTO="$HOME/This is my   Desktop directory/keep/"

Thre typical case for this is "/tftpboot"
or "/var/share/tftpbot"
I do not see any other use for it at the momemnt.

If you want more stability,
then providing a directory for tftpboot
would be the real option.

I.E: You always end with tftpboot.
YOu can then select "/"  or "/var/share"

for "/tftpboot" or "/var/share/tftpboot"

BR
Ulf Samuelsson

> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
