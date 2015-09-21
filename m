From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 21 Sep 2015 21:57:32 +0200
Subject: [Buildroot] Building system for the Marvell's ARMADA A385 borad
 to resolve the VLAN trunk issue
In-Reply-To: <944894A3EB1D044A9003B2F944389BB20474C34B0F@svr-wa-exch1.atg.lc>
References: <944894A3EB1D044A9003B2F944389BB20474C34B0F@svr-wa-exch1.atg.lc>
Message-ID: <5600612C.5060300@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21-09-15 20:20, Lee, Tommy wrote:
> Hi Buildroot Busybox,
> 
>  
> 
> My host is Ubuntu-14.04 LTS. My Buildroot release is 2015.05. I made the former
> meet the latter?s requirements. My target is Marvell ARMADA A385 (ARM-Cortex-A9)
> DB-88F6820-GP.
> 
>  
> 
> While resolving my BuidrootLinux-4.0.4 VLAN trunk reachability issue, I
> discovered that Buildroot-2015.05 supports Marvell?s MV78x000 based  ARMADA XP
> Family, not the DB-88F6820-GPboard I am currently using.

 I think you're confusing buildroot with Linux. Buildroot doesn't have a
defconfig for Armada XP as far as I know.

 So you'll have to configure buildroot yourself. Start with selecting
BR2_cortex_a9 for the architecture, configure the toolchain as you like. Then
for the kernel, select an in-tree defconfig and fill in "mvebu_v7" for the
defconfig name. Also select an in-tree device tree and fill in armada-388-gp.

 Thomas Petazzoni actually worked on this board I think. Thomas, why didn't you
submit a defconfig? :-P


 Regards,
 Arnout

> 
>  
> 
> With the current board, I have three approaches to resolve the trunk problem on
> it, from top to bottom:
> 
>  
> 
> 1.      Pick ?Marvell MV78xx0?, from the Buildroot-2015.05 ?make
> linux-menuconfig? ARM system type list, for ARMADA A385 to create our .config file.
> 
> 2.      Upgrade Buildroot-2015.05 to 2015.08 to see whether the ARMADA A38x
> family is included in the ARM system type list.
> 
> 3.      Get back to buildroot-2012.11-2015_T1.0 which Marvell built their system
> successfully. Follow Marvell?s procedures to build my system.
> 
>  
> 
> I hope you would comment on the above approaches.
> 
>  
> 
> Tommy
> 
> 
> --------------------------------------------------------------------------------
> This e-mail message is for the sole use of the intended recipient(s) and may
> contain confidential and privileged information. Any unauthorized review, use,
> disclosure or distribution is prohibited. If you are not the intended recipient,
> please contact the sender by reply e-mail and destroy all copies of the original
> message. If you are the intended recipient, please be advised that the content
> of this message is subject to access, review and disclosure by the sender's
> e-mail System Administrator.
> 
> 
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
