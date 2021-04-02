From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 2 Apr 2021 23:54:50 +0200
Subject: [Buildroot] [PATCH 3/3] package/qpid-proton: fix build without
 C++
In-Reply-To: <20210402163343.1254491-3-fontaine.fabrice@gmail.com>
References: <20210402163343.1254491-1-fontaine.fabrice@gmail.com>
 <20210402163343.1254491-3-fontaine.fabrice@gmail.com>
Message-ID: <20210402215450.GM24043@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-04-02 18:33 +0200, Fabrice Fontaine spake thusly:
> Fixes:
>  - http://autobuild.buildroot.org/results/05f344151100219c159ca4d466a453df96bf07fa
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, with the following changes:

  - move code in thread condition, to avoid setting -DBUILD_CPP twice

Thanks!

Regards,
Yann E. MORIN.

> ---
>  package/qpid-proton/qpid-proton.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/qpid-proton/qpid-proton.mk b/package/qpid-proton/qpid-proton.mk
> index bbf953c472..ce1f0af773 100644
> --- a/package/qpid-proton/qpid-proton.mk
> +++ b/package/qpid-proton/qpid-proton.mk
> @@ -31,6 +31,12 @@ QPID_PROTON_CONF_OPTS = \
>  	-DENABLE_WARNING_ERROR=OFF \
>  	-DPYTHON_EXECUTABLE=$(HOST_DIR)/bin/python2
>  
> +ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
> +QPID_PROTON_CONF_OPTS += -DBUILD_CPP=ON
> +else
> +QPID_PROTON_CONF_OPTS += -DBUILD_CPP=OFF
> +endif
> +
>  # epoll proactor unconditionally uses pthread and cpp binding unconditionally
>  # uses proactor
>  ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
> -- 
> 2.30.2
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
