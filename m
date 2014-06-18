From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 18 Jun 2014 23:01:30 +0200
Subject: [Buildroot] How to handle custom kernel config
In-Reply-To: <CAGm1_kvcZDk_ke4OVgx1dO6_qWOhff7LupEKj42kgiq0Fyog6w@mail.gmail.com>
References: <53A04483.9030601@gmail.com>
 <CAGm1_ktpFoYZSu2Yjd_hNpiHbySLv8FPrHtJ91DQv4iNmthYHg@mail.gmail.com>
 <53A045EC.4030107@gmail.com>
 <CAGm1_kvcZDk_ke4OVgx1dO6_qWOhff7LupEKj42kgiq0Fyog6w@mail.gmail.com>
Message-ID: <53A1FE2A.5060908@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/06/14 15:58, Yegor Yefremov wrote:
> On Tue, Jun 17, 2014 at 3:43 PM, Marco Trapanese
> <marcotrapanese@gmail.com> wrote:
>> Il 17/06/2014 15:40, Yegor Yefremov ha scritto:
>>
>>> As soon as you're happy with your new .config in the build directory,
>>> you just manually overwrite your board/sub_directory/linux.config Yegor
>>
>>
>> Ok, so I should do the following:
>>
>> 1) copy the custom file to .config
> 
> This step will be made by Buildroot, when you first compile the kernel
> or perhaps if you invoke make linux-reconfigure. Your custom .config
> will be copied to output/build/linux-xxx
> 
>> 2) edit that with make linux-menuconfig
>> 3) copy back the .config to custom file

 This step can be done with the command

make linux-update-defconfig


 Regards,
 Arnout

> 
> Other step are correct.
> 
> Yegor
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
