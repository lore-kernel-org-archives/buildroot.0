From: Carlos Santos <unixmania@gmail.com>
Date: Mon, 9 Dec 2019 08:41:40 -0300
Subject: [Buildroot] [PATCH] package/glibc: drop dependency of utilities
 on bash
In-Reply-To: <20191209085301.19cd9f52@windsurf.home>
References: <20191203001405.12984-1-unixmania@gmail.com>
 <20191205231729.2c16445c@windsurf>
 <CAJ4jsaca+BnSWrQ5Zcd9h_6o5705oe0z9fAjBr7bN6g65+RE=w@mail.gmail.com>
 <20191209085301.19cd9f52@windsurf.home>
Message-ID: <CAJ4jsaez3Zs1DDeVATnq5cE9=1_oGUegg4nSux7GKT8TX-kR4A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Dec 9, 2019 at 4:53 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Carlos,
>
> On Sun, 8 Dec 2019 22:38:52 -0300
> Carlos Santos <unixmania@gmail.com> wrote:
>
> > I'm working on a patch series to glibc but it requires ATORECONF,
> > which fails because GLIBC_SUBDIR is set to "build" and there
> > configure.ac is not there. I circumvented the problem by using
> >
> > define GLIBC_AUTORECONF
> >         cd $(@D) && $(AUTORECONF) || true
> > endef
> >
> > GLIBC_PRE_CONFIGURE_HOOKS = GLIBC_AUTORECONF
> >
> > The "|| true" there is a kludge to ignore this error:
> >
> > Use of uninitialized value $args[0] in split at
> > /work/qemu_x86_64_glibc_eudev/host/bin/autoreconf line 493, <GEN2>
>
> Hum, OK. Perhaps another way is to simply have your patch make its way
> upstream, and wait until the next glibc release to really use it in
> Buildroot. In the mean time, we can keep the post patch hook that you
> have implemented and that was merged in Buildroot.
>
> What is important is that at some point in the future, there will be an
> upstream solution. We don't necessarily need to use it immediately in
> Buildroot.

RFE submitted: https://sourceware.org/bugzilla/show_bug.cgi?id=25259

-- 
Carlos Santos <unixmania@gmail.com>
