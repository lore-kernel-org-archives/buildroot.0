From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 12 May 2015 13:26:32 +0200
Subject: [Buildroot] [PATCH] libmemcached: don't use -fPIE and -pie with
 FLAT binaries
In-Reply-To: <87d226iwpp.fsf@dell.be.48ers.dk>
References: <1431377736-2574-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <87d226iwpp.fsf@dell.be.48ers.dk>
Message-ID: <20150512132632.2cbbc566@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Tue, 12 May 2015 00:19:14 +0200, Peter Korsgaard wrote:

> BINFMT_FLAT implies BR2_STATIC_LIBS and (elf) static libraries should
> also not be built with -fPIE / -pie, right?
> 
> Is there any specific reason to only do this workaround for BINFMT_FLAT?

Actually, I'm a bit confused. Shouldn't FLAT binaries be PIE ? Since
there's no MMU, each binary will be loaded at a different address, so
binaries should be PIE, no?

But the original reason why I removed -pie is because of:

  https://www.mail-archive.com/toolchain-devel at blackfin.uclinux.org/msg02113.html

For the exact same error, Mike Frysinger says to remove the -pie flag.

Hum, http://www.kdvelectronics.eu/uClinux-cisco2500/exotica.html seems
to indicate that PIE is not required in all cases for FLAT binaries.

I would tend to trust Mike Frysinger on this, though :)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
