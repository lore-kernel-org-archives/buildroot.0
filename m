From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 12 Jul 2015 21:03:59 +0200
Subject: [Buildroot] [PATCH] Fix selection of bootloaders from
	$(BR2_EXTERNAL)
In-Reply-To: <1436722021-6478-1-git-send-email-arnout@mind.be>
References: <1411667269-8347-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1436722021-6478-1-git-send-email-arnout@mind.be>
Message-ID: <CAAXf6LWzCoguUEJ_Ocu9Fd8ORLh7zwxs1AxhbKavZkQ4C_Fp-Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jul 12, 2015 at 7:27 PM, Arnout Vandecappelle (Essensium/Mind)
<arnout@mind.be> wrote:
> From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
>
> If a package is based on "generic-package", pkg-generic.mk will compute
> the name of the Kconfig variable to use for checking if this package has
> been selected by the user.
>
> Unfortunately, this mechanism does not take into account the case where
> a bootloader is declared in a $(BR2_EXTERNAL)/boot directory.
>
> So, even if the bootloader has been selected, it will not be added to
> $(TARGETS) and will not be built.
>
> This patch fixes this issue.
>
> [Arnout: use single filter line, also apply this to toolchain]
>
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> Cc: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
