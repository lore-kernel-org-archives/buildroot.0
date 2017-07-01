From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Jul 2017 12:56:15 +0200
Subject: [Buildroot] [PATCH] docs: known issues no longer valid
In-Reply-To: <20170630032140.3u3bwbec7tr25zdt@tarshish>
References: <20170629204730.GA27700@waldemar-brodkorb.de>
 <20170630032140.3u3bwbec7tr25zdt@tarshish>
Message-ID: <20170701125615.277cd704@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 30 Jun 2017 06:21:40 +0300, Baruch Siach wrote:

> >  * The +libffi+ package is not supported on the SuperH 2 and ARC
> >    architectures.  
> 
> This paragraph and the following one (about prboom) are also outdated. libffi 
> supports all Buildroot target architectures for quite some time now.

This is not quite true. We still have in the autobuild-run script:

    # libffi not available on sh2a and ARMv7-M, but propagating libffi
    # arch dependencies in Buildroot is really too much work, so we
    # handle this here.
    if 'BR2_sh2a=y\n' in configlines and  'BR2_PACKAGE_LIBFFI=y\n' in configlines:
        return False
    if 'BR2_ARM_CPU_ARMV7M=y\n' in configlines and  'BR2_PACKAGE_LIBFFI=y\n' in configlines:
        return False

I'll apply Waldemar's patch as-is, because it isn't wrong by itself.
Additional patches are of course welcome.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
