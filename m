From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 10 Mar 2018 21:58:41 +0100
Subject: [Buildroot] Is there a way to automatically detect the minimum
 required BR2_TARGET_ROOTFS_EXT2_SIZE?
In-Reply-To: <CAFXrp_exNc=GtVqbuRmYqKiDNXgD+pawnCSmRH-1FrF2dxXgLQ@mail.gmail.com>
References: <CAFXrp_exNc=GtVqbuRmYqKiDNXgD+pawnCSmRH-1FrF2dxXgLQ@mail.gmail.com>
Message-ID: <20180310205841.GA2097@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ciro, All,

On 2018-03-10 16:14 +0000, Ciro Santilli spake thusly:
> https://stackoverflow.com/questions/49211241/is-there-a-way-to-automatically-detect-the-minimum-required-br2-target-rootfs-ex
> 
> I'm when making a big non-embedded image, I keep hitting the error:
> 
>     *** Maybe you need to increase the filesystem size
> (BR2_TARGET_ROOTFS_EXT2_SIZE)
> 
> and then I have to do a `du` on `output/target` to find out how big I
> have to make `BR2_TARGET_ROOTFS_EXT2_SIZE`.
> 
> Is there a way to automate this, or a decent workaround?

No, becaaue it is not reliable, see commit:

    c6bca8cef fs/ext2: Remove support for auto-calculation of rootfs size

In the end, it does nto make sense to do auto-calculation, because on an
embedded device, you have to now the layout and size of your storage.
So, you know what size you want your ext filesystem to be.

Regards,
Yann E. MORIN.

> Some workarounds I'm considering:
> 
> * put the big stuff under 9p:
> https://superuser.com/questions/628169/how-to-share-a-directory-with-the-host-without-networking-in-qemu
> * use CPIO and `-initrd`
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
