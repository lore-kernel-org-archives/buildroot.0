From: Kevin Broch <kevbroch@gmail.com>
Date: Wed, 8 Aug 2012 13:49:45 -0700
Subject: [Buildroot] building native gcc for target
In-Reply-To: <CAJJ6jxszVqjSSLCsU0oVbWAb72KBo1jf5U6kFEBHpED+RniKdw@mail.gmail.com>
References: <CAKWKLJCPCYuYteR7s6xrUgBH6j5aOfn28431eeSQeGqVT5Z3=g@mail.gmail.com>
 <CAJJ6jxszVqjSSLCsU0oVbWAb72KBo1jf5U6kFEBHpED+RniKdw@mail.gmail.com>
Message-ID: <CAKWKLJBK4Kt5keBO8OwPn4-YjwBAt1y2y=fx9qD6kYMYaCYZsA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Steve, Grant,

I appreciate your skepticism as validation this is something uncommon.
 That being said I still want to do it.
To be clear my end goal is to have native gcc compiler on the target.  As I
see it there are 2 ways to accomplish that:
1) cross compile it
2) go through step to build a native compiler here:
http://gcc.gnu.org/install/build.html

#1 seems easier to me (and give the resource constraints of my system #2
might not be possible)

As for why(some just examples):
- use buildroot to create a native development platform for
http://www.raspberrypi.org/
- isolated system that has feedback loop from sensor data which requires
periodic recompilation of C source
- stress test hardware using gcc as a workload

Best, /<evin





On Tue, Aug 7, 2012 at 7:19 PM, Steve Calfee <stevecalfee@gmail.com> wrote:

> On Tue, Aug 7, 2012 at 6:18 PM, Kevin Broch <kevbroch@gmail.com> wrote:
> > I'm am looking to build a complete (gcc too) development environment on
> the
> > target (arm) but currently don't see that this is possible.
> > I have tried all 3 toolchain types (buildroot, cross-ng, external
> (linaro),
> > but regardless I don't find gcc in output/target/usr/bin/gcc
> > I am wondering if I am missing something?
> >
> > If not I am looking for any pointer on how I might do this (having never
> > created a buildroot package).
> > Ideally I would like to create a package that compiles Linaro GCC:
> > https://wiki.linaro.org/WorkingGroups/ToolChain/Using/GCCNative
> > I am imagining leveraging what is used to generate other tools like gdb,
> > binutils, and trying to incorporate the various machine options (VFP,
> > softfloat, etc)
> > in the configure options.
> >
> > Any pointers would be appreciated.
> >
> > Best, /<evin
>
> I guess you haven't seen how to do it because it is kind of bizarre.
> You want to cross compile a native mode compiler. Why?
>
> Most people building embedded systems don't want to compile on those
> systems. I don't know how you even bootstrap a gcc build in a system
> without a c compiler.
>
> Regards, Steve
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120808/83cabfba/attachment.html>
