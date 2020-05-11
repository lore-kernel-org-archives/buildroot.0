From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 11 May 2020 23:13:20 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-future: fix dependency
In-Reply-To: <20200511184253.77689-1-aussedat.louis@gmail.com>
References: <20200511184253.77689-1-aussedat.louis@gmail.com>
Message-ID: <20200511231320.75b4914e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 11 May 2020 20:42:53 +0200
Louis Aussedat <aussedat.louis@gmail.com> wrote:

> python-future does not depends on python2.
> The package work with python 3.x.
> 
> Signed-off-by: Louis Aussedat <aussedat.louis@gmail.com>
> ---
>  package/python-future/Config.in | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/package/python-future/Config.in b/package/python-future/Config.in
> index 29303f334d..8a3fd38f36 100644
> --- a/package/python-future/Config.in
> +++ b/package/python-future/Config.in
> @@ -1,6 +1,5 @@
>  config BR2_PACKAGE_PYTHON_FUTURE
>  	bool "python-future"
> -	depends on BR2_PACKAGE_PYTHON
>  	help
>  	  Easy, clean, reliable Python 2/3 compatibility.

But is it useful for Python 3.x ? I thought it was providing Python 3.x
features to Python 2.x.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
