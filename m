From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 21 Sep 2016 22:35:35 +0200
Subject: [Buildroot] [PATCH v2 2/2] configs: add defconfig for TS-4900
In-Reply-To: <20160918171032.2ee45abd@free-electrons.com>
References: <1474143804-19181-1-git-send-email-mathieu.audat@savoirfairelinux.com>
 <1474143804-19181-3-git-send-email-mathieu.audat@savoirfairelinux.com>
 <20160918171032.2ee45abd@free-electrons.com>
Message-ID: <017033a8-afa4-5b74-3d69-99b2bcefbbb9@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18-09-16 17:10, Thomas Petazzoni wrote:
>> +The bootloader comes pre-flashed on the board on an SPI flash. Since updating
>> > +the bootloader is risky and not trivial, it is not included in the Buildroot
>> > +defconfig. Refer to http://wiki.embeddedarm.com/wiki/TS-4900#U-Boot for details
>> > +on which U-Boot config to use and how to flash it.

> I don't really like the fact that Buildroot doesn't rebuild the entire
> system. Why is it "risky" to update the bootloader? It's an i.MX6
> processor, so you have imx-usb-loader to recover the board whatever
> happens. I believe Buildroot defconfigs should rebuild all the software
> components that runs on the board.

 As discussed in v1 of this patch, the problem is that this is a defconfig for a
module. Several hardware revisions of this module exist with different DDR
chips, which require a different U-Boot config. So we'd need several buildroot
defconfigs for the different module revisions. And it's not easy to distinguish
between them.

 In addition, recovery through USB requires a specific baseboard that sets the
boot mode pins in a way that you actually boot from USB. Not everybody necessary
has this baseboard.

 For these reasons, I agreed with Mathieu that it was OK to skip the bootloader.

 Regards,
 Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
