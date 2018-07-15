From: Christian Stewart <christian@paral.in>
Date: Sun, 15 Jul 2018 15:59:26 -0700
Subject: [Buildroot] [PATCH v4 3/3] docker-engine: split into
 docker-{cli, engine}, bump v2018.06-ce-rc3
In-Reply-To: <CACvFaDemV-9dCECmvrqQ6OSPrWX0S+QnSsv4JJQfGW-GcdwUSA@mail.gmail.com>
References: <20180715224340.30282-1-christian@paral.in>
 <20180715224340.30282-3-christian@paral.in>
 <CACvFaDemV-9dCECmvrqQ6OSPrWX0S+QnSsv4JJQfGW-GcdwUSA@mail.gmail.com>
Message-ID: <CA+h8R2qmO-DfiY+yt5X9s8Fp=eOZ-Ts7mKUmEAPQ2zVV8ZFo2A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Pascal,

On Sun, Jul 15, 2018 at 3:51 PM Pascal Vizeli <pascal.vizeli@syshack.ch> wrote:
> I think we should not force anything and stay with official release circle?

As noted in the commit message:

> > Docker repositories "engine" and "cli" recently started tagging releases as
> > recent as v18.06-ce-rc1, so we pull the latest tagged release v18.06-ce-rc3 and
> > upgrade to v18.06-ce when it is released.

There are no tags for v17.03.2-ce to  v18.06.* in docker/engine and docker/cli.

The package split also did not happen until recently, IIRC, and we
suffered critical instability with the early 2018 releases on our arm
systems when testing earlier this year.

I suppose this series could be deferred until the next major stable
release of Docker, at which point the split between docker-cli and
docker-engine would be made, as shown here. I will wait to see what
the general consensus is.

RFC on the package split, regardless.

Christian
