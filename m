From: Abhimanyu V <abhimanyu.v@imgtec.com>
Date: Mon, 20 Mar 2017 12:43:10 +0530
Subject: [Buildroot] [PATCH v4 2/3] Add LINUX_DIR to EXTRA_ENV for use
 in post-build scripts
In-Reply-To: <20170318153136.5f460040@free-electrons.com>
References: <1489664602-32596-1-git-send-email-abhimanyu.vishwakarma@imgtec.com>
 <1489664602-32596-2-git-send-email-abhimanyu.vishwakarma@imgtec.com>
 <b7ac0faf-3b85-2439-1386-e181257c2d29@mind.be>
 <20170318142331.061e2cda@free-electrons.com>
 <78a51dc2-e493-4b74-bd65-0e3f579ebba7@mind.be>
 <20170318153136.5f460040@free-electrons.com>
Message-ID: <77aa6567-43d7-6e2b-9b11-6a5ce2459863@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Saturday 18 March 2017 08:01 PM, Thomas Petazzoni wrote:
> Hello,
>
> On Sat, 18 Mar 2017 14:59:35 +0100, Arnout Vandecappelle wrote:
>>> What about instead using BR2_LINUX_KERNEL_VMLINUX_BIN, to get
>>> vmlinux.bin copied to output/images, and then compress it in the
>>> post-build script ?
>>   I considered that in one of my reviews, but vmlinux.bin doesn't contain the
>> load and start address. The post-build script would have to retrieve those in
>> some other way.
> vmlinux.bin.gz also does not contain the load/start address. Only
> uImage does, and they get them from uImage.
>
> So one possibility would be to make the Linux package behave like the
> U-Boot package: instead of having a choice...endchoice for the image
> format to install, you simply have a list of options so that you can
> select several of them.
>
>>   However, Abhimanyu reported that there is upstream support for generating a
>> fitImage in the kernel build itself. That's of course preferable...
> Yes, it would be much better obviously.
>
> Otherwise, hardcoding the load/start address in the .its.in file is
> also good enough, this file is anyway board-specific.
Damn, i didnt see this mail before replying to previous version, I will 
prepare the patch with this.
> Best regards,
>
> Thomas
Regards
Abhimanyu
