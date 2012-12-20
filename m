From: Charles Manning <cdhmanning@gmail.com>
Date: Thu, 20 Dec 2012 13:13:38 +1300
Subject: [Buildroot] Any way to override .config settings?
In-Reply-To: <50D255F0.8030107@mind.be>
References: <CAE21AQpSdqfXmX1Kv97LHQP_kqEqC9FH+rwU70ZZAPS-Xt4_DA@mail.gmail.com>
 <50D255F0.8030107@mind.be>
Message-ID: <CAE21AQrTh=bTke7awGUDfp+SfJJx5K1L6HVVhMs5F4eXAaZaTA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Dec 20, 2012 at 1:04 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 19/12/12 23:20, Charles Manning wrote:
>>
>> I need to be able to build a system from an svn repository using a
>> bunch of different revisions for different elements. For example, I
>> might want to use the kernel at r 1234, u-boot at r 4567 and the
>> rootfs+apps at r 3344.
>
>
>  Uh? Sounds like a horrible idea to me.

Why does it sound like a terrible idea?


>
>
>
>> Now I could achieve this by going into the .config with menuconfig and
>> changing the config, but I would prefer to be able to have a file of
>> revisions to use and have buildroot pick up those revision symbols
>> instead.
>
>
>  I don't see the relation between the .config and svn revisions.

Well svn revisions are useful to me with the changes I have made to
fetch linux from a custom location. I have not submitted that patch
yet. The same would apply for a git revison.

We want to lock the versions we build into releases or use a different
release for experimental reasons.  Overriding is sometimes less
intrusive than changing the .config.


>
>
>
>> I guess there are a few ways this could be handled:
>>
>> 1) Is there a built in mechanism in buildroot to include extra symbols
>> and override those in .config?
>
>
>  Yes, the package override file: BR2_PACKAGE_OVERRIDE_FILE, defaults to
> $(TOPDIR)/local.mk. I use this to include a bunch of project-specific .mk
> files that add packages without requiring a Config.in.

In a separate thread to this, I submitted a patch that follows the
package overriding idea to override the config

>
>
>  Regards,
>  Arnout
>
>
>> 2) Run my own script that nobbles the .config using sed etc.
>>
>> Is there something built in to buildroot that will do this?
>>
>> Thanks
>>
>> Charles
>
>
>
>
> --
> Arnout Vandecappelle                               arnout at mind be
> Senior Embedded Software Architect                 +32-16-286540
> Essensium/Mind                                     http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
