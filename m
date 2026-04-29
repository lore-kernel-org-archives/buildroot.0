Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD4F3FF8864
	for <buildroot@archiver.kernel.org>; Wed, 29 Apr 2026 07:56:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9677C40E7D;
	Wed, 29 Apr 2026 07:56:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yYql2LKlryom; Wed, 29 Apr 2026 07:56:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9675040E7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777449363;
	bh=TY+kBm5Aaxzb9+NMjlAMVJNGX4Uuq3Gssv7af3NmOwc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qN5ZLSZdMxquf+GK8mXaWN8HAB5OI9vA5oG+j9YV0mX3iHrD9SrTxMQCyUodGexUr
	 7v4jTX74sbXeKLFZ4QoqZSTLiPW5vdQ0LfK2ejCi5WiVGFmvWngJP8eoENxoA/+ejh
	 FJzfX7gaXzjLq9P47skJa/lOp/Ti5e6faKW28hXTQbffqtTKoSyGPIjJWS+ARQOoHa
	 LV6IvZXiC/lVFGmomxlQbjzn1l/JexetIqY7pm3ffthYmSJylRgMqMZ2MqoZXTG377
	 d6naSfsXKrjHhi4Tu7Ue6BHAXIRHMFTLi+fLgHgbiV+g3QOSzmIYCswWHpefLWSGnw
	 GffAmHfPfgu5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9675040E7C;
	Wed, 29 Apr 2026 07:56:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A67201B8
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 07:56:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 989AA40E7C
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 07:56:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lSShB8Nf--4v for <buildroot@buildroot.org>;
 Wed, 29 Apr 2026 07:56:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95C9F40E7A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 95C9F40E7A
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 07:56:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 27A5383A81; Wed, 29 Apr 2026 07:56:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 29 Apr 2026 09:55:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3a488674b52f2515b3cc54526253682749553d11
X-Git-Newrev: bd9e30470f66fc491b7a4cef2b0c803e87095b71
X-Patchwork-Hint: ignore
Message-Id: <20260429075600.27A5383A81@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: Update email for Eugen Hristev
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bd9e30470f66fc491b7a4cef2b0c803e87095b71
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Replace old bouncing email address.

Signed-off-by: Eugen Hristev <ehristev@kernel.org>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index c6c228ae91..1270365ef0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -968,7 +968,7 @@ F:	package/optee-client/
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
