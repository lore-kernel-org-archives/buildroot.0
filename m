From: Trevor Woerner <twoerner@gmail.com>
Date: Thu, 24 Nov 2011 16:59:28 -0500
Subject: [Buildroot] commit bf4465 (ncurses: fix hanging installation
 due to old version of tic)
In-Reply-To: <20111124223902.4258ab95@skate>
References: <CAHUNapT5XD1ghKZgfH1nVsiOEqpjfxUcTTHp5NCNa_C7+rEEJg@mail.gmail.com>
 <20111124215742.7678dab4@skate>
 <CAHUNapR1xfZahWU+Ru+Vb5hdOCH1tvz1DqT-aSBEVuku7aEHNA@mail.gmail.com>
 <20111124223902.4258ab95@skate>
Message-ID: <CAHUNapQLDSDJZSj8riVcTic89DhYFHDbrpKcC_3-zVtmzyfDBA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have a configuration where I'm:
- using an external toolchain
- not using busybox
- selecting a very small number of starter packages

When I record the build and look at the steps involved it starts off
looking like the following:
>>> ncurses 5.7 Extracting
>>> ncurses 5.7 Patching package//ncurses
>>> ncurses 5.7  Updating config.sub and config.guess
>>> ncurses 5.7 Patching libtool
>>> host-ncurses 5.7 Extracting
>>> host-ncurses 5.7 Patching package//ncurses
>>> host-ncurses 5.7  Updating config.sub and config.guess
>>> host-ncurses 5.7 Patching libtool
>>> host-ncurses 5.7 Configuring
>>> host-ncurses 5.7 Building
>>> host-ncurses 5.7 Installing to host directory
>>> ncurses 5.7 Configuring
>>> ncurses 5.7 Building
>>> ncurses 5.7 Installing to staging directory
>>> ncurses 5.7 Installing to target
...

Since ncurses and host-ncurses use the autotools I was just wondering
if it was an oversight that they're not first building and using
host-autotools.
