From: Christian Stewart <christian@paral.in>
Date: Fri, 12 Mar 2021 13:59:18 -0800
Subject: [Buildroot] [PATCH v1 2/2] package/batman-adv: bump version to
 2021.0
In-Reply-To: <20210311210804.9616-2-ps.report@gmx.net>
References: <20210311210804.9616-1-ps.report@gmx.net>
 <20210311210804.9616-2-ps.report@gmx.net>
Message-ID: <CA+h8R2ps1MF-NiZKYWceSTruHLXMpzLPORhzORetVKuF1PWDdA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Thu, Mar 11, 2021 at 1:08 PM Peter Seiderer <ps.report@gmx.net> wrote:
> -BATMAN_ADV_VERSION = 2019.3
> +BATMAN_ADV_VERSION = 2021.0

I get build errors against 2 different device kernels (x86_64 and pi4):

LD [M]  /build/batman-adv-2021.0/net/batman-adv/batman-adv.o
MODPOST /build/batman-adv-2021.0/net/batman-adv/Module.symvers
ERROR: modpost: "batadv_v_mesh_free"
[/build/batman-adv-2021.0/net/batman-adv/batman-adv.ko] undefined!
ERROR: modpost: "batadv_v_mesh_init"
[/build/batman-adv-2021.0/net/batman-adv/batman-adv.ko] undefined!
ERROR: modpost: "batadv_v_hardif_init"
[/build/batman-adv-2021.0/net/batman-adv/batman-adv.ko] undefined!
ERROR: modpost: "batadv_v_init"
[/build/batman-adv-2021.0/net/batman-adv/batman-adv.ko] undefined!

Possibly the package makefile needs to be updated?

thanks,
Christian
