From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 03 Jul 2016 11:06:59 +0200
Subject: [Buildroot] [PATCH] tekui: new package
In-Reply-To: <1458297236-21640-1-git-send-email-francois.perrad@gadz.org>
 (Francois Perrad's message of "Fri, 18 Mar 2016 11:33:56 +0100")
References: <1458297236-21640-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <87poqv145o.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Francois" == Francois Perrad <fperrad@gmail.com> writes:

 > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Sorry for the slow response.

> ---
 >  package/Config.in        |  1 +
 >  package/tekui/Config.in  | 19 ++++++++++++++
 >  package/tekui/tekui.hash |  2 ++
 >  package/tekui/tekui.mk   | 66 ++++++++++++++++++++++++++++++++++++++++++++++++
 >  4 files changed, 88 insertions(+)
 >  create mode 100644 package/tekui/Config.in
 >  create mode 100644 package/tekui/tekui.hash
 >  create mode 100644 package/tekui/tekui.mk

 > diff --git a/package/Config.in b/package/Config.in
 > index 2401867..73edf1a 100644
 > --- a/package/Config.in
 > +++ b/package/Config.in
 > @@ -289,6 +289,7 @@ comment "QT libraries and helper libraries"
 >  	source "package/quazip/Config.in"
 >  	source "package/qwt/Config.in"
 >  endif
 > +	source "package/tekui/Config.in"
 >  	source "package/weston/Config.in"
 >  	source "package/x11r7/Config.in"
 
 > diff --git a/package/tekui/Config.in b/package/tekui/Config.in
 > new file mode 100644
 > index 0000000..b426223
 > --- /dev/null
 > +++ b/package/tekui/Config.in
 > @@ -0,0 +1,19 @@
 > +config BR2_PACKAGE_TEKUI
 > +	bool "TekUI"
 > +	select BR2_PACKAGE_FREETYPE
 > +	select BR2_PACKAGE_LUAFILESYSTEM	# runtime only
 > +	select BR2_PACKAGE_LUAEXPAT		# runtime only
 > +	select BR2_PACKAGE_LUASOCKET		# runtime only
 > +	select BR2_PACKAGE_LUAPOSIX		# runtime only
 > +	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 > +	depends on BR2_TOOLCHAIN_HAS_THREADS
 > +	help
 > +	  TekUI is a small, freestanding and portable graphical user interface
 > +	  (GUI) toolkit written in Lua and C. It was initially developed for
 > +	  the X Window System and has been ported to DirectFB, Windows, Nano-X
 > +	  and a raw framebuffer since
 > +
 > +	  http://tekui.neoscientists.org/
 > +
 > +comment "TekUI needs a Lua interpreter and a toolchain with threads"
 > +	depends on !BR2_PACKAGE_HAS_LUAINTERPRETER || !BR2_TOOLCHAIN_HAS_THREADS

We use w/ threads to save space.

Committed, thanks.

-- 
Bye, Peter Korsgaard
