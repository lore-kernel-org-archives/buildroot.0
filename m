Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FF54CAC5BB
	for <buildroot@archiver.kernel.org>; Sun,  5 Oct 2025 08:03:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 195D560C29;
	Sun,  5 Oct 2025 08:03:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uSmCh0RGeCc3; Sun,  5 Oct 2025 08:03:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2227360BC1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2227360BC1;
	Sun,  5 Oct 2025 08:03:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 51B48226
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 08:03:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3341060BC1
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 08:03:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QOoy-8UVnEum for <buildroot@buildroot.org>;
 Sun,  5 Oct 2025 08:03:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CDB0A60B0E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CDB0A60B0E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CDB0A60B0E
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 08:03:27 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a03c3.dip0.t-ipconnect.de [91.58.3.195])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B8CBDA4C5BDA
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 10:03:24 +0200 (CEST)
Received: from [192.168.1.144] (port=52198 helo=bruckner.lan.fli4l)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v5JiG-00000000802-0jvI
 for buildroot@buildroot.org; Sun, 05 Oct 2025 08:03:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  5 Oct 2025 10:03:23 +0200
Message-ID: <20251005080323.2103951-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251005080323.2103951-1-bernd@kuhls.net>
References: <20251005080323.2103951-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1759651404;
 bh=gUSQ49ZKC3KHkfjp3sMdZ921QZrQBtAZ9LLymbk2zPs=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=JH9wKEgjjaiY1fevYPC87J/GpTAsDkut0Epa8u1dVhpHicXT4RlO/mrQ8y+h7iqJq
 zurLY5KFeN8wHCDMUPmwa+akUurrF/9eemaDt/PRZXZYvmFEf3stDrvK+4rxeBDnhU
 Kp0JgwPVSsyWpYiaIFYNtFvTeZncdVHhpxBTxnYN5j2BxhNpbiYjcyfQRuQy9nycaQ
 shA5C4T5nB9EHtwVj/a/EynlGTEherE8EPYkl0H5D2T1Ed11oA5kTULn/aCUvSNg0R
 QWqSS6Upr2gTV8G4rh1DYfizWw5Whiv8nRclvZAZouWjWf5vmQw/hTeJTc+1LXQv28
 3YylIFz6AIXKA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=JH9wKEgj
Subject: [Buildroot] [PATCH 2/2] DEVELOPERS: add Bernd Kuhls for libid3tag
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 886ba7ab94..764bab7b04 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -418,6 +418,7 @@ F:	package/libglew/
 F:	package/libglu/
 F:	package/libhdhomerun/
 F:	package/libheif/
+F:	package/libid3tag/
 F:	package/libilbc/
 F:	package/libldns/
 F:	package/libmicrohttpd/
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
