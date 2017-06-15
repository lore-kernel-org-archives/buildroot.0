From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Jun 2017 22:38:56 +0200
Subject: [Buildroot] [PATCH] arm-trusted-firmware: cleanup make target
 handling
In-Reply-To: <1497439347-10579-1-git-send-email-luca@lucaceresoli.net>
References: <1497439347-10579-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <20170615223856.3bdee993@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 14 Jun 2017 13:22:27 +0200, Luca Ceresoli wrote:
> ARM_TRUSTED_FIRMWARE_MAKE_TARGET is expanded, but it's never assigned
> so it is always empty. On the other hand the make targets are defined
> in ARM_TRUSTED_FIRMWARE_MAKE_OPTS, which should contain options, not
> targets.
> 
> Clean it all up by moving the targets in the proper place, replacing
> the useless $(ARM_TRUSTED_FIRMWARE_MAKE_TARGET).
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> ---
>  boot/arm-trusted-firmware/arm-trusted-firmware.mk | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
