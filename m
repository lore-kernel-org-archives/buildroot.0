From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 12 Feb 2020 12:18:37 -0300
Subject: [Buildroot] [git commit] board/freescale/common/imx: add
 support for i.MX8
In-Reply-To: <20200205111426.415708122F@busybox.osuosl.org>
References: <20200205111426.415708122F@busybox.osuosl.org>
Message-ID: <CAOMZO5BOONSJYw9hrgJXNMJTOW0mDB+Xz7BfcexOPkuOZ80XeQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Maeva,

On Wed, Feb 5, 2020 at 8:25 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> commit: https://git.buildroot.net/buildroot/commit/?id=3f8ace002831a01ed6aec59b704bd92c8a3b957f
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
> Signed-off-by: Maeva Manuel <maeva.manuel@nxp.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

This commit breaks the freescale_imx8qxpmek_defconfig target:

774122 bytes (774 kB, 756 KiB) copied, 0,00407387 s, 190 MB/s
AP file_offset = 0x25000 size = 0xbd000
Can't open /home/fabio/buildroot/output/images/mx8qx-ahab-container.img:
No such file or directory
Makefile:806: recipe for target 'target-post-image' failed
make: *** [target-post-image] Error 1

Reverting it make the build work again.

Please fix it.
