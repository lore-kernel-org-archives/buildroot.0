Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6296E85388
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 18:19:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 809A9401DD;
	Fri,  3 Apr 2026 18:19:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iJ8fzbZSbgu3; Fri,  3 Apr 2026 18:19:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA21B4022B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775240395;
	bh=yRA278QH3FIxTalEPmzIAAv3IAW5xmwzb/pejqKiCL0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LmHbBZb6RHc+j510mLBZoLL9smMZqREDFmtc4MEPNXt5L7hQP1PT1IqeRX1i7SKS6
	 GQcLLTWLwKeNzcICaZAz1NMq15QNpeDHy6a4kHwc7E+piK4c7YpYfqCEBQmc7A1JZ1
	 9PeJK26YwBA/LJDsWeng+5eyxFt87prqSbuc6GKX6Z9HSEBHQdVtJrfCcld4RwVB6k
	 TQ78T4ZUjhOxtPcAe3jXOpNB5uVcghMFlAmXxe8po7a8RLV32EUYTZY7N/KbqCqqTo
	 XA+CMMh/OO6vKY3yh8Nu3kWUKmFrmnqNm2SaB9vGBZL+FC+cjA5U3t4Qr4UAftxTX8
	 tO6gxNMW7JNJA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA21B4022B;
	Fri,  3 Apr 2026 18:19:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 18A9F1A9
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 18:19:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F2605611C4
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 18:19:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pBAtekax3Iza for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 18:19:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 469636117C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 469636117C
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 18:19:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B3C1380238; Fri,  3 Apr 2026 18:19:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 3 Apr 2026 20:16:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ec6b4dfd32dcd877a24a80bd4ed5597944e6b68e
X-Git-Newrev: 9f44e9c879ddd791e7b320cf02b5a87cc2785424
X-Patchwork-Hint: ignore
Message-Id: <20260403181952.B3C1380238@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cppcms: remove dependency to pcre
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9f44e9c879ddd791e7b320cf02b5a87cc2785424
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Upstream allows to replace pcre with std::regex since version 2.0.0:
https://github.com/artyom-beilis/cppcms/commit/731bc83a980211a704e59a7049957ad579ca7c2f

We switch the package to the new code path to prepare for the removal
of the unmaintained pcre package.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/cppcms/Config.in | 1 -
 package/cppcms/cppcms.mk | 5 +++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cppcms/Config.in b/package/cppcms/Config.in
index 48266e00c1..094dc473c0 100644
--- a/package/cppcms/Config.in
+++ b/package/cppcms/Config.in
@@ -4,7 +4,6 @@ config BR2_PACKAGE_CPPCMS
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on !BR2_STATIC_LIBS # dlopen()
 	depends on BR2_USE_WCHAR
-	select BR2_PACKAGE_PCRE
 	help
 	  CppCMS is a Free High Performance Web Development Framework
 	  (not a CMS) aimed for Rapid Web Application Development. It
diff --git a/package/cppcms/cppcms.mk b/package/cppcms/cppcms.mk
index b39122d12f..28167b0acc 100644
--- a/package/cppcms/cppcms.mk
+++ b/package/cppcms/cppcms.mk
@@ -15,9 +15,10 @@ CPPCMS_CXXFLAGS = $(TARGET_CXXFLAGS)
 # path
 CPPCMS_CONF_OPTS = \
 	-DCMAKE_SKIP_RPATH=ON \
-	-DCMAKE_CXX_FLAGS="$(CPPCMS_CXXFLAGS)"
+	-DCMAKE_CXX_FLAGS="$(CPPCMS_CXXFLAGS)" \
+	-DDISABLE_PCRE=ON
 
-CPPCMS_DEPENDENCIES = host-python3 pcre
+CPPCMS_DEPENDENCIES = host-python3
 
 ifeq ($(BR2_PACKAGE_CPPCMS_ICU),y)
 CPPCMS_CONF_OPTS += -DDISABLE_ICU_LOCALE=OFF
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
