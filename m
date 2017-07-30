From: Dave Bender <codehero@gmail.com>
Date: Sun, 30 Jul 2017 18:50:44 -0400
Subject: [Buildroot] host-icu: ERROR: package host-icu installs
 executables without proper RPATH:
In-Reply-To: <0a256bf7-ce46-4349-1bb5-12f5cbbd7c4d@mind.be>
References: <CAETHaKrDURWTeFqnFYeXU0X+rxqV0Vb_uB1nVJ+_gX4xGZUJ_g@mail.gmail.com>
 <0a256bf7-ce46-4349-1bb5-12f5cbbd7c4d@mind.be>
Message-ID: <CAETHaKppmcyCGbDcS7RmvkzmKwvSCuiZfxJXTP2xmceytrSn6g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,
  I guess there was some cruft in there from a prior build. The make clean
step and rebuild resulted in success.

Thank you!

-Dave

On Sun, Jul 30, 2017 at 5:42 PM, Arnout Vandecappelle <arnout@mind.be>
wrote:

>
>
> On 30-07-17 22:18, Dave Bender wrote:
> > (Note full build output for host-icu attached).
> >
> > host-icu build is breaking on detecting executables without proper RPATH.
> > What corrective action should I take?
> >
> > cd /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/lib/icu/58.2/..; \
> >     rm -f current && ln -s 58.2 current; \
> >     rm -f Makefile.inc && ln -s current/Makefile.inc Makefile.inc; \
> >     rm -f pkgdata.inc && ln -s current/pkgdata.inc pkgdata.inc
> > make[2]: Leaving directory
> > '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source'
> > make[1]: Leaving directory
> > '/stuff/gsrc/AppImage/buildroot-qt/output/build/host-icu-58.2/source'
> > ***
> > *** ERROR: package host-icu installs executables without proper RPATH:
> > ***   /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/bin/openssl
> > ***   /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/bin/xzdec
> > ***   /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/bin/tabs
> > ***   /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/bin/getfattr
> > ***   /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/bin/python2.7
> > ***   /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/bin/setfattr
> > ***   /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/bin/tput
> > ***   /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/bin/lzmainfo
> > ***   /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/bin/infocmp
> > ***   /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/bin/xmlwf
> > ***   /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/bin/lzmadec
> > ***   /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/bin/mksquashfs
> > ***   /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/bin/genimage
> > ***   /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/bin/clear
> > ***   /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/bin/tset
> > ***   /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/bin/toe
> > ***   /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/bin/xz
> > ***   /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/bin/unsquashfs
> > ***   /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/bin/tic
> > ***   /stuff/gsrc/AppImage/buildroot-qt/output/host/usr/bin/attr
>
>  Something is really messed up here, since all these files are not
> installed by
> host-icu but by other packages.
>
>  Also, which Buildroot version are you using? Current master doesn't have
> the
> /usr part in the path anymore.
>
>  In either case, please try to run 'make clean world', that might fix it.
>
>  Regards,
>  Arnout
>
> > make: *** [package/pkg-generic.mk:231 <http://pkg-generic.mk:231>:
> > /stuff/gsrc/AppImage/buildroot-qt/output/build/
> host-icu-58.2/.stamp_host_installed]
> > Error 1
> >
> >
> > Thanks,
> > Dave
> >
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> >
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170730/841ec310/attachment.html>
