From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Apr 2020 23:38:35 +0200
Subject: [Buildroot] [PATCH v3,1/6] package/collectd: drop autoreconf
In-Reply-To: <20200415063008.2237470-1-fontaine.fabrice@gmail.com>
References: <20200415063008.2237470-1-fontaine.fabrice@gmail.com>
Message-ID: <20200419213835.GE5035@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-04-15 08:30 +0200, Fabrice Fontaine spake thusly:
> autoreconf is not needed since bump to version 5.11.0 in commit
> 57adbfc482454e3fb17172626b2dc971afaf5cfd which dropped patch
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Patches 1 and 2 applied to master, thanks. I'm deffering the rest of the
series for a while, waiting for feedback from the other maintainers...

Regards,
Yann E. MORIN.

> ---
>  package/collectd/collectd.mk | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
> index c09edebfc9..dda15b0162 100644
> --- a/package/collectd/collectd.mk
> +++ b/package/collectd/collectd.mk
> @@ -12,8 +12,6 @@ COLLECTD_CONF_ENV = ac_cv_lib_yajl_yajl_alloc=yes
>  COLLECTD_INSTALL_STAGING = YES
>  COLLECTD_LICENSE = MIT (daemon, plugins), GPL-2.0 (plugins), LGPL-2.1 (plugins)
>  COLLECTD_LICENSE_FILES = COPYING
> -# We're patching configure.ac
> -COLLECTD_AUTORECONF = YES
>  
>  # These require unmet dependencies, are fringe, pointless or deprecated
>  COLLECTD_PLUGINS_DISABLE = \
> -- 
> 2.25.1
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
