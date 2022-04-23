Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DB21C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Apr 2022 15:09:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5E49540609;
	Sat, 23 Apr 2022 15:09:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5-lXpSNStAuI; Sat, 23 Apr 2022 15:09:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 70388400F8;
	Sat, 23 Apr 2022 15:09:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8F51A1BF421
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 15:09:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7CF44419D6
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 15:09:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rY6NvZ8rtaRh for <buildroot@lists.busybox.net>;
 Sat, 23 Apr 2022 15:09:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D6CCE41763
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 15:09:49 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id z19so448594edx.9
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 08:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=QZ0sZbiz8szYKJbH234Dsc0dDe+E4Havg+xGLOmcW+c=;
 b=Ws1zbrdgMoaVYqZvbOf9zCHxjLQ5phoE/+0TGi+p2Xt0+NWL+YvjsswSSsgimxREK8
 P8rSjgD0J5AeuHJYCzSDh21twQvwVOBIaX011NVjQ9l2OBGoVq526PHarG414GYvYBBB
 /PDOwUX+HRQV3ElDk4YQaTqmJ/TiGjDSa7Kdlmuf+XXsaX4ZOVHZNGSUYtBKpfpU+xPC
 4Js/oNFoqq1snf6n+diouICJEHPbLmzVanSpyKGGX4MXyPfQnKzUGq5sOQI1YymzEYyl
 0Id/LrmXUr8kA5awdujb0OYNHfuhFASLS9bmmXpsb+aCUrAw4BJj6e8SbbVYKtnvChl8
 SN0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=QZ0sZbiz8szYKJbH234Dsc0dDe+E4Havg+xGLOmcW+c=;
 b=Qa5WDKWdLAWykWy9q0L74Wpv73d26IzTLdGpVokYlwTiEopf0hpIL3XdgHimf8SQL2
 bVT/oJ6l7uPw/HO2BdmLwcvLBaAeOmnJ73Z1D0F7IXuEBeMSMz96Plq0gB6swOWFED5N
 xn7Ost7TKV2bB1kOYu86nW7QmAFpNMXOy5Xq2bkJlz3vt3jX1xnj7NuMb5ggZHLGpXyf
 97YQxqmc1bPOi0PZ3XS/92mqre1ZPHMpE3Sh6GOWzDgeEBcm1zrVsxcHQCns65Nj35ix
 HKMURxG3QRxQ2I9eVb/w4OfZ4T56D2AlPZtzx88EO4Dms/D4CXccLaZR5JevdF3Wf+Uc
 gThQ==
X-Gm-Message-State: AOAM532Bsc3YvXSiAzzup2qu4oITzfmaK/fDTWuzp5zgLAd/pNXzw+tq
 Ih1Kf0IEtbmCv+b6bs2RTypruA==
X-Google-Smtp-Source: ABdhPJybodEH/rPNSRHwBs1F487ZOZSI1sgbSLV80lmD1ZcF+5vHZEJPvlO+03vcCgDTGWpcu7h+2A==
X-Received: by 2002:a05:6402:2554:b0:423:f3e3:81da with SMTP id
 l20-20020a056402255400b00423f3e381damr10398059edb.87.1650726588047; 
 Sat, 23 Apr 2022 08:09:48 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 q11-20020a170906144b00b006cf61dfb03esm1759343ejc.62.2022.04.23.08.09.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Apr 2022 08:09:47 -0700 (PDT)
Message-ID: <0802760d-78d8-cdfc-cc86-f99a70edd79f@mind.be>
Date: Sat, 23 Apr 2022 17:09:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220419193215.4089204-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220419193215.4089204-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/postgresql: can't be built with
 BR2_OPTIMIZE_FAST
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, Alexey Lukyanchuk <skif@skif-web.ru>,
 Asaf Kahlon <asafka7@gmail.com>, Peter Seiderer <ps.report@gmx.net>,
 Julien Corjon <corjon.j@ecagroup.com>, Nathaniel Roach <nroach44@gmail.com>,
 Matt Weber <matthew.weber@collins.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 19/04/2022 21:32, Fabrice Fontaine wrote:
