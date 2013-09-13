From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 13 Sep 2013 22:56:59 +0200
Subject: [Buildroot] [PATCH 2/3] Add support for BR2_EXTERNAL
In-Reply-To: <OFC3B467E6.5C4667CC-ON86257BE4.0078D9C7-86257BE4.0079F00F@rockwellcollins.com>
References: <1378646129-4167-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1378646129-4167-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <OF916AAFB6.8E78891C-ON86257BE3.000A49F0-86257BE3.000B5AF0@rockwellcollins.com>
 <52322C8E.7010501@mind.be>
 <OFD093CE04.A9291FB9-ON86257BE4.007504CF-86257BE4.00762929@rockwellcollins.com>
 <5232351D.3030703@mind.be>
 <OFCA626374.83240A5A-ON86257BE4.0077C33E-86257BE4.00781ADF@rockwellcollins.com>
 <523238B0.3050500@mind.be>
 <OFC3B467E6.5C4667CC-ON86257BE4.0078D9C7-86257BE4.0079F00F@rockwellcollins.com>
Message-ID: <52337C1B.3090108@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13/09/13 00:11, Ryan Barnett wrote:
> Arnout Vandecappelle <arnout@mind.be> wrote on 09/12/2013 04:57:04 PM:
>
>  > On 12/09/13 23:51, Ryan Barnett wrote:
>  > >  > > In order to utilize the BR2_EXTERNAL feature I must have
> BR2_EXTERNAL
>  > >  > > either exported into my environment or be called as
>  > >  >
>  > >  >   The Makefile exports it in the environment of the Kconfig
> targets. So
>  > >  > once it is in the .config, it will stay there. Try it and you'll
> see :-)
>  > >
>  > > I have looked as I'm experiment with this and it definitely isn't
> there :)
>  > > Also according to the documentation you need to define it every time :)
>  > >
>  >
>  >   Ah, yes indeed, sorry about that - I was trying to be too smart.
>
> Happens to the best of us.
>
>  >   To save it in the .config, it needs a prompt, and to be able to take it
>  > from the environment it needs a helper variable. Like BR2_DEFCONFIG.
>
> I like to view BR2_EXTERNAL as something that is similar to "O=" which means
> that I have the ability to change it at a moments notice. However, like it
> is done in mkmakefile when doing the following from within buildroot
> toplevel
> source directory:
>
> make O=/path/to/build defconfig
>
> O= is stored in the generated makefile (as you know). However, it gets very
> annoying to type BR2_EXTERNAL=/path/to/external and I don't always want to
> export it as shell environment variable. Thus, adding that line to
> mkmakefile is handy since usually when you specify O= you are doing a
> specific build which BR2_EXTERNAL would definitely be a part of.

  My point is: it should (and can) be made part of the .config. It really 
has to be part of the .config, because some options in the .config will 
refer to the packages that are defined in the external directory.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
