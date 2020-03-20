From: Robert Hammond <rob.hammondit@gmail.com>
Date: Fri, 20 Mar 2020 16:24:52 +0000
Subject: [Buildroot] configuration fragment file names
Message-ID: <CAFjuYxzo4me4Lhj=gKFNWF-F81DvqWqkn72WjVSA9pVxGOrhBw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Version buildroot-2020.02

Hi , I am trying to configure a Linux Kernel build using an NXP QorIQ arm64
kernel branch.
the configs in the kernel for this are arch/arm64/configs/defconfig
and arch/arm64/configs/lsdk.config

( a copy of the kernel source for this can be found here )
https://source.codeaurora.org/external/qoriq/qoriq-components/linux

In the buildroot menu system I have selected to use the in-tree defconfig
file which is does and picks up the arm64 default. If I don't specify the
other fragment it builds

However, I'm not having much luck in pointing it towards the other config
fragment.
I've tried specifying the fragment file name on it's own and with the
relative path from the linux top level directory i.e. both just lsdk.config
and arch/arm64/configs/lsdk.config .

In both cases the error :-

for f in ./arch/arm64/configs/defconfig ; do if [ ! -f "${f}" ]; then
printf "Kconfig fragment '%s' for '%s' does not exist\n" "${f}" "linux";
exit 1; fi; done
Kconfig fragment './arch/arm64/configs/defconfig' for 'linux' does not exist

Could i get help on the correct way of specifying this?

Best Regards

Rob Hammond
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200320/9c23ef26/attachment.html>
