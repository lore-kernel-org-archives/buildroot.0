From: Andreas Kuehn <Andreas.Kuehn@gin.de>
Date: Wed, 11 Jun 2008 10:49:13 +0200
Subject: [Buildroot] kernel image size depends on toolchain?
In-Reply-To: <408540dd0806110130h49a4b38ar1b55c3b86b7c9675@mail.gmail.com>
References: <484F8157.2050902@gin.de>
	<408540dd0806110130h49a4b38ar1b55c3b86b7c9675@mail.gmail.com>
Message-ID: <484F9189.6050700@gin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey Matt!

In fact I was a little confused about your question but a found the flag 
  in the kernels .config file.

# CONFIG_BLK_DEV_INITRD is not set

And so, initrd is not active.



Matthew Dombroski wrote:
> Hi,
> Have you tried disabling the initrd stuff in the buildroot config?
> ~Matt
> 
> On Wed, Jun 11, 2008 at 7:40 PM, Andreas Kuehn <Andreas.Kuehn@gin.de> wrote:
>> Its probably one of these "again" questions but I couldn't get a
>> reasonable/sound answer.
>>
>> I'm building an arm rootfs and an 2.6.23.14 kernel with the actual svn
>> buildroot and uclibc. It works quite well but produces really large
>> kernel images.
>>
>> Created:      Tue Jun 10 11:45:43 2008
>> Image Type:   ARM Linux Kernel Image (uncompressed)
>> Data Size:    4528112 Bytes = 4421.98 kB = 4.32 MB
>>
>> With an old toolchain I can achive regular sizes:
>>
>> Created:      Tue Jun 10 13:44:26 2008
>> Image Type:   ARM Linux Kernel Image (uncompressed)
>> Data Size:    1412792 Bytes = 1379.68 kB = 1.35 MB
>>
>>
>> Unfortunately, the old toolchain has a buggy uclibc and I need a new
>> one. -- How can I fix that greedy kernel thing ? --
>>
>> Thanks in advance...
>> akuehn
>> _______________________________________________
>> buildroot mailing list
>> buildroot at uclibc.org
>> http://busybox.net/mailman/listinfo/buildroot
>>
> 
