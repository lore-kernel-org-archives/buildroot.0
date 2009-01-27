From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Tue, 27 Jan 2009 01:26:21 +0100
Subject: [Buildroot] svn commit: trunk/buildroot: docs
	target	target/device/Atmel target/ etc...
In-Reply-To: <20090126235232.92CF677458@busybox.osuosl.org>
References: <20090126235232.92CF677458@busybox.osuosl.org>
Message-ID: <20090127002621.GQ25952@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jan 26, 2009 at 11:52:32PM +0000, ulf at uclibc.org wrote:
>Author: ulf
>Date: 2009-01-26 23:52:31 +0000 (Mon, 26 Jan 2009)
>New Revision: 25071

>This is overridden by BUILDROOT_COPYTO,
>if set into the environment.

>+COPYTO=$(strip $(subst ",,$(BUILDROOT_COPYTO)))

What i like about stuff like that is that it is so obvious that it
_will_ bite sombody sooner or later. Surely you will call that
case constructed, but there is no need to add brittle stuff if
it would be so easy to do it "right".

$ grep _COPYTO ~/.bashrc
BUILDROOT_COPYTO="$HOME/This is my   Desktop directory/keep/"
