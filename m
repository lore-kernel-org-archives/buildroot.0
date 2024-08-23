Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98AEBC52D7C
	for <buildroot@archiver.kernel.org>; Fri, 23 Aug 2024 17:24:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D07881854;
	Fri, 23 Aug 2024 17:24:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tf4BDYQmEIDJ; Fri, 23 Aug 2024 17:24:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 564478188D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 564478188D;
	Fri, 23 Aug 2024 17:24:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B00DD1BF314
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 17:24:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 98FDE4015E
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 17:24:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tA9YR3ksJOYB for <buildroot@lists.busybox.net>;
 Fri, 23 Aug 2024 17:24:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D354A40179
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D354A40179
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D354A40179
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 17:24:03 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.118.8]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MJVHU-1sNgme1zDs-00NRnA; Fri, 23
 Aug 2024 19:24:00 +0200
To: buildroot@buildroot.org
Date: Fri, 23 Aug 2024 19:23:39 +0200
Message-ID: <20240823172341.1035485-3-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240823172341.1035485-1-fiona.klute@gmx.de>
References: <20240823172341.1035485-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:9MVB7WSu+eqa3ddvgSwHbSDVnJK92Akh32KJIZAQiqU29F5TLxE
 DrqnD4MpeAQ1thebd/OD1jCSCO5OP1f8Hm8rPQmHbsyYa7QCmSJVLazUvUOaFRJ9D6Uo0mS
 19XHnlqYfS4CbB/FZ6081LoLnLdduH/47hvb7wEAiEICkuH4JU2DWgQIRsLzn1KSn30HjIC
 /GOTLsmwzfn44mS9zMvzw==
UI-OutboundReport: notjunk:1;M01:P0:hQtddl1hAOA=;tc1Gtm1NMqnoJ+cOfNliGkgjk3+
 26q94CFJ3cKJegd+VBj28J4liJG/9t/HNdcOcsBA3nCEENZ5f/mCrneVI9kIpHS16Wh8KLsg5
 xtTdVPLil0N2KrtHmVl39A5lnU8OaXQWSBrMo4zFOrijTRZXQmHCMgIfHoPP2iUzEEhUaBTIJ
 55I932bn4+gDLJuazOQkYDk0QDH9IejoOFA/SZBWLOrG1YTcH0up9/wfGwFVWSXX/ethuJCJk
 qE9fJQLxVqSwNIVe+NdeXPnljpfAXZ4aMR6FlraB5P/xNk25dHpP8UScAaZ9YAHqVUATjPUSJ
 21C0J3oCyJaoUH3y+2jefARJecM/vzY8wO+cCOwku0y7SUopk4Tbn/7tCvU3fw+AjhMrwPRth
 wSoHy3vAWlcxGNxBpO9burR5A+xBLV7WwjMZfO/WIUyrNQaj7Ay3hZoRMeDIX5e/oPdVx2SvM
 XTso6Ac41giMmVjQMLAgPh7Y2BSwtlQt7qHwvby7nFePwsCERUJd+EKwLnS3puQ82Xt6FOLBU
 vZjPxDD4gT1SsYlmxVFVBWutn3hQ2WPobA9qCaUFkvD4UVqkv8jd5XfzIbzberzcHmzERIC5m
 mG/Ck3GZSYDsKOB1sbpYaTKo6gnIOvC5Q7ezogcv6o0t8xKUhSb0vbliOkE9AkQxZPSsSOqRq
 9CBHgz1jqgvWjC7C9oK2ALt6DJrxc8W9Wp/wrvrQmo2taNPq8oARpjtV/wh7zYP9d+EC0xJ20
 ZPXB6qhl8F2ifn9yasa5jbhczJoQkzzsGXx5bn9bpzCfM6kSYVn7Mg6cqlu59gZK5qv9c9Y3r
 SO3kM3jDDIKZvnhWUQCIt2Ag==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1724433840; x=1725038640; i=fiona.klute@gmx.de;
 bh=TdB1U6M8NDS/fJaxch3uLvlhpV/GwUYXNRU9Ymrrofc=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=j9EYLebAURZfmb+4quK9ATmaWeoFc0UW7LxuqEItWA0wjqVQAI70NaMffjtgDisC
 x7eyWSMkqc03M0t2nT3YfzGVmXNygIKAwYJ1QsU18tYqVkjs5cu6g/aaR7EYQUyUC
 32FosWzS69cYIZzgAtVVCfmBS+SzsfiLa39iWYkqZvtQ2t7fxV3c/BuxglB5Nt/jp
 ELfyHYO5cJaTnAwFWmWJuO3sFnK4hhXHGwRq8seelWrhLZYc8ndIvwphpsuOFIst4
 4ggaOfRn8bbzSIh98Iy0RCzFJhb9utIaIABarTjACRH4y9nH1WU7JjPOUQwBNEZPG
 nmMZxN8N81gpZRKaaA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=j9EYLebA
