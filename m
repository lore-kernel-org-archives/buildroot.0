From: Aleksander Morgado <aleksander@aleksander.es>
Date: Thu, 12 Dec 2019 14:14:47 +0100
Subject: [Buildroot] [PATCH] modem-manager: bump to version 1.12.2
In-Reply-To: <CAJ4jsadmZEQwQdt0tr=apUw-pJN5zxJBsN1ZDksYFHnn8F1A5A@mail.gmail.com>
References: <20191212093325.2178579-1-aleksander@aleksander.es>
 <CAJ4jsafsOvYMfXBpMipUSz69G=+PHLV59UzN1FvGnYyrr2L1RQ@mail.gmail.com>
 <CAAP7ucLxYCT=+j+2dEhLBKAuB74gjDdyA5Obz4Rk=LvgNaxXtw@mail.gmail.com>
 <CAJ4jsadmZEQwQdt0tr=apUw-pJN5zxJBsN1ZDksYFHnn8F1A5A@mail.gmail.com>
Message-ID: <CAAP7ucJR+0h_pJfD63eOvWiYqtHT1GyRpBtpjSPqMtw_gPhudw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> > >
> > > I still see an error similar to the one in
> > > http://autobuild.buildroot.net/results/0ae6ca0b278ca1903057ff6ac31b1b70e8638b9a/
> > > in a clean build after applying the patch to bump libqmi o 1.24.2 and
> > > this one:
> > >
> >
> > Did you run autoreconf in srcdir after applying the patch manually?
>
> 2019-12-12T07:30:18 Applying
> 0001-build-fix-order-of-linked-libs-in-test-apps.patch using patch:
> 2019-12-12T07:30:18 patching file test/Makefile.am
> 2019-12-12T07:30:18 >>> modem-manager 1.12.2 Updating config.sub and
> config.guess
> 2019-12-12T07:30:18 for file in config.guess config.sub; do for i in
> $(find /work/0ae6ca0b278ca1903057ff6ac31b1b70e8638b9a/build/modem-manager-1.12.2
> -name $file); do cp support/gnuconfig/$file $i; done; done
> 2019-12-12T07:30:18 >>> modem-manager 1.12.2 Configuring
> 2019-12-12T07:30:18 >>> modem-manager 1.12.2 Autoreconfiguring
>
> > Not sure how that would be done when rebuilding using the
> > br-reproduce-build setup.
>
> I don't use br-reproduce-build setup. I just applied the patches on
> buildroot using git am ran a build using the same defconfig of build
> 0ae6ca0b278ca1903057ff6ac31b1b70e8638b9a.
>
> > Can you tell me what's the value of mmsmspdu_DEPENDENCIES in the
> > "test/Makefile" file you have in your build? It should be something
> > like this:
> > mmsmspdu_DEPENDENCIES = $(am__DEPENDENCIES_1) \
> >         $(top_builddir)/libmm-glib/libmm-glib.la \
> >         $(top_builddir)/src/libhelpers.la
> >
> >
> > (i.e. libmm-glib.la listed before libhelpers.la)
>
> mmsmspdu_DEPENDENCIES = $(am__DEPENDENCIES_1) \
>         $(top_builddir)/libmm-glib/libmm-glib.la \
>         $(top_builddir)/src/libhelpers.la
>

Oh, this is very strange then. Could you run the build with V=s to see
the full compilation commands?

-- 
Aleksander
https://aleksander.es
