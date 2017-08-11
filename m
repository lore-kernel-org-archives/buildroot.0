From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Aug 2017 15:29:44 +0200
Subject: [Buildroot] [PATCH] minnowboard_max_defconfig: grub2 needs WCHAR
In-Reply-To: <20170810212805.27808-1-arnout@mind.be>
References: <20170810212805.27808-1-arnout@mind.be>
Message-ID: <20170811152944.62b3f48e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 10 Aug 2017 23:28:05 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> Since commit 5ffafd2353f5d67 (grub2: bump up version), grub2 needs a
> toolchain with WCHAR support. However, the defconfigs that use grub2
> were not updated at the time.
> 
> Add BR2_TOOLCHAIN_BUILDROOT_WCHAR=y to minnowboard_max_defconfig.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Erico Nunes <nunes.erico@gmail.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> Cc: Vincent Stehl? <vincent.stehle@intel.com>
> ---
> The following other defconfigs also use grub2.

I've applied to master. However, I'm not entirely happy with the fact
that grub2 requires wchar, but it's maybe a dependency that can be
removed once we introduce grub2-tools
(http://patchwork.ozlabs.org/patch/755651/).

Anyway for now, adding the wchar option in the minnowboard defconfig is
the only option we have.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
