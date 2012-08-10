From: Kevin Broch <kevbroch@gmail.com>
Date: Thu, 9 Aug 2012 19:28:31 -0700
Subject: [Buildroot] building native gcc for target
In-Reply-To: <20120809033252.GB3332@tarshish>
References: <CAKWKLJCPCYuYteR7s6xrUgBH6j5aOfn28431eeSQeGqVT5Z3=g@mail.gmail.com>
 <CAJJ6jxszVqjSSLCsU0oVbWAb72KBo1jf5U6kFEBHpED+RniKdw@mail.gmail.com>
 <5021CE95.9000808@sri.com>
 <20120808055704.GA9185@sapphire.tkos.co.il>
 <CAKWKLJCnXK-+4kDorAubXCizrEeUua=H+2+K6h+hCzddJ9q-BA@mail.gmail.com>
 <20120809033252.GB3332@tarshish>
Message-ID: <CAKWKLJAi_oNBGSTnkpq79Vi5L7uZH+XKuAXJBfOmr4Ne7qVL=w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks for suggestions. I am going down the debian arm route to get armv7l

Best, /<evin

On Wed, Aug 8, 2012 at 8:32 PM, Baruch Siach <baruch@tkos.co.il> wrote:

> Hi Kevin,
>
> On Wed, Aug 08, 2012 at 01:24:14PM -0700, Kevin Broch wrote:
> > Thank Baruch I will have to check it out.  Have you used this yourself
> and
> > if so what platform?
>
> Yes. I used it on ARMv5 platform (i.MX25) to build the initramfs
> environment
> (just Busybox and a few small utilities) statically linked.
>
> Another option that comes to mind is to install Debian on your target.
> Debian
> includes a natively built toolchain, and you can easily test the result in
> a
> chroot. If you don't have enough storage for Debian (at least 500MB, more
> is
> preferred) on-board you can use NFS mounted root filesystem, mounted from a
> PC. I used this trick on several platforms (ARM, MIPS, PowerPC) during
> bring-up phase as it's a short path to a wealth of pre-built (and natively
> compiled) software packages.
>
> baruch
>
> > On Tue, Aug 7, 2012 at 10:57 PM, Baruch Siach <baruch@tkos.co.il> wrote:
> > > Hi Scott, Kevin,
> > >
> > > On Tue, Aug 07, 2012 at 07:27:33PM -0700, Scott Moore wrote:
> > > > On 8/7/12 7:19 PM, Steve Calfee wrote:
> > > > >On Tue, Aug 7, 2012 at 6:18 PM, Kevin Broch <kevbroch@gmail.com>
> wrote:
> > > > >>I'm am looking to build a complete (gcc too) development
> environment
> > > on the
> > > > >>target (arm) but currently don't see that this is possible.
> > > > >>I have tried all 3 toolchain types (buildroot, cross-ng, external
> > > (linaro),
> > > > >>but regardless I don't find gcc in output/target/usr/bin/gcc
> > > > >>I am wondering if I am missing something?
> > > > >>
> > > > >>If not I am looking for any pointer on how I might do this (having
> > > never
> > > > >>created a buildroot package).
> > > > >>Ideally I would like to create a package that compiles Linaro GCC:
> > > > >>https://wiki.linaro.org/WorkingGroups/ToolChain/Using/GCCNative
> > > > >>I am imagining leveraging what is used to generate other tools like
> > > gdb,
> > > > >>binutils, and trying to incorporate the various machine options
> (VFP,
> > > > >>softfloat, etc)
> > > > >>in the configure options.
> > > > >>
> > > > >>Any pointers would be appreciated.
> > > > >I guess you haven't seen how to do it because it is kind of bizarre.
> > > > >You want to cross compile a native mode compiler. Why?
> > > > >
> > > > >Most people building embedded systems don't want to compile on those
> > > > >systems. I don't know how you even bootstrap a gcc build in a system
> > > > >without a c compiler.
> > > > According to http://www.uclibc.org/toolchains.html (which
> > > > unfortunately seems quite out of date), this is a recommended way of
> > > > creating a development system for using uClibc.
> > > > I'm actually trying to do something similar to easily build
> > > > applications in a "clean" environment with only uClibc headers, etc,
> > > > and also having trouble. Has anyone done this recently? (See my
> > > > message earlier today about a configuration for x86_64)
> > > >
> > > > Kevin, you may need to select GCC in the "package selection for
> > > > target -> development tools" options in menuconfig (which requires
> > > > setting development files on target to true in build options). I've
> > > > gotten that far but the resulting native compiler hasn't worked
> > > > reliably.
> > >
> > > You may try Aboriginal Linux (http://landley.net/aboriginal/) which
> > > includes
> > > pre-built native compilers for various targets, along with their build
> > > scripts.
> > >
> > > baruch
>
> --
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open
> Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120809/5f84200c/attachment.html>
