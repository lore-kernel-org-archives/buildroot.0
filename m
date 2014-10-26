From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Oct 2014 16:41:55 +0100
Subject: [Buildroot] [PATCH 1/2] kconfig/lxdialog: get ncurses CFLAGS
 with pkg-config
In-Reply-To: <1414329446-16587-2-git-send-email-bjorn.forsman@gmail.com>
References: <1414329446-16587-1-git-send-email-bjorn.forsman@gmail.com>
 <1414329446-16587-2-git-send-email-bjorn.forsman@gmail.com>
Message-ID: <20141026164155.4c1bc8db@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bj?rn Forsman,

On Sun, 26 Oct 2014 14:17:25 +0100, Bj?rn Forsman wrote:
> This makes "make menuconfig" also work on systems where ncurses is not
> installed in a standard location (such as on NixOS).
> 
> This patch changes ccflags() so that it tries pkg-config first, and only
> if pkg-config fails does it go back to the fallback/manual checks. This
> is the same algorithm that ldflags() already uses.
> 
> [This patch is already applied upstream (will be part of linux v3.18):
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=be8af2d54a66911693eddc556e4f7a866670082b
> 
> I'm adding this instead of doing a full upstream kconfig sync because
> (1) there was a conflict in one of the Buildroot kconfg patches (against
> linux 3.18-rc1), (2) adding this patch won't create any conflict next
> time someone re-syncs kconfig with linux and (3) because this is easier
> to review.
> ]
> 
> Signed-off-by: Bj?rn Forsman <bjorn.forsman@gmail.com>
> ---
>  support/kconfig/lxdialog/check-lxdialog.sh | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>  mode change 100644 => 100755 support/kconfig/lxdialog/check-lxdialog.sh

Hum, whenever we do change in the kconfig code, we like them to be part
of the patch series we have. See support/kconfig/README.buildroot for
details. In this case, indeed, the fix is already upstream. But still,
we would like to keep separated the base kconfig version (copied
as-is from the kernel) from any further modification we have made.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
