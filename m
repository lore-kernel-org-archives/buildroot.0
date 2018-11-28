From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 28 Nov 2018 11:51:23 +0100
Subject: [Buildroot] [PATCH 1/3] toolchain-external-andes-nds32: new
 package
In-Reply-To: <20181128101542.9561-2-nylon7@andestech.com>
References: <20181128101542.9561-1-nylon7@andestech.com>
 <20181128101542.9561-2-nylon7@andestech.com>
Message-ID: <20181128115123.7a48eec6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 28 Nov 2018 18:15:40 +0800, Nylon Chen wrote:
> This commit adds a new package for the nds32 external
> toolchain for the nds32 architecture.
> 
> Signed-off-by: Che-Wei Chuang <cnoize@andestech.com>
> Signed-off-by: Greentime Hu <greentime@andestech.com>
> Signed-off-by: Nylon Chen <nylon7@andestech.com>
> ---
>  DEVELOPERS                                    |   6 +
>  toolchain/toolchain-external/Config.in        |   6 +
>  .../toolchain-external-andes-nds32/Config.in  |   9 ++
>  .../Config.in.options                         | 145 ++++++++++++++++++
>  .../toolchain-external-andes.hash             |   2 +
>  .../toolchain-external-andes.mk               |   9 ++
>  6 files changed, 177 insertions(+)
>  create mode 100644 toolchain/toolchain-external/toolchain-external-andes-nds32/Config.in
>  create mode 100644 toolchain/toolchain-external/toolchain-external-andes-nds32/Config.in.options
>  create mode 100644 toolchain/toolchain-external/toolchain-external-andes-nds32/toolchain-external-andes.hash
>  create mode 100644 toolchain/toolchain-external/toolchain-external-andes-nds32/toolchain-external-andes.mk

It is not clear what you are trying to do in this patch. It seems like
you are simply duplicating the "toolchain-external-custom" package,
which doesn't make a lot of sense.

You have two options:

 - You want to add a new pre-defined external toolchain, like we
   already have for the Linaro toolchains, ARM toolchains, ARC
   toolchains, and more.

   In this case, your package should reference a tarball of the
   pre-built toolchain, and tell Buildroot what is the configuration of
   this toolchain.

   See toolchain/toolchain-external/toolchain-external-arm-arm/ for an
   example.

 - You don't have such a pre-defined external toolchain publicly/easily
   available. In this case, just use the existing
   toolchain-external-custom package.

What you're doing in your patch is add another
"toolchain-external-custom" package, just named differently.

> diff --git a/DEVELOPERS b/DEVELOPERS
> index 53467da489..7cc5b0fe6e 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2261,3 +2261,9 @@ F:	package/qjson/
>  F:	package/quazip/
>  F:	package/shapelib/
>  F:	package/tinc/
> +
> +N:	Che-Wei Chuang <cnoize@andestech.com>
> +N:	Greentime Hu <greentime@andestech.com>
> +N:	Nylon Chen <nylon7@andestech.com>

I don't think we support having multiple names like this, there should
be a separate entry for each person.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
