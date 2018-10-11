From: Daniel Palmer <daniel@0x0f.com>
Date: Thu, 11 Oct 2018 20:42:30 +0900
Subject: [Buildroot] meson for host package with executables doesn't
 work.
In-Reply-To: <20181011120126.4bb50328@windsurf>
References: <CAFr9PXm1Y=HHy4znDBVdxpd2ndHKdu+_unfgSGHkJFotSZ9HKA@mail.gmail.com>
 <20181011120126.4bb50328@windsurf>
Message-ID: <CAFr9PXkRORYwg4JF=moZp-e2bhrXLQAamhy-ygzi0ahq8dtgDg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Looking through the history in git it looks like this was broken by
commit a03f46ca6e9f43028003aedc92f1a1204ae7480f that bumped the
version of meson and removed a patch that stops meson from stripping
the RPATH on host executables. I guess because there are no packages
in-tree that used it (I couldn't find host-meson-package in any
packages) no one noticed.

Cheers,

Daniel
On Thu, 11 Oct 2018 at 19:01, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Daniel,
>
> On Thu, 11 Oct 2018 18:25:39 +0900, Daniel Palmer wrote:
>
> > That was working fine a few months ago but now I get this:
> >
> > ***
> > *** ERROR: package host-json-glib installs executables without proper RPATH:
> > ***   <snip>/buildroot-firmware/output/host/bin/json-glib-validate
> > ***   <snip>/buildroot-firmware/output/host/bin/json-glib-format
> >
> > As far as I know meson strips RPATH on install and there is no way to
> > stop it doing that outside of adjusting the build file.
> >
> > Does anyone have any ideas about how this should be fixed?
>
> We really need the host tools to have an rpath pointing to
> $(HOST_DIR)/lib, otherwise they won't pick up the libraries that we
> have installed in $(HOST_DIR)/lib.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
