Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 732B0C433EF
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 20:42:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA31381A3E;
	Tue,  4 Jan 2022 20:42:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jRwYXb6YCGry; Tue,  4 Jan 2022 20:42:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45F80818E6;
	Tue,  4 Jan 2022 20:42:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 36C581BF44A
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 20:42:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 241C1405BD
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 20:42:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 52MQctW_BCjK for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 20:42:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 162884033A
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 20:42:47 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id s1so78668289wrg.1
 for <buildroot@buildroot.org>; Tue, 04 Jan 2022 12:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2EFQE3CidPxpW1WfRImOckE2zX2cIpWNl2gBgKWnW8Y=;
 b=pTe5RhrQiO+1sD//yCv6XDqb1TkHRg1x6XDuXMn2miCE8BSzpJk+Ss7ApXNTtkhUBD
 jT6O94cjdxFlsMCWm9WaHQsTDc242d0uqKf8xR6h4lchiYyQgN3KRTNS/F70KdGn7YQ8
 Z7vrIftAUL6ptR4O+pEptLMmGw69uAOGFmO2GYz1aiGiQsZVllgQO7gVhW16rXubGcN4
 4Bkfw9RVzHpO6DRSfYnRfThU9RI0Jlqp2COA7CDHQ5uWP/udixGRlEHomjuOcuJ2wR5h
 KWFzl6Yt1vXETb4RWc5iqDTLQBgCoPl0dsb+tsnICwwThCbvQ0+ry3F51eC/X1bWhr21
 EcKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2EFQE3CidPxpW1WfRImOckE2zX2cIpWNl2gBgKWnW8Y=;
 b=uwKk1RONTJHp1a4AOQiNY/BXo3qQ0RknDC2jRmjcLmTwhFnoJYxDP8cj5M1nVhg74r
 PETyMF8NMCLqW536fmtcLPlWhFrPeapnB85ypPXeCVnNU5J9bzmddxMz9g8FHXni39kI
 3ngp0fJtpQ0dh3P/ZFpvEZt6k0LqqT4O4RtyRBwITcht/7Ytawbk2ieClBd3LL9AclH+
 5sB/mhsPf+V9f7XG3KqnfT15n0BhbQw7vl9ED9oIJxb4WOIEVxIoo6mgzE+6g1JVNAcn
 K5XZ6gheVoETvYc2z2vIZPNyYVH3se7t0YkRAFSOT7TzZzXxIeInTzovRDFIAoKcV15r
 LpYA==
X-Gm-Message-State: AOAM530RFS8YviBvnslTc4sFezZbLeIOINvz5Uej9/zCnDWpdWcsai+F
 GWR+UZvM53E90spMe+B8C3xi+IiWGO0=
X-Google-Smtp-Source: ABdhPJz84Kw1Hp/OAl53+UbvzlePDmyHa2YTLPbKEYg4GQ0h4WDw/J9stMYlH+pstsL3N+M838sQDg==
X-Received: by 2002:a05:6000:1542:: with SMTP id
 2mr43117739wry.308.1641328966016; 
 Tue, 04 Jan 2022 12:42:46 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id k6sm38298921wrc.38.2022.01.04.12.42.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 12:42:45 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  4 Jan 2022 21:41:26 +0100
Message-Id: <20220104204126.3631293-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gensio: add avahi optional
 dependency
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

avahi-client is an optional dependency which is enabled by default since
version 2.2.0 and
https://github.com/cminyard/gensio/commit/5ab117c9743fd4719f610cf9f1ba45023cc25d7c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gensio/gensio.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gensio/gensio.mk b/package/gensio/gensio.mk
index 389de1e263..b4936d5f21 100644
--- a/package/gensio/gensio.mk
+++ b/package/gensio/gensio.mk
@@ -9,6 +9,7 @@ GENSIO_SITE = http://downloads.sourceforge.net/project/ser2net/ser2net
 GENSIO_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
 GENSIO_LICENSE_FILES = COPYING.LIB COPYING
 GENSIO_INSTALL_STAGING = YES
+GENSIO_DEPENDENCIES = $(if $(BR2_PACKAGE_AVAHI_DAEMON),avahi)
 GENSIO_CONF_OPTS = \
 	--without-openipmi \
 	--without-swig \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
