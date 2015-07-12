From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Jul 2015 21:56:22 +0200
Subject: [Buildroot] [PATCH v2] package: Remove shell completion at
 finalize stage
In-Reply-To: <1436714757-20767-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1436714757-20767-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20150712215622.6a903161@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Sun, 12 Jul 2015 17:25:57 +0200, Maxime Hadjinlian wrote:
> Instead of doing a removal of the completion file package per package,
> do it all at the finalize stage so it's done once and for all.
> 
> Note: This fixes an issue with systemd where passing a --bashcompletiondir
> or --zshcompletiondir would be evaluated to '.' by the autotools macro.
> This would create a 'target./' directory.
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
> V1 -> V2: fix inverted path between bash and zsh
> ---
>  Makefile                         | 6 ++++++
>  package/kmod/kmod.mk             | 4 ----
>  package/systemd/systemd.mk       | 8 --------
>  package/util-linux/util-linux.mk | 6 ------
>  4 files changed, 6 insertions(+), 18 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
