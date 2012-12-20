From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 20 Dec 2012 01:20:44 +0100
Subject: [Buildroot] Any way to override .config settings?
In-Reply-To: <CAE21AQrTh=bTke7awGUDfp+SfJJx5K1L6HVVhMs5F4eXAaZaTA@mail.gmail.com>
References: <CAE21AQpSdqfXmX1Kv97LHQP_kqEqC9FH+rwU70ZZAPS-Xt4_DA@mail.gmail.com>
 <50D255F0.8030107@mind.be>
 <CAE21AQrTh=bTke7awGUDfp+SfJJx5K1L6HVVhMs5F4eXAaZaTA@mail.gmail.com>
Message-ID: <50D259DC.7090509@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20/12/12 01:13, Charles Manning wrote:
> On Thu, Dec 20, 2012 at 1:04 PM, Arnout Vandecappelle<arnout@mind.be>  wrote:
>> On 19/12/12 23:20, Charles Manning wrote:
>>>
>>> I need to be able to build a system from an svn repository using a
>>> bunch of different revisions for different elements. For example, I
>>> might want to use the kernel at r 1234, u-boot at r 4567 and the
>>> rootfs+apps at r 3344.
>>
>>
>>   Uh? Sounds like a horrible idea to me.
>
> Why does it sound like a terrible idea?

  I thought you meant the buildroot directories would be at different 
versions. But you just want to override the 
BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION, that's OK of course.

[snip]
>>> 1) Is there a built in mechanism in buildroot to include extra symbols
>>> and override those in .config?
>>
>>
>>   Yes, the package override file: BR2_PACKAGE_OVERRIDE_FILE, defaults to
>> $(TOPDIR)/local.mk. I use this to include a bunch of project-specific .mk
>> files that add packages without requiring a Config.in.
>
> In a separate thread to this, I submitted a patch that follows the
> package overriding idea to override the config

  Since it does exactly the same as BR2_PACKAGE_OVERRIDE_FILE, I don't 
see the point... Unless you want to start overriding toolchain configs.

  Actually, I don't see much point to override the .config - why not just 
save a different .config?


  Regards,
  Arnout


-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
