From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 24 Apr 2008 21:07:33 +0200
Subject: [Buildroot] Problem files
In-Reply-To: <46a136670804241157r1b0d178fi1d81474a38555621@mail.gmail.com>
	(John Voltz's message of "Thu\, 24 Apr 2008 14\:57\:59 -0400")
References: <46a136670804241157r1b0d178fi1d81474a38555621@mail.gmail.com>
Message-ID: <878wz3137u.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "John" == John Voltz <john.voltz@gmail.com> writes:

 John> I've noticed a few packages that use the "hackish" method of
 John> defining their build environment by using a shell script
 John> instead of pkg-config. These scripts reside in /usr/bin and are
 John> called by the configure script of other packages that depend on
 John> them, the following is a list of the packages I have found that
 John> do this:

I take it you mean STAGING_DIR/usr/bin.

 John> cups-config
 John> curl-config
 John> fltk-config
 John> freetype-config
 John> gpg-error-config
 John> ibgcrypt-config
 John> icu-config
 John> libpng12-config
 John> pkg-config
 John> xft-config
 John> xml2-config
 John> xslt-config

SDL also has a sdl-config script.

 John> I'm looking for suggestions on what could be done to fix them
 John> so cross compiling works. I would prefer to not have to rewrite
 John> all of the makefiles to sed the right paths in. Freetype is the
 John> worst offender, it breaks pango and fontconfig on Ubuntu. And
 John> if you build a system for x86, a few packages will get linked
 John> against your build machine libraries instead of the target,
 John> then you will get errors like "can't find libc.so.6" (gtk and
 John> glib are the two I that know of)

I don't really think there's any other solution, but fixing the
-config scripts isn't that hard, see the sdl makefile for an example.

-- 
Bye, Peter Korsgaard
