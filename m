Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B0C7C433F5
	for <buildroot@archiver.kernel.org>; Sun, 30 Jan 2022 22:48:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 131DF60E9D;
	Sun, 30 Jan 2022 22:48:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id buUaUFyvW96M; Sun, 30 Jan 2022 22:48:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2F8260EA4;
	Sun, 30 Jan 2022 22:48:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A25161BF4DA
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 22:48:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9017240236
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 22:48:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2OwsAZj1CI3f for <buildroot@lists.busybox.net>;
 Sun, 30 Jan 2022 22:48:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5A95240233
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 22:48:04 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 71026240005;
 Sun, 30 Jan 2022 22:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1643582881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HCJJz+Qe7qrJmbMrv95WcKfGTNcHR/fobSCMeI28pIY=;
 b=Wdx68K1Kwdv6AWE4dVzJ/UZuOGx8pPoatkxG8WcO4+XdmaYw844yrSrTxE+jcIMTfEqdz1
 GPCzaLTVfeeI6039WbJO1DBWBfb7vy8ldD/M/FZzdwbaBDAiiuH4D9KNczKHFY4yYpoFUe
 rIwMKEWCl7CumvucZZfMowjyMPYLSGGGtEDAvaDOrnkDEedE6AAf5Gr5UHKbDH3yr0z7P4
 TN6SitFlYVPEGgH0KJEjO1dhGE9GqHMv12mMNsQ4shxBWzjAdto68xeistm0PQesWzobZg
 W14zeGogwSEuBIdZjNRM0hcoTHdxhoro2iYtrMR9/Tsolww9PaUMXJKOh4HPug==
Date: Sun, 30 Jan 2022 23:48:00 +0100
To: Arek Marud <a.marud@post.pl>
Message-ID: <20220130234800.14da56ca@windsurf>
In-Reply-To: <YfcMrhsNq6LnkKzP@leo>
References: <YfcMrhsNq6LnkKzP@leo>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] I have a problem adding new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Arek,

On Sun, 30 Jan 2022 23:09:50 +0100
Arek Marud <a.marud@post.pl> wrote:

> I'm trying to add new package to Buildroot. I follow Buildroot tutorial
> for autotools package. But I got an error message, and i have no idea
> what is the problem.
> 
> https://gist.github.com/arekmd/c33a3a487ec73d8847c3c115f8fa3299

libonvif: installs files in /home/myname/workbench/resources/development/myproj/buildroot/buildroot/output/host/aarch64-myproj-linux-gnu/sysroot//home/myname/workbench/resources/development/myproj/buildroot/buildroot/output

Look at this path: it contains two times
/home/myname/workbench/resources/development/myproj/buildroot/buildroot/output,
and that's clearly bogus, and that's why Buildroot complains.

> ################################################################################
> #
> # libonvif
> ################################################################################
> LIBONVIF_VERSION = 1.1.1
> LIBONVIF_SOURCE = v$(LIBONVIF_VERSION).tar.gz
> LIBONVIF_SITE = https://github.com/sr99622/libonvif/archive/refs/tags
> LIBONVIF_INSTALL_STAGING = YES
> LIBONVIF_INSTALL_TARGET = YES
> LIBONVIF_CONF_OPTS = --with-libxml2 --includedir="$(STAGING_DIR)/usr/include/libxml2" 

This includedir is wrong, and is perhaps the reason for the failure.
includedir is the location where libonvif will install its headers, not
where the libxml2 headers will be found. And setting
$(STAGING_DIR)/usr/include/libxml2 for includedir is incorrect, because
then at install time we pass DESTDIR=$(TARGET_DIR) (for target
installation) or DESTDIR=$(STAGING_DIR) (for staging installation).

This means that the libonvif headers will get installed in:

 $(TARGET_DIR)/$(STAGING_DIR)/usr/include/libxml2
               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ this is the value you passed to includedir

and

 $(STAGING_DIR)/$(STAGING_DIR)/usr/include/libxml2
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ this is the value you passed to includedir

Hope this helps,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
