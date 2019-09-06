From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 6 Sep 2019 21:40:37 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-pip: bump to version
 19.2.3
In-Reply-To: <20190906181844.60466-1-aduskett@gmail.com>
References: <20190906181844.60466-1-aduskett@gmail.com>
Message-ID: <20190906214037.63e68b22@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  6 Sep 2019 11:18:44 -0700
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> Also:
>   Select PYTHON_SSL or PYTHON3_SSL as pip connects to https://pypi.org
>   making SSL mandatory for runtime.

Missing empty line before SoB line. But more importantly here you say
that you select PYTHON_SSL or PYTHON3_SSL, but...

> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
>  package/python-pip/Config.in       | 1 +
>  package/python-pip/python-pip.hash | 4 ++--
>  package/python-pip/python-pip.mk   | 4 ++--
>  3 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-pip/Config.in b/package/python-pip/Config.in
> index ac741da872..805dc01545 100644
> --- a/package/python-pip/Config.in
> +++ b/package/python-pip/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_PYTHON_PIP
>  	bool "python-pip"
>  	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
> +	select BR2_PACKAGE_PYTHON3_SSL

... you always select PYTHON3_SSL.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
