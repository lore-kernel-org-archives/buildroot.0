Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13D4AC71136
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 13:12:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2E914081B;
	Thu, 12 Jun 2025 13:12:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zJi8oEqeD1Co; Thu, 12 Jun 2025 13:12:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 422A640825
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 422A640825;
	Thu, 12 Jun 2025 13:12:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D39341E0
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 13:12:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B9E95404B0
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 13:12:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bX6ZTUWWf-Vs for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 13:12:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5B93F400CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B93F400CE
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5B93F400CE
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 13:12:39 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.24.254]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MOzT4-1uBKeG0O8C-00NgNt; Thu, 12
 Jun 2025 15:12:36 +0200
To: buildroot@buildroot.org
Date: Thu, 12 Jun 2025 15:12:00 +0200
Message-ID: <20250612131200.393469-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:llGkeJ6o7LitRD+77hJ2rKXPFZESWYMPnbCaTO6I/TWwh95T03S
 TvLX6lM/NZ3Uw+P7karhc4uvV5xZlkJ5Igk6G7GJgb1g8rXNMhrTXJfjZ0g2kwZVE6JRqm6
 srT7q3H9Z1HUCzaMIo2edq1SRk+8aXZzK6XEn6gLAnDr/e481cpTaJjR8+HBQtIjxkbpCmD
 2FiFZTGU9HKZ25egu8qkQ==
UI-OutboundReport: notjunk:1;M01:P0:qJKh90RwRdY=;9XJVVm54fX+sMvV2rxu4cgqhknt
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1749733956; x=1750338756; i=fiona.klute@gmx.de;
 bh=1HajZHUeQZdzoIxIKelzCTuWz/L8c2Hdmj9t+n0/ehs=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=MsC4qKtavezYVJp+7bfQcdi8jzj4UvS4EOgevfebYPLszEwvWd6kJeIzN5NWmiDa
 dwHeSA7BD7VsX3Lvb1qgb6ci5bF0xCvoqCAjAACJOm2I74ygowKJTDisKyS+F+aiY
 wwE8zSQTjB1U5V+/x0KoDJuoElBn4JelAj4ePs+Ll64QBhHudrlvPsT5/TzOfD960
 xELTZa7lJxwhPnZOMHgrtgckOMH/XxDvcIEKe5SyNy5HUaEslDfX8DWEdhzZBOTMr
 U8fYZukXvFNHZRnXlWQAtONnAsN/ETDvKgqCrgIXUN/8ePT06dWgYfGMk7DowLNyb
 qNoEyQ5y1SG9uttnQg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=MsC4qKta
Subject: [Buildroot] [PATCH 1/1] package/libndp: fix build with GCC 14 and
 musl
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

Patch has been pending upstream for a while [1], Alpine has merged an
older version that includes some whitespace damage but is functionally
equivalent.

[1] https://github.com/jpirko/libndp/pull/29

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
 ...le-pointer-types-with-gcc14-and-musl.patch | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 package/libndp/0001-fix-incompatible-pointer-types-with-gcc14-and-musl.patch

diff --git a/package/libndp/0001-fix-incompatible-pointer-types-with-gcc14-and-musl.patch b/package/libndp/0001-fix-incompatible-pointer-types-with-gcc14-and-musl.patch
new file mode 100644
index 0000000000..6cf97e8afa
--- /dev/null
+++ b/package/libndp/0001-fix-incompatible-pointer-types-with-gcc14-and-musl.patch
@@ -0,0 +1,43 @@
+From e821ddbfdff5e1b14846421d9196978ffebac346 Mon Sep 17 00:00:00 2001
+From: oreo639 <oreo6391@gmail.com>
+Date: Sat, 15 Mar 2025 18:38:50 -0700
+Subject: [PATCH] libndp: fix incompatible pointer types with gcc14 and musl
+
+When compiling with gcc14 and musl, the following error is produced:
+libndp.c: In function 'mysendto6':
+libndp.c:212:50: error: passing argument 5 of 'sendto' from incompatible pointer type [-Wincompatible-pointer-types]
+  212 |         ret = sendto(sockfd, buf, buflen, flags, &sin6, sizeof(sin6));
+      |                                                  ^~~~~
+      |                                                  |
+      |                                                  struct sockaddr_in6 *
+In file included from libndp.c:27:
+/usr/include/sys/socket.h:343:49: note: expected 'const struct sockaddr *' but argument is of type 'struct sockaddr_in6 *'
+  343 | ssize_t sendto (int, const void *, size_t, int, const struct sockaddr *, socklen_t);
+      |                                                 ^~~~~~~~~~~~~~~~~~~~~~~
+
+In POSIX, sendto() takes a sockaddr pointer:
+https://pubs.opengroup.org/onlinepubs/009604499/functions/sendto.html
+
+While glibc uses the gcc __transparent_union__ extension to mark them as
+compatible types, musl does not, as such we need to explicitly cast the pointer
+to tell the compiler that it is fine.
+
+Upstream: https://github.com/jpirko/libndp/pull/29
+Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
+---
+ libndp/libndp.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libndp/libndp.c b/libndp/libndp.c
+index fa20a31..315333a 100644
+--- a/libndp/libndp.c
++++ b/libndp/libndp.c
+@@ -209,7 +209,7 @@ static int mysendto6(int sockfd, void *buf, size_t buflen, int flags,
+ 	memcpy(&sin6.sin6_addr, addr, sizeof(sin6.sin6_addr));
+ 	sin6.sin6_scope_id = ifindex;
+ resend:
+-	ret = sendto(sockfd, buf, buflen, flags, &sin6, sizeof(sin6));
++	ret = sendto(sockfd, buf, buflen, flags, (struct sockaddr*)&sin6, sizeof(sin6));
+ 	if (ret == -1) {
+ 		switch(errno) {
+ 		case EINTR:
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
