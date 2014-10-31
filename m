From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 31 Oct 2014 16:39:19 +0100
Subject: [Buildroot] [PATCH v2 3/3] mysql: use /etc/ld.so.conf.d instead
 of /etc/ld.so.conf
In-Reply-To: <1414768749-15134-3-git-send-email-jezz@sysmic.org>
References: <1414768749-15134-1-git-send-email-jezz@sysmic.org>
 <1414768749-15134-3-git-send-email-jezz@sysmic.org>
Message-ID: <20141031163919.4e436a70@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?me Pouiller,

On Fri, 31 Oct 2014 16:19:09 +0100, J?r?me Pouiller wrote:

>  define MYSQL_ADD_MYSQL_LIB_PATH
> -	echo "/usr/lib/mysql" >> $(TARGET_DIR)/etc/ld.so.conf
> +	$(INSTALL) -d $(TARGET_DIR)/etc/ld.so.conf.d
> +	$(INSTALL) -m 644 \
> +		package/mysql g/ld.so.conf.d-mysql.conf \
> +		$(TARGET_DIR)/etc/ld.so.conf.d
>  endef

Does this works with uClibc?

The gst-fsl-plugins package is limited to glibc, so we don't care. But
mysql is supported with uClibc, and I'm not sure uClibc
supports /etc/ld.so.conf.d/.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
