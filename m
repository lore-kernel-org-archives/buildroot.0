From: Adam Duskett <aduskett@gmail.com>
Date: Tue, 15 Oct 2019 10:52:08 -0700
Subject: [Buildroot] [PATCH] package/pkg-meson.mk: set Python
 sysconfigdata
In-Reply-To: <50c4a224-2759-b65e-7b67-e941e2a8ce36@mind.be>
References: <20190804220503.13534-1-arnout@mind.be>
 <CAFSsvmo30O+h5ZUwVfGf91GxsTuGQiUH2CndBmgxY9hVyW08qQ@mail.gmail.com>
 <CAFSsvmqZE3Gop3e_-rce-JEAkMiuTq9dpdbhW3XTviPHLHjP=w@mail.gmail.com>
 <CAFSsvmqu=vOn87rwAkTyTp=OBrpnLPE-wCVf1P48GOPY+dXS7Q@mail.gmail.com>
 <CAFSsvmpyL1iEA2=ia7od7uxE9Wj26YJJKw_nVP+9JXV+EHCxLA@mail.gmail.com>
 <50c4a224-2759-b65e-7b67-e941e2a8ce36@mind.be>
Message-ID: <CAFSsvmp0n+Yw4o+mqfQEm+uYpqm981DZJaPtXrtb-t7L-_YnAg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If you look at the Yocto project, it seems like they intentionally
unset _PYTHON_SYSCONFIGDATA_NAME when compiling libglib2.


On Sun, Oct 13, 2019 at 9:43 AM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 13/10/2019 01:11, Adam Duskett wrote:
> > All;
> >
> > I inadvertently found an issue with this patch.
> > If the user has not selected python or python3,
> > _PYTHON_SYSCONFIGDATA_NAME will be passed as an empty string,
>
>  That's weird...
>
> +       _PYTHON_SYSCONFIGDATA_NAME="$$(if
> $$(BR2_PACKAGE_PYTHON3),$$(PKG_PYTHON_SYSCONFIGDATA_NAME),_sysconfigdata)" \
>
>  If python3 is not selected, it should be set to _sysonfigdata... I don't
> remember how extensively I tested that situation, but I definitely did take it
> into account!
>
>
>  Regards,
>  Arnout
>
> > which
> > causes libglib2 to fail during the configuration step.
> > Apparently, all of my previous testings were done with python3
> > enabled, and I didn't notice!
> [snip]
