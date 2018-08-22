From: Vadim Kochan <vadim4j@gmail.com>
Date: Wed, 22 Aug 2018 10:02:46 +0300
Subject: [Buildroot] [PATCH 1/1] package/gettext-tiny: Add new package
In-Reply-To: <20180821221026.4fec5cf2@windsurf>
References: <20180821142226.2309-1-vadim4j@gmail.com>
 <87r2irvljb.fsf@tkos.co.il> <20180821172913.1a7eb830@windsurf>
 <CAMw6YJ+FS=z0MQqWj3K-21QYR5m-20wE2RbfFHQnc1WdgrYwLA@mail.gmail.com>
 <20180821193616.5634b4dc@windsurf>
 <CAMw6YJLASMAVyjqKs26zzzpxdpHV5ezQhaXu=nNyO3UwnQF-Yw@mail.gmail.com>
 <20180821221026.4fec5cf2@windsurf>
Message-ID: <CAMw6YJ+NAM8VXK8U5RSV-yLPEEsstOMJ_Hi3HwVWv-dTOxAvFA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello!

On Tue, Aug 21, 2018 at 11:10 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Vadim,
>
> On Tue, 21 Aug 2018 23:07:59 +0300, Vadim Kochan wrote:
>
> > >  - There are a few packages that unconditionally need host-gettext. Is
> > >    this really true ?
> > Not sure about this)
>
> In this situation, we have:
>
>  - aumix
>  - host-guile
>  - host-intltool (perhaps legit ?)
>  - host-libglib2
>  - libv4l (for AM_ICONV m4 macro)
>  - linphone
>  - mediastreamer
>  - host-mono
>  - sysstat (which also uses TARGET_NLS_DEPENDENCIES... weird)
>  - tvheadend
>  - host-wine
>  - xkeyboard-config
>  - zbar (for AM_ICONV m4 macro)

Meanwhile I did convert gettext -> gettext-gnu and made gettext as
virtual package
which selects gettext-gnu by default. I tested compilation of
libglib2, sysstat, zbar, libv4l
and linphone together with force selected gettext-tiny (as gettext provider)
and the compilation was success.

Regards,
Vadim Kochan
