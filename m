From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Jun 2016 00:11:55 +0200
Subject: [Buildroot] [PATCH v4] igmpproxy: bump version to
 a731683d1a65956fa05024b0597b105fe6a3a122
In-Reply-To: <1463685189.2081.13.camel@embedded.rocks>
References: <1463668693-1367-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1463685189.2081.13.camel@embedded.rocks>
Message-ID: <20160610001155.4296260a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 19 May 2016 21:13:09 +0200, J?rg Krause wrote:

> # Use standard unsigned integer types for fixing musl build
> IGMPPROXY_PATCH =?https://github.com/pali/igmpproxy/commit/33a69727c936
> e81aff312d1f92ab5681a77b095d.patch
> # Fix ucLinux support
> IGMPPROXY_PATCH +=?https://github.com/pali/igmpproxy/commit/0e3af272c87
> d77cc81740436fcf6bc69e0c3c215.patch

Unfortunately, this doesn't work, because
33a69727c936e81aff312d1f92ab5681a77b095d.patch fails to apply, most
likely because it depends on other commits:

>>> igmpproxy 0.1 Patching
support/scripts/apply-patches.sh  /home/thomas/projets/buildroot/output/build/igmpproxy-0.1 /home/thomas/dl 33a69727c936e81aff312d1f92ab5681a77b095d.patch

Applying 33a69727c936e81aff312d1f92ab5681a77b095d.patch using patch: 
patching file src/igmp.c
Hunk #1 FAILED at 79.
Hunk #2 FAILED at 230.
2 out of 2 hunks FAILED -- saving rejects to file src/igmp.c.rej
patching file src/kern.c
patching file src/lib.c
patching file src/os-dragonfly.h
patching file src/os-freebsd.h
patching file src/os-linux.h
patching file src/os-netbsd.h
patching file src/os-openbsd.h
Patch failed!  Please fix 33a69727c936e81aff312d1f92ab5681a77b095d.patch!
package/pkg-generic.mk:159: recipe for target '/home/thomas/projets/buildroot/output/build/igmpproxy-0.1/.stamp_patched' failed

We could also integrate those commits in IGMPPROXY_PATCH, or we could
adjust the patch and keep it in package/igmpproxy/. All in all, I think
Matt's original solution is good enough, so I applied his patch.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
