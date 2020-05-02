From: Asaf Kahlon <asafka7@gmail.com>
Date: Sat, 2 May 2020 10:54:23 +0300
Subject: [Buildroot] [PATCH] package/python-xmodem: new package
In-Reply-To: <87d07p85mm.fsf@grinn-global.com>
References: <20200430132020.2476465-1-m.niestroj@grinn-global.com>
 <87d07p85mm.fsf@grinn-global.com>
Message-ID: <CALFsTFW=hMQH1sYJEDNPg_=QGeh9iRkMF+m5myR2BE1pv4oGrw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, Apr 30, 2020 at 4:28 PM Marcin Niestr?j
<m.niestroj@grinn-global.com> wrote:
>
> Hi All!
>
> The problem with this package is that there is no license file when we
> download from pypi. But there is one on github. Question is: what should
> we do about it?

We already have some python packages which don't include the license
on the tarball, although it exists in the repo.
Most of the times, it's because the maintainer of the package didn't add
the license file in MANIFEST.in (which seems to be your case too).
On those cases, PKG-INFO is mostly used, but it's not the preferred
solution, so I suggest to send a PR for adding the license to
MANIFEST.in
You can see an example from snmpclitools here:
https://github.com/etingof/snmpclitools/commit/d93597050f7e4708ce875cc47274c39a9e63da11

>
> Marcin Niestroj <m.niestroj@grinn-global.com> writes:
>
> > Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
> > ---
> >  DEVELOPERS                               |  1 +
> >  package/Config.in                        |  1 +
> >  package/python-xmodem/Config.in          |  6 ++++++
> >  package/python-xmodem/python-xmodem.hash |  3 +++
> >  package/python-xmodem/python-xmodem.mk   | 13 +++++++++++++
> >  5 files changed, 24 insertions(+)
> >  create mode 100644 package/python-xmodem/Config.in
> >  create mode 100644 package/python-xmodem/python-xmodem.hash
> >  create mode 100644 package/python-xmodem/python-xmodem.mk
> >
> > [snip]
>
> --
> Marcin Niestr?j
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Best regards,
Asaf.
