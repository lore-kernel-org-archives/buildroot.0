From: Sven Neumann <s.neumann@phase-zero.de>
Date: Thu, 22 Jan 2009 09:47:01 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/libconfuse
In-Reply-To: <20090122071406.155456d9@hcegtvedt>
References: <20090121204512.4928A768C5@busybox.osuosl.org>
	<20090122071406.155456d9@hcegtvedt>
Message-ID: <1232614021.6415.3.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Thu, 2009-01-22 at 07:14 +0100, Hans-Christian Egtvedt wrote:
> On Wed, 21 Jan 2009 20:45:12 +0000 (UTC)
> jacmet at uclibc.org wrote:
> 
> > Author: jacmet
> > Date: 2009-01-21 20:45:10 +0000 (Wed, 21 Jan 2009)
> > New Revision: 24944
> > 
> > Log:
> > libconfuse: fix build by removing -Werror flag
> > 
> 
> You know that is not fixing it ;) Source code should not generate
> warnings, they are usually a sign of something bad is happening.

Source code that compiles without warnings on one compiler may generate
warnings on a different compiler (or just a different version or a
slightly differently configured instance of the very same compiler).
Having -Werror in public source code is always wrong as you can't
possibly know that it will compile cleanly for everyone.

And there are tons of warnings created by compilers that don't
necessarily indicate a problem in the source code. But of course you are
right that one should always check every warning carefully.


Sven
