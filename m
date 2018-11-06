From: mws <mike.w.shapiro+buildroot@gmail.com>
Date: Tue, 6 Nov 2018 10:49:24 -0600 (CST)
Subject: [Buildroot] glibc link fails on x86_64 with fPIC error
In-Reply-To: <CANQCQpZ1j-Nfh+z0qSkshZqrZrLi4pcgYhEJfrOJrOcfDyXm-A@mail.gmail.com>
References: <1541520575003-0.post@n4.nabble.com>
 <CANQCQpZ1j-Nfh+z0qSkshZqrZrLi4pcgYhEJfrOJrOcfDyXm-A@mail.gmail.com>
Message-ID: <1541522964822-0.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

$ cat defconfig
BR2_x86_64=y
BR2_x86_core_avx2=y
BR2_JLEVEL=1
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_KERNEL_HEADERS_4_9=y
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
BR2_PACKAGE_PCIUTILS=y
BR2_PACKAGE_LIBXML2=y
BR2_PACKAGE_ELFUTILS=y
BR2_PACKAGE_LIBCAP=y
BR2_PACKAGE_BASH=y

$ grep -i relro .config
BR2_RELRO_NONE=y
# BR2_RELRO_PARTIAL is not set
# BR2_RELRO_FULL is not set

Thanks for any ideas.



--
Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
