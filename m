From: Romain Naour <romain.naour@smile.fr>
Date: Tue, 4 Jul 2017 17:16:42 +0200
Subject: [Buildroot] [PATCH v3 13/14] pkg-python: use $(HOST_DIR)
 instead of $(HOST_DIR)/usr as prefix
In-Reply-To: <20170704140404.4098-14-arnout@mind.be>
References: <20170704140404.4098-1-arnout@mind.be>
 <20170704140404.4098-14-arnout@mind.be>
Message-ID: <80c0e801-eddb-ce58-fc53-abefc26fe6fb@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Le 04/07/2017 ? 16:04, Arnout Vandecappelle (Essensium/Mind) a ?crit :
> Remove the redundant usr/ component of the HOST_DIR paths. Since a
> previous commit added a symlink from $(HOST_DIR)/usr to $(HOST_DIR),
> everything keeps on working.
> 
> Build-tested with a bunch of python packages.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Reviewed-by: Romain Naour <romain.naour@smile.fr>

Best regards,
Romain

> ---
>  package/pkg-python.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/pkg-python.mk b/package/pkg-python.mk
> index 2418f5dfa4..6e411ab5c5 100644
> --- a/package/pkg-python.mk
> +++ b/package/pkg-python.mk
> @@ -53,7 +53,7 @@ HOST_PKG_PYTHON_DISTUTILS_ENV = \
>  	PYTHONNOUSERSITE=1
>  
>  HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPTS = \
> -	--prefix=$(HOST_DIR)/usr
> +	--prefix=$(HOST_DIR)
>  
>  # Target setuptools-based packages
>  PKG_PYTHON_SETUPTOOLS_ENV = \
> @@ -83,7 +83,7 @@ HOST_PKG_PYTHON_SETUPTOOLS_ENV = \
>  	PYTHONNOUSERSITE=1
>  
>  HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS = \
> -	--prefix=$(HOST_DIR)/usr
> +	--prefix=$(HOST_DIR)
>  
>  ################################################################################
>  # inner-python-package -- defines how the configuration, compilation
> 
