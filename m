From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 3 Mar 2020 22:49:13 +0100
Subject: [Buildroot] [PATCH 1/1] package/python-jinja2: fix async
 removal paths
In-Reply-To: <20200229011155.10706-1-james.hilliard1@gmail.com>
References: <20200229011155.10706-1-james.hilliard1@gmail.com>
Message-ID: <20200303214913.GF12449@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James, All,

On 2020-02-28 18:11 -0700, James Hilliard spake thusly:
> Fixes:
> http://autobuild.buildroot.net/results/dd5/dd5f151b2c9872476ab63c529468d0b37a0374f5/
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/python-jinja2/python-jinja2.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/python-jinja2/python-jinja2.mk b/package/python-jinja2/python-jinja2.mk
> index 189b75d18f..64b4c60c9b 100644
> --- a/package/python-jinja2/python-jinja2.mk
> +++ b/package/python-jinja2/python-jinja2.mk
> @@ -20,7 +20,7 @@ HOST_PYTHON_JINJA2_DEPENDENCIES = host-python-markupsafe
>  # Hence remove both files after package extraction.
>  ifeq ($(BR2_PACKAGE_PYTHON),y)
>  define PYTHON_JINJA2_REMOVE_ASYNC_SUPPORT
> -	rm $(@D)/jinja2/asyncsupport.py $(@D)/jinja2/asyncfilters.py
> +	rm $(@D)/src/jinja2/asyncsupport.py $(@D)/src/jinja2/asyncfilters.py
>  endef
>  
>  PYTHON_JINJA2_POST_EXTRACT_HOOKS = PYTHON_JINJA2_REMOVE_ASYNC_SUPPORT
> -- 
> 2.20.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
