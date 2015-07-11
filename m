From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jul 2015 09:25:43 +0200
Subject: [Buildroot] [PATCH 1/5] nano: work around broken syntax
 highlighting regexes
In-Reply-To: <1432838510-1848-1-git-send-email-pmjdebruijn@pcode.nl>
References: <1432838510-1848-1-git-send-email-pmjdebruijn@pcode.nl>
Message-ID: <20150711092543.650825fb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Pascal de Bruijn,

On Thu, 28 May 2015 20:41:46 +0200, Pascal de Bruijn wrote:
> Signed-off-by: Pascal de Bruijn <pmjdebruijn@pcode.nl>
> ---
>  package/nano/nano.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/nano/nano.mk b/package/nano/nano.mk
> index 4d47fdb..c6eb29c 100644
> --- a/package/nano/nano.mk
> +++ b/package/nano/nano.mk
> @@ -11,6 +11,9 @@ NANO_LICENSE_FILES = COPYING
>  NANO_CONF_OPTS = --without-slang
>  NANO_DEPENDENCIES = ncurses
>  
> +# work around broken syntax highlighting regexes
> +NANO_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -DGNU_WORDBOUNDS=1"
> +

There was a ./configure option --with-wordbounds to also do this, so I
use that instead of fiddling with CFLAGS.

Committed with that change, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
