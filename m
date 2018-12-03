From: Matthew Weber <Matthew.Weber@collins.com>
Date: Mon, 3 Dec 2018 13:14:48 -0600
Subject: [Buildroot] [PATCH] linux: ensure images/ exist before creatign
 files there
In-Reply-To: <20181203191219.18998-1-yann.morin.1998@free.fr>
References: <20181203191219.18998-1-yann.morin.1998@free.fr>
Message-ID: <CANQCQpaARaig1_Cpja2_cgVYYvWqaOX+YptPH4xKoaHchkOo6g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Mon, Dec 3, 2018 at 1:12 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> When using an initramfs, on the first-pass build, we create a dummy cpio
> so that the build succeeeds. The real cpio will come later, and we'll do
> a second-pass build to use the actual cpio.
>
> However, when we touch that dummy cpio, the images/ directory may not
> yet exist, since commit d0f4f95e39 (Makefile: rework main directory
> creation logic) removed its creation at the begining of the build, to
> only at the moment we need it, i.e. during the *_INSTALL_IMAGES_CMDS
> steps.
>
> However, the linux build is not a _INSTALL_IMAGES_CMDS step, so there is
> no guarantee that images/ already exist at that time.
>
> Fix that by explicitly creating images/ before touching the dummy cpio.
>
> Reported-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Matthew Weber <matthew.weber@rockwellcollins.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Thanks Yann!

Reviewed-by: Matthew Weber <matthew.weber@rockwellcollins.com>
