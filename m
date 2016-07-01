From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Jul 2016 16:33:52 +0200
Subject: [Buildroot] [PATCH v2 1/1] efivar: depends on target gcc >= 4.7
In-Reply-To: <20160626213627.14298-1-nunes.erico@gmail.com>
References: <20160626213627.14298-1-nunes.erico@gmail.com>
Message-ID: <20160701163352.27bdb1e5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 26 Jun 2016 23:36:27 +0200, Erico Nunes wrote:
> The efivar internal build system uses flags such as -std=gnu11 ,
> -Wmaybe-uninitialized , -flto which are available in gcc >= 4.7 only.
> These flags are passed both to target build and to build a host tool.
> For the host part, this has been worked around by overriding
> 'gcc_flags', but doing that for the target would remove all flags that
> upstream intended for the target build.
> 
> Buildroot doesn't support building gcc 4.6 in its own toolchain anymore
> but it's possible to use an external toolchain with gcc 4.6 which would
> be unable to build this package.
> 
> This patch adds a limitation on toolchains with target gcc >= 4.7 to
> make sure that the flags are available in the chosen toolchain.
> 
> Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
> ---
> Changes v1 -> v2:
>   - propagated gcc >= 4.7 dependency to efibootmgr (pointed out by
>   Thomas Petazzoni)
> ---
>  package/efibootmgr/Config.in | 6 ++++--
>  package/efivar/Config.in     | 6 ++++--
>  2 files changed, 8 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
