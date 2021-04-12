From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 12 Apr 2021 22:39:11 +0200
Subject: [Buildroot] [PATCH] package/python-flup: update dependency to
 python3
In-Reply-To: <20210412164405.16890-1-matthew.weber@rockwellcollins.com>
References: <20210412164405.16890-1-matthew.weber@rockwellcollins.com>
Message-ID: <20210412223911.1989281d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 12 Apr 2021 11:44:05 -0500
Matt Weber <matthew.weber@rockwellcollins.com> wrote:

> From: Jared Bents <jared.bents@rockwellcollins.com>
> 
> Dependency incorrectly calls out python, should be python3
> 
> Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
> Signed-off-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
> ---
>  package/python-flup/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/python-flup/Config.in b/package/python-flup/Config.in
> index 2c21323515..f40f250163 100644
> --- a/package/python-flup/Config.in
> +++ b/package/python-flup/Config.in
> @@ -1,6 +1,6 @@
>  config BR2_PACKAGE_PYTHON_FLUP
>  	bool "python-flup"
> -	depends on BR2_PACKAGE_PYTHON
> +	depends on BR2_PACKAGE_PYTHON3

Do we know since when this is the case? This package was introduced in
2014 as version 1.0.3.dev-20110405, and back then the commit log said
"Tested with ARM and Python 2.7.6". Then it was bumped to
1.0.3.dev20161029 by Adam in 2017, and again to 1.0.3 in 2019. Is it
this latest update that brought the python3 requirement ?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
