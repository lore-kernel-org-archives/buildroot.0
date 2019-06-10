From: Mirza Krak <mirza.krak@northern.tech>
Date: Mon, 10 Jun 2019 17:41:43 +0200
Subject: [Buildroot] [PATCH 1/1] package/pkg-golang: add cflags/ldflags
 to GO_HOST_ENV
In-Reply-To: <CADHdJwCLHm2fvahK=uEo2fH-rJyHzCo9m4=-d1auXy-GdC8KFg@mail.gmail.com>
References: <20190603092101.8658-1-mirza.krak@northern.tech>
 <7ccf0442-d03f-05f8-c9c5-338f975b5d3b@mind.be>
 <CADHdJwD4BkLGeaEmC4q8L+0R0RWeHmaH2CMyhn1RNHtpm7c8eQ@mail.gmail.com>
 <0eb1cbd8-c143-432d-ebd3-7d25fb719ccc@mind.be>
 <CADHdJwCLHm2fvahK=uEo2fH-rJyHzCo9m4=-d1auXy-GdC8KFg@mail.gmail.com>
Message-ID: <CADHdJwCqTWC6UCO-3E9ZbzAW8urb80RZ7CLCWiH9MBaLghtDwA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jun 10, 2019 at 5:12 PM Mirza Krak <mirza.krak@northern.tech> wrote:
>

< snip >

> > >
> > > Will compare defconfigs but I suspect it is related to,
> > >
> > >       BR2_STATIC_LIBS=y
> > >
> > > being set in the erroneous build.
> >
> >  It may be related, but it shouldn't be: the build of host packages should not
> > depend on the setting of BR2_STATIC_LIBS on the target.
> >
> > > This not something that I use
> > > locally.
> >
> >  You can try to reproduce locally using the config from the autobuilder.
>
> Thanks for the pointers, I will investigate further.


I believe that I found the cause of this, patch sent

      https://patchwork.ozlabs.org/patch/1113150/

-- 
Mirza Krak | Embedded Solutions Architect | https://mender.io

 Northern.tech AS | @northerntechHQ
