From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 May 2016 17:20:39 +0200
Subject: [Buildroot] [PATCH v3] boot/uboot: fix missing host-openssl for
	i.MX28 target
In-Reply-To: <1463720244-2491-1-git-send-email-joerg.krause@embedded.rocks>
 (=?utf-8?Q?=22J=C3=B6rg?= Krause"'s message of "Fri, 20 May 2016 06:57:24
 +0200")
References: <1463720244-2491-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <87oa7u88qg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:

 > From: Julien Boibessot <julien.boibessot@armadeus.com>
 > Building an U-Boot image for the i.MX23 or i.MX28 target requires to run the
 > bootloaders 'mxsimage' tool on the host. As mxsimage needs unconditionally
 > OpenSSL, building U-Boot for those targets fails if it is not available on
 > the host:

 > tools/mxsimage.c:18:25: fatal error: openssl/evp.h: No such file or directory
 >   #include <openssl/evp.h>

 > Add the required dependency 'host-openssl' to all the different U-Boot image
 > types used to build a bootloader image for an i.MX23/i.MX28 target.

 > Also pass HOST_CFLAGS and HOST_LDFLAGS to the U-Boot build process so the right
 > -I/-L options will be used to find OpenSSL.

 > Ported from the Armadeus project:
 > https://sourceforge.net/p/armadeus/mailman/message/33595402/

 > Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
 > [J?rg: port to recent Buildroot version]
 > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

 > ---
 > v3:
 >  - set authorship to Julien Boibessot <julien.boibessot@armadeus.com> (Baruch)

Committed, thanks.

-- 
Bye, Peter Korsgaard
