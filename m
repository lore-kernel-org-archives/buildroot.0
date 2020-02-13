From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 13 Feb 2020 15:13:26 +0530
Subject: [Buildroot] [PATCH 2/4] package/arm-gnu-a-toolchain: new package
In-Reply-To: <20200213092005.o5h7wioo2kokn2gr@bars>
References: <1581573151-18943-1-git-send-email-sunil@amarulasolutions.com>
 <1581573151-18943-3-git-send-email-sunil@amarulasolutions.com>
 <20200213073431.6p42z2gsv6kaydoi@bars>
 <CAMty3ZBaswiTKkH4KFBQhWEZCUKcOOyFyjVGMw7b-JzvroTkcw@mail.gmail.com>
 <20200213092005.o5h7wioo2kokn2gr@bars>
Message-ID: <CAMty3ZAhiNYneON3==+q63_6JkdybOZX-1rKOwXno=9LYpCanw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Feb 13, 2020 at 2:50 PM Sergey Matyukevich <geomatsi@gmail.com> wrote:
>
> On Thu, Feb 13, 2020 at 01:40:43PM +0530, Jagan Teki wrote:
> > On Thu, Feb 13, 2020 at 1:04 PM Sergey Matyukevich <geomatsi@gmail.com> wrote:
> > >
> > > > arm trusted firmware requires a bare metal toolchain for its build.
> > > > Add pre-built cross-compilation ARM-A bare metal toolchain for Arm Cortex-A
> > > > family processors to avoid the following build error.
> > > >
> > > > make[3]: arm-none-eabi-gcc: Command not found
> > > >
> > > > pre-built bate metal ARM GNU-A toolchain installs into the host file system folder
> > > > /opt/gcc-arm-none-eabi.
> > > >
> > > > https://developer.arm.com/-/media/Files/downloads/gnu-a/9.2-2019.12/binrel/gcc-arm-9.2-2019.12-x86_64-arm-none-eabi.tar.xz
> > > >
> > > > Signed-off-by: Suniel Mahesh <sunil@amarulasolutions.com>
> > > >
> > >
> > > Hi,
> > >
> > > Could you please clarify why a separate toolchain is required to build
> > > ATF for this platform ? Is there any specific requirements other than
> > > this particular build error ?
> >
> > Rockchip rk3399 has cortex-m0 and these changes are build during ATF.
> > and then environment should have arm32 cross toolchain to make it
> > build successfully.
> >
> > I think, Sunil need to write something more on this requirement on
> > commit message.
>
> Well, I mean that other ATF firmwares can be built with standard buildroot
> toolchain. I guess this is the case for Rockchip ATF as well. You just need
> to specify available toolchain using environment variable or something.
> In the worst case, some patch modifing Makefiles in Rockchip ATF
> source tree is needed.

It is a known requirement that rockchip rk3399 AFT would require arm32
toolchain as well. For testing, if you try to build ATF manually w/o
the environment has arm32 toolchain, build would fail. Since it is not
supported earlier, Thomas has reverted rk3399 boards in previous
release. This is something similar to "32-bit code generation for
Armv8 targets" in this thread [1].

[1] http://lists.busybox.net/pipermail/buildroot/2019-February/242453.html

Jagan.
