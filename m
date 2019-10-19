From: Carlos Santos <unixmania@gmail.com>
Date: Sat, 19 Oct 2019 10:53:42 -0300
Subject: [Buildroot] [PATCH] package/libseccomp: circumvent uClibc-ng
 bug on x86_64
In-Reply-To: <20191019152306.1749a465@windsurf.home>
References: <20191019141746.3d1551f1@windsurf.home>
 <4154F3C2-1876-461A-8AF2-9DCE7174E286@gmail.com>
 <20191019152306.1749a465@windsurf.home>
Message-ID: <CAJ4jsafqfKeSzxZ5ax0KbEPm3=rerr0SA=suP6xkCqPeXKu6rQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Oct 19, 2019 at 10:23 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Sat, 19 Oct 2019 10:01:52 -0300
> Carlos Santos <unixmania@gmail.com> wrote:
>
> > > If it is "up to v1.0.31", then the problem is fixed in uClibc-ng. Why
> > > would we want to carry a work-around in libsseccomp ? To support older
> > > uClibc-ng pre-built toolchains ?
> >
> > It?s not fixed in uClibc-ng, since there no version newer than 1.0.31.
>
> There is a 1.0.32, which Buildroot uses since a few days, hence when
> you said "up to 1.0.31", I thought it was fixed.

Ah, I was not aware of that. I just checked and it still contains the
error, so the workaround in libseccomp is still necessary.

-- 
Carlos Santos <unixmania@gmail.com>
