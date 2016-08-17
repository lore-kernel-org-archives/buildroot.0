From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Aug 2016 19:37:21 +0200
Subject: [Buildroot] BuildRoot cannot build powerpc64
In-Reply-To: <F9C551623D2CBB4C9488801D14F864C6EE8B17ED@ex-mb1.corp.adtran.com>
References: <F9C551623D2CBB4C9488801D14F864C6EE8B1000@ex-mb1.corp.adtran.com>
 <57b3aeb6944cf_7ec33f915a8b1b9c298e6@ultri3.mail>
 <F9C551623D2CBB4C9488801D14F864C6EE8B17ED@ex-mb1.corp.adtran.com>
Message-ID: <20160817193721.0cc1466d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 17 Aug 2016 15:33:30 +0000, ANDY KENNEDY wrote:

> Our RFS we like to have static, so that we can throw libs into
> the system @ runtime without breaking our stable RFS.
> 
> Based upon your e-mail, I dropped into the uclibc dependencies
> || BR2_powerpc64, which made it selectable.  Problem is that
> it wouldn?t build.  My guess is that the T-series parts haven't
> been added to uClibC-ng yet, which is why it isn't selectable.
> 
> Thus, the answer to my question is "it is by design".

The only C library that supports PowerPC64 today is glibc.

But glibc does not support static linking.

Hence there is no solution to do a statically linked rootfs on
PowerPC64 today.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
