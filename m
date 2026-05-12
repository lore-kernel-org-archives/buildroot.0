Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7923ECD343F
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:28:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47E3241A62;
	Fri, 15 May 2026 13:28:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QB0xUAFfe1E5; Fri, 15 May 2026 13:28:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 742F741A8C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778851718;
	bh=0rL1x4th9FtiuT8J0b89y83NncVQmAQ+Bd+v2uUaR4c=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PZRxMqXGge3K2FF14cXs8myla3FkgIr/kz1iyXliNrmsoVuhZjYy+9s2tSOqXft5b
	 WsyURfHElfy+bFEOygIiyok5HMU8Qrzm2mqMHLYgUOdpR06vWe8pVJhJOHfW8f0Yp1
	 FsY+aPXAgyfpDBgKinUxDbT2il3xpq2qwH1YNQ4xGWQWEDb42Z6o49zRC4bV41y94d
	 8Dnk2p1Pr1KmGB2uXWJSewMv5wLKowfZWU0GHOvVeI07H46Hv2OwmREvI2q8wLBfsR
	 50lEBL6rHkMj0nbT0TOGG3oCb9HvkAC/HErDgV9NeKZarGGc5ZVhXcm5ykvikXOrQ+
	 mL5Z3xdyxC2TQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 742F741A8C;
	Fri, 15 May 2026 13:28:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 05EC036F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:28:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2F14A6154C
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:28:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GdRTgWx8Oh2Y for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:28:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 98D9F6154B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 98D9F6154B
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:28:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EB7A18634F; Fri, 15 May 2026 13:28:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 12 May 2026 15:28:21 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 80d875769e851af9828c6b4503073c1249736bc0
X-Git-Newrev: 2bc63484712c1e0a51e53724f96cc13ca5d43858
X-Patchwork-Hint: ignore
Message-Id: <20260515132815.EB7A18634F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] DEVELOPERS: Update email
 for Eugen Hristev
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2bc63484712c1e0a51e53724f96cc13ca5d43858
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Replace old bouncing email address.

Signed-off-by: Eugen Hristev <ehristev@kernel.org>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
(cherry picked from commit bd9e30470f66fc491b7a4cef2b0c803e87095b71)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1ce6b0b522..f6bb93c1da 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -927,7 +927,7 @@ F:	package/optee-client/
 F:	package/optee-examples/
 F:	package/optee-test/
 
-N:	Eugen Hristev <eugen.hristev@microchip.com>
+N:	Eugen Hristev <ehristev@kernel.org>
 F:	board/atmel/readme.txt
 F:	board/microchip/sama7g5ek/
 F:	configs/microchip_sama7g5ek*
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
