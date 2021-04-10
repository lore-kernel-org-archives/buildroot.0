From: Ryan Barnett <ryanbarnett3@gmail.com>
Date: Sat, 10 Apr 2021 15:07:02 -0500
Subject: [Buildroot] Build failure with alpine
In-Reply-To: <66004670-FB20-4C02-9998-B7071C0F6249@yahoo.com>
References: <66004670-FB20-4C02-9998-B7071C0F6249.ref@yahoo.com>
 <66004670-FB20-4C02-9998-B7071C0F6249@yahoo.com>
Message-ID: <CALq67GDxNNqZ+Catt-b=T_G3rOCf9wzp=UES8f_bhAWyRu7qvA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vicary,

On Mon, Dec 28, 2020 at 3:28 AM Vicary A via buildroot
<buildroot@busybox.net> wrote:
>
> Hello everyone,
>
> I am new to buildroot, please let me know if this is not the correct place for general help.
>
> This is my first time building buildroot, I started with a clean alpine container with the 2020.11 archive.
>
> I installed alpine equivalents of recommended prerequisites from the official site, packages are:
>
> I typed "make raspberrypi4_64_defconfig" followed by "make all", I can see most of the compilation went through until I get the following lines:
>
> making install in e2fsck
> make[2]: Entering directory '/root/buildroot/output/build/host-e2fsprogs-1.45.6/e2fsck'
>         MKDIR_P /root/buildroot/output/host/sbin /root/buildroot/output/host/share/man/man8
> make[2]: config/install-sh: No such file or directory
> make[2]: *** [Makefile:522: installdirs] Error 127
> make[2]: Leaving directory '/root/buildroot/output/build/host-e2fsprogs-1.45.6/e2fsck'
> make[1]: *** [Makefile:433: install-progs-recursive] Error 1
> make[1]: Leaving directory '/root/buildroot/output/build/host-e2fsprogs-1.45.6'
> make: *** [package/pkg-generic.mk:260: /root/buildroot/output/build/host-e2fsprogs-1.45.6/.stamp_host_installed] Error 2

This specific issue is caused by coreutils not being installed since
e2fsck make file requires the full version of mkdir. Here is a
Dockerfile that I have with the list of the minimum dependencies found
for buildroot.

https://github.com/rjbarnet/alpine-buildroot-dev/blob/master/Dockerfile

I have a few being patches that I have not submitted for upstreaming
yet can be found here:

https://github.com/rjbarnet/buildroot/tree/add-alpine-support

In the future I hope to provide some feedback on minimum requirements
for buildroot in the future. Please let me know if you have any
feedback in regards to using Alpine with buildroot.

Thanks,
-Ryan
