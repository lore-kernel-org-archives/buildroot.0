From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 29 Aug 2012 01:00:22 +0200
Subject: [Buildroot] 2012.08-rc3 skipping python modules during build
In-Reply-To: <CALoHCLOK1-F5uxiWc95Mr6SJwCc2sqxicBi5V93-HtuBOhY0kA@mail.gmail.com>
References: <CALoHCLOK1-F5uxiWc95Mr6SJwCc2sqxicBi5V93-HtuBOhY0kA@mail.gmail.com>
Message-ID: <503D4D86.3040802@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/28/12 17:43, Eric Seifert wrote:
> Hello, I have been using the stable 2012.05 build without issue and wanted to try the latest rc3. I have a few extra
> python modules I have added to the external python modules section. It seems in the latest rc3 is not building them or
> even downloading the packages even though they are selected in the menuconfig, they are just ignored. It works in the
> stable 2012.05 build. When I select one of the existing external modules such as pthon-serial, it does get built.

  The package infrastructure has changed.  If you added a package ending with
$(eval $(call GENTARGETS))
it will be ignored.  Replace it with
$(eval $(call package-generic))

  (Note: this is just guesswork based on the limited information you gave.)

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
