From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Nov 2018 14:51:15 +0100
Subject: [Buildroot] [PATCH v2] alsa-utils: install systemd sevice files
In-Reply-To: <20181030224139.5140-1-ps.report@gmx.net>
References: <20181030224139.5140-1-ps.report@gmx.net>
Message-ID: <20181101145115.38919e8f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 30 Oct 2018 23:41:39 +0100, Peter Seiderer wrote:
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Changes v1 -> v2:
>   - fix symlinks (reported by ????? ??????????)
> ---
>  package/alsa-utils/alsa-utils.mk | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)

So, I have applied (after fixing the typo in the commit title), but I
am not a big fan in fact. Indeed, the alsa-utils build system has all
the logic to install those service files, provided --enable-systemd is
passed.

Unfortunately, we completely override the alsa-utils "make install"
before since we define ALSA_UTILS_INSTALL_TARGET_CMDS.

Perhaps the alsa-utils package should be reworked to use
ALSA_UTILS_INSTALL_TARGET_CMDS, and then use post-install target hooks
to remove unwanted programs/data if applicable.

But since that was clearly a larger effort, I took your patch as-is as
it does the right thing considering how alsa-utils.mk works today.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
