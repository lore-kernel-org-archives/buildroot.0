From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Nov 2013 09:13:16 +0100
Subject: [Buildroot] [PATCH 1/1] Added stage2 ldscripts
In-Reply-To: <1384986808-24363-1-git-send-email-thierry.bultel@wanadoo.fr>
References: <1384986808-24363-1-git-send-email-thierry.bultel@wanadoo.fr>
Message-ID: <20131121091316.16816a89@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thierry Bultel,

On Wed, 20 Nov 2013 23:33:28 +0100, Thierry Bultel wrote:
> When building stage2 with binutils >= 2.19.1, grub says it is corrupted
> I have not tried to downgrade binutils to that version, since buildroot
> offers 2.20.1 as oldest. The issue was reproduced with 2.23.2.
> 
> The following patch is clearly not mine.
> I have found it at that location https://dev.openwrt.org/ticket/10444
> where the issue is described, and the patch offered.
> 
> Successfully tested with an iso image in kvm, that else would hang on 
> "Loading stage2 ..."
> 
> Signed-off-by: Thierry Bultel <thierry.bultel@wanadoo.fr>
> ---
>  boot/grub/grub.500-add-stage2-ldscripts.patch |   58 +++++++++++++++++++++++++
>  1 files changed, 58 insertions(+), 0 deletions(-)
>  create mode 100644 boot/grub/grub.500-add-stage2-ldscripts.patch

This is weird, because I've built and run grub with the CodeSourcery
x86 toolchain, and the Buildroot toolchain (while testing my
http://lists.busybox.net/pipermail/buildroot/2013-November/082351.html
patch series), and it was just working fine.

Note however that
http://lists.busybox.net/pipermail/buildroot/2013-November/082365.html
makes a number of changes in the CFLAGS used to build Grub.

I've just pushed this branch (rebased on top of master) at:

  http://git.free-electrons.com/users/thomas-petazzoni/buildroot/log/?h=x86-stuff

Could you try this branch and see if it fixes the problem for you?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
