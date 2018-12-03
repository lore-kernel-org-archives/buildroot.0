From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 3 Dec 2018 15:36:53 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
 2018-12-02
In-Reply-To: <20181203153431.0c2a82f1@windsurf.home>
References: <20181203070035.5D6B220D2E@mail.bootlin.com>
 <CA+Vb7ho5wgKxatazqbL4sdmtiEXiwSH8zw+LdYGr5vySBa0QBw@mail.gmail.com>
 <20181203134517.40729dd9@windsurf.home>
 <CAMRc=MeGJzA7wdAKz7UXXwvDmnDE+mgPK+kNi_UxbXgfn+RFHQ@mail.gmail.com>
 <20181203144457.33a80c9d@windsurf.home>
 <CAMRc=MdwOpMmwhjvHMOfb_wBgwQAq4_TAdUUDRSi4eYReYTcZg@mail.gmail.com>
 <20181203145612.150037bc@windsurf.home>
 <CAMRc=Mc1SqoZKZ45xT7LS9g=0mpA7Av1AJF6qEZmeFeBgL+qrw@mail.gmail.com>
 <20181203153431.0c2a82f1@windsurf.home>
Message-ID: <CAMRc=MdGYNCPPPavGpcD=wz5v5rMbQc8RzKf8mqdVQ=wbqH-mw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

pon., 3 gru 2018 o 15:34 Thomas Petazzoni
<thomas.petazzoni@bootlin.com> napisa?(a):
>
> Hello,
>
> On Mon, 3 Dec 2018 15:25:25 +0100, Bartosz Golaszewski wrote:
>
> > > How can a bug in pulseview/libsigrokdecode after libttorrent-rasterbar ?
> > >
> > > See the build failures we are talking about, they affect the
> > > libtorrent-rasterbar package:
> > >
> >
> > I'm not following you here I'm afraid. This has nothing to do with any
> > other package - this is purely a pulseview bug. It appears after my
> > previous version bump and is confined to pulseview.
>
> Are you looking at:
>
>   http://autobuild.buildroot.net/results/753/753059dd52da9ec2aa1b06f3b64b0ab5ee3e059a/build-end.log
>
> Let me paste the relevant part:
>
> In file included from peer_connection.cpp:56:0:
> ../include/libtorrent/peer_connection.hpp:550:8: error: generic thunk code fails for method 'virtual void libtorrent::peer_connection::_ZThn96_NK10libtorrent15peer_connection8peer_logENS_14peer_log_alert11direction_tEPKcS4_z(libtorrent::peer_log_alert::direction_t, const char*, const char*, ...) const' which uses '...'
>    void peer_log(peer_log_alert::direction_t direction
>         ^~~~~~~~
> make[2]: *** [peer_connection.lo] Error 1
> make[2]: *** Waiting for unfinished jobs....
> make[2]: Leaving directory `/home/dawncrow/buildroot-test/scripts/instance-0/output/build/libtorrent-rasterbar-1.1.11/src'
> make[1]: *** [all-recursive] Error 1
> make[1]: Leaving directory `/home/dawncrow/buildroot-test/scripts/instance-0/output/build/libtorrent-rasterbar-1.1.11'
> make: *** [/home/dawncrow/buildroot-test/scripts/instance-0/output/build/libtorrent-rasterbar-1.1.11/.stamp_built] Error 2
> make: Leaving directory `/home/dawncrow/buildroot-test/scripts/instance-0/buildroot'
>
> Where do you see a pulseview issue ?
>

Eek I was looking at
http://autobuild.buildroot.net/results/79ed29bdd1eec9bf7cb5003202da5ceaeb8101b6/
why am I responding here? I have no idea. :)

Anyway, patch for pulseview sent. Sorry for the confusion.

Bart
