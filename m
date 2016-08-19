From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sat, 20 Aug 2016 00:27:38 +0200
Subject: [Buildroot] [PATCHv4] bfin: fix issues with internal toolchain,
 re-enable C++ support
In-Reply-To: <1471638312-4799-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1471638312-4799-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160819222738.GA22524@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
Thomas Petazzoni wrote,

> From: Waldemar Brodkorb <wbx@openadk.org>
> 
> The three patches allow to compile applications using TLS emulation from
> libgcc or C++ applications.
> 
> The patches 892-libgcc-mkmap-symver-support-skip_underscore.patch and
> 893-libgcc-config-bfin-use-the-generic-linker-version-in.patch fixes how
> libgcc is generated, by making the necessary libgcc symbols declared
> "GLOBAL", and therefore visible outside of libgcc. This fixes a large
> number of undefined reference issues (for either C++ applications or
> applications using TLS emulation). This was reported as gcc PR74748.
> 
> The patch 894-libgcc-fix-DWARF-compilation-with-FDPIC-targets.patch
> allows to build DWARF in FDPIC mode. This patch replaces the older
> 892-disable-dwarf-bfin.patch, as instead of disabling DWARF support, it
> fixes it. This was reported as gcc PR68468.
> 
> In order to get C++ working without unresolved symbols, we also need to
> disable symbol versioning (--disable-symvers). This is a remaining issue
> in gcc which will be investigated at a later point.
> 
> Since this commit fixes C++ support in Blackfin, it re-enables the
> selection of C++ support for this architecture.

Tested and works great. Awesome. Wonderful.
Thanks for cleaning up my messy hacks :)

best regards
 Waldemar
