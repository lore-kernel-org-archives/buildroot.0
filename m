From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 17 Dec 2013 22:06:14 +0100
Subject: [Buildroot] build uboot for AT91SAM9G20
In-Reply-To: <3487466.tnqfWxcGWT@regdesktophome>
References: <3487466.tnqfWxcGWT@regdesktophome>
Message-ID: <52B0BCC6.7070508@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16/12/13 02:52, Ron Eggler wrote:
> Hi,
>
> I'm relatively new to buildroot, thus please excuse my beginner question.
>
> I have configured buildroot to build an image for my AT91SAM9G20 system.
> I believe it has built just fine but I'm running into an issue when it
> comes to uboot, I'm getting this:
>
> ...
>
> make[1]: Entering directory
> `/etc/E10-buildroot/br2013.11/output/build/uboot-2013.10'
>
> make: *** No rule to make target `e10_config'. Stop.

  You set BR2_TARGET_UBOOT_BOARDNAME to "e10", but there is no board with 
that name defined in U-Boot's boards.cfg. Choose a board that appears in 
boards.cfg, e.g. at91sam9g20ek_nandflash.


  Regards,
  Arnout

>
> make[1]: *** [e10_config] Error 1
>
> make[1]: Leaving directory
> `/etc/E10-buildroot/br2013.11/output/build/uboot-2013.10'
>
> make: ***
> [/etc/E10-buildroot/br2013.11/output/build/uboot-2013.10/.stamp_configured]
> Error 2
>
> #
>
> how can I get buildroot to properly compile uboot for my AT91SAM9G20?
>
> Thanks,
>
> Ron
>
> --
>
> ron eggler | semios | senior software engineer
>
> 320 - 887 Great Northern Way | Vancouver, BC | V5T 4T5
>
> T | 604 229 2044 ext 105 <tel:604%20229%202044%20ext%20105>
>
> C | 778 230 9442 <tel:778%20230%209442>
>
> E |reggler at semios.com <mailto:reggler@semios.com>
>
> smart farming <http://www.semios.com>
>
> twitter <https://twitter.com/semios>linkedin
> <http://www.linkedin.com/company/semiosbio-technologies-inc?goback=%2Enmp_*1_*1_*1_*1_*1_*1_*1_*1_*1_*1&trk=company_logo>
>
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
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
