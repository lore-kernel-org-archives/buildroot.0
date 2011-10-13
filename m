From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 14 Oct 2011 00:07:05 +0200
Subject: [Buildroot] [PATCH v2] New package: ImLib2
In-Reply-To: <4E955ECB.7000209@visionsystems.de>
References: <1318328770-9496-1-git-send-email-yegorslists@googlemail.com>
 <201110121125.08933.arnout@mind.be> <4E955ECB.7000209@visionsystems.de>
Message-ID: <201110140007.05681.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Wednesday 12 October 2011 11:32:59, Yegor Yefremov wrote:
> >>> Shouldn't this depend on BR2_PACKAGE_XORG7 ?
> >>
> >> Thanks for reviewing. I checked these two packages_ libx11 and libxext
> >> and they seem to selected by xorg anyway, so I replaced them by
> >> dependency on  BR2_PACKAGE_XORG7.
> > 
> >  libXext indeed selects libX11, but I don't see how libXext would be automatically selected...
> 
> What about  BR2_PACKAGE_XSERVER_XORG_SERVER [=y] && BR2_PACKAGE_XORG7 [=y] && !BR2_avr32 [=n]?

 Yes, but you can usefully build ImLib2 without an Xserver.  BR2_PACKAGE_XSERVER_XORG_SERVER does not get selected by BR2_PACKAGE_XORG7.

 Regards,
 Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111014/bb50d761/attachment.html>
