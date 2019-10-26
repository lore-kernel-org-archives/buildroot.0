From: Markus Mayer <mmayer@broadcom.com>
Date: Sat, 26 Oct 2019 14:49:04 -0700
Subject: [Buildroot] [PATCH] toolchain: introduce config options to
 include GCC's sanitation libraries
In-Reply-To: <CANQCQpYfibhMA9S_p6vrdLTmrUnURvaRrAxtK74naE7xiC==BQ@mail.gmail.com>
References: <20190605214155.3006-1-mmayer@broadcom.com>
 <CAGt4E5udpTU+_+jige3NdgBt2C0w9A9tfG+5xOPDdxdyWL=R2A@mail.gmail.com>
 <CANQCQpYfibhMA9S_p6vrdLTmrUnURvaRrAxtK74naE7xiC==BQ@mail.gmail.com>
Message-ID: <CAGt4E5uEb_crVMj06ZyvQXAJEER3-nF28_rkhNN0S5Dd46ieAQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 26 Oct 2019 at 12:03, Matthew Weber <matthew.weber@collins.com> wrote:
>
> Markus,
>
> On Sat, Oct 26, 2019 at 1:29 PM Markus Mayer <mmayer@broadcom.com> wrote:
> >
> > Hi all,
> >
> > On Wed, 5 Jun 2019 at 14:42, Markus Mayer <mmayer@broadcom.com> wrote:
> > >
> > > We add config options for external toolchains to allow copying the
> > > following libraries into the root file system:
> > >
> > >   - libasan (-fsanitize=address)
> > >   - liblsan (-fsanitize=leak)
> > >   - libtsan (-fsanitize=thread)
> > >   - libubsan (-fsanitize=undefined)
> > >
> > > Copying these shared libraries into the root file system will add
> > > run-time support for binaries compiled with one of the above "sanitize"
> > > options for enhanced run-time debugging.
> >
>
> Aside from build time impacts, would there be any reason to not just
> enable these by default in GCC > 4.8 ?

Size considerations would also be a reason not to enable it by
default. I believe BR tries to keep things minimal, and these are
debugging libraries that are not strictly necessary on a production
system.

But I am open to doing it either way. I'll leave it up to the BR
maintainers to make the call one way or another. Regardless of what
the default is, though, it'll be easy to change the settings in a
defconfig file or config fragment.

Regards,
-Markus
