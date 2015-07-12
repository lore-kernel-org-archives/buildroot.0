From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Jul 2015 18:45:59 +0200
Subject: [Buildroot] [RFC PATCH v2 0/5] Add ILP32 support in aarch64
In-Reply-To: <1426672192-21041-1-git-send-email-bamvor.zhangjian@huawei.com>
References: <1426672192-21041-1-git-send-email-bamvor.zhangjian@huawei.com>
Message-ID: <20150712184559.581d42c0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Zhang Jian(Bamvor),

On Wed, 18 Mar 2015 17:49:47 +0800, Zhang Jian(Bamvor) wrote:

> Zhang Jian(Bamvor) (5):
>   aarch64: add big endian(aarch64_be) support

I've now applied this patch. However it is not complete enough: you
need to audit all the places where BR2_aarch64 is used in Buildroot,
and see whether adding BR2_aarch64_be is needed. For example, in
package/binutils/Config.in.host:

        config BR2_BINUTILS_VERSION_2_23_2
                depends on !BR2_aarch64 && !BR2_microblaze && \
                           !BR2_powerpc64le && !BR2_nios2
                bool "binutils 2.23.2"

You quite probably want to add !BR2_aarch64_be here as well.

>   aarch64: ilp32: handle special file name
>   aarch64: ilp32: add ilp32 compiler and linker flags
>   aarch64: ilp32: add ilp32 build config
>   aarch64: ilp32 defconfig examples

For those patches, you had some comments. A while ago, when I sent you
a reminder about those patches, you said you would resend an updated
version, but this didn't happen. For now, we marked those patches as
"Changes Requested" in patchwork. Do not hesitate to resend a new
version.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
