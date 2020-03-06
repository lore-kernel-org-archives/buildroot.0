From: erichiggins at gmail.com <erichiggins@gmail.com>
Date: Fri, 6 Mar 2020 10:57:00 -0800
Subject: [Buildroot] [PATCH v5 2/2] package/python-scipy: new package
In-Reply-To: <CAHfxMJ7ydmnTJi=ujMbvCYwxFxEK9T6wTYN-hE3PSCNao7Ym6w@mail.gmail.com>
References: <CAHfxMJ7ydmnTJi=ujMbvCYwxFxEK9T6wTYN-hE3PSCNao7Ym6w@mail.gmail.com>
Message-ID: <CAHfxMJ7VcTMSsFupEwQ0_ES=SPsZA_XTf05Urt0JE8tPF1mTrQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update:
- I've rebased my branch onto the latest 2019.11.x
- I successfully applied and build the first patch (which changed numpy)
- I upgraded the second patch to scipy 1.4.1
- Now I see the following build failure, which may be easier to resolve?

https://gist.github.com/erichiggins/6d6e9e065f7099f9fcc095b4bb30aeaa


On Wed, Feb 19, 2020 at 6:16 PM <erichiggins@gmail.com> wrote:

> Hello,
>
> I'm trying to add the scipy package to my buildroot project. Someone in
> the IRC support channel had found and shared the following two patches by
> Esben, which appear to do exactly that.
>
> https://patchwork.ozlabs.org/patch/1169181/
> https://patchwork.ozlabs.org/patch/1169182/
>
> I applied both patches to my branch (based on 2019.11.x) and tried to
> build, but got the following errors:
>
> ...
> /home/eric/src/personal/buildroot/output/build/python-scipy-1.3.1/build/src.linux-x86_64-3.8/build/src.linux-x86_64-3.8/scipy/fftpack/fortranobject.c:1061:
> undefined reference to `PyCapsule_Type'
> collect2: error: ld returned 1 exit status
> error: Command
> "/home/eric/src/personal/buildroot/output/host/bin/arm-buildroot-linux-gnueabihf-gfortran
> -Wall -g
> build/temp.linux-x86_64-3.8/build/src.linux-x86_64-3.8/scipy/fftpack/_fftpackmodule.o
> build/temp.linux-x86_64-3.8/scipy/fftpack/src/zfft.o
> build/temp.linux-x86_64-3.8/scipy/fftpack/src/drfft.o
> build/temp.linux-x86_64-3.8/scipy/fftpack/src/zrfft.o
> build/temp.linux-x86_64-3.8/scipy/fftpack/src/zfftnd.o
> build/temp.linux-x86_64-3.8/build/src.linux-x86_64-3.8/scipy/fftpack/src/dct.o
> build/temp.linux-x86_64-3.8/build/src.linux-x86_64-3.8/scipy/fftpack/src/dst.o
> build/temp.linux-x86_64-3.8/build/src.linux-x86_64-3.8/build/src.linux-x86_64-3.8/scipy/fftpack/fortranobject.o
> -L/home/eric/src/personal/buildroot/output/host/lib/gcc/arm-buildroot-linux-gnueabihf/8.3.0/../../../../arm-buildroot-linux-gnueabihf/lib
> -L/home/eric/src/personal/buildroot/output/host/lib/gcc/arm-buildroot-linux-gnueabihf/8.3.0/../../../../arm-buildroot-linux-gnueabihf/lib
> -L/home/eric/src/personal/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib
> -Lbuild/temp.linux-x86_64-3.8 -ldfftpack -lfftpack -lgfortran -o
> build/lib.linux-x86_64-3.8/scipy/fftpack/_
> fftpack.cpython-38-arm-linux-gnueabihf.so -Wl,--version-script=build/temp.linux-x86_64-3.8/link-version-scipy.fftpack._fftpack.map"
> failed with exit status 1
> package/pkg-generic.mk:238: recipe for target
> '/home/eric/src/personal/buildroot/output/build/python-scipy-1.3.1/.stamp_built'
> failed
> make: ***
> [/home/eric/src/personal/buildroot/output/build/python-scipy-1.3.1/.stamp_built]
> Error 1
>
> Has anyone been able to successfully apply these patches?
> Is there a status update for them being merged into buildroot?
>
> Thanks!
> -Eric Higgins
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200306/747ed51e/attachment.html>
