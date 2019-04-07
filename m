From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 7 Apr 2019 14:20:52 +0200
Subject: [Buildroot] [PATCH 01/10] infra/pkg-download: return just a
 list of URIs
In-Reply-To: <75ae0630f1759fb589a3a9ed20daa918c246e819.1554637858.git.yann.morin.1998@free.fr>
References: <cover.1554637858.git.yann.morin.1998@free.fr>
 <75ae0630f1759fb589a3a9ed20daa918c246e819.1554637858.git.yann.morin.1998@free.fr>
Message-ID: <20190407142052.7287739d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

On Sun,  7 Apr 2019 13:51:16 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> @@ -101,7 +101,7 @@ define DOWNLOAD
>  		-N '$($(PKG)_RAWNAME)' \
>  		-o '$($(PKG)_DL_DIR)/$(notdir $(1))' \
>  		$(if $($(PKG)_GIT_SUBMODULES),-r) \
> -		$(DOWNLOAD_URIS) \
> +		$(patsubst %,-u %,$(DOWNLOAD_URIS)) \

A patsubst here feels a bit awkward. What about a foreach instead, i.e:

		$(foreach uri,$(DOWNLOAD_URIS),-u $(uri))

 ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
