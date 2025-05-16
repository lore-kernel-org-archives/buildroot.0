Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C7C5C2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 11:01:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 643E270E3E;
	Mon, 19 May 2025 11:00:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZyjIKCd-d4eu; Mon, 19 May 2025 11:00:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A29570E4C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A29570E4C;
	Mon, 19 May 2025 11:00:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D2CB193
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:47:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 69D8D4198C
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p1A6ABKpFphW for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9272E419EF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9272E419EF
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8FADD82A2E; Mon, 19 May 2025 10:40:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 May 2025 16:19:47 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 9b6e7bf7ee2fb03fae040853a3c12a8e1b46a532
X-Git-Newrev: e42de820cd598d6ed7045fd4f06aa1429a359e05
X-Patchwork-Hint: ignore
Message-Id: <20250519104004.8FADD82A2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-pydantic-core:
 bump to 2.34.1
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e42de820cd598d6ed7045fd4f06aa1429a359e05
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
[Arnout: update hash for cargo3]
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/python-pydantic-core/Config.in                 | 3 ++-
 package/python-pydantic-core/python-pydantic-core.hash | 2 +-
 package/python-pydantic-core/python-pydantic-core.mk   | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-pydantic-core/Config.in b/package/python-pydantic-core/Config.in
index 3eeb1844a2..3f985ae4da 100644
--- a/package/python-pydantic-core/Config.in
+++ b/package/python-pydantic-core/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_PYTHON_PYDANTIC_CORE
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
 	help
-	  Core validation logic for pydantic written in rust.
+	  Core functionality for Pydantic validation and
+	  serialization.
 
 	  https://github.com/pydantic/pydantic-core
diff --git a/package/python-pydantic-core/python-pydantic-core.hash b/package/python-pydantic-core/python-pydantic-core.hash
index aca95d2c13..11b00dc05d 100644
--- a/package/python-pydantic-core/python-pydantic-core.hash
+++ b/package/python-pydantic-core/python-pydantic-core.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  b3e332ffb9193d9fb08bdd8690ceb1ed787d03e1e7c4a00b069715bb3def1424  python-pydantic-core-2.29.0-cargo3.tar.gz
+sha256  475e20938b8dd93465a4e9fe9e030dfa51dcf1961d1cb02e3e50889489defd67  python-pydantic-core-2.34.1-cargo3.tar.gz
 # Locally computed sha256 checksums
 sha256  2afdd30d54b4d62b6f488a6bcc1546e84ec5061f13f4209c03d012348783795a  LICENSE
diff --git a/package/python-pydantic-core/python-pydantic-core.mk b/package/python-pydantic-core/python-pydantic-core.mk
index c27967689d..48fd4960af 100644
--- a/package/python-pydantic-core/python-pydantic-core.mk
+++ b/package/python-pydantic-core/python-pydantic-core.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_PYDANTIC_CORE_VERSION = 2.29.0
+PYTHON_PYDANTIC_CORE_VERSION = 2.34.1
 PYTHON_PYDANTIC_CORE_SOURCE_PYPI = pydantic_core-$(PYTHON_PYDANTIC_CORE_VERSION).tar.gz
-PYTHON_PYDANTIC_CORE_SITE_PYPI = https://files.pythonhosted.org/packages/79/f6/904edea98c98c09b8d618d619749af19a50ea5a71b9199ee2131a5a03dfb
 PYTHON_PYDANTIC_CORE_SITE = $(PYTHON_PYDANTIC_CORE_SITE_PYPI)/$(PYTHON_PYDANTIC_CORE_SOURCE_PYPI)?buildroot-path=filename
+PYTHON_PYDANTIC_CORE_SITE_PYPI = https://files.pythonhosted.org/packages/42/fa/5f682f3db14e14f7b5b7f5008ac24594b93943d1da4facbacff5876624cf
 PYTHON_PYDANTIC_CORE_SETUP_TYPE = maturin
 PYTHON_PYDANTIC_CORE_LICENSE = MIT
 PYTHON_PYDANTIC_CORE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
