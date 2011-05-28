From: =?ISO-8859-1?Q?S=E9rgio?= Basto <sergio@serjux.com>
Date: Sat, 28 May 2011 16:16:13 +0100
Subject: [Buildroot] libglib2 now requires gettext
In-Reply-To: <15734.99.181.179.117.1306510521.squirrel@lavabit.com>
References: <15734.99.181.179.117.1306510521.squirrel@lavabit.com>
Message-ID: <1306595773.12969.5.camel@segulix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 2011-05-27 at 08:35 -0700, idunham at lavabit.com wrote: 
> I've been trying to build a system with buildroot 2011.05rc2, complete
> with GTK2, which requires libglib2; gettext is enabled for some other
> library.
> So far, buildroot has reached configuring libglib2 for the target system;
> here, it ignores the --disable-nls flag, and goes on to:
> ...
> checking for libintl.h... no
> configure: error:
> *** You must have either have gettext support in your C library, or use the
> *** GNU gettext library. (http://www.gnu.org/software/gettext/gettext.html)
> 
> This with is libglib2-2.28.6
> 
> So I guess the makefiles need to be changed so as to set gettext as a
> dependency for libglib2, if buildroot uses the latest version.

I had a similar problem here: 
https://bugs.busybox.net/show_bug.cgi?id=759
see if helps ,
