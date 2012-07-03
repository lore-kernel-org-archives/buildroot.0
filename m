From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Jul 2012 21:48:07 +0200
Subject: [Buildroot] RPC support for modern (e)glibc toolchains
In-Reply-To: <4FEEF013.9000500@mind.be>
References: <20120627000701.506f534e@skate>
 <359dafd382a8aa5ccaaa5ebbde9b38ff@zacarias.com.ar>
 <20120627145340.34895a74@skate> <4FEEF013.9000500@mind.be>
Message-ID: <20120703214807.17a08790@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sat, 30 Jun 2012 14:24:51 +0200,
Arnout Vandecappelle <arnout@mind.be> a ?crit :

>   However, given that this will only appear in BR-2012.08 at the earliest,
> and that the native RPC is on the way out anyway, maybe we can keep it
> even simpler and remove the BR2_TOOLCHAIN_HAS_NATIVE_RPC option
> completely.  Just replace all 'depends on BR2_INET_RPC' with
> 'select BR2_PACKAGE_LIBTIRPC'.  The only users who are aversely affected
> by that are people using a pre-2.14 glibc toolchain, because now they'll
> get 100K of redundant library.  But I guess glibc users don't care much
> about a mere 100K of rootfs size.

Replacing "depends on BR2_INET_RPC" by "select BR2_PACKAGE_LIBTIRPC"
means that uClibc users will be forced to use libtirpc, while they
probably wanted to keep using the internal uClibc RPC code. I don't
think it's a good idea to do this.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
