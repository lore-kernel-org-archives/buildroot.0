From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 16 Sep 2013 21:53:48 +0200
Subject: [Buildroot] Is GPLv2 the right license for Buildroot?
In-Reply-To: <20130916170815.GB3293@free.fr>
References: <20130911172709.GB3410@free.fr>
 <CAAXf6LVD590fVudge3Fk+2B8pSzvUEV2GQLTcbz=VpOB2HCmtQ@mail.gmail.com>
 <20130912202157.536e5904@skate>
 <F9C551623D2CBB4C9488801D14F864C639AC8DAF@ex-mb1.corp.adtran.com>
 <20130912203359.7e650ebe@skate> <52323A54.7020808@mind.be>
 <20130912221256.GE3362@free.fr> <523388B6.7090305@mind.be>
 <20130914221613.GA3444@free.fr> <20130916182101.3844a686@skate>
 <20130916170815.GB3293@free.fr>
Message-ID: <523761CC.3050803@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16/09/13 19:08, Yann E. MORIN wrote:
> Thomas, All,
>
> On 2013-09-16 18:21 +0200, Thomas Petazzoni spake thusly:
>> >On Sun, 15 Sep 2013 00:16:13 +0200, Yann E. MORIN wrote:
>> >
>>> > >Since Buildroot's license is the GPLv2, BR2_EXTERNAL is covered by the
>>> > >GPLv2.
>> >
>> >Probably going to make waves,
> Probably, yes.;-)
>
>> >but I'm wondering if the GPLv2 is the
>> >right license for Buildroot. I believe it is not very easy to
>> >understand how the terms of the GPL apply to something such as a build
>> >system, and I am not sure that the GPL copyleft requirements are really
>> >benefiting to Buildroot in any way. I am pretty sure that the vast
>> >majority of companies using Buildroot are not really realizing it's
>> >licensed under the GPL and therefore are not complying with the
>> >Buildroot license terms (while they probably do realize that the
>> >kernel, U-Boot, etc. are under the GPL and comply with their terms).
> On the other hand, the GPLv2 only applies at the time of distribution.
> So long as the Buildroot tre is not distributed, there is no reason to
> fear anything.
>
> Now, let's try to make things clear:
>
>    - on an embedded system, the probability that there is a GPL program
>      is rather high (eg. busybox, the Linux kernel);
>
>    - lets assume Buildroot is used to build those programs;
>
>    - the GPL (as applied to_those_  programs, not Buildroot) mandates
>      that the script to control compilation and installation of those
>      programs be made available (section of GPLv2);
>
>    - so the easiest way to comply with those programs' GPL is to
>      distribute the Buildroot tree that was used to build the target
>      filesystem, since it does contain all required recipes (aka the
>      scripts of section 3 of the GPLv2)
>
>    - Buildroot is itself GPLv2, so by distributing the Buildroot tree, a
>      company has to release it under GPLv2.

  I think this states the same as docs/manual/legal-notice.txt already 
does, though a bit easier to follow. That paragraph in the manual also 
clearly states that this is the interpretation of the buildroot developers.

  I think that for the users, things are still simple: just make 
buildroot available. It also takes away a large part of the burden of 
GPL-compliance, because buildroot takes care of downloading the source so 
you can consider that job done (at least according to the spirit of the 
license, and explicitly in GPLv3).

  As to the .config: would it really be an issue for your company that 
the end user can see that there is something called BR2_THE_APP installed 
on the system? Looking back at some buildroot projects I've done, the 
proprietary packages had names like "pir", "h264", "upgrade", "rt_app", 
"system". Like, that's really leaking information...

  And for the really paranoid companies that lock down their filesystem 
sufficiently that users can't read (and thereby discover those top-secret 
application names), I think they will can afford the 15-minute investment 
to grep away the proprietary packages from the .config.


  However, coming back to Thomas's idea of changing the license: the 
buildroot license is not really the issue here. Even if buildroot were 
MIT-licensed, the GPL of the target programs may still require you to 
provide the buildroot source. Since buildroot itself is source-only, 
there is really no big difference between GPL or any other free software 
license.


  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
