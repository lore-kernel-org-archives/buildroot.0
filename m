From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Jul 2016 17:30:33 +0200
Subject: [Buildroot] [PATCH 01/13] package/gcc: use BR2_USE_WCHAR to set
 gcc libquadmath option
In-Reply-To: <1467040287-39390-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1467040287-39390-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20160701173033.40f03bf4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 27 Jun 2016 16:11:15 +0100, Vicente Olivert Riera wrote:
> From: Samuel Martin <s.martin49@gmail.com>
> 
> BR2_TOOLCHAIN_BUILDROOT_WCHAR is only defined when uclibc is selected, whereas
> BR2_USE_WCHAR is always defined.
> 
> So, use BR2_USE_WCHAR to drive the gcc libquadmath option.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

I've applied, after doing some tweaks, see below.

> ---
>  package/gcc/gcc.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
> index 46f05ff..88d2bc2 100644
> --- a/package/gcc/gcc.mk
> +++ b/package/gcc/gcc.mk
> @@ -107,7 +107,7 @@ HOST_GCC_COMMON_CONF_OPTS += --disable-libitm
>  endif
>  
>  # gcc 4.6.x quadmath requires wchar

I've updated this commit, because the requirement on wchar doesn't
apply just to gcc 4.6. It applies *since* 4.6, because that's when
libquadmath was introduced.

> -ifneq ($(BR2_TOOLCHAIN_BUILDROOT_WCHAR),y)
> +ifneq ($(BR2_USE_WCHAR),y)

And I've inverted the condition to use positive logic:

ifeq ($(BR2_USE_WCHAR),)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
