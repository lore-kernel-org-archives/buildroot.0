From: Jan Viktorin <xvikto03@stud.fit.vutbr.cz>
Date: Wed, 19 Mar 2014 14:53:34 +0100
Subject: [Buildroot] [PATCH 1/1] Fix microblize little endian toolchain
In-Reply-To: <5329954F.7060701@zacarias.com.ar>
References: <1395230465-4421-1-git-send-email-xvikto03@stud.fit.vutbr.cz>
 <5329954F.7060701@zacarias.com.ar>
Message-ID: <20140319145334.5a838859@pcviktorin.fit.vutbr.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 19 Mar 2014 10:02:07 -0300
Gustavo Zacarias <gustavo@zacarias.com.ar> wrote:

> On 03/19/2014 09:01 AM, Jan Viktorin wrote:
> 
> > From: Jan Drazil <xdrazi00@stud.fit.vutbr.cz>
> > 
> > Buildroot toolchain creates big endian binaries instead of little
> > endian ones for microblaze architecture. The reason is wrong
> > BR2_ARCH string. KERNEL_ARCH must contain microblaze in both cases.
> > 
> > Signed-off-by: Jan Drazil <xdrazi00@stud.fit.vutbr.cz>
> > Signed-off-by: Jan Viktorin <xvikto03@stud.fit.vutbr.cz>
> 
> Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Tested-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> 
> The qemu_microblazeel_mmu_defconfig now starts the kernel (before it
> was a big failure). Still not great since OOM killer strikes before
> the login prompt.
> Regards.
> 

Hello Gustavo,

thanks for the testing report.

It is possible to boot the system on Microblaze but it is impossible to
login (getty shows prompt without hostname: "(none) login:" and it
always fails). A similar behaviour was seen a while before with one of
the Xilinx toolchains (14.3?).

We tried to hack into the system from an init script by starting a
shell. This failed with Illegal instruction exception. Another strange
thing happens while calling "ls -l /". It lists all the filesystem
recursively (I suppose, this is wrong as well).

Do you have any idea how to debug it? (qemu + gdb?)

Regards
Jan Viktorin
