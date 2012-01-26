From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 27 Jan 2012 00:40:09 +0100
Subject: [Buildroot] [PATCH 14/14] libedbus: Add new package
In-Reply-To: <CAFbHwiTmVeZYM_OBKzzNLkdvbr30RG06wi8FxFzbhVhP9KcTbw@mail.gmail.com>
References: <CAFbHwiRMV41vA3FUVdekg6H123c-yyUV7n5qQQHObJ-yw0Qc=g@mail.gmail.com>
 <201201232351.35126.arnout@mind.be>
 <CAFbHwiTmVeZYM_OBKzzNLkdvbr30RG06wi8FxFzbhVhP9KcTbw@mail.gmail.com>
Message-ID: <201201270040.09862.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday 24 January 2012 11:32:50 Will Newton wrote:
> On Mon, Jan 23, 2012 at 10:51 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> > On Monday 23 January 2012 17:36:27 Will Newton wrote:
> >> Signed-off-by: Will Newton <will.newton@imgtec.com>
> > Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> >
> > [snip]
> >> diff --git a/package/efl/libedbus/Config.in b/package/efl/libedbus/Config.in
> >> new file mode 100644
> >> index 0000000..71e3b50
> >> --- /dev/null
> >> +++ b/package/efl/libedbus/Config.in
> >> @@ -0,0 +1,8 @@
> >> +config BR2_PACKAGE_LIBEDBUS
> >> +     bool "libedbus"
> >> +     select BR2_PACKAGE_LIBEINA
> >> +     select BR2_PACKAGE_DBUS
> >  DBUS depends on BR2_PACKAGE_EXPAT || BR2_PACKAGE_LIBXML2
> > so you have to repeat that here.
> 
> Hmm, would it be better just to add a comment asking the user to
> enable dbus rather than adding the select for the XML library? I'm not
> sure what the best way to handle that is.
 dbus itself has depends on, not select.  So either you take that over
(and libedbus is not available unless one of the two XML packages is
selected).  Alternatively, you can use depends on BR2_PACKAGE_DBUS
instead of a select.  Or ideally, you add a choice for the XML library
to DBUS itself, so that the dependency is removed completely.  Patch 
follows.

> >  BTW, it's advisable to compile-test your patches against a minimal
> > uclibc-based 32-bit and 64-bit cross-toolchain.  That helps detecting
> > dependencies on USE_WCHAR and USE_LARGEFILE.
> 
> There is a top-level dependency on WCHAR for all of EFL, I'll test
> with LARGEFILE enabled too.

 Oops my bad.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
