Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C748ECD985
	for <buildroot@archiver.kernel.org>; Thu,  5 Feb 2026 16:30:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A7A041215;
	Thu,  5 Feb 2026 16:30:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MnvoIn70eL0K; Thu,  5 Feb 2026 16:30:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D2CB41237
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770309002;
	bh=M4V5X3g9XkBSS808NX3g9tvryEzcP/HvBp+hnMM/xyg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Cf0/zheQXQuNOmn9ZDv5xYWAzCNesazpN6ymVBscF9vfAFc3QoJci/4Yrs/85Crp6
	 QT9vQ4Vn7fRbiAjG9QqucVjLl1IVbkDDCCiHPJ8pgyH0JJYVicai1Okq6eq3K8/bl4
	 Mt7/xKbgccfX4p9UYFL3jYtlNyFrnY5hT+UMA7U1fD0VCe7/j2R9+UOXgo/fnVOl5a
	 56LE74RluJbxrS0YxBjmTWOOMGqratWXMJp/Mrrmw5/TO/drHviqxOQ4NgQT5petlJ
	 moj1jn2XSVrK7mFk0j2DVYz4JdNWOZSUCa+BTExffPB+WjjAWgozfTYSq9vEaYgj7y
	 CbxoJCBqnCIGQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D2CB41237;
	Thu,  5 Feb 2026 16:30:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2DF3F17A
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 16:30:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1988260B50
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 16:30:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QrL9Fk4X612k for <buildroot@buildroot.org>;
 Thu,  5 Feb 2026 16:30:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2CBEE60B13
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2CBEE60B13
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 16:30:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 11AC786A1E; Thu,  5 Feb 2026 16:30:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 5 Feb 2026 17:27:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 296f509307ae2aea3dbd2064244721d7b8215f9f
X-Git-Newrev: 39d8525edef2662044136462a68ead5f2053b5a7
X-Patchwork-Hint: ignore
Message-Id: <20260205163000.11AC786A1E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/webkitgtk: security bump to
 version 2.50.4
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/39d8525edef2662044136462a68ead5f2053b5a7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

News:
 - https://webkitgtk.org/2025/11/19/webkitgtk2.50.2-released.html
 - https://webkitgtk.org/2025/12/04/webkitgtk2.50.3-released.html
 - https://webkitgtk.org/2025/12/16/webkitgtk2.50.4-released.html

Security advisory:
 - https://webkitgtk.org/security/WSA-2025-0008.html
 - https://webkitgtk.org/security/WSA-2025-0009.html
 - https://webkitgtk.org/security/WSA-2025-0010.html

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/webkitgtk/webkitgtk.hash | 6 +++---
 package/webkitgtk/webkitgtk.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index 90304074ac..3c2f7aedbd 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,6 +1,6 @@
-# From https://www.webkitgtk.org/releases/webkitgtk-2.50.1.tar.xz.sums
-sha1  b599be86497f57fc5b2eb8b5d60ff181fc651752  webkitgtk-2.50.1.tar.xz
-sha256  33e912ee6e3cdb4b9803715f50686af85a60af47f1cf72a6acc6a2db1bb3d9fe  webkitgtk-2.50.1.tar.xz
+# From https://www.webkitgtk.org/releases/webkitgtk-2.50.4.tar.xz.sums
+sha1  719c304539cecca945846700cefebc7339eb5924  webkitgtk-2.50.4.tar.xz
+sha256  d3bfa473845acfab72635bada5e0d134fda6792c5b95c5c5cd141b46125bd8e4  webkitgtk-2.50.4.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index fecca3529d..d9aa48f024 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.50.1
+WEBKITGTK_VERSION = 2.50.4
 WEBKITGTK_SITE = https://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
