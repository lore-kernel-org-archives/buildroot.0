From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 12 Feb 2013 15:20:35 +0100
Subject: [Buildroot] [PATCH 4/5] python-bottle: Convert package to be
 used with python2 or python3
In-Reply-To: <1360678441-3199-5-git-send-email-kpa_info@yahoo.fr>
References: <1360678441-3199-1-git-send-email-kpa_info@yahoo.fr>
 <1360678441-3199-5-git-send-email-kpa_info@yahoo.fr>
Message-ID: <20130212152035.39a97720@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Patrick Gerber,

On Tue, 12 Feb 2013 15:14:00 +0100, Patrick Gerber wrote:
> 
> Signed-off-by: Patrick Gerber <kpa_info@yahoo.fr>
> ---
>  package/python-bottle/Config.in        |    1 +
>  package/python-bottle/python-bottle.mk |    2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/python-bottle/Config.in b/package/python-bottle/Config.in
> index f9b60ca..e6f2f3b 100644
> --- a/package/python-bottle/Config.in
> +++ b/package/python-bottle/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_PYTHON_BOTTLE
>  	bool "python-bottle"
> +	depends on (BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3)

This change is useless, since the python-bottle package is only
available when either BR2_PACKAGE_PYTHON or BR2_PACKAGE_PYTHON3 are
enabled:

+if (BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3)
+menu "external python modules"
+source "package/python-bottle/Config.in"

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
