From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Sep 2017 23:12:17 +0200
Subject: [Buildroot] [PATCH v2] package/xmlstarlet: fix host build
In-Reply-To: <20170902200741.2878-1-romain.naour@gmail.com>
References: <20170902200741.2878-1-romain.naour@gmail.com>
Message-ID: <20170902231217.530a9008@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  2 Sep 2017 22:07:41 +0200, Romain Naour wrote:

> Fixes:
> src/xml_C14N.c:12:31: erreur fatale?: libxml/xmlversion.h : No such file or directory
>  #include <libxml/xmlversion.h>
>                                ^
> In file included from src/trans.c:4:0:
> src/trans.h:32:30: erreur fatale?: libxml/xmlmemory.h : No such file or directory
>  #include <libxml/xmlmemory.h>

Still some french messages here, so I've fixed that.

> +HOST_XMLSTARLET_CONF_OPTS += \
> +	--with-libxml-prefix=$(HOST_DIR)/usr \
> +	--with-libxslt-prefix=$(HOST_DIR)/usr \
> +	--with-libiconv-prefix=$(HOST_DIR)/usr

The last option is not needed, we don't have libiconv on the host.

Committed with those issues fixed. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
