From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 May 2017 17:05:25 +0200
Subject: [Buildroot] [PATCH] toolchains/configs: make external toolchain
 explicit
In-Reply-To: <20170504070745.13349-1-arnout@mind.be>
References: <20170504070745.13349-1-arnout@mind.be>
Message-ID: <20170504170525.440fc631@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 4 May 2017 09:07:45 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> Some of the toolchain configs rely on the default to select which
> external toolchain to use. However, this is wrong for two reasons:
> - when the defaults change in Buildroot, the toolchain config will
>   change under the hood;
> - when the autobuild-run script adds some options (in particular,
>   BR2_STATIC_LIBS), it is possible that the default changes (or is
>   no longer available).
> 
> Both can be fixed by explicitly adding the external toolchain option
> we want to the config file. Indeed, the autobuild-run script will
> then detect that there is a difference between the generated config
> and the base one, and will discard it.
> 
> Fixes:
> http://autobuild.buildroot.net/results/39888c188c0d13219a8419897a833275fcc81597
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
> I didn't really test this change, I just manually ran a config which
> each of them and checked if it was OK.
> ---
>  web/toolchains/configs/linaro-aarch64.config      | 1 +
>  web/toolchains/configs/linaro-arm.config          | 1 +
>  web/toolchains/configs/sourcery-arm-thumb2.config | 1 +
>  web/toolchains/configs/sourcery-nios2.config      | 1 +
>  4 files changed, 4 insertions(+)

Applied to buildroot-test and deployed. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
