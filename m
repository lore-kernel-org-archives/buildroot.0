From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Mar 2014 09:35:20 +0100
Subject: [Buildroot] [PATCH] systemd: needs kernel headers >= 3.7.
In-Reply-To: <1396024266-6662-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1396024266-6662-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <20140329093520.5318ada7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Eric Le Bihan,

On Fri, 28 Mar 2014 17:31:05 +0100, Eric Le Bihan wrote:
> Systemd needs Linux headers >= 3.7 because it uses IFLA_GRE_FLOWINFO
> from linux/if_tunnel.h.
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
>  system/Config.in |    6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Are you sure Linux headers >= 3.7 are sufficient? I'm looking at the
build failure at
http://autobuild.buildroot.org/results/ad3/ad3b4003dc50582a493f1156234d83652104a6bf/build-end.log,
and it looks like missing kernel definitions, even though the toolchain
apparently uses 3.7 kernel headers, as far as I can see.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
