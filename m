From: Carlos Santos <unixmania@gmail.com>
Date: Sun, 15 Mar 2020 17:51:25 -0300
Subject: [Buildroot] Beaglebone support
In-Reply-To: <87lfohavm5.fsf@dell.be.48ers.dk>
References: <CAPmASeu4KLNSK=nkgb04C4UKwTsDfjyZ0RXOCkF2r3yWyHYWJg@mail.gmail.com>
 <CABhNV22j46zXYJimCgP7Z-VK=kbbosiQr0V7ObVW0Y3cW-VVZg@mail.gmail.com>
 <87lfohavm5.fsf@dell.be.48ers.dk>
Message-ID: <CAJ4jsaf0G1tYjtNPuY7FNgwEDhQG153GsvbNK0D-ra05AxP0LQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Mar 3, 2020 at 8:04 PM Peter Korsgaard <peter@korsgaard.com> wrote:
>
> >>>>> "Einar" == Einar J?n <tolvupostur@gmail.com> writes:
>
>  > Hello Andrea, Sebastien
>  > Sorry for the late response. I've been meaning to build and fix the qt5 for
>  > beaglebone, but I'm in the middle of switching jobs and moving countries,
>  > and I don't have the buildroot repo.
>  > The beaglebone_qt5_defconfig should mostly work with the latest addition of
>  > new ti-sgx drivers (added in November or so). It now builds the latest
>  > drivers for ti-sgx (which finally builds the KMS plugin for QT), and
>  > QtMultimedia should work. I have been building QtMultimedia and QtWebEngine
>  > with the old ti-sgx drivers and writing directly to the frame buffer (no
>  > acceleration because KMS plugin wouldn't build, no Weston) for over a year.
>
>  > I haven't tried that exact setup since the addition, but you probably need
>  > to add
>  > BR2_KERNEL_NEEDS_OPENSSL=y
>  > for it to build. Compare beaglebone_qt5_defconfig to beaglebone_defconfig
>  > for exact spelling of this option.
>
> Notice that this has been fixed in commit 128c57adb8f3a4e1af2b9, which
> is part of 2020.02-rc3.
>
> --
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

In order to build beaglebone_qt5 it is necessary to revert commits
b73cde8ff7c8b673c1108a8ae6f4f8838d1123d4. and
1bdceb5d735aad5fbf32b35e3a7f573ecb727e20. Otherwise it fails to build
wit the same error reported here

    http://autobuild.buildroot.net/results/9c7c66f6fd6a409b08c19f80582b1d1659cde601/

qt5wayland also fails to build, with the same error

    /usr/bin/ld: cannot find /usr/lib64/libatomic.so.1.0.0

Notice that in both case it is trying to use the host compiler and linker.

-- 
Carlos Santos <unixmania@gmail.com>
