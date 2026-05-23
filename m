Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22A14CD5BB8
	for <buildroot@archiver.kernel.org>; Sat, 23 May 2026 15:53:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D705160B12;
	Sat, 23 May 2026 15:53:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8k58TwIblmnz; Sat, 23 May 2026 15:53:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 144C9605E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779551623;
	bh=iVIjpF0L/MlWKXXhjVKRRRFIDWxfEUkUOE0+xqcD8Rc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=geyK5rwMnJinl2FLNy77rCSP+Agc/gaMMi1TfXYQjuk07Y7nJZ0o047zYXoxsondY
	 /XiC0gKulvk2CjHjke7SsTad2l7kdy67oPAJVgpkUwBb20HjX3gP7GkKizVsdF4HUq
	 rt7TG3Pcbmxsxh9RwxXJIT29BcmWQyp5fNhtkWLjXIN+H8h8a57u2oHZq0orqmAWij
	 XE9+AZVt2cikbyBelem/KW9jCtHcBzzPnT2MYZZzQp7m500h4moJyBpKk33udRdt0x
	 NkgBYdn93MfEYNk0pTplOEOzsP88aA9MiQezq6Gexh1H/TW1Arr87WWYrk4Ml4A93K
	 dl7ewQwP+xoQA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 144C9605E6;
	Sat, 23 May 2026 15:53:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C1ECB265
 for <buildroot@buildroot.org>; Sat, 23 May 2026 15:53:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB83A40494
 for <buildroot@buildroot.org>; Sat, 23 May 2026 15:53:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZM5GpZl9nkRu for <buildroot@buildroot.org>;
 Sat, 23 May 2026 15:53:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F1B440490
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F1B440490
 for <buildroot@buildroot.org>; Sat, 23 May 2026 15:53:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E600F86C8F; Sat, 23 May 2026 15:53:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 23 May 2026 17:12:12 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 1a173d9918b228d73eeb159b0a3771843712a257
X-Git-Newrev: 298ef0bf92645cad35d2aa731da2c8b7ab8e5abb
X-Patchwork-Hint: ignore
Message-Id: <20260523155330.E600F86C8F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libffi: bump version
 to 3.5.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/298ef0bf92645cad35d2aa731da2c8b7ab8e5abb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

https://github.com/libffi/libffi/releases/tag/v3.5.0
https://github.com/libffi/libffi/releases/tag/v3.5.1
https://github.com/libffi/libffi/releases/tag/v3.5.2

Switched to sha256 tarball hash provided by upstream.

Updated license hash due to copyright year bump:
https://github.com/libffi/libffi/commit/8b0eab28cb45c6862b30f5cadfc1a7fe996b072c

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libffi/libffi.hash | 6 +++---
 package/libffi/libffi.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libffi/libffi.hash b/package/libffi/libffi.hash
index 75be5bbcef..11e30e0e44 100644
--- a/package/libffi/libffi.hash
+++ b/package/libffi/libffi.hash
@@ -1,4 +1,4 @@
-# Locally calculated
-sha256  bc9842a18898bfacb0ed1252c4febcc7e78fa139fd27fdc7a3e30d9d9356119b  libffi-3.4.8.tar.gz
+# From https://github.com/libffi/libffi/releases/tag/v3.5.2
+sha256  f3a3082a23b37c293a4fcd1053147b371f2ff91fa7ea1b2a52e335676bac82dc  libffi-3.5.2.tar.gz
 # License files, locally calculated
-sha256  67894089811f93fca47a76f85e017da6f8582d4ba0905963c6e0f1ad6df7a195  LICENSE
+sha256  d5699fa516968e3a1550e6c902b7441c78856f2603d61bedd0b0662a26655366  LICENSE
diff --git a/package/libffi/libffi.mk b/package/libffi/libffi.mk
index 7ea61dac1e..2f3208333c 100644
--- a/package/libffi/libffi.mk
+++ b/package/libffi/libffi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFFI_VERSION = 3.4.8
+LIBFFI_VERSION = 3.5.2
 LIBFFI_SITE = \
 	https://github.com/libffi/libffi/releases/download/v$(LIBFFI_VERSION)
 LIBFFI_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
