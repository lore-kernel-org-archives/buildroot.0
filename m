From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Jun 2012 22:00:28 +0200
Subject: [Buildroot] [PATCH 10/10] toolchain-external: on SuperH,
 use Sourcery CodeBench 2011.09 by default
In-Reply-To: <87ehpvsejt.fsf@macbook.be.48ers.dk>
References: <cover.1338732273.git.thomas.petazzoni@free-electrons.com>
 <cover.1338732273.git.thomas.petazzoni@free-electrons.com>
 <7a2800c2cb33d674a82e1396354225549458a708.1338732273.git.thomas.petazzoni@free-electrons.com>
 <87ehpvsejt.fsf@macbook.be.48ers.dk>
Message-ID: <20120606220028.478baaf9@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 04 Jun 2012 09:48:38 +0200,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
> 
>  Thomas> The 2012.03 version of the x86 toolchain uses glibc 2.15, which
>  Thomas> doesn't provide RPC functions. This breaks most packages for now,
>  Thomas> until we package TI-RPC properly.
> 
> Seems like cut'n'paste from patch 9.

Yes :)

> "Most packages" is probably somewhat exaggerated - We have very few
> packages depending on BR2_INET_RPC:
> 
> git grep -l BR2_INET_RPC package/**/Config.in
> package/lmbench/Config.in
> package/netkitbase/Config.in
> package/netkittelnet/Config.in
> package/nfs-utils/Config.in
> package/portmap/Config.in
> 
> Or have you found other packages where we're missing the BR2_INET_RPC
> annotation?

There are some packages that do not depend on BR2_INET_RPC, but that
enable stuff when BR2_INET_RPC is enable. Take for example
package/busybox :-)

For the moment, the external toolchain code assumes that if the
external toolchain uses (e)glibc, then it has RPC support, so it always
enables BR2_INET_RPC. Obviously, this is what is broken, but I'd prefer
to add proper support for TI-RPC to not leave users using modern
toolchains with absolutely no solution for RPC support.

For now, if you choose one of those toolchains, even Busybox does not
build (complains that rpc.h doesn't exist), which explains why I
preferred to not make those toolchains the default ones, until I find
the time to work on TI-RPC integration.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
