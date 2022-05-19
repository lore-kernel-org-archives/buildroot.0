Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B2FDC433EF
	for <buildroot@archiver.kernel.org>; Thu, 19 May 2022 14:09:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E20541D2A;
	Thu, 19 May 2022 14:09:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LB5G8Y2vbqNh; Thu, 19 May 2022 14:09:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C61E441D09;
	Thu, 19 May 2022 14:09:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 104E81BF3CE
 for <buildroot@lists.busybox.net>; Thu, 19 May 2022 14:08:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C1BC441D23
 for <buildroot@lists.busybox.net>; Thu, 19 May 2022 14:08:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KSk1oueOj9yX for <buildroot@lists.busybox.net>;
 Thu, 19 May 2022 14:08:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BDF6741986
 for <buildroot@buildroot.org>; Thu, 19 May 2022 14:08:38 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id j25so7328534wrc.9
 for <buildroot@buildroot.org>; Thu, 19 May 2022 07:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d8X1YRBI7bQB+5/eXJ2w2e5SAArY0LcKHo8CKRhALpA=;
 b=nT3h1U/d9/L6hhQ2TMgAoXckMBzoGJ6Gdk3Rljt62QU+awxJWENUHY1SdSQvzUF6Sg
 GMi2lDKIe7wWhn0ZwMLMsfwEp7ArTGZJrdBjFStiNz+xB7oHNVOoyAT7nj1xz6qHQixp
 Eq6454e3XxBwBy7e6hwOQPAn1lyQ+Xf9ikkL+v5Pqm8ZwwAZBTbgWL9yOj8LlQYFfViQ
 htTXqcPJ7rMa2jKnwFh9XgvxQrZ8CDQoYiywxLm+GZ6Pg00JFSckQ//HyS14Dwktbftd
 PjcFnvMC53LE6bx6j1TY5JgwI9SLVgcqoz5Qru5sWp9XvgjZi1a1tQvf7dim270ueU8C
 gR6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d8X1YRBI7bQB+5/eXJ2w2e5SAArY0LcKHo8CKRhALpA=;
 b=NeyDyc6T9gKgFtD0oWsTDkwzFHwuPpGaSltQF/D3FoeIjZtcC22DIp05/nmsI7+HmW
 c9pEK+IGF/OfjFAhFdLKPHpBuNPzSTKysLFqS0KsVLrLZntoqvpeUl70SeLH/pyPRkta
 49+DwgSHYSInJuEt17IhTZ34+B1uXGFDzLotOsYCgRCzlXQNoLUeO0daI8oLfVYCEmQi
 2FYKlOWUaFhOQnKNrg4021mAe8JDCQq+n7WpvvZgGO4KWARdfW/p+NtP9qt2DBkjQxdK
 utpf1LE0UKxNCslFHC22FwebmxS3FbVAWrDnUFHdY01bhFIl9n4Nj+iTJYBa+pjQYose
 l4Pg==
X-Gm-Message-State: AOAM532O4mVc4wAccXkKdVy43A2taOJW0zqXAcMk/f/pcTwxxGZ3bmPb
 Pi57jg0gXYtmC1i03Skx2o6x4kL0yp8=
X-Google-Smtp-Source: ABdhPJz3MHRDnjG4kwpahO9TZRmF/gb6EDClryezXKfM7GNGWGCf9fz3O7Lkx246JvjYlEYZfJj1rQ==
X-Received: by 2002:a05:6000:1841:b0:20c:788b:9306 with SMTP id
 c1-20020a056000184100b0020c788b9306mr4155557wri.369.1652969318012; 
 Thu, 19 May 2022 07:08:38 -0700 (PDT)
Received: from shrek2.. (lmontsouris-659-1-42-116.w92-154.abo.wanadoo.fr.
 [92.154.77.116]) by smtp.gmail.com with ESMTPSA id
 f18-20020adfb612000000b0020d00174eabsm4790214wre.94.2022.05.19.07.08.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 07:08:37 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 19 May 2022 16:07:58 +0200
Message-Id: <20220519140810.1953601-9-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220519140810.1953601-1-johan.oudinet@gmail.com>
References: <20220519140810.1953601-1-johan.oudinet@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 08/20] package/erlang-p1-xmpp: bump version
 to 1.5.6
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
Cc: Johan Oudinet <johan.oudinet@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/erlang-p1-xmpp/Config.in           | 1 +
 package/erlang-p1-xmpp/erlang-p1-xmpp.hash | 2 +-
 package/erlang-p1-xmpp/erlang-p1-xmpp.mk   | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/erlang-p1-xmpp/Config.in b/package/erlang-p1-xmpp/Config.in
index 6e40fed10a..c67dc832b7 100644
--- a/package/erlang-p1-xmpp/Config.in
+++ b/package/erlang-p1-xmpp/Config.in
@@ -4,6 +4,7 @@ comment "erlang-p1-xmpp needs a toolchain w/ C++"
 config BR2_PACKAGE_ERLANG_P1_XMPP
 	bool "erlang-p1-xmpp"
 	depends on BR2_INSTALL_LIBSTDCPP # erlang-p1-stringprep
+	select BR2_PACKAGE_ERLANG_IDNA
 	select BR2_PACKAGE_ERLANG_P1_XML
 	select BR2_PACKAGE_ERLANG_P1_STRINGPREP
 	select BR2_PACKAGE_ERLANG_P1_TLS
diff --git a/package/erlang-p1-xmpp/erlang-p1-xmpp.hash b/package/erlang-p1-xmpp/erlang-p1-xmpp.hash
index d0a761fcac..fce23c09c6 100644
--- a/package/erlang-p1-xmpp/erlang-p1-xmpp.hash
+++ b/package/erlang-p1-xmpp/erlang-p1-xmpp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  65c73ffaf8faab5d6fc7d42ada0b5a380f20f3e46056ad98614d81922322d9a2  erlang-p1-xmpp-1.4.10.tar.gz
+sha256  bde03ad371aad3e171ebe94a5b3b84daa4b8dd7ee37e9979ff373cd65370e725  erlang-p1-xmpp-1.5.6.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/erlang-p1-xmpp/erlang-p1-xmpp.mk b/package/erlang-p1-xmpp/erlang-p1-xmpp.mk
index f903cb945d..fc63b5ffc2 100644
--- a/package/erlang-p1-xmpp/erlang-p1-xmpp.mk
+++ b/package/erlang-p1-xmpp/erlang-p1-xmpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_XMPP_VERSION = 1.4.10
+ERLANG_P1_XMPP_VERSION = 1.5.6
 ERLANG_P1_XMPP_SITE = $(call github,processone,xmpp,$(ERLANG_P1_XMPP_VERSION))
 ERLANG_P1_XMPP_LICENSE = Apache-2.0
 ERLANG_P1_XMPP_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
