From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Tue, 28 Aug 2007 12:48:08 +0100
Subject: [Buildroot] User-space packages - Staging_Dir or Target_Dir
In-Reply-To: <b6838d3a0708280435tc49ecfbs563b3aedf3d5b57c@mail.gmail.com>
References: <b6838d3a0708280435tc49ecfbs563b3aedf3d5b57c@mail.gmail.com>
Message-ID: <d6cda7730708280448l695f99cew798d96e747da4604@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

yes, some packages will instead use make install with the appropriate
DESTDIR set or having configured it with the prefix. But most of the
time, make install does stuff you don't want, like install man pages.
One has to check what the package makefiles are doing to make sure.

On 8/28/07, Daniel Frey <dmfrey+linux@gmail.com> wrote:
> Do I need to explicitly copy what I install into the staging dir into the
> root dir in order for the new libraries to be included in the resulting
> image?
>
> I have seen this done in the xml2 makefile and I wasn't sure if it was
> needed for every package.
>
> Dan
>
>
> >On Wed, Aug 22, 2007 at 07:47:59PM -0400, Daniel Frey wrote:
> >>When constructing my make files for my packages in the package/, what is
> the
> >>suggested installation directory, TARGET_DIR or STAGING_DIR?
> >>
> >>Some of the included packages install them to STAGING_DIR.  The
> >>Documentation on the buildroot website has them installed in the
> TARGET_DIR.
> >>
> >>Is there a correct way, or preferred way?
> >
> >Depends :)
> >
> >Files that go straight to the target have to me installed to the
> >TARGET_DIR. Intermediate files (prerequisites of stuff that will be on
> >the target like helper libraries, headers, etc) have to live in
> >STAGING_DIR. Sometimes only a small fraction of files in the staging_dir
> >is needed in the real target, so they are copied selectively.
> >
> >HTH,
> >Bernhard
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
