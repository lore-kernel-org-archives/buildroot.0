From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Apr 2018 23:37:41 +0200
Subject: [Buildroot] [PATCH 2/2] python-watchdog: add missing runtime
 dependency
In-Reply-To: <1518787921-32089-2-git-send-email-yegorslists@googlemail.com>
References: <1518787921-32089-1-git-send-email-yegorslists@googlemail.com>
 <1518787921-32089-2-git-send-email-yegorslists@googlemail.com>
Message-ID: <20180428233741.15a41dca@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 16 Feb 2018 14:32:01 +0100, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Script watchmedo requires python-setuptools.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/python-watchdog/Config.in | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/package/python-watchdog/Config.in b/package/python-watchdog/Config.in
> index e529089..18f569e 100644
> --- a/package/python-watchdog/Config.in
> +++ b/package/python-watchdog/Config.in
> @@ -1,8 +1,9 @@
>  config BR2_PACKAGE_PYTHON_WATCHDOG
>  	bool "python-watchdog"
> -	select BR2_PACKAGE_PYTHON_PYYAML
> -	select BR2_PACKAGE_PYTHON_ARGH
> -	select BR2_PACKAGE_PYTHON_PATHTOOLS
> +	select BR2_PACKAGE_PYTHON_ARGH # runtime
> +	select BR2_PACKAGE_PYTHON_PATHTOOLS # runtime
> +	select BR2_PACKAGE_PYTHON_PYYAML # runtime
> +	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime

I applied, but since this dependency is only needed for the
watchmedo.py script, does it make sense to make this a mandatory
dependency ?

Also, skimming through the watchmedo.py script, I couldn't see what was
bringing this dependecny on setuptools. Could you enlighten me (it's
mainly for my own curiosity, I trust you when you said it was needed).

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
