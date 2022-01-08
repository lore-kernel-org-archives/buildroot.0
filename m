Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BB5BC433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 13:09:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7BA9402E1;
	Sat,  8 Jan 2022 13:09:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jDo2g1NDQbTI; Sat,  8 Jan 2022 13:09:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 070F84033D;
	Sat,  8 Jan 2022 13:09:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7CD5B1BF301
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 13:09:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 68A24813BD
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 13:09:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k7ewSUKenH-w for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 13:09:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 785AC813B1
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 13:09:30 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id e9so15151944wra.2
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 05:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=Nz4kUs9LIz4RPuSGkpqDVbhgNwoyId1aHufQnyPYa/E=;
 b=IPgciOs7Der2Zl5GG6Q5BK/cnlWXVfk8yhm/sH4IERIv+lsMl+xNHaNTd7Eq3DRyez
 OuBgzM3QY+Gw26Dk7LM2rO2AxBfLS/molbKo8zSUYWGNkxHBRUsdkQ0W6quurD11i31h
 w9no7CdkIKbx6l4YFdRbuiEBJzrlg0VW+Z8QYimYbToAZc4t2Z4fxByjj3W8JUB3ck9y
 I8LI0NWqUxIBBVXvqgWzgQjNBi8pA9FJfdN2SopntN+GsgsVJYBvY9Oe6wkEdV3Vt/PH
 iu7gCNAOZOT8jbftWEbnF1PkMcl30UvwhG3T4tsPbD2XKwj//P4TELLZa9WXVFH5yiWM
 R7Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Nz4kUs9LIz4RPuSGkpqDVbhgNwoyId1aHufQnyPYa/E=;
 b=cz2rOc7bejWemFUNKFxfb/V7wNE7pxQQV6cX9G1tCUdiaFcCFtf55DVB3YDPHrMGl7
 FyMt9LBj+X3d92i9zwHswl7DA8s/0FYlRDyGK9hsLC/0JlroSt7Ys3tVe8ddwAeZilbP
 0fOuFkzvfEAtd6rP0LaBCGWRwKK6Ht73BBWA3VUybIBoqTaJk9Veu+5/mlQVAKuOQsfx
 /cJPmMuiz5KvEZABmTtjWFw4MZmvbhpApvGSZxkbBPIDhgV21+xwAYcPGllR8k+yZYK/
 8GSL7K5LXz/HOTPGrlh5ss4lj3/OObQaZMxegt1eQ2laXfyylUeLpwifW9LLSP/Eh6hK
 bvcg==
X-Gm-Message-State: AOAM531vQEYHnvgjI/GE6J/gcvgFTCYn7jK0/y/S2ztjO6XPr1H7ZISm
 yELGiH50PrTGXVfaW8EfmJYsF8E/g1RXGIRc
X-Google-Smtp-Source: ABdhPJz3VBmnuAPO2I4kOhyMNZFpvv5MMIYYfZFkLabnmSF4j0zxkXUvKDqFaFBdadU1aytIIzAapQ==
X-Received: by 2002:a5d:618e:: with SMTP id j14mr782378wru.136.1641647368401; 
 Sat, 08 Jan 2022 05:09:28 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id m5sm1372573wml.48.2022.01.08.05.09.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Jan 2022 05:09:28 -0800 (PST)
Message-ID: <4e5386f0-4fda-d2ea-fcc8-12e05c509e64@mind.be>
Date: Sat, 8 Jan 2022 14:09:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Alexey Lukyanchuk <skif@skif-web.ru>, buildroot@buildroot.org
References: <20200423071752.23893-1-skif@skif-web.ru>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20200423071752.23893-1-skif@skif-web.ru>
Subject: Re: [Buildroot] [PATCH 1/1] package/zabbix: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 23/04/2020 09:17, Alexey Lukyanchuk wrote:
> Signed-off-by: Alexey Lukyanchuk <skif@skif-web.ru>

  Applied to master, thanks. I made the following changes.

      - BR2_TOOLCHAIN_USES_GLIBC implies the other glibc options.
      - Fix wrapping in Config.in help text.
      - Add upstream URL.
      - Protect comments with "depends on" instead of "if".
      - Select postgresl/mysql instead of depends (and propagate
        dependencies).
      - Remove redundant condition around
        BR2_PACKAGE_ZABBIX_SERVER_COPY_DUMPS.
      - Select PHP extensions instead of depends.
      - Make optional dependencies automatic instead of Config.in.
      - Improve some of the help texts.
      - Bump to 5.4.9 and update hashes.
      - Add COPYING as license file.
      - Switch to actual upstream at zabbix.com.
      - Explicitly disable all unused features.
      - Disable zabbix user login with '*'.
      - Don't add user to zabbix group twice.
      - Do patch of zabbix_*.conf in post-patch hook and do it for all conf
        files in one shot.
      - Remove workarounds for pending patches (which were merged).
      - Put web ui in /var/www/zabbix and SQL files in /var/lib/zabbix.

  Sorry it took so long, but it still took me three hours to make all of the 
