From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 19 Jul 2011 23:01:49 +0200
Subject: [Buildroot] [Patch] Allow file to be built against static libs.
In-Reply-To: <87sjq22f6n.fsf@macbook.be.48ers.dk> (Peter Korsgaard's message
 of "Tue, 19 Jul 2011 22:22:56 +0200")
References: <F9C551623D2CBB4C9488801D14F864C6044668@ex-mb1.corp.adtran.com>
 <87sjq22f6n.fsf@macbook.be.48ers.dk>
Message-ID: <87oc0q2ddu.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <jacmet@uclibc.org> writes:

>>>>> "ANDY" == ANDY KENNEDY <ANDY.KENNEDY@adtran.com> writes:
 ANDY> If selected "prefer static libs", file fails to build reporting:
 ANDY> relocation R_X86_64_32S against `zcalloc' can not be used when making
 ANDY> a shared object; recompile with -fPIC
 ANDY> The suggested -fPIC doesn't work.  The issue is that the default
 ANDY> configure has --enable-shared --enable-static.  This patch modifies
 ANDY> the configure to disable shared when "prefer static libs" is selected.

 ANDY> FILE_DEPENDENCIES = host-file zlib
 ANDY> HOST_FILE_DEPENDENCIES = host-zlib

 ANDY> +ifeq ($(BR2_PREFER_STATIC_LIB),y)
 ANDY> +FILE_CONF_OPT = --disable-shared --enable-static
 ANDY> +HOST_FILE_CONF_OPT = --disable-shared --enable-static

 Peter> We indeed force --enable-shared --disable-static for host builds, but
 Peter> that doesn't really matter. For target builds we use (see
 Peter> package/Makefile.in) --enable-static --enable-shared when
 Peter> PREFER_STATIC_LIB is enabled, so rather than something file specific, I
 Peter> think it would make more sense to set that to --enable-static
 Peter> --disable-shared instead.

Ehh, drop that, I remembered wrong - We're already doing --enable-static --disable-shared.

-- 
Bye, Peter Korsgaard
