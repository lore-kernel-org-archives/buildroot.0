Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF37DD2F35C
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:36:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3EB68382F;
	Tue, 13 Jan 2026 19:36:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yELx9roVd0Kb; Tue, 13 Jan 2026 19:36:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E679837CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333015;
	bh=HH9NpJRvvwH2ygTghVFHuPnuJ/MYvxJavY+m4MyP098=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fE/7/vHTFoAjHCNJeX2acs0254JbXylitJCgbiJlkltIg4BArlpI4OTaaKU3pkw/+
	 UeSNqBZLXl70IUrRI5I80MouwFu2Upd9b6jFDfFhKvEUSIdjvRzUZgzXl7Z+vAWdZ7
	 IRJTzHuZ702KR+rlmqkeY3mmJSzS+Eua0aM+DCwJ/6/0ri359UPM4PHQdNcfjiXhSr
	 Vx5l2hOjSPVg9ahDwnNszP6Zu4Ys9IpI2UbqWQphrP/BqzxMDSNxD4KjTPGaN4HjyB
	 oKJA7cDfLsMK2lkAd1RhS7+nSP3mfnPpQQQexH8KIozslSHCRUa6rKoQVP1IQlEJj6
	 oPLTYosLMRbyg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E679837CD;
	Tue, 13 Jan 2026 19:36:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id F2D8E1C3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3B8C44050C
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4_IFmiPlhACy for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:36:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57CA9404C7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 57CA9404C7
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5609580FAC; Tue, 13 Jan 2026 19:36:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 16:17:24 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 3d13a6de73459a9b468f484ce04b97d50ccc8f00
X-Git-Newrev: fdfd19dc15db492a55d7b2dc2618ff9ec3cd336a
X-Patchwork-Hint: ignore
Message-Id: <20260113193618.5609580FAC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/qt5/qt5webkit:
 fix gcc >= 14.x build issue
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fdfd19dc15db492a55d7b2dc2618ff9ec3cd336a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Add another patch from Fedora, also used in Arch Linux to fix a gcc >=
14.x build issue:

build/qt5webkit-5.212.0-alpha4/Source/WebCore/page/csp/ContentSecurityPolicy.cpp:235:56:   required from here
  235 |             if ((policy.get()->*allowed)(std::make_pair(algorithm, digest)))
      |                                          ~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
host/opt/ext-toolchain/aarch64-buildroot-linux-gnu/include/c++/14.3.0/type_traits:1246:52: error: non-constant
condition for static assertion
 1246 |       static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
      |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit b79eb5a28f50b54078eff5c92fb2c00ac05a2882)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...ore-page-csp-ContentSecurityPolicy.cpp-fi.patch | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/package/qt5/qt5webkit/0013-Source-WebCore-page-csp-ContentSecurityPolicy.cpp-fi.patch b/package/qt5/qt5webkit/0013-Source-WebCore-page-csp-ContentSecurityPolicy.cpp-fi.patch
new file mode 100644
index 0000000000..ab6137dd28
--- /dev/null
+++ b/package/qt5/qt5webkit/0013-Source-WebCore-page-csp-ContentSecurityPolicy.cpp-fi.patch
@@ -0,0 +1,45 @@
+From 286e0280a55949d62b2163d68c827539c141d487 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Sun, 28 Dec 2025 18:35:45 +0100
+Subject: [PATCH] Source/WebCore/page/csp/ContentSecurityPolicy.cpp: fix build
+ with gcc >= 14.x
+
+Fixes:
+
+/home/thomas/buildroot/br/output-all/build/qt5webkit-5.212.0-alpha4/Source/WebCore/page/csp/ContentSecurityPolicy.cpp:235:56:   required from here
+  235 |             if ((policy.get()->*allowed)(std::make_pair(algorithm, digest)))
+      |                                          ~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
+/home/thomas/buildroot/br/output-all/host/opt/ext-toolchain/aarch64-buildroot-linux-gnu/include/c++/14.3.0/type_traits:1246:52: error: non-constant
+condition for static assertion
+ 1246 |       static_assert(std::__is_complete_or_unbounded(__type_identity<_Tp>{}),
+      |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
+
+Patch used in Fedora and Arch Linux:
+
+  https://src.fedoraproject.org/rpms/qt5-qtwebkit/raw/rawhide/f/qtwebkit-fix-build-gcc14.patch
+  https://aur.archlinux.org/packages/qt5-webkit
+
+Upstream: dead
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ Source/WebCore/page/csp/ContentSecurityPolicy.cpp | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/Source/WebCore/page/csp/ContentSecurityPolicy.cpp b/Source/WebCore/page/csp/ContentSecurityPolicy.cpp
+index 9e726d5fe10c..989a59a6122f 100644
+--- a/Source/WebCore/page/csp/ContentSecurityPolicy.cpp
++++ b/Source/WebCore/page/csp/ContentSecurityPolicy.cpp
+@@ -231,8 +231,9 @@ bool isAllowedByAllWithHashFromContent(const CSPDirectiveListVector& policies, c
+         auto cryptoDigest = CryptoDigest::create(toCryptoDigestAlgorithm(algorithm));
+         cryptoDigest->addBytes(contentCString.data(), contentCString.length());
+         Vector<uint8_t> digest = cryptoDigest->computeHash();
++        ContentSecurityPolicyHash hash = std::make_pair(algorithm, digest);
+         for (auto& policy : policies) {
+-            if ((policy.get()->*allowed)(std::make_pair(algorithm, digest)))
++            if ((policy.get()->*allowed)(hash))
+                 return true;
+         }
+     }
+-- 
+2.52.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
