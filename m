From: Oscar Gomez Fuente <oscargomezf@gmail.com>
Date: Fri, 5 Aug 2016 11:12:49 +0200
Subject: [Buildroot] imx6 platform var-som-solo
In-Reply-To: <20160804141405.70e0e848@free-electrons.com>
References: <CALtfCQZz4Pc9mhwr=7t37oyty-KWCPRackStkV67H6rSeu+1Gw@mail.gmail.com>
 <20160804141405.70e0e848@free-electrons.com>
Message-ID: <CALtfCQZKkumEfrgO8nVJXVtYmwdd=5WS-mY+j-mYDBhhTNyfUQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

To select imx-gpu-viv I need glibc toolchain with armhf enabled. I already
have selected glibc but for enable armhf I have to change my Target
options. I had to enable:

> Target options >
 [*] Enable VFP extension support

And then it appeared the option EABIhf in Target ABI:

> Target options >
Target ABI (EABIhf)  --->

And the I selected:

> Target options >
Floating point strategy (VFPv3)  --->

But then I've got an error to compile qt5:

----------------------
qt5base 5.6.1-1 Building
...
                 from eglconvenience/qeglpbuffer_p.h:50,
                 from eglconvenience/qeglpbuffer.cpp:35:
../../include/QtCore/../../src/corelib/kernel/qvariant.h:334:24: warning:
?const char* typeToName(int)? declared ?static? but never defined
[-Wunused-function]
     static const char *typeToName(int typeId);
                        ^
make[4]: *** [.obj/qeglpbuffer.o] Error 1
make[4]: *** Waiting for unfinished jobs....
make[3]: *** [sub-platformsupport-make_first] Error 2
make[2]: *** [sub-src-make_first] Error 2
make[1]: ***
[/home/oscargomez/GIT/imx6-variscite/buildroot-2016.05/output/build/qt5base-5.6.1-1/.stamp_built]
Error 2
make: *** [_all] Error 2
----------------------

Any suggestion?

Best regards.

Oscar Gomez Fuente

On 4 August 2016 at 14:14, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Hello,
>
> On Thu, 4 Aug 2016 13:52:50 +0200, Oscar Gomez Fuente wrote:
>
> > I made something similar with the raspberry pi 2B and I didn't have any
> > problem. I can't find how to select OpenGL and EGL to free the option to
> > select eglfs.
>
> Enable the imx-gpu-viv package, which provides the OpenGL ES and EGL
> implementation for i.MX6.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160805/422eedc0/attachment.html>
