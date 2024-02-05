Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 983A8C48292
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 17:37:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E941340135;
	Mon,  5 Feb 2024 17:37:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E941340135
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zZlNIkBDvpSi; Mon,  5 Feb 2024 17:37:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E92DF40162;
	Mon,  5 Feb 2024 17:37:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E92DF40162
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7D6771BF3D6
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 17:37:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5655E60C22
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 17:37:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5655E60C22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zs8P2drEp4z3 for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 17:37:02 +0000 (UTC)
Received: from mail-a.sr.ht (mail-a.sr.ht [46.23.81.152])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C169B607AA
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 17:37:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C169B607AA
Received: from git.sr.ht (unknown [46.23.81.155])
 by mail-a.sr.ht (Postfix) with ESMTPSA id 316D02013A;
 Mon,  5 Feb 2024 17:37:11 +0000 (UTC)
From: ~bubu <bubu@git.sr.ht>
Date: Mon, 05 Feb 2024 18:09:43 +0100
Message-ID: <170715461915.13905.5968173515742280918-0@git.sr.ht>
X-Mailer: git.sr.ht
To: buildroot@buildroot.org
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 bh=Z9DZbBZ+nrn+RgWka0qJXDfDf4N7ITE+hxtgQuG1K9g=; 
 c=simple/simple; d=git.sr.ht; h=From:Date:Subject:Reply-to:To:Cc;
 q=dns/txt; s=20240113; t=1707154631; v=1;
 b=EioxzFUgQrEo8ocdKe6PVQOel3LJ4Nh3gBtgbOmCgw7U/jT42D1Rwp9KIYvTMZFOlX2C7FWd
 x4HUkOvQbUWqcALGf8QhjQprRxsBngCaUxsQNFZMmw87QRjoA+yoVBalwn+g0JpSj/pd/c4aKYW
 /i2exeepGhJGggxznUxoLhXC40cbuqWgTI3w4vqi241fRtABS9GE28BzoPN/uAz0l+MKXnbKTaa
 aRDK/Uo8OdB5Tb0ko4LgUXVwTJwaOENbdlFtUAHwFdUWDTWSGWkEkMAmhHYm0WkIIJJk85UevG/
 1ZtlbxVaT8rrDEZvir4xWF1dpTsCCCQK81vgJtWsFvUEw==
Subject: [Buildroot] [PATCH buildroot v2 1/2] package/python-uvicorn:
 requires PYTHON3_SSL
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Reply-To: ~bubu <bubu@bubu1.eu>
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Marcus Hoffmann <bubu@bubu1.eu>

Uvicorn has a hard requirement on the python ssl module. Without it even
running uvicorn --help fails.

Signed-off-by: Marcus Hoffmann <bubu@bubu1.eu>
---
 package/python-uvicorn/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-uvicorn/Config.in b/package/python-uvicorn/Config.in
index 3e769392f9..c84f54781f 100644
--- a/package/python-uvicorn/Config.in
+++ b/package/python-uvicorn/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_PYTHON_UVICORN
 	bool "python-uvicorn"
 	select BR2_PACKAGE_PYTHON_CLICK # runtime
 	select BR2_PACKAGE_PYTHON_H11 # runtime
+	select BR2_PACKAGE_PYTHON3_SSL # runtime
 	help
 	  The lightning-fast ASGI server.
 
-- 
2.38.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
