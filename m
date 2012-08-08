From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 8 Aug 2012 08:57:04 +0300
Subject: [Buildroot] building native gcc for target
In-Reply-To: <5021CE95.9000808@sri.com>
References: <CAKWKLJCPCYuYteR7s6xrUgBH6j5aOfn28431eeSQeGqVT5Z3=g@mail.gmail.com>
 <CAJJ6jxszVqjSSLCsU0oVbWAb72KBo1jf5U6kFEBHpED+RniKdw@mail.gmail.com>
 <5021CE95.9000808@sri.com>
Message-ID: <20120808055704.GA9185@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Scott, Kevin,

On Tue, Aug 07, 2012 at 07:27:33PM -0700, Scott Moore wrote:
> On 8/7/12 7:19 PM, Steve Calfee wrote:
> >On Tue, Aug 7, 2012 at 6:18 PM, Kevin Broch <kevbroch@gmail.com> wrote:
> >>I'm am looking to build a complete (gcc too) development environment on the
> >>target (arm) but currently don't see that this is possible.
> >>I have tried all 3 toolchain types (buildroot, cross-ng, external (linaro),
> >>but regardless I don't find gcc in output/target/usr/bin/gcc
> >>I am wondering if I am missing something?
> >>
> >>If not I am looking for any pointer on how I might do this (having never
> >>created a buildroot package).
> >>Ideally I would like to create a package that compiles Linaro GCC:
> >>https://wiki.linaro.org/WorkingGroups/ToolChain/Using/GCCNative
> >>I am imagining leveraging what is used to generate other tools like gdb,
> >>binutils, and trying to incorporate the various machine options (VFP,
> >>softfloat, etc)
> >>in the configure options.
> >>
> >>Any pointers would be appreciated.
> >I guess you haven't seen how to do it because it is kind of bizarre.
> >You want to cross compile a native mode compiler. Why?
> >
> >Most people building embedded systems don't want to compile on those
> >systems. I don't know how you even bootstrap a gcc build in a system
> >without a c compiler.
> According to http://www.uclibc.org/toolchains.html (which
> unfortunately seems quite out of date), this is a recommended way of
> creating a development system for using uClibc.
> I'm actually trying to do something similar to easily build
> applications in a "clean" environment with only uClibc headers, etc,
> and also having trouble. Has anyone done this recently? (See my
> message earlier today about a configuration for x86_64)
> 
> Kevin, you may need to select GCC in the "package selection for
> target -> development tools" options in menuconfig (which requires
> setting development files on target to true in build options). I've
> gotten that far but the resulting native compiler hasn't worked
> reliably.

You may try Aboriginal Linux (http://landley.net/aboriginal/) which includes 
pre-built native compilers for various targets, along with their build 
scripts.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
