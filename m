From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Thu, 14 Aug 2014 10:43:50 -0400
Subject: [Buildroot] [PATCH] package/erlang: build host erlang with ssl
 support to match target
In-Reply-To: <1407968827-12487-1-git-send-email-yann.morin.1998@free.fr>
References: <1407968827-12487-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <CA+-urNTMEL0G0-CoWJ7-hfTSX8Ef-qprBY58s8d--m1sZFMUYg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Wed, Aug 13, 2014 at 6:27 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> If the target erlang has SSL support, so shoud the host-erlang.

This patch makes sense to me. I tried it in my setup to make sure that
everything still works fine and that host-erlang is really using
host-openssl. It looks good, so.

Tested-by: Frank Hunleth <fhunleth@troodon-software.com>

Thanks,
Frank

>
> Suggested-by: Frank Hunleth <fhunleth@troodon-software.com>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Frank Hunleth <fhunleth@troodon-software.com>
> Cc: Johan Oudinet <johan.oudinet@gmail.com>
>
> ---
> Note: I am not sure whether this is the correct solution, to match the
> host SSL support to the target SSL support. I'll let the erlang experts
> enhance that patch if need be. ;-)
> ---
>  package/erlang/erlang.mk | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/package/erlang/erlang.mk b/package/erlang/erlang.mk
> index 1278682..b7ff9c1 100644
> --- a/package/erlang/erlang.mk
> +++ b/package/erlang/erlang.mk
> @@ -34,8 +34,11 @@ endif
>  ifeq ($(BR2_PACKAGE_OPENSSL),y)
>  ERLANG_CONF_OPT += --with-ssl
>  ERLANG_DEPENDENCIES += openssl
> +HOST_ERLANG_DEPENDENCIES += host-openssl
> +HOST_ERLANG_CONF_OPT += --with-ssl=$(HOST_DIR)/usr
>  else
>  ERLANG_CONF_OPT += --without-ssl
> +HOST_ERLANG_CONF_OPT += --without-ssl
>  endif
>
>  ifeq ($(BR2_PACKAGE_ZLIB),y)
> --
> 1.9.1
>



-- 
Frank Hunleth
Troodon Software LLC
Embedded Software Development
http://troodon-software.com/
