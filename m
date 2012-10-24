From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 24 Oct 2012 16:48:37 +0200
Subject: [Buildroot] [PATCH v2] wireshark: new package
In-Reply-To: <20121024164059.10666049@skate>
References: <4b73cf9536d6cde485299c9afb9fc41affa909ae.1351087817.git.baruch@tkos.co.il>
 <20121024164059.10666049@skate>
Message-ID: <20121024144837.GA25255@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Oct 24, 2012 at 04:40:59PM +0200, Thomas Petazzoni wrote:
> 
> On Wed, 24 Oct 2012 16:13:33 +0200, Baruch Siach wrote:
> > diff --git a/package/wireshark/wireshark-dont-include-prefix.patch b/package/wireshark/wireshark-dont-include-prefix.patch
> > new file mode 100644
> > index 0000000..6f3c946
> > --- /dev/null
> > +++ b/package/wireshark/wireshark-dont-include-prefix.patch
> > @@ -0,0 +1,18 @@
> > +configure.in: don't add the build host's /usr/include and /usr/lib to the 
> > +search path of include files and libraries. This is not what you want when 
> > +cross compiling.
> > +
> > +Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> > +---
> > +diff -Nuar wireshark-1.8.3.orig/configure.in wireshark-1.8.3/configure.in
> > +--- wireshark-1.8.3.orig/configure.in	2012-08-15 23:33:32.000000000 +0300
> > ++++ wireshark-1.8.3/configure.in	2012-10-24 09:54:15.259853331 +0200
> > +@@ -639,7 +639,7 @@
> > + # If using $prefix we add "$prefix/include" to the include search path
> > + # and "$prefix/lib" to the library search path.
> > + #
> > +-if test "x$prefix" != "x" ; then
> > ++if false ; then
> > + 	AC_MSG_CHECKING(whether to use $prefix for headers and libraries)
> > + 	if test -d $prefix/include ; then
> > + 		AC_MSG_RESULT(yes)
> 
> This works, but cannot be submitted upstream. Do you think you can come
> up with a patch suitable for upstream inclusion?
> 
> Note that the OE patch is not better than your proposal:
> http://cgit.openembedded.org/openembedded/tree/recipes/wireshark/files/fix-configure.patch.
> It is also not suitable for upstream.

Well, the ultimate solution would probably be to add a --disable-usr configure 
option, like the existing --disable-usr-local. I see if I can find time to 
work on this. I'm no autotools expert.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
