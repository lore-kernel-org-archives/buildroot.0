From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 30 Jan 2013 10:54:36 +0100
Subject: [Buildroot] Linux and busybox-configfiles
In-Reply-To: <ce1e1f6b-7d56-461e-87a7-d18a64240c35@zimbra2.corp.accelance.fr>
References: <ce1e1f6b-7d56-461e-87a7-d18a64240c35@zimbra2.corp.accelance.fr>
Message-ID: <5108EDDC.5050808@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 30/01/13 08:50, Jeremy Rosen wrote:
>>    If this does go through, I would  like to have some way to throw
>>    away
>> the customized config and revert to the configured config.  Perhaps a
>> 'realclean' target?
>>
>>
>
> I am not sure what you mean by "the configured" vs "the customized"
>
> I guess that the customized is the one from make linux-menuconfig and the configured is the one from make foo_defconfig

  Not from 'make foo_defconfig', but from 'make menuconfig'.

  If in the buildroot config I select 'Use omap2plus defconfig' for the 
kernel, then I expect it to use the omap2plus configuration. Similarly, 
if I set the custom linux config to /some/path/linux.config, then I 
expect that that configuration will be used.

  So 'configured' is what you see in 'make menuconfig', 'customized' is 
what you see in 'make linux-menuconfig'.


> hmm, I see your use case.... I would tend to argue that the kernel is no exception to the way buildroot works
>
> * make clean removes all build-generated but doesn't touch user-defined configurations (BR configuration, kernel configuration)

  But the problem is that the buildroot configuration conflicts with the 
kernel configuration.


  Regards,
  Arnout

> * to revert to BR's suggested configuration, use make xxx_defconfig, and that would override both the kernel and BR's configuration.
>
> I don't really see a use-case for "revert my changes to the kernel, but not the rest of buildroot" though providing targets like make linux-xxx_defconfig for all kernel defined defconfig
> and/or a make linux-buildrootconfig to revert to the buildroot-suggested config might make sense...
>
>
> Best
> J?r?my
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
