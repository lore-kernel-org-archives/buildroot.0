From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 21 Oct 2018 16:29:00 +0200
Subject: [Buildroot] [PATCH v2] package/clang: default linker to the
 cross GNU
In-Reply-To: <1540124495-63551-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1540124495-63551-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20181021162900.4c43e6f4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 21 Oct 2018 07:21:35 -0500, Matt Weber wrote:
> By default clang is assuming the system linker /usr/bin/ld.  This
> patchset updates the default to point at the cross toolchain ld.
> 
> Previously clang had been used on target only, this update is
> required for host clang/clang++ to be used as a frontend for
> cross-compiling.
> 
> Example build command:
> 
> output/host/bin/clang++ -mcpu=cortex-a53  \
>   --sysroot /<abs path>/output/staging/ \
>   -B /<abs path>/output/host/opt/ext-toolchain/ \
>   foobar.cc -o foobar
> 
> Cc: Valentin Korenblit <valentinkorenblit@gmail.com>
> Reviewed-by: Romain Naour <romain.naour@gmail.com>
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
> Changes
> v1 -> v2
> [Romain
>  - Added example build command in commit description as example
>    for an eventual wrapper
>  - Moved setting of ld path option to be with other path assignments
> ---
>  package/clang/clang.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
