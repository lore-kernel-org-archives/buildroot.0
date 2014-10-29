From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Oct 2014 09:41:21 +0100
Subject: [Buildroot] [PATCH] Revert "package/libcap: Fix build error
 with kernel headers < 3.6"
In-Reply-To: <20141029093544.7fb84bf9@PAL-U515208D001>
References: <1414445712-26011-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20141029093544.7fb84bf9@PAL-U515208D001>
Message-ID: <20141029094121.37a752d6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Christophe Vu-Brugier,

On Wed, 29 Oct 2014 09:35:44 +0100, Christophe Vu-Brugier wrote:

> Tested-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
> 
> I built libcap, cdrkit and lxc with an external toolchain with 3.0
> kernel headers:
> 
> BR2_x86_64=y
> BR2_TOOLCHAIN_USES_GLIBC=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_0=y
> BR2_PACKAGE_CDRKIT=y
> BR2_PACKAGE_LIBCAP=y
> BR2_PACKAGE_LXC=y

Actually, it's enabling BR2_PACKAGE_ATTR=y that causes libcap to build
the problematic code. But even with that, a toolchain that uses 3.1
kernel headers builds fine a configuration that has BR2_PACKAGE_ATTR=y
+ BR2_PACKAGE_LIBCAP=y.

That being said, we probably need a dependency on kernel headers >=
3.0, because we don't distinguish the version of the kernel headers for
2.6.x kernels.

In fact, I just realized that I have mistakenly pushed the revert. I
had it locally in my master branch to do some testing, and I pushed it
by mistake:
http://git.buildroot.net/buildroot/commit/?id=d5146f4b53d926c13a47215ac514e43b2c66b9ac.
Unfortunately, I pushed a quick and dirty version that doesn't have the
huge explanation I had written for the patch I submitted to the mailing
list :-/

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
