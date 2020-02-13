From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 13 Feb 2020 13:40:43 +0530
Subject: [Buildroot] [PATCH 2/4] package/arm-gnu-a-toolchain: new package
In-Reply-To: <20200213073431.6p42z2gsv6kaydoi@bars>
References: <1581573151-18943-1-git-send-email-sunil@amarulasolutions.com>
 <1581573151-18943-3-git-send-email-sunil@amarulasolutions.com>
 <20200213073431.6p42z2gsv6kaydoi@bars>
Message-ID: <CAMty3ZBaswiTKkH4KFBQhWEZCUKcOOyFyjVGMw7b-JzvroTkcw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Feb 13, 2020 at 1:04 PM Sergey Matyukevich <geomatsi@gmail.com> wrote:
>
> > arm trusted firmware requires a bare metal toolchain for its build.
> > Add pre-built cross-compilation ARM-A bare metal toolchain for Arm Cortex-A
> > family processors to avoid the following build error.
> >
> > make[3]: arm-none-eabi-gcc: Command not found
> >
> > pre-built bate metal ARM GNU-A toolchain installs into the host file system folder
> > /opt/gcc-arm-none-eabi.
> >
> > https://developer.arm.com/-/media/Files/downloads/gnu-a/9.2-2019.12/binrel/gcc-arm-9.2-2019.12-x86_64-arm-none-eabi.tar.xz
> >
> > Signed-off-by: Suniel Mahesh <sunil@amarulasolutions.com>
> >
>
> Hi,
>
> Could you please clarify why a separate toolchain is required to build
> ATF for this platform ? Is there any specific requirements other than
> this particular build error ?

Rockchip rk3399 has cortex-m0 and these changes are build during ATF.
and then environment should have arm32 cross toolchain to make it
build successfully.

I think, Sunil need to write something more on this requirement on
commit message.

Jagan.
