From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sat, 25 Apr 2020 22:18:43 +0200
Subject: [Buildroot] [PATCH 1/1] package/syrepo: fix SysV init script
In-Reply-To: <20200425220758.7e83e2e0@windsurf.home>
References: <20200420095738.16104-1-heiko.thiery@gmail.com>
 <20200425162221.5105443c@windsurf.home>
 <CAEyMn7arhktDMYurpWu-8E=vqFYFvez17sqdAm+m+vC7BkgptA@mail.gmail.com>
 <20200425213717.46a38cbf@windsurf.home>
 <CAEyMn7atSwtJ6XHD3utVG+LWp7kprdKdufD5e6-qP_61_qHZMw@mail.gmail.com>
 <20200425220758.7e83e2e0@windsurf.home>
Message-ID: <CAEyMn7bjFNUnBJFFZ_5_9WynRcyH-0cXRdbph9oy3pvO4E_CMw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sa., 25. Apr. 2020 um 22:07 Uhr schrieb Thomas Petazzoni
<thomas.petazzoni@bootlin.com>:
>
> On Sat, 25 Apr 2020 21:58:56 +0200
> Heiko Thiery <heiko.thiery@gmail.com> wrote:
>
> > No it doesn't. The confusion is due to my bad commit message ;-/ I try
> > to explain it better.
> >
> > The current script is not able to stop the daemon.
> >
> > Options to fix the problem:
> >
> > A) By adding the "-m -p $PIDFILE" option the pid file will be created
> > but it will not contain the correct PID used by the daemon. This is
> > obviously because the daemon forks.
> > B) By not starting the daemon in background (sysrepo-plugind -d) and
> > let do it by start-stop-daemon with "-b" option the log messages of
> > the daemon will not longer ends in the syslog but to stderr.
> > C) start the daemon without a pidfile and stop the daemon with the "-x" option.
> >
> > I think the best option is C. This is what the patch does.
>
> Absolutely :-) I'll update the commit message with this explanation
> when applying.
>
> Thanks!

Thanks a lot!
