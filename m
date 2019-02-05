From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 05 Feb 2019 12:35:41 +0000
Subject: [Buildroot] [Bug 11656] Custom device tree and u-boot boot.scr not
 integrated in boot.vfat (hw: BeagleBoneBlack with LCD cape)
In-Reply-To: <bug-11656-163@https.bugs.busybox.net/>
References: <bug-11656-163@https.bugs.busybox.net/>
Message-ID: <bug-11656-163-wxR3QNltoa@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11656

Tibor Stolz <tistolz@outlook.de> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|Device tree issues with     |Custom device tree and
                   |BeagleBoneBlack and LCD     |u-boot boot.scr not
                   |cape                        |integrated in boot.vfat
                   |                            |(hw: BeagleBoneBlack with
                   |                            |LCD cape)

--- Comment #2 from Tibor Stolz <tistolz@outlook.de> ---
Hello,

During another build I found out that board/beaglebone/post-image.sh is
responsible for the contents of the boot.vfat filesystem. It selects the config
file board/beaglebone/genimage.cfg (or genimage_linux41.cfg), which contains
the vfat filesystem contents hard-coded:

> image boot.vfat {
>         vfat {
>                 files = {
>                         "MLO",
>                         "u-boot.img",
>                         "zImage",
>                         "uEnv.txt",
>                         "am335x-evm.dtb",
>                         "am335x-evmsk.dtb",
>                         "am335x-bone.dtb",
>                         "am335x-boneblack.dtb",
>                         "am335x-bonegreen.dtb",
>                 }
>         }
>         size = 16M
> }
[...]

So is it worth the effort to dynamically change this files list, depending on
the presence of 'boot.scr' or additional out-of-tree .dtb files?

Best regards,
Tibor Stolz

-- 
You are receiving this mail because:
You are on the CC list for the bug.
