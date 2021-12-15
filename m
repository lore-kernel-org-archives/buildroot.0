Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04E97C433F5
	for <buildroot@archiver.kernel.org>; Wed, 15 Dec 2021 12:00:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B25D60E3D;
	Wed, 15 Dec 2021 12:00:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zsMY2fRWgTRc; Wed, 15 Dec 2021 12:00:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 944BB60E43;
	Wed, 15 Dec 2021 12:00:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 90E1D1BF2F5
 for <buildroot@lists.busybox.net>; Wed, 15 Dec 2021 12:00:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7F1F140985
 for <buildroot@lists.busybox.net>; Wed, 15 Dec 2021 12:00:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qEC72_FAtn5d for <buildroot@lists.busybox.net>;
 Wed, 15 Dec 2021 12:00:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A8DFA40988
 for <buildroot@buildroot.org>; Wed, 15 Dec 2021 12:00:16 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id p8so32966362ljo.5
 for <buildroot@buildroot.org>; Wed, 15 Dec 2021 04:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=n9YHBLtsql+r/Kl/YnkZS5mNAc1/IyfSs4/DFdLqbDo=;
 b=ThmycfOc/SZC+m+TPSwJscwvKmBVgygmKIuQw51tze4zJJxjHWwWyvPsiUt/AAdMwV
 Olc4yL0erlm0rHNx9gYP3efmk1PGIyI84B6IJFrdYwe86YdqEjg02Y1KUinT6dD9kQNW
 prJacWfRi0Qq1GeB3CcF8gQm4x0Al1VpEs06uUaGiVpa6Us7K1aKfy8sm3lkuDdXDqP7
 Li7DrGAIXaK3tUcCiFnfe3OXB6ud0qHegLwdfO36Lsc3Gqo1HSzWGj9mT4XSbqWVCz9L
 YTmgS/ST5wsqRq4DgzYAH0NcwBcCAKxNKTnUHG6GbuVrSgd8DqBz5gEQKyvRaS69qGNA
 57Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=n9YHBLtsql+r/Kl/YnkZS5mNAc1/IyfSs4/DFdLqbDo=;
 b=co1m0AYOUAduqM2oIw2UJluusmFCytVlfsPMrCOLWOqSgLbOC4QuWKmCiGKhKkQ1Lw
 hyLAhE7O1ln6cPeUl+f5n76TR1KCY7wBYFSNhbviDEejnYIa6LxZG/S/+zE2s9c/xbnt
 k+JUY8vnqALjv63vzqauUjfiNxpwyWuezTQuT3vH4BpDqzO60uTuhvItVMoZ9cViAP9L
 swlv+UMXB2Z78R9df14ga3cRArErI/SIek9fXQEQp6mlWbErS4Slq/39vRdUOkg7/G5U
 +HRsfUE7pUyyEKWZArocO1nikq4RFmskh7R9qH5MqqJw5cfC3/YVzbhOgQ35bL6NgjRx
 goag==
X-Gm-Message-State: AOAM53319Pd7J761COIOTBH/fvDBFkI5K4+aYIpEHQON18jnJHXd1agx
 jIZPPA4cn6bffjJWRTGoaA9fgQApxW5oSdXNWItqYa4jM1o=
X-Google-Smtp-Source: ABdhPJwVbk2cjDrxwEqTMGb/rJaDBD0Y7XsJCPP4FVdL24uHG4TaKiKRuf7FqGOZtEbFn5Dskxp+REFgy3JY7TrG4KE=
X-Received: by 2002:a05:651c:118:: with SMTP id
 a24mr9401333ljb.292.1639569614413; 
 Wed, 15 Dec 2021 04:00:14 -0800 (PST)
MIME-Version: 1.0
References: <CAEXMXLRZ5d3RaipEw3ftPfmqLCyYb0CFTyR+oz34COWBVkKfZA@mail.gmail.com>
In-Reply-To: <CAEXMXLRZ5d3RaipEw3ftPfmqLCyYb0CFTyR+oz34COWBVkKfZA@mail.gmail.com>
From: =?UTF-8?Q?Nuno_Gon=C3=A7alves?= <nunojpg@gmail.com>
Date: Wed, 15 Dec 2021 12:00:03 +0000
Message-ID: <CAEXMXLQVQr_837fH5jR-a0HTfnGZo6Fb+meJLDHh5A1B=_=0QA@mail.gmail.com>
To: buildroot@buildroot.org
Subject: [Buildroot] [PATCH] connman: remove iptables as a fixed dependency
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

connman might depend on iptables or nftables, and those dependencies
are already selected later in this file as required.

Signed-off-by: Nuno Goncalves <nunojpg@gmail.com>
---
 package/connman/connman.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index 0355426e92..e5e596c973 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -7,7 +7,7 @@
 CONNMAN_VERSION = 1.40
 CONNMAN_SOURCE = connman-$(CONNMAN_VERSION).tar.xz
 CONNMAN_SITE = $(BR2_KERNEL_MIRROR)/linux/network/connman
-CONNMAN_DEPENDENCIES = libglib2 dbus iptables
+CONNMAN_DEPENDENCIES = libglib2 dbus
 CONNMAN_INSTALL_STAGING = YES
 CONNMAN_LICENSE = GPL-2.0
 CONNMAN_LICENSE_FILES = COPYING
--
2.32.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
