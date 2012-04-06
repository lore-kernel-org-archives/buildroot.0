From: Stephan Hoffmann <sho@relinux.de>
Date: Fri, 06 Apr 2012 19:03:12 +0200
Subject: [Buildroot] [PATCH 1/2] qemu/x86: Adapted qemu command line in
 readme file
In-Reply-To: <52c7e9684ce54565c417f75a9b912be3@zacarias.com.ar>
References: <1333729180-18218-1-git-send-email-sho@relinux.de>
 <52c7e9684ce54565c417f75a9b912be3@zacarias.com.ar>
Message-ID: <4F7F21D0.5030506@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 06.04.2012 18:45, schrieb Gustavo Zacarias:
> On 2012-04-06 13:19, Stephan Hoffmann wrote:
>
>
>> -  qemu-system-i386 -M pc -kernel output/images/bzImage -drive
>> file=output/images/rootfs.ext2,if=ide -append root=/dev/sda
>> +  qemu-system-i386 -M pc -kernel images/bzImage -drive
>> file=images/rootfs.ext2,if=ide -append root=/dev/sda
>
> Why?
> I don't think it's common for users to be in the output directory as
> their current working directory.
No, of course not. I assume being in the directory where make was called in.
> Regards.
>
O.K., after further investigation I found out that this was caused by my
out-of-tree build taking the working directory as the output directory;-)

Kind regards

Stephan

-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de
