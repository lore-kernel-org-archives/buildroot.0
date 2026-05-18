Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C64A1CD4F4A
	for <buildroot@archiver.kernel.org>; Mon, 18 May 2026 20:01:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2428C607D1;
	Mon, 18 May 2026 20:01:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SOeTehDvXKJC; Mon, 18 May 2026 20:01:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 20BCA607D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779134482;
	bh=FV1PDeq741nkc/xDddQ/iRJJdyG/7KtiquE5/GbvbxE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gv0FilxoZcZqzAqcZNsSLEnzVmxJ11vmcZejo1b83KRvxGTmQwXDw8wqxtvK3FvNZ
	 oSc8Z9aX6yUAyAVYmE/S6EE2JEv0pA784ejiisDCWTX7+uHlpSmw4C05tlWz0xGq/x
	 L74bR11+IIlxyK9N/fCWYt8I+MSpZoyAgbB/L/MZ8WG8h7OrxVWc6EYielZHKRpJ0J
	 RHlaSy5Qio5ZwymxwVXHq2Qxw4ZS4Ui+HREMAn51lx7XQXWvojnxIE2iSEYS40dbqg
	 ahdTCb0/W4qhvGgz8ovXO4LGYYXjpE4s66ohxHhLJuAfBvxtuRVBNT1b9Fn29qkbRN
	 QecbBaWNhHWCQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20BCA607D0;
	Mon, 18 May 2026 20:01:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B8D2265
 for <buildroot@buildroot.org>; Mon, 18 May 2026 20:01:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6213740937
 for <buildroot@buildroot.org>; Mon, 18 May 2026 20:01:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qrxaZBhRt0cc for <buildroot@buildroot.org>;
 Mon, 18 May 2026 20:01:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7322C4028F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7322C4028F
 for <buildroot@buildroot.org>; Mon, 18 May 2026 20:01:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 28E2E866EB; Mon, 18 May 2026 20:01:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 18 May 2026 21:48:50 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 7a5b27453fb06bd25c5c78012ae1e5bcd7e2c07e
X-Git-Newrev: 6fda245fea3d162b47472240bd1f0af7bd98753a
X-Patchwork-Hint: ignore
Message-Id: <20260518200110.28E2E866EB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/poco: Do not unpack
 libpq-fs.h
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6fda245fea3d162b47472240bd1f0af7bd98753a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

The file was introduced in the project when postgresql support was added,
and has since never been used by the project internally.

They already depend on postgresql when the option is selected, so
let the postgresql package provide the header. Otherwise, the header
file provided by poco conflicts with the one provided by postgresql.

Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: John Ernberg <j@j-ernberg.se>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/poco/poco.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index fe1dd29855..40dcc1c502 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -11,6 +11,8 @@ POCO_LICENSE_FILES = LICENSE
 POCO_CPE_ID_VENDOR = pocoproject
 POCO_INSTALL_STAGING = YES
 
+POCO_EXCLUDES = **/libpq/libpq-fs.h
+
 POCO_DEPENDENCIES = \
 	pcre2 \
 	utf8proc \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
