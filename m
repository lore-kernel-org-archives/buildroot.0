From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 31 Dec 2019 10:17:10 +0100
Subject: [Buildroot] [RFC PATCH 1/1] libcap: always build static version
In-Reply-To: <20191108094119.6749-1-patrick.havelange@essensium.com>
References: <20191108094119.6749-1-patrick.havelange@essensium.com>
Message-ID: <20191231091710.GC26395@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patrick, All,

On 2019-11-08 10:41 +0100, Patrick Havelange spake thusly:
> Some tools require a static libcap to be able to be built. This is
> the case for lxc's init.lxc.static binary. As it is currently not
> possible to depend explicitely on a specific static library only,
> this patch always builds the static version of libcap.
> 
> We could also do this only when building lxc, however this would
> make things more complicated inside libcap.mk, and would not bring
> us that much as the static lib is not installed on target anyway.
> This also reverts the previous commit
> 7984f2d97b4271c14e0922ef22027edaedd78e59.
> 
> Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>
> 
> ---
> This patch was originally developped for the Lxc test, however
> the init.lxc.static is only used when there is no init system
> specified for the container. Thus it is no longer required for the
> test. However somebody might still need it.

Your use-case is not entirely obvious, and you explain here that this
patch is not even needed for your use-case.

As discussed with Thomas on IRC, we decided to reject this patch.

If you feel like you really need it, please resubmit with a proper
explanation for the use-case.

Regards,
Yann E. MORIN.

> ---
>  package/libcap/libcap.mk | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
> index 4919a4adca..23888c4682 100644
> --- a/package/libcap/libcap.mk
> +++ b/package/libcap/libcap.mk
> @@ -18,9 +18,6 @@ HOST_LIBCAP_DEPENDENCIES = host-gperf
>  ifeq ($(BR2_STATIC_LIBS),y)
>  LIBCAP_MAKE_TARGET = libcap.a libcap.pc
>  LIBCAP_MAKE_INSTALL_TARGET = install-static
> -else ifeq ($(BR2_SHARED_LIBS),y)
> -LIBCAP_MAKE_TARGET = all
> -LIBCAP_MAKE_INSTALL_TARGET = install-shared
>  else
>  LIBCAP_MAKE_TARGET = all
>  LIBCAP_MAKE_INSTALL_TARGET = install
> -- 
> 2.17.1
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
