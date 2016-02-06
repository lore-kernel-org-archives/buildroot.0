From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 6 Feb 2016 11:18:28 +0100
Subject: [Buildroot] [PATCH v3 00/18] Rework atomic handling
In-Reply-To: <1454427096-20967-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1454427096-20967-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160206111828.2d4fd6e7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

On Tue,  2 Feb 2016 16:31:18 +0100, Thomas Petazzoni wrote:

> Thomas Petazzoni (18):
>   icu: libatomic is only available starting from gcc 4.8
>   toolchain: add BR2_TOOLCHAIN_HAS_{SYNC_x,ATOMIC} hidden booleans
>   docs/manual: document usage of BR2_TOOLCHAIN_HAS_SYNC_x
>   json-c: needs __sync_val_compare_and_swap_4
>   pulseaudio: remove BR2_ARCH_HAS_ATOMICS dependency
>   apache, apr: fix atomic handling
>   jack2: use the proper BR2_TOOLCHAIN_HAS_SYNC_x symbol
>   libtorrent: use the proper BR2_TOOLCHAIN_HAS_SYNC_x symbols
>   gauche: disable on SPARC(64), remove atomics dependency
>   cairo, harfbuzz: rework atomic dependencies
>   squid: rework atomic handling
>   thrift: remove BR2_ARCH_HAS_ATOMICS dependency
>   msgpack: rework BR2_ARCH_HAS_ATOMICS dependency
>   arch: remove BR2_ARCH_HAS_ATOMICS option
>   glog: fix atomic built-in problem
>   openal: fix atomic handling
>   freerdp: add missing BR2_TOOLCHAIN_HAS_SYNC_4 dependency
>   neard: add missing BR2_TOOLCHAIN_HAS_SYNC_4 dependency

Since this series is needed to fix a number of build failures, I've
applied it so it gets part of 2016.02-rc1, and we can continue to fix
atomic related build issues throughout the 2016.02 debug period.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
