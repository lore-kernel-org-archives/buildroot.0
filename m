From: juju at cotds.org <juju@cotds.org>
Date: Wed, 04 Dec 2019 18:24:51 +0100
Subject: [Buildroot] 
 =?utf-8?q?=5BPATCH_1/1=5D_configs/freescale=5Fimx8mq?=
 =?utf-8?q?evk=3A_bump_BSP_components_to_4=2E14=2E98=5F2=2E0=2E0?=
In-Reply-To: <CAOMZO5B7FZg93Z82hD-a-1oBCB6q5UQmNLEkj8bekyC5Uc8eOg@mail.gmail.com>
References: <20191203203805.408448-1-juju@cotds.org>
 <CAOMZO5B7FZg93Z82hD-a-1oBCB6q5UQmNLEkj8bekyC5Uc8eOg@mail.gmail.com>
Message-ID: <7f7ce42627d79783827f1b347b9084da@cotds.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabio,

On 2019-12-03 21:51, Fabio Estevam wrote:
> Hi Julien,
> 
> On Tue, Dec 3, 2019 at 5:38 PM Julien Olivain <juju@cotds.org> wrote:
>> 
>> Update Kernel, U-Boot and ATF to NXP BSP version 
>> rel_imx_4.14.98_2.0.0_ga
> 
> What about switching to imx_4.19.35_1.1.0 instead?

Some packages, like imx-gpu-viv are linked to the i.MX uboot/kernel/atf
versions. For example i.MX BSP 4.14.78-1.0.0 uses 
imx-gpu-viv-6.2.4.p2.3,
but 4.19.35-1.1.0 uses imx-gpu-viv-6.4.0.p1.0, ... (One could eventually
workaround this by using kernel-module-imx-gpu-viv, though). This is 
also
probably the case for other i.MX packages like imx-sc-firmware (with SC 
RPC API
version), and firmware-imx, and maybe others...

On the other hand, some other board vendors are providing their own BSPs
derived from older NXP BSPs (e.g. TechNexion latest BSP is still based 
on
4.14.98_2.0.0). So updating EVK board to 4.19.35_1.1.0 would probably 
require
an imx-gpu-viv update too, but would also probably break the TechNexion 
PicoPi
8M.

This means that, some of the i.MX defconfigs needs to be aligned 
altogether,
with those packages. My intent was to not update beyond the latest 
TechNexion
BSP version.

Maybe the correct long-term solution would be to add a "Custom Version" 
option
in KConfig, for those packages with kernel/uboot/atf dependencies?

Best regards,

Julien.
