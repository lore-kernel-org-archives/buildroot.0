From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 3 Dec 2018 14:37:05 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
 2018-12-02
In-Reply-To: <20181203134517.40729dd9@windsurf.home>
References: <20181203070035.5D6B220D2E@mail.bootlin.com>
 <CA+Vb7ho5wgKxatazqbL4sdmtiEXiwSH8zw+LdYGr5vySBa0QBw@mail.gmail.com>
 <20181203134517.40729dd9@windsurf.home>
Message-ID: <CAMRc=MeGJzA7wdAKz7UXXwvDmnDE+mgPK+kNi_UxbXgfn+RFHQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

pon., 3 gru 2018 o 13:45 Thomas Petazzoni
<thomas.petazzoni@bootlin.com> napisa?(a):
>
> Hello Philipp,
>
> Thanks for taking a look at your autobuilder failures! Please try to
> Cc: the Buildroot mailing list on such discussions.
>
> On Mon, 3 Dec 2018 12:26:33 +0100, Philipp Richter wrote:
> > In file included from peer_connection.cpp:56:0:
> > ../include/libtorrent/peer_connection.hpp:550:8: error: generic thunk
> > code fails for method ?virtual void
> > libtorrent::peer_connection::_ZThn96_NK10libtorrent15peer_connection8peer_logENS_14peer_log_alert11direction_tEPKcS4_z(libtorrent::peer_log_alert::direction_t,
> > const char*, const char*, ...) const? which uses ?...?
> >    void peer_log(peer_log_alert::direction_t direction
> >         ^
> >
> > So there's an issue with the variadic function maybe because it's
> > overriding a virtual variadic function ?
> > According to this https://bugzilla.redhat.com/show_bug.cgi?id=1511021
> > adding "[[gnu::optimize("O0")]]" to the function might be a
> > workaround.
> > Or maybe a newer gcc though for openrisc it seems to be stuck with gcc 5.
> > I'll check it out and report back.
>
> Note that it also happened on Xtensa:
> http://autobuild.buildroot.net/results/38a/38a5481dff972954c02a74ab19f37e71d5f6510e/build-end.log,
> which uses gcc 7.x.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Hi Thomas,

this failure (and others in pulseview) are due to libsigrokdecode.h
being included when libsigrokdecode is not built. It's a bug in
pulseview. I already have a patch and will submit it later today both
for buildroot as well as upstream.

Best regards,
Bartosz Golaszewski
