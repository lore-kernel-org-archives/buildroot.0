From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 25 Apr 2018 22:43:19 +0200
Subject: [Buildroot] [PATCH 2/2] core/pkg-infra: don't enforce
 site-method for extra downloads
In-Reply-To: <58a86c2e2f56abb66012e88c26f5e8c1d6737a2d.1524685305.git.yann.morin.1998@free.fr>
References: <cover.1524685305.git.yann.morin.1998@free.fr>
 <58a86c2e2f56abb66012e88c26f5e8c1d6737a2d.1524685305.git.yann.morin.1998@free.fr>
Message-ID: <4acd322f-704d-c8a9-7c23-f78bcb43ab32@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On 25/04/2018 21:41, Yann E. MORIN wrote:
> The site method only ever applies to the main download, while extra
> downloads are always to be fetches with wget.
> 
> However, the site method is prepended to the URL from within the
> DOWNLOAD macro (well, a variable evaluated in the DOWNLOAD macro),
> which is called for each download of a package, thus effectively
> prepending the site method to all downloads, even the extra ones (and
> the patches).
> 
> We fix that by prepending the site method from within the
> generic-package infra, so that it only applies to the main download.
> 
> For that, we move the main _SOURCE out of the foreach loop, so that
> we can prepend the site-method to it, without impacting the other
> downloads.
> 
> Reported-by: Luca Ceresoli <luca@lucaceresoli.net>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

Thanks for such a prompt fix!

Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
Tested-by: Luca Ceresoli <luca@lucaceresoli.net>

-- 
Luca
