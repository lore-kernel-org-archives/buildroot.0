From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Aug 2016 11:48:27 +0200
Subject: [Buildroot] [PATCHv4] bfin: fix issues with internal toolchain,
 re-enable C++ support
In-Reply-To: <1471638312-4799-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1471638312-4799-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160820114827.6d286be0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 19 Aug 2016 22:25:12 +0200, Thomas Petazzoni wrote:
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
> 
> Fixes:
>   (alsa-lib emutls)
>   http://autobuild.buildroot.net/results/8544ce58d75820666579db93a25ca5656a8efa8e/
>   (cairo emutls)
>   http://autobuild.buildroot.net/results/88b02a5dd5408318941ccbfcea0a9cbaa331500a/
>   (audiofile c++)
>   http://autobuild.buildroot.net/results/394e530c5dcd9ccb590eb151aeaadb37d11e0e39/
>   (assimp c++)
>   http://autobuild.buildroot.net/results/01f4be126c2d786a5ad7f220c2cf60539888a480/
>   (bellagio c++)
>   http://autobuild.buildroot.net/results/ada/ada44228bf13ec05382275bd6571396f5ba2b1f7/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
