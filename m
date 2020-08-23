From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Aug 2020 19:06:50 +0200
Subject: [Buildroot] [git commit] package/php: drop
 BR2_PACKAGE_PHP_EXT_HASH
In-Reply-To: <20200823165655.328FB814F6@busybox.osuosl.org>
References: <20200823165655.328FB814F6@busybox.osuosl.org>
Message-ID: <20200823190650.7bc12a8a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 23 Aug 2020 19:03:20 +0200
Yann E. MORIN <yann.morin.1998@free.fr> wrote:

> commit: https://git.buildroot.net/buildroot/commit/?id=de9e0f1f00cc4491ef67722b93fb77040ef63043
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> hash extension can't be disabled since version 7.4.0 and
> https://github.com/php/php-src/commit/bf344425812b0f6156d0a8a54ed7bc38054f7636
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>  Config.in.legacy       | 6 ++++++
>  package/php/Config.ext | 7 -------
>  package/php/php.mk     | 1 -
>  3 files changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index cf7aaf75a5..957cbb8b3c 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,12 @@ endif
>  
>  comment "Legacy options removed in 2020.08"
>  
> +config BR2_PACKAGE_PHP_EXT_HASH
> +	bool "php hash extension is mandatory"
> +	select BR2_LEGACY
> +	help
> +	  Since php 7.4.0, hash extension can't be disabled.

In this sort of situation, we generally don't add any legacy handling.
Indeed, since the feature is now mandatory... the default behavior will
always be OK.

People who could be annoyed are people who had this feature disabled...
which is now always enabled. But the legacy handling will anyway not
help those people.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
