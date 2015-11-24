From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 Nov 2015 14:41:26 +0100
Subject: [Buildroot] [PATCH] gmp: disable for MIPS R6
In-Reply-To: <56545FE6.7060405@zacarias.com.ar>
References: <1448368861-24776-1-git-send-email-Vincent.Riera@imgtec.com>
 <56545FE6.7060405@zacarias.com.ar>
Message-ID: <20151124144126.4d6ad588@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, Vicente,

On Tue, 24 Nov 2015 10:02:30 -0300, Gustavo Zacarias wrote:
> On 24/11/15 09:41, Vicente Olivert Riera wrote:
> 
> > gmplib is not yet supported for MIPS R6, so disable it and also
> > propagate that dependency recursively to all packages who select it.
> >
> > Fixes:
> >
> >    http://autobuild.buildroot.net/results/d06/d0686b3e7b8884f93034d4ea4b79fa8590ffa221/
> 
> Hi.
> How about in package/gmp.mk:
> 
> ifeq ($(BR2_mips_32r6)$(BR2_mips_64r6),y)
> GMP_CONF_OPTS += --disable-assembly
> endif

If this works, sounds a *lot* better than duplicating the !mipsr6
dependency to zillions of packages.

Vicente ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
