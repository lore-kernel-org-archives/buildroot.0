From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 Dec 2013 18:44:51 +0100
Subject: [Buildroot] [PATCHv2 1/4] linux: enable initrd/initramfs
 support when cpio rootfs is chosen
In-Reply-To: <1388338428-19833-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1388338428-19833-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1388338428-19833-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20131229174451.GJ3567@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-12-29 18:33 +0100, Thomas Petazzoni spake thusly:
> When one enables the generation of a cpio archive of the root
> filesystem, the most likely usage is as an initramfs for the
> kernel. This commit ensures that the kernel has initramfs support when
> the rootfs cpio image format is chosen.
> 
> This will for example ensure that if the user selects the ISO9660
> filesystem format (which uses a cpio initramfs), the kernel will have
> proper support to load and use the initramfs.
> 
> It is worth mentionning that when BR2_TARGET_ROOTFS_INITRAMFS is
> enabled, then BR2_TARGET_ROOTFS_CPIO is always enabled. That's why we
> move the enabling of CONFIG_BLK_DEV_INITRD from the initramfs case to
> the cpio case.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
