From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Mar 2020 07:35:16 +0100
Subject: [Buildroot] [PATCH] package/busybox: fix target-finalize hook
In-Reply-To: <20200325003053.6305-1-unixmania@gmail.com>
References: <20200325003053.6305-1-unixmania@gmail.com>
Message-ID: <20200325073516.67d09288@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 24 Mar 2020 21:30:53 -0300
unixmania at gmail.com wrote:

> From: Carlos Santos <unixmania@gmail.com>
> 
> It was searching for CONFIG_ASH=y and CONFIG_HUSH=y at $(@D)/.config,
> which does not contain the package build path at the target-finalize
> step. Use $(BUSYBOX_DIR), instead.
> 
> Signed-off-by: Carlos Santos <unixmania@gmail.com>
> ---
>  package/busybox/busybox.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
