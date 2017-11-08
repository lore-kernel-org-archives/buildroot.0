From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Wed, 8 Nov 2017 13:35:48 +0100
Subject: [Buildroot] [PATCH 1/2] qt5 add qmake.conf.in for eglfs
In-Reply-To: <20171108132219.75d007f3@windsurf>
References: <1510140635-80618-1-git-send-email-giulio.benetti@micronovasrl.com>
 <20171108132219.75d007f3@windsurf>
Message-ID: <A426A44B-CF1F-48F2-983D-762586968C8B@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thank you Thomas,

I needed these instructions to send patches.
Do you want me to re-submit patchset as you described under?

Thank you very much again for teaching me.

Inviato da iPhone

> Il giorno 08 nov 2017, alle ore 13:22, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ha scritto:
> 
> Hello,
> 
> Thanks for this new iteration. Sorry, but I have a lot of
> pedantic/presentation comments, see below :)
> 
>> On Wed,  8 Nov 2017 12:30:34 +0100, Giulio Benetti wrote:
>> EGLFS_DEVICE_INTEGRATION = eglfs_* doesn't work correctly with previous patch
>> EGLFS_DEVICE_INTEGRATION = eglfs_viv/eglfs_* must be written before include(../common/linux_device_post.conf)
>> 
>> On first patch, I've moved qmake.conf to qmake.conf.in suggested by Arnout,
>> tagging EGLFS_DEVICE_INTEGRATION = @EGLFS_DEVICE at .
>> Then with sed I substitute @EGLFS_DEVICE@ if any eglfs_* are possible,
>> otherwise I delete that line and the subsequent too.
>> 
>> On second patch, I add support for sunxi-mali and upcoming sunxi-mali-mainline.
>> In this way they behave the same way of vivante.
>> 
>> Hope I've done everything correctly.
>> I've had to used sed without $(SED) because of its argument,
>> to redirect to qmake.conf instead of changing qmake.conf.in.
>> 
>> After copied to qt5base build directory,
>> I remove qmake.conf to avoid problem with git.
>> 
>> Thanks in advance for any response.
>> 
>> Kind regard to everyone
> 
> A commit log is not an e-mail, it is a text that describes the commit.
> So:
> 
> - It should not be written at the first person
> 
> - It should not contain things like "Thanks in advance", "Kind
>   regards", etc.
> 
> - Also, things like "After copied to qt5base build directory, I remove
>   qmake.conf to avoid problem with git" sound weird.
> 
> - Don't talk about the second patch in the commit log of the first
>   patch!
> 
> Also, since this is a new version of patches you have already sent, it
> should be sent as PATCHv2, and have a changelog that details the
> changes since the first iteration.
> 
> Best regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