above fixes and maintainer time is scarce.

  Regards,
  Arnout

> ---
>   DEVELOPERS                           |   3 +
>   package/Config.in                    |   1 +
>   package/zabbix/Config.in             | 122 +++++++++++++++++++++
>   package/zabbix/zabbix-agent.service  |  17 +++
>   package/zabbix/zabbix-server.service |  17 +++
>   package/zabbix/zabbix.hash           |   3 +
>   package/zabbix/zabbix.mk             | 154 +++++++++++++++++++++++++++
>   7 files changed, 317 insertions(+)
>   create mode 100644 package/zabbix/Config.in
>   create mode 100644 package/zabbix/zabbix-agent.service
>   create mode 100644 package/zabbix/zabbix-server.service
>   create mode 100644 package/zabbix/zabbix.hash
>   create mode 100644 package/zabbix/zabbix.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index c57bc1c5c9..08a9aadf72 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -155,6 +155,9 @@ N:	Alexey Brodkin <alexey.brodkin@synopsys.com>
>   F:	board/cubietech/cubieboard2/
>   F:	configs/cubieboard2_defconfig
>   
> +N:	Alexey Lukyanchuk <skif@skif-web.ru>
> +F:	package/zabbix/
> +
>   N:	Alistair Francis <alistair@alistair23.me>
>   F:	board/sifive/
>   F:	boot/opensbi/
> diff --git a/package/Config.in b/package/Config.in
> index a9c6f6fcbc..aa244812db 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -2234,6 +2234,7 @@ endif
>   	source "package/xinetd/Config.in"
>   	source "package/xl2tp/Config.in"
>   	source "package/xtables-addons/Config.in"
> +	source "package/zabbix/Config.in"
>   	source "package/znc/Config.in"
>   
>   endmenu
> diff --git a/package/zabbix/Config.in b/package/zabbix/Config.in
> new file mode 100644
> index 0000000000..0ce60a37e5
> --- /dev/null
> +++ b/package/zabbix/Config.in
> @@ -0,0 +1,122 @@
> +config BR2_PACKAGE_ZABBIX
> +	bool "zabbix"
> +	depends on BR2_TOOLCHAIN_USES_GLIBC=y || BR2_TOOLCHAIN_EXTERNAL_GLIBC=y || BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
> +	select BR2_PACKAGE_PCRE
> +	help
> +	  Zabbix is an enterprise-class open source distributed
> +	  monitoring solution.Zabbix is free of cost. Zabbix
> +	  is written and distributed under the GPL General Public
> +	  License version 2.
> +
> +if (!BR2_TOOLCHAIN_USES_GLIBC && !BR2_TOOLCHAIN_EXTERNAL_GLIBC && !BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC)
> +comment "zabbix need glibc"
> +endif
> +
> +if BR2_PACKAGE_ZABBIX
> +
> +if (!BR2_PACKAGE_POSTGRESQL && !BR2_PACKAGE_MYSQL)
> +comment "zabbix server needs postgresql or mysql support"
> +endif
> +
> +config BR2_PACKAGE_ZABBIX_SERVER
> +	bool "zabbix server"
> +	depends on BR2_PACKAGE_POSTGRESQL || BR2_PACKAGE_MYSQL
> +	select BR2_PACKAGE_ZLIB
> +	select BR2_PACKAGE_LIBEVENT
> +
> +if BR2_PACKAGE_ZABBIX_SERVER
> +
> +choice
> +	prompt "server database backend"
> +
> +config BR2_PACKAGE_ZABBIX_SERVER_MYSQL
> +	bool "mysql"
> +	depends on BR2_PACKAGE_MYSQL
> +
> +config BR2_PACKAGE_ZABBIX_SERVER_POSTGRESQL
> +	bool "postgresql"
> +	depends on BR2_PACKAGE_POSTGRESQL
> +
> +endchoice
> +
> +if BR2_PACKAGE_ZABBIX_SERVER_POSTGRESQL || BR2_PACKAGE_ZABBIX_SERVER_MYSQL
> +config BR2_PACKAGE_ZABBIX_SERVER_COPY_DUMPS
> +	bool "install sql dumps"
> +	help
> +	  Copy inicitial database dumps to /usr/zabbix/
> +endif
> +
> +if (!BR2_PACKAGE_PHP || (!BR2_PACKAGE_PHP_EXT_MYSQLI && !BR2_PACKAGE_PHP_EXT_PGSQL) || \
> +	!BR2_PACKAGE_PHP_EXT_MBSTRING || !BR2_PACKAGE_PHP_EXT_BCMATH || \
> +	!BR2_PACKAGE_PHP_EXT_SOCKETS || !BR2_PACKAGE_PHP_EXT_GD || \
> +	!BR2_PACKAGE_PHP_EXT_LIBXML2 || !BR2_PACKAGE_PHP_EXT_CTYPE || \
> +	!BR2_PACKAGE_PHP_EXT_SESSION || !BR2_PACKAGE_PHP_EXT_XMLREADER || \
> +	!BR2_PACKAGE_PHP_EXT_XMLWRITER )
> +comment "zabbix-frontend need php with extensions(bc, sockets, "
> +comment "mbstring, gd, libxml2, ctype, session, xmlreader, xmlwriter, mysql or postgresql"
> +endif
> +
> +choice
> +	prompt "server ssl/tls backend"
> +
> +config BR2_PACKAGE_ZABBIX_SERVER_NOTLS
> +	bool "none"
> +
> +config BR2_PACKAGE_ZABBIX_SERVER_OPENSSL
> +	bool "openssl"
> +	depends on BR2_PACKAGE_OPENSSL
> +
> +config BR2_PACKAGE_ZABBIX_SERVER_GNUTLS
> +	bool "gnutls"
> +	depends on BR2_PACKAGE_GNUTLS
> +
> +endchoice
> +
> +config BR2_PACKAGE_ZABBIX_SERVER_OPENIPMI
> +	bool "openipmi support"
> +	select BR2_PACKAGE_OPENIPMI
> +
> +config BR2_PACKAGE_ZABBIX_SERVER_LIBSSH2
> +	bool "libssh2 support"
> +	select BR2_PACKAGE_LIBSSH2
> +
> +config BR2_PACKAGE_ZABBIX_SERVER_LDAP
> +	bool "openldap support"
> +	select BR2_PACKAGE_OPENLDAP
> +
> +if (!BR2_USE_MMU)
> +comment "netsnmp support need MMU"
> +endif
> +
> +config BR2_PACKAGE_ZABBIX_SERVER_NETSNMP
> +	bool "net-snmp support"
> +	depends on BR2_USE_MMU # netsnmp
> +	select BR2_PACKAGE_NETSNMP
> +
> +config BR2_PACKAGE_ZABBIX_SERVER_LIBCURL
> +	bool "libcurl support"
> +	select BR2_PACKAGE_LIBCURL
> +
> +config BR2_PACKAGE_ZABBIX_SERVER_LIBXML2
> +	bool "libxml2 support"
> +	select BR2_PACKAGE_LIBXML2
> +
> +config BR2_PACKAGE_ZABBIX_SERVER_COPY_FRONTEND
> +	bool "copy php-frontend to target"
> +	depends on BR2_PACKAGE_PHP
> +	depends on BR2_PACKAGE_PHP_EXT_MYSQLI || BR2_PACKAGE_PHP_EXT_PGSQL
> +	depends on BR2_PACKAGE_PHP_EXT_BCMATH
> +	depends on BR2_PACKAGE_PHP_EXT_SOCKETS
> +	depends on BR2_PACKAGE_PHP_EXT_MBSTRING
> +	depends on BR2_PACKAGE_PHP_EXT_GD
> +	depends on BR2_PACKAGE_PHP_EXT_LIBXML2
> +	depends on BR2_PACKAGE_PHP_EXT_CTYPE
> +	depends on BR2_PACKAGE_PHP_EXT_SESSION
> +	depends on BR2_PACKAGE_PHP_EXT_XMLREADER
> +	depends on BR2_PACKAGE_PHP_EXT_XMLWRITER
> +	help
> +	  copy web-frontend to /usr/zabbix/php-frontend
> +
> +endif
> +
> +endif
> diff --git a/package/zabbix/zabbix-agent.service b/package/zabbix/zabbix-agent.service
> new file mode 100644
> index 0000000000..8b4f45a4fc
> --- /dev/null
> +++ b/package/zabbix/zabbix-agent.service
> @@ -0,0 +1,17 @@
> +[Unit]
> +Description=Zabbix Agent Daemon
> +After=network.target
> +
> +[Service]
> +Type=forking
> +ExecStart=/usr/sbin/zabbix_agentd
> +ExecReload=/usr/sbin/zabbix_agentd -R config_cache_reload
> +RuntimeDirectory=zabbix
> +PIDFile=/run/zabbix/zabbix_agentd.pid
> +User=zabbix
> +Group=zabbix
> +WatchdogSec=30s
> +Restart=on-failure
> +
> +[Install]
> +WantedBy=multi-user.target
> diff --git a/package/zabbix/zabbix-server.service b/package/zabbix/zabbix-server.service
> new file mode 100644
> index 0000000000..b8ba0d1707
> --- /dev/null
> +++ b/package/zabbix/zabbix-server.service
> @@ -0,0 +1,17 @@
> +[Unit]
> +Description=Zabbix Server Daemon
> +After=network.target
> +
> +[Service]
> +Type=forking
> +ExecStart=/usr/sbin/zabbix_server
> +ExecReload=/usr/sbin/zabbix_server -R config_cache_reload
> +RuntimeDirectory=zabbix
> +PIDFile=/run/zabbix/zabbix_server.pid
> +User=zabbix
> +Group=zabbix
> +WatchdogSec=30s
> +Restart=on-failure
> +
> +[Install]
> +WantedBy=multi-user.target
> diff --git a/package/zabbix/zabbix.hash b/package/zabbix/zabbix.hash
> new file mode 100644
> index 0000000000..5c4207f168
> --- /dev/null
> +++ b/package/zabbix/zabbix.hash
> @@ -0,0 +1,3 @@
> +# Locally computed
> +sha256  22bb28e667424ad4688f47732853f4241df0e78a7607727b043d704ba726ae0e  zabbix-4.4.6.tar.gz
> +sha256  a823e00bc7f0844874f90fee97136f178e7debc76bace5f09e15ee8ed55f04c3  README
> diff --git a/package/zabbix/zabbix.mk b/package/zabbix/zabbix.mk
> new file mode 100644
> index 0000000000..a75914a816
> --- /dev/null
> +++ b/package/zabbix/zabbix.mk
> @@ -0,0 +1,154 @@
> +################################################################################
> +#
> +# zabbix
> +#
> +################################################################################
> +
> +ZABBIX_VERSION = 4.4.6
> +ZABBIX_SITE = https://sourceforge.net/projects/zabbix/files
> +ZABBIX_LICENSE = GPL-2.0
> +ZABBIX_LICENSE_FILES = README
> +
> +ZABBIX_DEPENDENCIES = pcre
> +ZABBIX_CONF_OPTS = --with-libpcre=$(STAGING_DIR)/usr/bin/ \
> +	--enable-agent
> +
> +ZABBIX_POST_INSTALL_TARGET_HOOKS += ZABBIX_CLIENT_CHANGE_PIDFILE_LOCATION
> +ZABBIX_SYSTEMD_UNITS += zabbix-agent.service
> +
> +define ZABBIX_INSTALL_INIT_SYSTEMD
> +	$(foreach unit,$(ZABBIX_SYSTEMD_UNITS),\
> +		$(INSTALL) -D -m 0644 $(ZABBIX_PKGDIR)/$(unit) $(TARGET_DIR)/usr/lib/systemd/system/$(unit) && \
> +		mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants && \
> +		ln -fs -r $(TARGET_DIR)/usr/lib/systemd/system/$(unit) $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/$(unit)
> +	)
> +endef
> +
> +define ZABBIX_USERS
> +	zabbix -1 zabbix -1 !- /var/lib/zabbix - zabbix zabbix user
> +endef
> +
> +define ZABBIX_CLIENT_CHANGE_PIDFILE_LOCATION
> +	$(SED) 's%\#\ PidFile=/tmp/zabbix_agentd.pid%PidFile=/run/zabbix/zabbix_agentd.pid%g' $(TARGET_DIR)/etc/zabbix_agentd.conf
> +endef
> +
> +ifeq ($(BR2_PACKAGE_ZABBIX_SERVER),y)
> +ZABBIX_SYSTEMD_UNITS += zabbix-server.service
> +ZABBIX_CONF_OPTS += --enable-server \
> +	--with-libevent \
> +	--with-libpthread=$(STAGING_DIR)/usr \
> +	--with-zlib=$(STAGING_DIR)/usr
> +ZABBIX_DEPENDENCIES += libevent zlib
> +ZABBIX_POST_INSTALL_TARGET_HOOKS += ZABBIX_SERVER_CHANGE_PIDFILE_LOCATION
> +
> +# Need openipmi in staging dir. Patch submitted at 2019.12.16
> +# Before this patch enabled, use this crutch
> +ifeq ($(BR2_PACKAGE_ZABBIX_SERVER_OPENIPMI),y)
> +ZABBIX_CONF_OPTS += --with-openipmi=$(STAGING_DIR)/usr
> +ZABBIX_DEPENDENCIES += openipmi
> +ZABBIX_PRE_CONFIGURE_HOOKS += BR2_PACKAGE_ZABBIX_SERVER_OPENIPMI_FIX_LIBS
> +
> +define BR2_PACKAGE_ZABBIX_SERVER_OPENIPMI_FIX_LIBS
> +	if [ ! -f $(STAGING_DIR)/usr/lib/libOpenIPMI.so ]; then \
> +		cp -rf $(TARGET_DIR)/usr/lib/libOpenIPMI* $(STAGING_DIR)/usr/lib/ ;\
> +		cp -rf $(TARGET_DIR)/usr/include/OpenIPMI $(STAGING_DIR)/usr/include/ ;\
> +	fi
> +endef
> +endif
> +
> +ifeq ($(BR2_PACKAGE_ZABBIX_SERVER_LIBCURL),y)
> +ZABBIX_CONF_OPTS += --with-libcurl=$(STAGING_DIR)/usr/bin/curl-config
> +ZABBIX_DEPENDENCIES += libcurl
> +endif
> +
> +ifeq ($(BR2_PACKAGE_ZABBIX_SERVER_LIBXML2),y)
> +ZABBIX_CONF_OPTS += --with-libxml2=$(STAGING_DIR)/usr/bin/xml2-config
> +ZABBIX_DEPENDENCIES += libxml2
> +endif
> +
> +ifeq ($(BR2_PACKAGE_ZABBIX_SERVER_NETSNMP),y)
> +ZABBIX_CONF_OPTS += --with-net-snmp=$(STAGING_DIR)/usr/bin/net-snmp-config
> +ZABBIX_DEPENDENCIES += netsnmp
> +endif
> +
> +ifeq ($(BR2_PACKAGE_ZABBIX_SERVER_LDAP),y)
> +ZABBIX_CONF_OPTS += --with-ldap=$(STAGING_DIR)/usr
> +ZABBIX_DEPENDENCIES += openldap
> +endif
> +
> +ifeq ($(BR2_PACKAGE_ZABBIX_SERVER_LIBSSH2),y)
> +ZABBIX_CONF_OPTS += --with-ssh2=$(STAGING_DIR)/usr
> +ZABBIX_DEPENDENCIES += libssh2
> +endif
> +
> +ifeq ($(BR2_PACKAGE_ZABBIX_SERVER_OPENSSL),y)
> +ZABBIX_CONF_OPTS += --with-openssl=$(STAGING_DIR)/usr
> +ZABBIX_DEPENDENCIES += openssl
> +else ifeq ($(BR2_PACKAGE_ZABBIX_SERVER_GNUTLS),y)
> +ZABBIX_CONF_OPTS += --with-gnutls=$(STAGING_DIR)/usr
> +ZABBIX_DEPENDENCIES += gnutls
> +endif
> +
> +ifeq ($(BR2_PACKAGE_ZABBIX_SERVER_COPY_FRONTEND),y)
> +ZABBIX_POST_INSTALL_TARGET_HOOKS += ZABBIX_SERVER_COPY_FRONTEND
> +
> +define ZABBIX_SERVER_COPY_FRONTEND
> +	mkdir -p $(TARGET_DIR)/usr/zabbix/php-frontend/
> +	cp -r $(@D)/frontends/php/* $(TARGET_DIR)/usr/zabbix/php-frontend/
> +endef
> +
> +endif
> +
> +define ZABBIX_SERVER_CHANGE_PIDFILE_LOCATION
> +	$(SED) 's%\#\ PidFile=/tmp/zabbix_server.pid%PidFile=/run/zabbix/zabbix_server.pid%g' $(TARGET_DIR)/etc/zabbix_server.conf
> +endef
> +
> +ifeq ($(BR2_PACKAGE_ZABBIX_SERVER_MYSQL),y)
> +ZABBIX_DEPENDENCIES += mysql
> +ZABBIX_CONF_OPTS += --with-mysql=$(STAGING_DIR)/usr/bin/mysql_config
> +# Need package/mariadb/0003-add-sysroot-path-to-mariadb_config.patch by Ryan Coe
> +# While this patch not included, use this crutch
> +ZABBIX_PRE_CONFIGURE_HOOKS += ZABBIX_DISABLE_MARIADB_CONFIG
> +ZABBIX_POST_CONFIGURE_HOOKS += ZABBIX_ENABLE_MARIADB_CONFIG
> +
> +define ZABBIX_DISABLE_MARIADB_CONFIG
> +	if [ -f "$(STAGING_DIR)/usr/bin/mariadb_config" ]; then \
> +		mv $(STAGING_DIR)/usr/bin/mariadb_config $(STAGING_DIR)/usr/bin/mariadb_config_save; \
> +	fi
> +endef
> +
> +define ZABBIX_ENABLE_MARIADB_CONFIG
> +	if [ -f "$(STAGING_DIR)/usr/bin/mariadb_confi_save" ]; then \
> +		mv $(STAGING_DIR)/usr/bin/mariadb_config_save $(STAGING_DIR)/usr/bin/mariadb_config; \
> +	fi
> +endef
> +
> +ifeq ($(BR2_PACKAGE_ZABBIX_SERVER_COPY_DUMPS),y)
> +ZABBIX_POST_INSTALL_TARGET_HOOKS += ZABBIX_SERVER_PREPARE_MYSQL
> +endif
> +
> +define ZABBIX_SERVER_PREPARE_MYSQL
> +	mkdir -p $(TARGET_DIR)/usr/zabbix/mysql_schema/
> +	cp -r $(@D) $(@D)/database/mysql/*\.sql $(TARGET_DIR)/usr/zabbix/mysql_schema/
> +endef
> +
> +endif
> +
> +ifeq ($(BR2_PACKAGE_ZABBIX_SERVER_POSTGRESQL),y)
> +ZABBIX_DEPENDENCIES += postgresql
> +ZABBIX_CONF_OPTS += --with-postgresql=$(STAGING_DIR)/usr/bin/pg_config
> +
> +define ZABBIX_SERVER_PREPARE_POSTGRESQL
> +	mkdir -p $(TARGET_DIR)/usr/zabbix/postgresql_schema
> +	cp -r $(@D)/database/postgresql/*\.sql $(TARGET_DIR)/usr/zabbix/postgresql_schema/
> +endef
> +
> +ifeq ($(BR2_PACKAGE_ZABBIX_SERVER_COPY_DUMPS),y)
> +ZABBIX_POST_INSTALL_TARGET_HOOKS += ZABBIX_SERVER_PREPARE_POSTGRESQL
> +endif
> +
> +endif
> +
> +endif
> +
> +$(eval $(autotools-package))
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
