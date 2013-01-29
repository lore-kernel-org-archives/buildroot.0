From: Stephan Hoffmann <sho@relinux.de>
Date: Tue, 29 Jan 2013 08:57:45 +0100
Subject: [Buildroot] Linux and busybox-configfiles
In-Reply-To: <ke74ce$76p$1@ger.gmane.org>
References: <510550FA.10502@relinux.de> <5105ABE8.70409@mind.be>
 <ke74ce$76p$1@ger.gmane.org>
Message-ID: <510780F9.9050207@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 29.01.2013 01:16, schrieb Shawn J. Goff:
>
>
> On 01/27/2013 05:36 PM, Arnout Vandecappelle wrote:
>> On 27/01/13 17:08, Stephan Hoffmann wrote:
>>> Hello all,
>>>
>>> buildroot provides direct calls to the configuration menus for busybox
>>> and linux:
>>>
>>> make linux-menuconfig
>>> make busybox-menuconfig
>>>
>>> Additionally, there is a linux-savedefconfig make target.
>>>
>>> All these save their output in the build directory, so that all changes
>>> get lost when "make clean" is called. Thus I don't think that I am the
>>> only one who has been surprised to notice that "make busybox-menuconfig
>>> && make clean && make" does not have any effect on busybox's
>>> configuration.
>>
>>   This is a bit a philosophical discussion: should the configuration
>> files of linux, busybox, etc. be considered part of the buildroot
>> configuration or not? In the former case, they should survive a 'make
>> clean', in the latter case they should be removed by 'make clean'.
>>
>>   I tend to agree that the package configs should be considered part of
>> the buildroot config. However, if your buildroot config specifies some
>> BR2_PACKAGE_BUSYBOX_CONFIG, then I would expect that after 'make clean',
>> that is the config that will be used. More generically, I expect I
>> can do:
>>
>>   make foo_defconfig
>>   Do all kinds of weird stuff that completely messes things up
>>   make clean
>>   make
>>
>> and to be back in the same state as 'make foo_defconfig; make'.
>>
>>
>
> I'd like the busybox-*config and linux-*config targets should save the
> resulting config in BR2_PACKAGE_BUSYBOX_CONFIG and
> BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE. I keep these two locations under
> source control in board/my_company/board_name/, so when I completely
> mess up the config, it's just a git checkout path/to/config, and if I
> want to keep the changes, I just add and commit the file. It also lets
> me clearly see something has changed when I run git status.
Do you know about busybox-update-config and linux-update-config?
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
