From: Ron Eggler <reggler@semiosbio.com>
Date: Thu, 17 May 2012 13:56:54 -0700
Subject: [Buildroot] cp210x needed
In-Reply-To: <20120517224505.31267c33@skate>
References: <CAFC29aV9nhzG8_ZAG8j1QCGqY_Qv1tg39sGac-5sTUvQL=uRJw@mail.gmail.com>
 <20120517222149.3c657ce1@skate>
 <CAFC29aX+g8jJXvp=hMXuXX7WKLNXGuAQ9KeQFZ4Hdf822MNpfQ@mail.gmail.com>
 <20120517224505.31267c33@skate>
Message-ID: <CAFC29aUB7tC3dh1U47_aMJ2bT2Twr_s4tTTz=WmbCuSM17Lyfg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

with make linux-menuconfig I get this:
reg at SemiosDesktop-reg:/usr/local/src/E10-buildroot/br1202-main$ make
linux-menuconfig
mkdir -p /usr/local/src/E10-buildroot/br1202-main/output/target
if ! [ -d "/usr/local/src/E10-buildroot/br1202-main/output/target/bin" ];
then \
                if [ -d
"/usr/local/src/E10-buildroot/br1202-main/fs/skeleton" ]; then \
                        cp -fa
/usr/local/src/E10-buildroot/br1202-main/fs/skeleton/*
/usr/local/src/E10-buildroot/br1202-main/output/target/; \
                fi; \
                touch
/usr/local/src/E10-buildroot/br1202-main/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/.fakeroot.00000;
\
        fi
find /usr/local/src/E10-buildroot/br1202-main/output/target -type d -name
CVS -print0 -o -name .svn -print0 | xargs -0 rm -rf
find /usr/local/src/E10-buildroot/br1202-main/output/target -type f \(
-name .empty -o -name '*~' \) -print0 | xargs -0 rm -rf
touch /usr/local/src/E10-buildroot/br1202-main/output/build/.root
>>> linux 3.2.7 Configuring
cp "board/synapse/e10/linux-3.2.6-config"
/usr/local/src/E10-buildroot/br1202-main/output/build/linux-3.2.7/arch/arm/configs/buildroot_defconfig
cp: cannot create regular file
`/usr/local/src/E10-buildroot/br1202-main/output/build/linux-3.2.7/arch/arm/configs/buildroot_defconfig':
No such file or directory
make: ***
[/usr/local/src/E10-buildroot/br1202-main/output/build/linux-3.2.7/.stamp_configured]
Error 1
reg at SemiosDesktop-reg:/usr/local/src/E10-buildroot/br1202-main$

:(

On Thu, May 17, 2012 at 1:45 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Le Thu, 17 May 2012 13:35:46 -0700,
> Ron Eggler <reggler@semiosbio.com> a ?crit :
>
> > Right but I haven't been able to find it so I wasn't sure if "make
> > menuconfig"
> > is the right way to do it...?
>
> In Buildroot, if you run "make menuconfig", you get the Buildroot
> options.
>
> If you have the kernel options, you have to run "make linux-menuconfig".
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120517/f2b442fd/attachment.html>
