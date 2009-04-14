From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Tue, 14 Apr 2009 17:12:05 +0200
Subject: [Buildroot] /dev files not being created correctly
In-Reply-To: <204928.46075.qm@web43412.mail.sp1.yahoo.com>
References: <204928.46075.qm@web43412.mail.sp1.yahoo.com>
Message-ID: <5f2b60904140812r3c76ff10p332d87deaa9bfee9@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2009/4/14 Mark Fisher <fobs12@ymail.com>

> Hi,
>
> I'm relatively new to buildroot and am using the 2009.02 release of
> buildroot on a Fedora 9 platform and targeting an embedded device with an
> Intel Atom processor.
>
> When the root filesystem is built the types of the files are all set to
> plain text files. So for instance the /dev/console is not set to be a
> character device. This has already create problems when I try to boot
> because the console could not be opened. I manually fixed /dev/console and
> /dev/null. I'm still having trouble booting the image and also after
> a re-build my custom changes were lost.
>
> Is this a known problem, and is there a fix? If not should I delete all the
> files in the /dev directory and then re-create them based on the settings in
> the device_table.txt?
>
The plain text files in /dev are just as they should be, but the rootfs with
those files is not the rootfs you want for your target. Try selecting a
different root file system type in menuconfig, like tar or ext2 or
something. By doing that you should get proper /dev/* files in your
generated rootfs images under ./binaries/<project>/.

>
> Thanks,
>
> Mark
>
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090414/1eb29339/attachment.htm>
