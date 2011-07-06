From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 07 Jul 2011 01:07:12 +0200
Subject: [Buildroot] libglib2 now requires gettext
In-Reply-To: <15734.99.181.179.117.1306510521.squirrel@lavabit.com>
 (idunham@lavabit.com's message of "Fri, 27 May 2011 08:35:21 -0700
 (PDT)")
References: <15734.99.181.179.117.1306510521.squirrel@lavabit.com>
Message-ID: <87d3hnt3dr.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "idunham" == idunham  <idunham@lavabit.com> writes:

 idunham> I've been trying to build a system with buildroot 2011.05rc2, complete
 idunham> with GTK2, which requires libglib2; gettext is enabled for some other
 idunham> library.
 idunham> So far, buildroot has reached configuring libglib2 for the target system;
 idunham> here, it ignores the --disable-nls flag, and goes on to:
 idunham> ...
 idunham> checking for libintl.h... no
 idunham> configure: error:
 idunham> *** You must have either have gettext support in your C library, or use the
 idunham> *** GNU gettext library. (http://www.gnu.org/software/gettext/gettext.html)

 idunham> This with is libglib2-2.28.6

Odd, it works here with this config:

BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_PACKAGE_LIBGLIB2=y

 idunham> So I guess the makefiles need to be changed so as to set gettext as a
 idunham> dependency for libglib2, if buildroot uses the latest version.

It already does so (and has done for some time). Could you please
provide some more details about your exact configuration?

-- 
Bye, Peter Korsgaard
