From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 19 Mar 2014 10:02:07 -0300
Subject: [Buildroot] [PATCH 1/1] Fix microblize little endian toolchain
In-Reply-To: <1395230465-4421-1-git-send-email-xvikto03@stud.fit.vutbr.cz>
References: <1395230465-4421-1-git-send-email-xvikto03@stud.fit.vutbr.cz>
Message-ID: <5329954F.7060701@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/19/2014 09:01 AM, Jan Viktorin wrote:

> From: Jan Drazil <xdrazi00@stud.fit.vutbr.cz>
> 
> Buildroot toolchain creates big endian binaries instead of little endian
> ones for microblaze architecture. The reason is wrong BR2_ARCH string.
> KERNEL_ARCH must contain microblaze in both cases.
> 
> Signed-off-by: Jan Drazil <xdrazi00@stud.fit.vutbr.cz>
> Signed-off-by: Jan Viktorin <xvikto03@stud.fit.vutbr.cz>

Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Tested-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

The qemu_microblazeel_mmu_defconfig now starts the kernel (before it was
a big failure). Still not great since OOM killer strikes before the
login prompt.
Regards.
