From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 18 Jul 2017 09:50:09 -0300
Subject: [Buildroot] [RFC] kernel-module-imx-gpu-viv:compaling error
In-Reply-To: <1500375085852-171182.post@n4.nabble.com>
References: <1500358371269-171162.post@n4.nabble.com>
 <20170718100720.39028066@windsurf>
 <CAAMH-ysnm5JMQnAJ4jQJS700o1tDE6tKeW0-niz8eBdRRQXWSQ@mail.gmail.com>
 <20170718110245.1f85dafb@windsurf.lan>
 <1500375085852-171182.post@n4.nabble.com>
Message-ID: <CAOMZO5C23FnwscYL78DZcuaxk36u+ZyD17iBghYwPoR_UYkkZQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Refik,

On Tue, Jul 18, 2017 at 7:51 AM, Refik Tuzakl? <tuzaklirefik@gmail.com> wrote:

> how can use Linux 4.1 based BSP provided by Freescale/NXP on buildroot. Is
> it enought to change kernel version to 4.1 under kernel and toolchain in
> Buildroot or should it be more specific like 4.1.15 as in Freescale website?

You can do:

make clean
make freescale_imx6qsabresd_defconfig
make

and this will build an image based on NXP 4.1.15 kernel.

You will still need to manually add the Vivante GPU packages though.

Another alternative is to use a mainline kernel with Etnaviv.

Here is a defconfig patch I sent that installs the graphic packages to
work with a mainline kernel:
http://lists.busybox.net/pipermail/buildroot/2017-June/195135.html

Thomas,

Any chances to getting imx6q-sabresd_qt5_defconfig accepted? It will
make users' life easier :-)

Thanks
