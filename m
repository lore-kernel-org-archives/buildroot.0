From: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
Date: Tue, 23 Apr 2019 16:45:34 +0200
Subject: [Buildroot] [PATCH] package/libglib2: disable compiler warnings
In-Reply-To: <20190423162303.2683abfb@windsurf>
References: <1556024465-7928-1-git-send-email-jugurtha.belkalem@smile.fr>
 <20190423162303.2683abfb@windsurf>
Message-ID: <CAHpTZwnAembvxag_fe-=XFshSNtpisE5Un+Y2fRfW3==QtqAOg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

I'm currently integrating the Qemu test from toolchain builder (
https://github.com/bootlin/toolchains-builder/blob/master/build.sh) into
buildroot to check the consistency of the build and get some ensurance that
Qemu build process went successful for the various Qemu architectures. This
why I have enabled host-qemu. When compiling without using
"--disable-compile-warnings"; I got this message :

>>> host-libglib2 2.56.4 Patching libtool
>>> host-libglib2 2.56.4 Building
Failed build last output
  CC       libgio_2_0_la-glistmodel.lo
  CC       libgio_2_0_la-gliststore.lo
  CC       libgio_2_0_la-gapplication.lo
....
....
....
cc1: some warnings being treated as errors
Makefile:3927: recipe for target 'libgio_2_0_la-gunixconnection.lo' failed

A complete log errors is available here :
https://gitlab.com/jugurthaB/buildroot/-/jobs/200780681.


After disabling the warnings; most architectures passes the test with
success as shown at :
https://gitlab.com/jugurthaB/buildroot/pipelines/57964815

Thank's.

On Tue, Apr 23, 2019 at 4:23 PM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello,
>
> On Tue, 23 Apr 2019 15:01:05 +0200
> Jugurtha BELKALEM <jugurtha.belkalem@smile.fr> wrote:
>
> > This flag is not set by default which yields in a
> > compilation error when host-qemu package is enabled.
> > The build fails at libglib2 package because -Werror
> > is activated which stops the compilation process.
> > Adding this flag corrects the issue.
>
> Could you be more specific about the build failure you encounter ?
> Also, what is the relationship with host-qemu ? host-libglib2 is build
> as a dependency for tons of things, including libglib2 itself, i.e it
> is built many times a day in our autobuilders. So what is different in
> your situation that requires disabling compiler warnings ?
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190423/03eab468/attachment.html>
