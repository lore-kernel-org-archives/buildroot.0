From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Jan 2016 21:28:16 +0100
Subject: [Buildroot] [PATCH] pkg-kconfig: add missing -patch dependency
 for defconfig
In-Reply-To: <1453676322-1906-1-git-send-email-arnout@mind.be>
References: <1453676322-1906-1-git-send-email-arnout@mind.be>
Message-ID: <20160126212816.6499320e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle (Essensium/Mind),

On Sun, 24 Jan 2016 23:58:42 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:
> Since the introduction of _KCONFIG_DEFCONFIG in 8ef62b99, the package's
> .config file no longer depends on anything (unless a fragment is
> defined). Therefore, there is no dependency anymore between .config
> and <pkg>-patch. Thus, it is possible that the .config file is
> attempted to be built before the package is extracted and patched.
> Usually this works out OK because <pkg>-patch will always be done
> before <pkg>-configure, but it will fail when the user calls
> <pkg>-menuconfig explicitly. It will also fail when we enable
> top-level parallel build.
> 
> To solve this, just add an explicit order-only dependency on
> <pkg>-patch. It really is only necessary when _KCONFIG_DEFCONFIG is
> defined and _KCONFIG_FRAGMENT_FILES is not, but it doesn't hurt to
> add it unconditionally.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Reported-by: FrAnKenStEiN MC <chfakht@gmail.com>
> ---
>  package/pkg-kconfig.mk | 5 +++++
>  1 file changed, 5 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
