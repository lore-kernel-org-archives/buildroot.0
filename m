From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Dec 2015 22:27:05 +0100
Subject: [Buildroot] [PATCH v2 3/3] python-tornado: bump to 4.3
In-Reply-To: <1450251372-7064-3-git-send-email-yegorslists@googlemail.com>
References: <1450251372-7064-1-git-send-email-yegorslists@googlemail.com>
 <1450251372-7064-3-git-send-email-yegorslists@googlemail.com>
Message-ID: <20151218222705.6d477414@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 16 Dec 2015 08:36:12 +0100, yegorslists at googlemail.com wrote:

> diff --git a/package/python-tornado/Config.in b/package/python-tornado/Config.in
> index 85c7891..ac86682 100644
> --- a/package/python-tornado/Config.in
> +++ b/package/python-tornado/Config.in
> @@ -2,6 +2,8 @@ config BR2_PACKAGE_PYTHON_TORNADO
>  	bool "python-tornado"
>  	select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON # runtime
>  	select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3 # runtime
> +	select BR2_PACKAGE_PYTHON_SINGLEDISPATCH if BR2_PACKAGE_PYTHON # runtime
> +	select BR2_PACKAGE_PYTHON_BACKPORTS_ABC	# runtime

So I guess that the plan is to make this a Python 2 dependency only
once we bump Python 3 to 3.5, right ?

Other than that, applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
