From: Markus Mayer <mmayer@broadcom.com>
Date: Thu, 20 Jun 2019 12:40:36 -0700
Subject: [Buildroot] [PATCH v3] package/coreutils: allow building
 individual binaries
In-Reply-To: <20190620212658.2d528ba9@windsurf>
References: <20190607021534.4657-1-mmayer@broadcom.com>
 <20190620212658.2d528ba9@windsurf>
Message-ID: <CAGt4E5vxNVwYJ+_huMmD-=A4VgwOVikxkLp7jQc+84KiOEykXQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 20 Jun 2019 at 12:27, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Markus,
>
> On Thu,  6 Jun 2019 19:15:34 -0700
> Markus Mayer <mmayer@broadcom.com> wrote:
>
> > We add configuration option BR2_PACKAGE_COREUTILS_INDIVIDUAL_BINARIES
> > so that coreutils can be built and installed as individual binaries.
> > It can be used if the target file system doesn't support symlinks or
> > symlinks are undesirable.
> >
> > The approach is modelled after Busybox's similarly named configuration
> > option.
> >
> > Signed-off-by: Markus Mayer <mmayer@broadcom.com>
>
> I have applied your patch, but after some changes.

[...]

> The namespace of variables in Buildroot is global, so using the name
> TEST_BINARY is a *very* bad idea. It should have been
> COREUTILS_TEST_BINARY. But in fact, I did this differently, and simply
> added two definitions of COREUTILS_CREATE_TEST_SYMLINK.

Good to know. I'll keep that in mind.

> See the final commit at
> https://git.buildroot.org/buildroot/commit/?id=7989818466f8a963c4b6cc8b5014b04703535d3a.

Looks good. Thanks for tweaking things to make the solution clearer.

Regards,
-Markus
