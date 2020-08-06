From: jiao shuaipeng <jiaoshuaipeng@outlook.com>
Date: Thu, 6 Aug 2020 16:28:10 +0000
Subject: [Buildroot] =?gb2312?b?u9i4tDogIG9wZW5zc2ggdG90YWx5IGNhbid0IHVz?=
 =?gb2312?b?ZSBvbiByaXNjdi9hcm02NCB3aXRoIGxhdGVzdCBidWlsZHJvb3Q=?=
In-Reply-To: <20200806171237.1ba34fc8@windsurf.home>
References: <VI1PR07MB4590527D56A9FCB9F72F5A1AAB480@VI1PR07MB4590.eurprd07.prod.outlook.com>,
 <20200806171237.1ba34fc8@windsurf.home>
Message-ID: <VI1PR07MB4590B24946F9A63C352677A2AB480@VI1PR07MB4590.eurprd07.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

Thanks for your reply.

I have ever tried to run "sshd --help" after linux is booting up inside the qemu. I see the similar phenomenon, the program is stuck.

So it should not "the lack of entropy in the random number generator ".

Thanks

________________________________
???: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
????: 2020?8?6? 23:12
???: jiao shuaipeng <jiaoshuaipeng@outlook.com>
??: buildroot at busybox.net <buildroot@busybox.net>; shuaipeng.jiao at montage-tech.com <shuaipeng.jiao@montage-tech.com>; jiaoshuaipeng at yeah.net <jiaoshuaipeng@yeah.net>
??: Re: [Buildroot] openssh totaly can't use on riscv/arm64 with latest buildroot

On Thu, 6 Aug 2020 14:31:33 +0000
jiao shuaipeng <jiaoshuaipeng@outlook.com> wrote:

> Any one ever use openssh8.3 on RISCV/ARM64 with latest buildroot commit ?
>
> We found the the binary of openssh can generated successfully with the buildroot.
> But when we run the application sshd or "ssh-keygen -a", it will be stuck.
> I have used the GDB to find root cause why the program is stuch, i see the stach frame is corrupted.
>
> we are using the config "qemu_aarch64_virt_defconfig" and "qemu_riscv32_virt_defconfig", and enable the openssh with "make menucofig". qemu version is 5.0.50.  linux kernel version is 5.1.12.

Could this simply due to the lack of entropy in the random number
generator ?

Thomas
--
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200806/337d1d92/attachment.html>
