From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 10 Jul 2011 23:27:03 +0200
Subject: [Buildroot] [PATCH 22/28] boot: rename BR2_TARGET_* to
	BR2_BOOT_*
In-Reply-To: <877h7pyj7o.fsf@macbook.be.48ers.dk>
References: <cover.1309895466.git.thomas.petazzoni@free-electrons.com>
 <cover.1309895466.git.thomas.petazzoni@free-electrons.com>
 <66caabc54512ea1f23a7361744fd5e9c74d8a192.1309895466.git.thomas.petazzoni@free-electrons.com>
 <877h7pyj7o.fsf@macbook.be.48ers.dk>
Message-ID: <20110710232703.1a11140e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sun, 10 Jul 2011 22:27:39 +0200,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

> Is this purely cosmetical or is there a deeper reason for this? This
> presumably breaks all existing configs where bootloaders are used.

It is a preparation for patch 24/28, which improves the package
infrastructure so that the bootloader packages do not have to do
TARGETS+=u-boot manually, but this is instead done automatically by the
package infrastructure, as is done for conventional userspace packages.

In order to do that, I needed to differentiate the package type from
the option name. So, we had BR2_PACKAGE for userspace packages, and we
now have BR2_BOOT for bootloader packages. See how patch 24/28 is
implemented.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
