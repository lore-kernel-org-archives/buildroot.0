From: Olivier Schonken <olivier.schonken@gmail.com>
Date: Thu, 8 Mar 2018 09:57:42 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-03-07
In-Reply-To: <87lgf3knkk.fsf@dell.be.48ers.dk>
References: <20180308070030.7B02A20993@mail.bootlin.com>
 <87lgf3knkk.fsf@dell.be.48ers.dk>
Message-ID: <CALdGsk+ED68h6geQuYCdmoxgTxdWoDRp1rCxhwWrY1ChkPasQA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

Will look at the cups-filters ln issue.

Regards
Olivier

On 08 Mar 2018 09:56, "Peter Korsgaard" <peter@korsgaard.com> wrote:

> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:
>
>  > Hello,
>  > Build statistics for 2018-03-07
>  > ===============================
>
>  >       branch |  OK | NOK | TIM | TOT |
>  >    2018.02.x |  11 |   1 |   0 |  12 |
>  >       master | 141 |  56 |   0 | 197 |
>
>  > Results for branch '2018.02.x'
>  > ==============================
>
>  > Classification of failures by reason
>  > ------------------------------------
>
>  >            cups-filters-1.17.9 | 1
>
>
>  > Detail of failures
>  > ------------------
>
>  >          arc |            cups-filters-1.17.9 | NOK |
> http://autobuild.buildroot.net/results/77a6369f3530a2a6a055f7fd664f1a
> d424274d77 |
>
> The install steps are using ln -s -r, so we probably need a workaround
> for old distributions like we have for systemd:
>
> package/systemd/0002-install-don-t-use-ln-relative.patch
>
> Olivier, can you take a look?
>
>  > Classification of failures by reason
>  > ------------------------------------
>
>  > zyre-1d949e4bf79b694ea883c3... | 14
>
> Started happening when czmq got bumped, so probably an incompatibility
> with the new version.
>
> I see upstream released a v2.0.0 back in January 2017, so bumping the
> version might fix it. Any takers?
>
> >                     htop-2.1.0 | 10
>
> It looks like it needs the same utf8 locale workaround as for
> systemd. Any takers?
>
>  >                   ntp-4.2.8p11 | 7
>
> Already fixed by 5766b6fb34a897092092f7d76d6b4f2bc8c48571
>
> >                     liblo-0.29 | 6
>
> musl compatibility issue:
>
> In file included from server.c:54:0:
> /home/buildroot/autobuild/run/instance-0/output/host/arm-
> buildroot-linux-musleabihf/sysroot/usr/include/sys/poll.h:1:2: error:
> #warning redirecting incorrect #include <sys/poll.h> to <poll.h>
> [-Werror=cpp]
>  #warning redirecting incorrect #include <sys/poll.h> to <poll.h>
>
> It apparently builds with -Werror, which is why this is fatal.
>
> Alex, you recently submitted a patch to pass --disable-werror, but the
> configure script doesn't understand that option:
>
> configure: WARNING: unrecognized options: --disable-gtk-doc,
> --disable-gtk-doc-html, --disable-doc, --disable-docs,
> --disable-documentation, --with-xmlto, --with-fop, --disable-nls,
> --disable-werror
>
> Can you take another look? Thanks.
>
> --
> Bye, Peter Korsgaard
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180308/f7d64314/attachment.html>
