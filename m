From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 19 Jul 2011 12:22:19 +0200
Subject: [Buildroot] devtmpfs and initramfs
Message-ID: <201107191222.19313.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hoi all,

 I'm using an initramfs as the root filesystem image, and devtmpfs for the 
devices.  However, it turns out that devtmpfs doesn't get mounted 
automatically if the root filesystem is an initramfs (at least in 2.6.35).

 I ended up adding the following to my inittab:

null::sysinit:/bin/mount -t devtmpfs devtmpfs /dev


 Does anyone know a more elegant solution?

 Regards,
 Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
