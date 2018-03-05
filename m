From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 5 Mar 2018 18:44:52 +0200
Subject: [Buildroot] Help ! I can not mount on boot my root filesystem
 with user_xattr, acl mount options (only remount works)
In-Reply-To: <211811520264204@web51j.yandex.ru>
References: <211811520264204@web51j.yandex.ru>
Message-ID: <20180305164451.6lujpx7wxqjtyimj@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Lev,

On Mon, Mar 05, 2018 at 06:36:44PM +0300, Lev Olshvang wrote:
> I do not understand how to boot my QEMU versatile arm with EXT4 root 
> filesystem with extented attribute mount option??user_xattr.
> ?
> The kernel 4.9.6 is compiled with support for EXTENDED attributes and I can do
> mount -o remount inside embedded?machine enabling user_attr.
> ?
> I tried to change /etc/fstab to add user_attr option but to no success.
> ?
> But I was able to chage reatime optin in fstab to noatime and see it accepted
> after reboot.
> ?
> I also tried to pass mount option using kernel boot parameters line, rootflags=
> user_xattr, rootfstype=ext4 but also to no success.
> ?
> I also tried tune2fs inside buildroot, but to no effect either.
> ?
> I am desperate,

Adding rootflags=user_xattr to the kernel command line might help.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
