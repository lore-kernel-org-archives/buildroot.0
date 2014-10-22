From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Oct 2014 22:51:33 +0200
Subject: [Buildroot] [PATCH] infra/pkg-kconfig: fix saving the config
 file
In-Reply-To: <1413836616-4209-1-git-send-email-yann.morin.1998@free.fr>
References: <1413836616-4209-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20141022225133.59ae7d55@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Mon, 20 Oct 2014 22:23:36 +0200, Yann E. MORIN wrote:
> When saving (aka updating) the configuration file of a kconfig package,
> a subsequent call to "make" would rebuild the package, even though the
> configuration did not actually change.
> 
> It took quite a while to understand why. But the reason is so simple and
> obvious, when you think about it:
> 
>   - $(@D)/.config depends on the config file $(BUSYBOX_CONFIG_FILE)
>   - busybox-update-config then copies $(@D)/.config back to the config
>     file $(BUSYBOX_CONFIG_FILE)
>   - so the config file is newer than $(@D)/.config
> 
> So, in the next run, pkg-kconfig believes that it has to rebuild
> busybox. Bummer... :-/
> 
> So, the fix is very trivial, and just requires asking "cp" to preserve
> timestamps, so the dependency does not kick in at the next run.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
