Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4328C6FA82
	for <buildroot@archiver.kernel.org>; Tue, 20 Sep 2022 06:40:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40A96416DD;
	Tue, 20 Sep 2022 06:40:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40A96416DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2N3505jmjwYx; Tue, 20 Sep 2022 06:40:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FF0E416FC;
	Tue, 20 Sep 2022 06:40:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0FF0E416FC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EBD3D1BF33A
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 06:40:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C536D416E9
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 06:40:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C536D416E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PG5oFBnkkuaV for <buildroot@lists.busybox.net>;
 Tue, 20 Sep 2022 06:40:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B6A2416DD
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5B6A2416DD
 for <buildroot@buildroot.org>; Tue, 20 Sep 2022 06:40:00 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7BB5B240005;
 Tue, 20 Sep 2022 06:39:58 +0000 (UTC)
Date: Tue, 20 Sep 2022 08:39:57 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Jesse Van Gavere <jesseevg@gmail.com>
Message-ID: <20220920083957.14ccdc13@windsurf>
In-Reply-To: <20220826135503.20612-21-jesseevg@gmail.com>
References: <20220826135503.20612-1-jesseevg@gmail.com>
 <20220826135503.20612-21-jesseevg@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663655998;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=en7yLXVdkTF8P6robd9tnOsAqiSyZGahCqpEIoV8vR8=;
 b=ElObbdu35aH6hbwWm7Mng7FwZRKrZ5wZ2hWRUM/fT1nAGl1aPflIdba0c2Ed0aL5Vpbz2U
 /8rRHVd5FkzhnhpJ+gCIpkpBT0sOzIgJcdM9yBPBtNw9TX2CnwcVPWJVhrWIHW8R3W3Ea4
 7VY+Q0r1FoaumkQLAWEO5J+5rgYTzSUvJFNK4/wVYN/fNEVCNYa1p5JDr9zSGJfsUzz7N9
 lo/A7gi1cgfBHxcwnJzTk9Rf6EtuwYQlKDtLfORsKM2VUMY/YRG0MjruS5xrE/LYuiSIzG
 KeGE3O3/H3fwdef87e7nQEAwYEQsoueDBzoSXEKOb/C/oQH2OuVI5Iiw2YM60g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ElObbdu3
Subject: Re: [Buildroot] [PATCH v4 20/29] package/qt6/qt6base: add support
 for sql module w/ sqlite
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 26 Aug 2022 15:54:54 +0200
Jesse Van Gavere <jesseevg@gmail.com> wrote:

> Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
> ---
>  package/qt6/qt6base/Config.in  | 25 +++++++++++++++++++++++++
>  package/qt6/qt6base/qt6base.mk |  9 +++++++++
>  2 files changed, 34 insertions(+)
> 
> diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
> index 79b6d675c5..5ae11afdb1 100644
> --- a/package/qt6/qt6base/Config.in
> +++ b/package/qt6/qt6base/Config.in
> @@ -90,6 +90,31 @@ comment "PostgreSQL plugin needs a toolchain w/ wchar, dynamic library"
>  	depends on BR2_USE_MMU
>  	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR
>  
> +choice
> +	prompt "SQLite 3 support"
> +	default BR2_PACKAGE_QT6BASE_SQLITE_NONE
> +	help
> +	  Select SQLite support.
> +
> +config BR2_PACKAGE_QT6BASE_SQLITE_NONE
> +	bool "No sqlite support"
> +	help
> +	  Do not compile any kind of SQLite support.
> +
> +config BR2_PACKAGE_QT6BASE_SQLITE_QT
> +	bool "Qt SQLite"
> +	help
> +	  Use Qt bundled SQLite support.
> +
> +config BR2_PACKAGE_QT6BASE_SQLITE_SYSTEM
> +	bool "System SQLite"
> +	select BR2_PACKAGE_SQLITE
> +	select BR2_PACKAGE_SQLITE_ENABLE_COLUMN_METADATA
> +	help
> +	  Use system SQLite.

In Buildroot, we really prefer to use non-bundled dependencies when it
is possible. So really the choice no/bundled/system does not make a lot
of sense. I have replaced it with a single boolean to enable/disable
sqlite support, and if enabled, it always uses the system sqlite.


> +ifeq ($(BR2_PACKAGE_QT6BASE_SQLITE_SYSTEM),y)
> +QT6BASE_CONF_OPTS += -DFEATURE_sql_sqlite=ON -DFEATURE_system_sqlite=ON
> +QT6BASE_DEPENDENCIES += sqlite
> +else ifeq ($(BR2_PACKAGE_QT6BASE_SQLITE_QT),y)
> +QT6BASE_CONF_OPTS += -DFEATURE_sql_sqlite=ON -DFEATURE_system_sqlite=OFF
> +else
> +QT6BASE_CONF_OPTS += -DFEATURE_sql_sqlite=OFF
> +endif

Consequently this has been simplified as well a little bit.

Applied with those changes. Thanks!

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
