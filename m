From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 29 Aug 2012 02:35:43 +0200
Subject: [Buildroot] 2012.08-rc3 skipping python modules during build
In-Reply-To: <20120829011800.01eb081e@skate>
References: <CALoHCLOK1-F5uxiWc95Mr6SJwCc2sqxicBi5V93-HtuBOhY0kA@mail.gmail.com>
 <20120829011800.01eb081e@skate>
Message-ID: <503D63DF.8060803@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/29/12 01:18, Thomas Petazzoni wrote:
> Le Tue, 28 Aug 2012 08:43:38 -0700,
> Eric Seifert<eric.seifert@cyaninc.com>  a ?crit :
>
>> Hello, I have been using the stable 2012.05 build without issue and wanted
>> to try the latest rc3. I have a few extra python modules I have added to
>> the external python modules section. It seems in the latest rc3 is not
>> building them or even downloading the packages even though they are
>> selected in the menuconfig, they are just ignored. It works in the stable
>> 2012.05 build. When I select one of the existing external modules such as
>> pthon-serial, it does get built.
>
> You aren't giving enough details to provide a final answer, but my
> guess is that you should replace:
>
> $(eval $(call GENTARGETS))
>
> by
>
> $(eval $(generic-package))
>
> at the end of your Python external modules .mk files.

  Maybe we should temporarily add something like

GENTARGETS = $$(error The GENTARGETS macro no longer exists; use $$$$(eval $$$$(generic-package)) or $$$$(eval 
$$$$(generic-host-package)))

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
