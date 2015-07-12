From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Jul 2015 21:54:06 +0200
Subject: [Buildroot] [PATCH] Fix selection of bootloaders from
 $(BR2_EXTERNAL)
In-Reply-To: <1436722021-6478-1-git-send-email-arnout@mind.be>
References: <1411667269-8347-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1436722021-6478-1-git-send-email-arnout@mind.be>
Message-ID: <20150712215406.1e3a723c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle (Essensium/Mind),

On Sun, 12 Jul 2015 19:27:01 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
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
> ---
> v2: [Arnout]
>   - Use a single filter line instead of copying it for BR2_EXTERNAL
>     (Suggested by Thomas DS)
>   - Add the same feature to toolchain (Suggested by Thomas DS)
> ---
>  package/pkg-generic.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
