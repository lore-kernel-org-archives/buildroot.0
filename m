Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEA43E9A053
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 17:24:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70EEC608B8;
	Thu, 19 Feb 2026 17:24:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mz5aoEzOTa1Z; Thu, 19 Feb 2026 17:24:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B2C4F60A4F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771521855;
	bh=qxlLx/sfq4nOfGduim/DSVfqXwyTfXCDq5x2C4ROiaE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OGhfjzg1hDLWFLBFlS4J5jbaBhEdAqRKvsk6HulZHpclRhZh6aRZCG1tpbo9pO+Pb
	 h8L9MQ7QRdZpb15jGQWPrInXlPwCZD0d/QfBQbNBtgIWL54FnBghl/MCjCMebPTCHu
	 y+JEPOjkfWrE3UQ0RKB0OT9qK0uhYYyUX44MuAMB51NubBbHs4wuKTLWIUIYW3b4C6
	 pmAqGtNBbZ6W/Ya4++u8aihuNhMXVJ3YRWpF7q6FCZHCmzk9l9VFewXA4QMKsKg7GV
	 GmOYlaj4BzjFhhQUpW7ufnwMIR677oDT3asDlxd+vdrWbgqqWQbI3aJ8JsP+qJYN4K
	 vL5HDkhVVnQSw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2C4F60A4F;
	Thu, 19 Feb 2026 17:24:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A735A1CE
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:24:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 98BB840D08
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:24:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OdkvuhXgkIH9 for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 17:24:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE77840CBC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE77840CBC
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:24:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AC0E686FA5; Thu, 19 Feb 2026 17:24:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 18 Feb 2026 19:12:18 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 6569e8b657072b4b5640f35c9ebb50b95f508a49
X-Git-Newrev: d393c0feb451d0a4fefa14d913c6d204005c6008
X-Patchwork-Hint: ignore
Message-Id: <20260219172413.AC0E686FA5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] DEVELOPERS: add missing
 final slash
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
Content-Type: multipart/mixed; boundary="===============1501553382621986256=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1501553382621986256==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d393c0feb451d0a4fefa14d913c6d204005c6008
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

Fixes: 3963c3c06e3a4161e0ebb570db80ab0b297c9a6a ("package/python-scp: new package")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d8e3c0513230c1ea7210b000f210bf9ac59c4a5f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index fd97e79b3b..41c985633d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -150,7 +150,7 @@ N:	Alexey Lukyanchuk <skif@skif-web.ru>
 F:	package/zabbix/
 
 N: 	Alexis Lothoré <alexis.lothore@bootlin.com>
-F: 	package/python-scp
+F: 	package/python-scp/
 
 N:	Alistair Francis <alistair@alistair23.me>
 F:	board/sifive/

--===============1501553382621986256==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1501553382621986256==--