Subject: [Buildroot] [PATCH next 2/3] package/python-gobject: bump to
 version 3.48.2
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Asaf Kahlon <asafka7@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Marcus Hoffmann <buildroot@bubu1.eu>,
 "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

Current gobject-introspection releases work with musl, so relax the C
library requirement.

Also update the homepage, the old URL now links to the current one.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
 package/python-gobject/Config.in           | 8 ++++----
 package/python-gobject/python-gobject.hash | 4 ++--
 package/python-gobject/python-gobject.mk   | 2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/python-gobject/Config.in b/package/python-gobject/Config.in
index 3354535637..d9d73cc5e3 100644
--- a/package/python-gobject/Config.in
+++ b/package/python-gobject/Config.in
@@ -4,17 +4,17 @@ config BR2_PACKAGE_PYTHON_GOBJECT
 	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS # gobject-introspection
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # gobject-introspection
 	depends on BR2_HOST_GCC_AT_LEAST_8 # gobject-introspection -> host-qemu
-	depends on BR2_TOOLCHAIN_USES_GLIBC # gobject-introspection
+	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # gobject-introspection
 	select BR2_PACKAGE_GOBJECT_INTROSPECTION
 	select BR2_PACKAGE_LIBGLIB2
 	help
 	  Python bindings for the GLib/GObject library

-	  https://wiki.gnome.org/action/show/Projects/PyGObject
+	  https://pygobject.gnome.org/

-comment "python-gobject needs a glibc toolchain, gcc >= 4.9, host gcc >= 8"
+comment "python-gobject needs a glibc or musl toolchain, gcc >= 4.9, host gcc >= 8"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_USES_GLIBC || \
+	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL) || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
 		!BR2_HOST_GCC_AT_LEAST_8
diff --git a/package/python-gobject/python-gobject.hash b/package/python-gobject/python-gobject.hash
index 2fb9d38ab0..f3bb0a4610 100644
--- a/package/python-gobject/python-gobject.hash
+++ b/package/python-gobject/python-gobject.hash
@@ -1,3 +1,3 @@
-# from https://download.gnome.org/sources/pygobject/3.42/pygobject-3.42.2.sha256sum
-sha256  ade8695e2a7073849dd0316d31d8728e15e1e0bc71d9ff6d1c09e86be52bc957  pygobject-3.42.2.tar.xz
+# from https://download.gnome.org/sources/pygobject/3.48/pygobject-3.48.2.sha256sum
+sha256  0794aeb4a9be31a092ac20621b5f54ec280f9185943d328b105cdae6298ad1a7  pygobject-3.48.2.tar.xz
 sha256  32434afcc8666ba060e111d715bfdb6c2d5dd8a35fa4d3ab8ad67d8f850d2f2b  COPYING
diff --git a/package/python-gobject/python-gobject.mk b/package/python-gobject/python-gobject.mk
index a12ce5c107..a09ddb7e87 100644
--- a/package/python-gobject/python-gobject.mk
+++ b/package/python-gobject/python-gobject.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################

-PYTHON_GOBJECT_VERSION_MAJOR = 3.42
+PYTHON_GOBJECT_VERSION_MAJOR = 3.48
 PYTHON_GOBJECT_VERSION = $(PYTHON_GOBJECT_VERSION_MAJOR).2
 PYTHON_GOBJECT_SOURCE = pygobject-$(PYTHON_GOBJECT_VERSION).tar.xz
 PYTHON_GOBJECT_SITE = https://download.gnome.org/sources/pygobject/$(PYTHON_GOBJECT_VERSION_MAJOR)
--
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
