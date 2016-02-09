From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 9 Feb 2016 22:53:33 +0100
Subject: [Buildroot] [PATCH 1/1] libuci: correct lua path
In-Reply-To: <1455023857-27794-1-git-send-email-Neha.Bairathi@imgtec.com>
References: <1455023857-27794-1-git-send-email-Neha.Bairathi@imgtec.com>
Message-ID: <56BA5FDD.9090905@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09-02-16 14:17, Neha Bairathi wrote:
> LUAPATH is used as the path for installing lua binding.
> As buildroot specifies the install prefix, STAGING_DIR gets
> appended to TARGET_DIR which is incorrect path for installation,
> so use relative path.
> 
> Reviewed-by: Abhimanyu Vishwakarma <Abhimanyu.Vishwakarma@imgtec.com>
> Reviewed-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
> Signed-off-by: Neha Bairathi <Neha.Bairathi@imgtec.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Checked that it is only used to set the INSTALL command's DESTINATION argument,
and that means that DESTDIR will indeed be prefixed to it.

 Regards,
 Arnout

> ---
>  package/libuci/libuci.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libuci/libuci.mk b/package/libuci/libuci.mk
> index a78048d..8c060d5 100644
> --- a/package/libuci/libuci.mk
> +++ b/package/libuci/libuci.mk
> @@ -13,7 +13,7 @@ LIBUCI_DEPENDENCIES = libubox
>  ifeq ($(BR2_PACKAGE_LUA_5_1),y)
>  LIBUCI_DEPENDENCIES += lua
>  LIBUCI_CONF_OPTS += -DBUILD_LUA=ON \
> -	-DLUAPATH=$(STAGING_DIR)/usr/lib/lua/5.1 \
> +	-DLUAPATH=/usr/lib/lua/5.1 \
>  	-DLUA_CFLAGS=-I$(STAGING_DIR)/usr/include
>  else
>  LIBUCI_CONF_OPTS += -DBUILD_LUA=OFF
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
