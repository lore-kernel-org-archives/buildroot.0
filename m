From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 01 Jun 2013 20:14:11 +0200
Subject: [Buildroot] [PATCH 18/20] gpu-viv-bin-mx6q: new package
In-Reply-To: <20130529154831.4ed34d89@skate>
References: <1369606110-8088-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1369606110-8088-19-git-send-email-thomas.petazzoni@free-electrons.com>
 <878v2x7vn1.fsf@dell.be.48ers.dk> <20130529154831.4ed34d89@skate>
Message-ID: <51AA39F3.90506@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 29/05/13 15:48, Thomas Petazzoni wrote:
>> >What kind of kernel dependencies does this package have?

> As far as I can see, it doesn't have any build-time dependency. It's
> just a bunch of pre-built shared libraries and header files that get
> copied around. At runtime, I believe a specific kernel driver is
> needed.

  It's hard to know for sure. Like most SoC vendors, Freescale assume 
you'll just use _their_ kernel, _their_ toolchain, _their_ binary 
libraries and even _their_ LTIB (though it seems Freescale is becoming 
more open about this).

  Now, regarding the kernel it's pretty easy: upstream support for i.MX6 
is limited to UART, SD and USB so you're bound to the Freescale kernel if 
you want to use any graphics at all. And the Freescale kernel contains 
the galcore module needed for accessing the vivante GPU.

  There is also firmware for the VPU in the imx-firmware package, but I 
think that is only needed for the H.264 etc. codecs.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
