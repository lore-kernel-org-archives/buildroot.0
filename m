From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Apr 2015 19:08:27 +0200
Subject: [Buildroot] [PATCH 1/2] libnfs: Without native RPC use libtirpc
In-Reply-To: <CAGduivzx8ANrYW5UCO98Ek+fZ89cnPxnp_eZj=VffFSQ+_kpzQ@mail.gmail.com>
References: <1430052871-6235-1-git-send-email-maxime.hadjinlian@gmail.com>
 <20150426125951.GL2258@tarshish>
 <CAGduivzx8ANrYW5UCO98Ek+fZ89cnPxnp_eZj=VffFSQ+_kpzQ@mail.gmail.com>
Message-ID: <20150426190827.599b4455@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Sun, 26 Apr 2015 18:13:33 +0200, Maxime Hadjinlian wrote:

> > What about libtirpc dependencies?
> There's only host-pkgconf, I don't think I have to add it to the
> dependency of libnfs, do I ?

Config.in dependencies. From libtirpc/Config.in:

        depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2
        depends on BR2_TOOLCHAIN_HAS_THREADS

They need to be propagated when you select BR2_PACKAGE_LIBTIRPC.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
