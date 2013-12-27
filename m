From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Dec 2013 19:56:58 +0100
Subject: [Buildroot] Fwd: reg: buildroot build iso image
In-Reply-To: <CABsRcuAqONAzUk-Me=mK16zu6imPvPK65KJHYdi65EYW9Ep07g@mail.gmail.com>
References: <CABsRcuBWOc_yXJjdEsUyjEB1aEt+1SxCLiQ94=40aYaNo4G62Q@mail.gmail.com>
 <CABsRcuAqONAzUk-Me=mK16zu6imPvPK65KJHYdi65EYW9Ep07g@mail.gmail.com>
Message-ID: <20131227195658.6e3a5326@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thiyagarajan,

On Fri, 27 Dec 2013 18:37:54 +0530, Thiyagarajan wrote:

>  I used the buidroot for building custom embedded linux. I compiled the
> buildroot2013.12 and i am able to build the rootfs.iso9660 image file. If i
> will try with this iso file in virtual box it take into grub prompt, and
> it's stops there itself.

Please add "iso9660" to the list of filesystems supported by Grub,
using the BR2_TARGET_GRUB_FS_SUPPORT option.

I will send some patches that make that automatic, but for the time
being, just add "iso9660" after "ext2fs" and "fat" in this option.

I've just tested this with Qemu, and it fixes the problem.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