> postgresql can't be built with BR2_OPTIMIZE_FAST:
> 
> configure: error: do not put -ffast-math in CFLAGS
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/106bb61bcff5d03e44d3e2e9149c76e6705606a5
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/bandwidthd/Config.in      | 4 ++++
>   package/collectd/Config.in        | 4 ++++
>   package/lighttpd/Config.in        | 4 ++++
>   package/php/Config.ext            | 8 ++++++++
>   package/poco/Config.in            | 4 ++++
>   package/postgresql/Config.in      | 4 ++++
>   package/python-psycopg2/Config.in | 4 ++++
>   package/qt5/qt5base/Config.in     | 4 ++++
>   package/zabbix/Config.in          | 1 +
>   9 files changed, 37 insertions(+)
> 
> diff --git a/package/bandwidthd/Config.in b/package/bandwidthd/Config.in
> index 5a3529e0c4..7537552390 100644
> --- a/package/bandwidthd/Config.in
> +++ b/package/bandwidthd/Config.in
> @@ -36,6 +36,7 @@ config BR2_PACKAGE_BANDWIDTHD_POSTGRESQL
>   	bool "enable postgresql log target support"
>   	depends on !BR2_STATIC_LIBS
>   	depends on BR2_USE_WCHAR # postgresql
> +	depends on !BR2_OPTIMIZE_FAST # postgresql
>   	select BR2_PACKAGE_POSTGRESQL
>   	help
>   	  Enable support for logging the bandwidthd data to a remote
> @@ -46,6 +47,9 @@ config BR2_PACKAGE_BANDWIDTHD_POSTGRESQL
>   comment "postgresql support needs a toolchain w/ dynamic library, wchar"
>   	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR
>   
> +comment "postgresql support can't be built with Optimize for fast"
> +	depends on !BR2_OPTIMIZE_FAST
> +
>   config BR2_PACKAGE_BANDWIDTHD_SQLITE3
>   	bool "enable sqlite3 log storage"
>   	select BR2_PACKAGE_SQLITE
> diff --git a/package/collectd/Config.in b/package/collectd/Config.in
> index 43eef3bf66..da8465beee 100644
> --- a/package/collectd/Config.in
> +++ b/package/collectd/Config.in
> @@ -475,6 +475,7 @@ config BR2_PACKAGE_COLLECTD_PING
>   config BR2_PACKAGE_COLLECTD_POSTGRESQL
>   	bool "postgresql"
>   	depends on BR2_USE_WCHAR # postgresql
> +	depends on !BR2_OPTIMIZE_FAST # postgresql
>   	select BR2_PACKAGE_POSTGRESQL
>   	help
>   	  Connects to and executes SQL statements on a PostgreSQL
> @@ -485,6 +486,9 @@ config BR2_PACKAGE_COLLECTD_POSTGRESQL
>   comment "postgresql support needs a toolchain w/ wchar"
>   	depends on !BR2_USE_WCHAR
>   
> +comment "postgresql support can't be built with Optimize for fast"
> +	depends on !BR2_OPTIMIZE_FAST
> +
>   config BR2_PACKAGE_COLLECTD_PROCESSES
>   	bool "processes"
>   	help
> diff --git a/package/lighttpd/Config.in b/package/lighttpd/Config.in
> index 6f0c927319..9522b80426 100644
> --- a/package/lighttpd/Config.in
> +++ b/package/lighttpd/Config.in
> @@ -93,6 +93,7 @@ config BR2_PACKAGE_LIGHTTPD_PGSQL
>   	bool "pgsql support"
>   	depends on BR2_USE_MMU # postgresql
>   	depends on BR2_USE_WCHAR # postgresql
> +	depends on !BR2_OPTIMIZE_FAST # postgresql
>   	select BR2_PACKAGE_POSTGRESQL
>   	help
>   	  Enable postgres support for lighttpd mod_vhostdb_pgsql.
> @@ -101,6 +102,9 @@ comment "pgsql support needs a toolchain w/ wchar"
>   	depends on BR2_USE_MMU
>   	depends on !BR2_USE_WCHAR
>   
> +comment "pgsql support can't be built with Optimize for fast"
> +	depends on !BR2_OPTIMIZE_FAST
> +
>   config BR2_PACKAGE_LIGHTTPD_WEBDAV
>   	bool "webdav support"
>   	select BR2_PACKAGE_LIBXML2
> diff --git a/package/php/Config.ext b/package/php/Config.ext
> index 5da5d8bed9..e4aced66df 100644
> --- a/package/php/Config.ext
> +++ b/package/php/Config.ext
> @@ -141,6 +141,7 @@ config BR2_PACKAGE_PHP_EXT_PGSQL
>   	depends on BR2_USE_MMU # postgresql
>   	depends on !BR2_STATIC_LIBS
>   	depends on BR2_USE_WCHAR # postgresql
> +	depends on !BR2_OPTIMIZE_FAST # postgresql
>   	select BR2_PACKAGE_POSTGRESQL
>   	help
>   	  PostgreSQL support
> @@ -149,6 +150,9 @@ comment "PostgreSQL extension needs a toolchain w/ dynamic library, wchar"
>   	depends on BR2_USE_MMU
>   	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR
>   
> +comment "PostgreSQL extension can't be built with Optimize for fast"
> +	depends on !BR2_OPTIMIZE_FAST
> +
>   config BR2_PACKAGE_PHP_EXT_SQLITE
>   	bool "SQLite3"
>   	select BR2_PACKAGE_SQLITE
> @@ -172,6 +176,7 @@ config BR2_PACKAGE_PHP_EXT_PDO_POSTGRESQL
>   	depends on BR2_USE_MMU # postgresql
>   	depends on !BR2_STATIC_LIBS
>   	depends on BR2_USE_WCHAR # postgresql
> +	depends on !BR2_OPTIMIZE_FAST # postgresql
>   	select BR2_PACKAGE_POSTGRESQL
>   	help
>   	  PDO driver for PostgreSQL
> @@ -180,6 +185,9 @@ comment "PostgreSQL drivers need a toolchain w/ wchar, dynamic library"
>   	depends on BR2_USE_MMU
>   	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR
>   
> +comment "PostgreSQL drivers can't be built with Optimize for fast"
> +	depends on !BR2_OPTIMIZE_FAST
> +
>   config BR2_PACKAGE_PHP_EXT_PDO_SQLITE
>   	bool "SQLite3"
>   	select BR2_PACKAGE_SQLITE
> diff --git a/package/poco/Config.in b/package/poco/Config.in
> index 699495a241..d2852ba03e 100644
> --- a/package/poco/Config.in
> +++ b/package/poco/Config.in
> @@ -52,9 +52,13 @@ config BR2_PACKAGE_POCO_DATA_MYSQL
>   config BR2_PACKAGE_POCO_DATA_PGSQL
>   	bool "Data/PostgreSQL"
>   	depends on BR2_USE_MMU # postgresql
> +	depends on !BR2_OPTIMIZE_FAST # postgresql
>   	select BR2_PACKAGE_POCO_DATA
>   	select BR2_PACKAGE_POSTGRESQL
>   
> +comment "Data/PostgreSQL can't be built with Optimize for fast"
> +	depends on !BR2_OPTIMIZE_FAST
> +
>   config BR2_PACKAGE_POCO_DATA_SQLITE
>   	bool "Data/SQLite"
>   	select BR2_PACKAGE_POCO_DATA
> diff --git a/package/postgresql/Config.in b/package/postgresql/Config.in
> index b42b219558..476427d534 100644
> --- a/package/postgresql/Config.in
> +++ b/package/postgresql/Config.in
> @@ -6,6 +6,7 @@ config BR2_PACKAGE_POSTGRESQL
>   	# postgresql is unlikely to be used in a pure statically
>   	# linked environment.
>   	depends on !BR2_STATIC_LIBS
> +	depends on !BR2_OPTIMIZE_FAST
>   	select BR2_PACKAGE_LIBOPENSSL_ENABLE_BLOWFISH if BR2_PACKAGE_LIBOPENSSL
>   	select BR2_PACKAGE_LIBOPENSSL_ENABLE_CAST if BR2_PACKAGE_LIBOPENSSL
>   	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
> @@ -34,3 +35,6 @@ endif
>   comment "postgresql needs a toolchain w/ dynamic library, wchar"
>   	depends on BR2_USE_MMU
>   	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR
> +
> +comment "postgresql can't be built with Optimize for fast"
> +	depends on !BR2_OPTIMIZE_FAST
> diff --git a/package/python-psycopg2/Config.in b/package/python-psycopg2/Config.in
> index ec27d706de..361c40cfa9 100644
> --- a/package/python-psycopg2/Config.in
> +++ b/package/python-psycopg2/Config.in
> @@ -1,6 +1,7 @@
>   config BR2_PACKAGE_PYTHON_PSYCOPG2
>   	bool "python-psycopg2"
>   	depends on BR2_USE_WCHAR # postgresql
> +	depends on !BR2_OPTIMIZE_FAST # postgresql
>   	select BR2_PACKAGE_POSTGRESQL
>   	help
>   	  Psycopg is the most popular PostgreSQL database adapter for
> @@ -24,3 +25,6 @@ config BR2_PACKAGE_PYTHON_PSYCOPG2
>   
>   comment "python-psycopg2 needs a toolchain w/ wchar"
>   	depends on !BR2_USE_WCHAR
> +
> +comment "python-psycopg2 can't be built with Optimize for fast"
> +	depends on !BR2_OPTIMIZE_FAST
> diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
> index 601438d2fe..6f2309dffd 100644
> --- a/package/qt5/qt5base/Config.in
> +++ b/package/qt5/qt5base/Config.in
> @@ -74,6 +74,7 @@ config BR2_PACKAGE_QT5BASE_PSQL
>   	depends on BR2_USE_MMU # postgresql
>   	depends on !BR2_STATIC_LIBS
>   	depends on BR2_USE_WCHAR # postgresql
> +	depends on !BR2_OPTIMIZE_FAST # postgresql
>   	select BR2_PACKAGE_POSTGRESQL
>   	help
>   	  Build PostgreSQL plugin
> @@ -83,6 +84,9 @@ comment "PostgreSQL plugin needs a toolchain w/ wchar, dynamic library"
>   	depends on BR2_USE_MMU
>   	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR
>   
> +comment "PostgreSQL plugin can't be built with Optimize for fast"
> +	depends on !BR2_OPTIMIZE_FAST
> +
>   choice
>   	prompt "SQLite 3 support"
>   	default BR2_PACKAGE_QT5BASE_SQLITE_NONE
> diff --git a/package/zabbix/Config.in b/package/zabbix/Config.in
> index 6f8a952936..0f7a0b0003 100644
> --- a/package/zabbix/Config.in
> +++ b/package/zabbix/Config.in
> @@ -45,6 +45,7 @@ config BR2_PACKAGE_ZABBIX_SERVER_POSTGRESQL
>   	bool "postgresql"
>   	depends on BR2_USE_WCHAR # postgresql
>   	depends on !BR2_STATIC_LIBS # postgresql
> +	depends on !BR2_OPTIMIZE_FAST # postgresql
>   	select BR2_PACKAGE_POSTGRESQL
>   
>   endchoice
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
