From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 08 Jun 2018 16:22:22 +0200
Subject: [Buildroot] [PATCHv2] linux: may fail to boot for binutils
 2.29+ even without armv7m
In-Reply-To: <20180605152911.GB2503@scaer> (Yann E. MORIN's message of "Tue, 5
 Jun 2018 17:29:11 +0200")
References: <20180601180157.759-1-yann.morin.1998@free.fr>
 <b3672758-0d2b-51cd-7eac-cc06158a995b@mind.be>
 <20180605074932.668ae4e7@windsurf> <20180605152911.GB2503@scaer>
Message-ID: <874lidcq8x.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 > But as you can see in the commit log that introduced this change, what
 > you suggest is not correct, because it is also very valid that you have
 > a arm-mode userland running on a thumb-mode kernel (as Peter initially
 > pointed out on IRC).

 > So, the kernel warning should not be about he userland mode.

 > And 'BR2_ARM_INSTRUCTIONS_THUMB || BR2_ARM_INSTRUCTIONS_THUMB2'
 > represent the userland mode, while we have, from our kconfig, no way to
 > know the kernel mode, because that is in the kernel .config file, which
 > we only get late.

 > As such, the only way is to depend on arm || armeb.

Or alternatively on

BR2_ARM_CPU_HAS_THUMB || BR2_ARM_CPU_HAS_THUMB2

But ok, either of those are true for most ARM cores.

-- 
Bye, Peter Korsgaard
