From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Jul 2021 21:26:21 +0200
Subject: [Buildroot] [PATCH] package/lua-lunix: fix build with musl
In-Reply-To: <20210717132144.1503495-1-francois.perrad@gadz.org>
References: <20210717132144.1503495-1-francois.perrad@gadz.org>
Message-ID: <20210720212621.0a476e44@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, 17 Jul 2021 15:21:44 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> see http://autobuild.buildroot.net/results/7d192a0a1d58d258b77906cf936949b2f47373cd/
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  .../0002-remove-link-with-librt.patch         | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 package/lua-lunix/0002-remove-link-with-librt.patch

What makes this patch work is that we don't support glibc < 2.17 for
the target, so indeed we no longer care about linking with librt.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
