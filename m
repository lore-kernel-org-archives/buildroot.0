Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFCF9D10C0B
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 12:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F36240029;
	Mon, 28 Oct 2024 12:44:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RWTAUwV3uRzN; Mon, 28 Oct 2024 12:44:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E7E6404AA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E7E6404AA;
	Mon, 28 Oct 2024 12:44:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B35BAEE
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 12:44:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1FFA88128E
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 12:44:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oUPuoHURcVvw for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 12:44:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.201.24.99;
 helo=mail.heine.tech; envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 148A780D25
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 148A780D25
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 148A780D25
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 12:44:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 505E11814B9; Mon, 28 Oct 2024 13:44:41 +0100 (CET)
To: buildroot@buildroot.org
Date: Mon, 28 Oct 2024 13:44:13 +0100
Message-ID: <20241028124423.710867-2-buildroot@heine.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1730119482; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=ibUT5pwd8QbqcD11+GBVYNTJhzfAc+4EIM/98jLC++M=;
 b=X5v2JH9WFxqXsUkIoFqs0l3oJ15NlWiYHWbe2SwphD+p71ohrmgRWHk+0UGKAYXQoN/D6k
 ygKj7tSNqCExqgDXpyq0Dv/Bi2b2Jh6IVI1Ese056ujb1W+KZdBEp460ctxt4rCTVjhYIW
 RN8X4YJTWIUrnXtyfRL7CYZtJxFS/18=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=X5v2JH9W
Subject: [Buildroot] [PATCH] package/criu: fix comment condition
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

in e97fc89e7b a dependency on host-gcc >= 7 was added but
for the comment the condition was not correctly inverted.

Fixes: e97fc89e7b ("package/protobuf-c: bump to version 1.5.0")

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/criu/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/criu/Config.in b/package/criu/Config.in
index 90bb18d355..a56dbe56ff 100644
--- a/package/criu/Config.in
+++ b/package/criu/Config.in
@@ -50,4 +50,4 @@ comment "criu needs a glibc or musl toolchain w/ threads, host gcc >= 7, gcc >=
 		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_18 \
 		|| BR2_TOOLCHAIN_USES_UCLIBC || !BR2_INSTALL_LIBSTDCPP \
 		|| BR2_STATIC_LIBS || !BR2_USE_WCHAR \
-		|| BR2_HOST_GCC_AT_LEAST_7
+		|| !BR2_HOST_GCC_AT_LEAST_7
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
