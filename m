From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 18 Feb 2016 00:48:20 +0100
Subject: [Buildroot] [PATCH v2 1/2] libimxvpuapi: add new package
In-Reply-To: <CAAMH-yvyOhp+5jxVDo=ZaAooX4G4GTrj5ZJtO2Djm-8o4khgbg@mail.gmail.com>
References: <1454363759-23349-1-git-send-email-gary.bisson@boundarydevices.com>
 <1454363759-23349-2-git-send-email-gary.bisson@boundarydevices.com>
 <20160216215313.15f228fe@gmx.net>
 <CAAMH-yuzsvt-6U-JX7RhNoEcWoJA4ahRm4U27LvWLwXyg4UtTg@mail.gmail.com>
 <trinity-f34aaf6c-100d-4336-9dbf-030d951133dd-1455701165352@3capp-gmx-bs46>
 <CAAMH-ysOoy8FNMZAOA0_m_vOnduBTYuQLcOe-2eVt+8t4wZvaw@mail.gmail.com>
 <trinity-9474c08f-9274-4fd6-961b-8257e3d58bd3-1455712203984@3capp-gmx-bs71>
 <CAAMH-yvyOhp+5jxVDo=ZaAooX4G4GTrj5ZJtO2Djm-8o4khgbg@mail.gmail.com>
Message-ID: <56C506C4.6020103@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17-02-16 13:42, Gary Bisson wrote:
> Hi Peter,
> 
> On Wed, Feb 17, 2016 at 1:30 PM, Peter Seiderer <ps.report@gmx.net> wrote:
>> Hello Gary,
>>
>>> <snip>
>>>> No, working with boundarydevices linux-imx6-f4c8395 and original boundary config
>>>> and there is a '/dev/galcore' entry on the target...
>>>
>>> Yes but that is the problem. Please try again with
>>> BR2_PACKAGE_KERNEL_MODULE_IMX_GPU_VIV.
>>>
>>> As you know, 3D graphics libraries match a specific kernel driver.
>>> Since it was an issue for many people, Vivante started to provide a
>>> kernel module so you can easily have the latest driver on an older
>>> kernel.
>>>
>>> Since I've updated the graphics to the latest (5.0.11 p7.1), the
>>> driver inside the 3.14.28 kernel is outdated so you need to use the
>>> Vivante kernel module. I didn't for the selection of the kernel module
>>> when the libraries are selected since some kernels (3.14.52) have the
>>> correct driver built-in.
>>>
>>
>> Got it now, the missing part was:
>>
>>  BR2_PACKAGE_KERNEL_MODULE_IMX_GPU_VIV=y
>>
>> Qt5 eglfs and gstreamer imxeglvivsink are working now...
> 
> Good to hear!
> 
>>> Sorry for the confusion but know that if you want to make sure the
>>> driver matches the user-space blobs, always select the Vivante kernel
>>> module as I'll make to always update both at the same time.
>>>
>>
>> Maybe a little hint in board/boundarydevices/nitrogen6x/readme.txt would be useful?
> 
> Well it is not Nitrogen6x-specific, it applies to all i.MX6 platforms
> so I'm not sure where would be the best place to give this info apart
> from the help text. Thomas, any idea on this?
> 
> Yocto is forcing the use of the Vivante kernel module, maybe we should
> do the same but I'm not fond of this approach.

 We can't force select because BR2_PACKAGE_KERNEL_MODULE_IMX_GPU_VIV depends on
the kernel to be built. But we could do

	select BR2_PACKAGE_KERNEL_MODULE_IMX_GPU_VIV if BR2_LINUX_KERNEL

 I don't think this would be such a bad idea. Added size isn't really a big
deal. Of course, the user still has to load the module...

 Regards,
 Arnout

> 
>> Many thanks for your support...
> 
> No problem. Thanks for your valuable feedback!
> 
> Regards,
> Gary
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
