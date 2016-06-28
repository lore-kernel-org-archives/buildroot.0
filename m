From: aduskett at gmail.com <aduskett@gmail.com>
Date: Tue, 28 Jun 2016 01:36:30 +0000 (UTC)
Subject: [Buildroot] [v1 1/1] uboot: Add local directory option to
 menuconfig
In-Reply-To: <3dade5a8-fefb-0dcc-e310-f8a67d7bd1c4@mind.be>
References: <1466994356-15411-1-git-send-email-Aduskett@gmail.com>
 <20160627205746.GC3714@free.fr>
 <045f11b5-1c4c-5082-d138-406559792a72@mind.be>
 <20160627223936.GD3714@free.fr>
 <3dade5a8-fefb-0dcc-e310-f8a67d7bd1c4@mind.be>
Message-ID: <7268E133691F8A88.982c4100-98b1-4f18-80d7-c39354d2a69e@mail.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Interesting, as I use the feature quite a bit!? I have my linux source as a submodule of my project. I guess I could just point buildroot to the git project of the kernel source as well and achieve the same results. 





On Mon, Jun 27, 2016 at 6:50 PM -0400, "Arnout Vandecappelle" <arnout@mind.be> wrote:












On 28-06-16 00:39, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2016-06-28 00:27 +0200, Arnout Vandecappelle spake thusly:
>> On 27-06-16 22:57, Yann E. MORIN wrote:
>> [snip]
>>> And looking at the commit that introduced it for linux, it is exactly
>>> the case that would have been covered by an override-srcdir:
>>>
>>>     commit 73da2ff6f718f2889e3c5024d899f8d58f502863
>>>     Author: Rafal Fabich 
>>>     Date:   Sat Feb 23 19:03:30 2013 +0100
>>>
>>>         Added local directory as source of kernel code
>>>     
>>>         Add the option to use a local directory as the source for
>>>         building the Linux kernel, which can be useful during
>>>         kernel development.
>>>     
>>>         Signed-off-by: Rafal Fabich 
>>>         Acked-by: Arnout Vandecappelle (Essensium/Mind) 
>>>         Tested-by: Arnout Vandecappelle (Essensium/Mind) 
>>>         Signed-off-by: Peter Korsgaard 
>>>
>>> Peter, any reason that you applied this patch at the time?
>>> Arnout, anything you remember for giving your ACK?
>>
>>  I think at the time I considered using _OVERRIDE_SRCDIR for something like this
>> too clunky. However, now I'm more convinced that every realistic project should
>> have an automatic _OVERRIDE_SRCDIR for everything in $(BR2_EXTERNAL)/src. So
>> then indeed this option is not so relevant anymore.
> 
> Well, any two projects would have different workflows, so suggesting a
> "realistic project" uses an automated override-srcdir is just pushing
> the limits too much, IMHO.

 Of course. But it's true that the same workflows are covered by
_OVERRIDE_SRCDIR and _CUSTOM_LOCAL.

> 
> Besides, my opinion is that having the sources for packages in the
> br2-external tree is bad, and that each package should have its own
> git/hg/svn/bzr tree. But that varies between projects! ;-)

 They are git submodules, of course.

 In my experience referring to tags or shas from a defconfig is really clunky,
it makes updating extremely inflexible. I've implemented scripts to automate the
tagging for some projects; in the end they didn't use it, because the submodule
tag already covers it.


> 
>>  It's still a bit clunky, though, that your (def)config has to specify
>> _something_ for the kernel version, but that it will never be used in practice.
> 
> Well, that would be the same for any package for which we have a version
> choice when an override-srcdir is in use for that package...

 ... which is why someone had the idea of adding this option for U-Boot :-)


 Regards,
 Arnout

> 
> And anyway, any override-srcdir should not be versioned I think. It
> should be purely for local development.
> 
>>  I propose to reject this patch but keep the existing LINUX_CUSTOM_LOCAL around
>> for a bit still.
> 
> Well, I saw your mail after I sent the patch, so... ;-)
> 
> Regards,
> Yann E. MORIN.
> 
>>  Regards,
>>  Arnout
>>
>>>
>>> So, I would think that:
>>>   1- we don't want this for U-Boot;
>>>   2- we should drop it for Linux.
>>>
>>> Peter, Thomas, Arnout: what do you think?
>> [snip]
>> -- 
>> Arnout Vandecappelle                          arnout at mind be
>> Senior Embedded Software Architect            +32-16-286500
>> Essensium/Mind                                http://www.mind.be
>> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
>> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
>> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF





-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160628/30e2a8fa/attachment.html>
