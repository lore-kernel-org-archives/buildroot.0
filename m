From: Christian Stewart <christian@paral.in>
Date: Mon, 15 Mar 2021 14:00:38 -0700
Subject: [Buildroot] [PATCH v1 1/2] package/batman-adv: fix compile with
 BR2_PACKAGE_BATMAN_ADV_BATMAN_V disabled
In-Reply-To: <20210314223207.13460-1-ps.report@gmx.net>
References: <20210314223207.13460-1-ps.report@gmx.net>
Message-ID: <CA+h8R2qT=su3CO8OCVbQtdpsZezCxsrnq2UtWWNJVp+ZP75r8A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, all,

On Sun, Mar 14, 2021 at 3:32 PM Peter Seiderer <ps.report@gmx.net> wrote:
>
> The given 'CONFIG_BATMAN_ADV_BATMAN_V=' is enough to trigger the wrong
> code compile path in net/batman-adv/bat_v.h missing the static inline
> dummy implementations.
>
> Fixes:

Unfortunately after applying this commit it still breaks.

I confirmed that the CONFIG_BATMAN_ADV_BATMAN_V is not being set now.


CONFIG_BATMAN_ADV=m
CONFIG_BATMAN_ADV_BLA=y
CONFIG_BATMAN_ADV_DAT=y
CONFIG_BATMAN_ADV_MCAST=y
M=build/batman-adv-2021.0/net/batman-adv
make modules

[snip]

  MODPOST /build/batman-adv-2021.0/net/batman-adv/Module.symvers
ERROR: modpost: "batadv_v_mesh_free" undefined!
ERROR: modpost: "batadv_v_mesh_init" undefined!
ERROR: modpost: "batadv_v_hardif_init" undefined!
ERROR: modpost: "batadv_v_init" undefined!

Thanks,
Christian Stewart
