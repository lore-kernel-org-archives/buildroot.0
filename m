Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F6ECD3F083
	for <buildroot@archiver.kernel.org>; Wed, 28 Jan 2026 17:22:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A836040B09;
	Wed, 28 Jan 2026 17:22:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JXCh0mOaFSo4; Wed, 28 Jan 2026 17:22:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B10840B8C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769620925;
	bh=FOmjSX+eUFpBgNRZrpQ3qREDw38lyKJ26de5uAZebOM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IgT9gywcPCtAyAHbsoQkUa315vIvsVbaE6ytV6RlCkgMVcJ3UXje7Gj281mHcCv5x
	 IjKmOqhjGNdhbLuf+V+9x3mhl+xMfLT8C0BHjDGccuYmckvIM7jYi0t07eFFsYbRUj
	 GjQ5xv+TiJMHd//cRlPHwa71ipUuCdGAuJJXW8ZpuMAmd85fXjtf1F0LFZBq8qNi8v
	 rit6T86ckeO5J4iwoGtaJEYJpQFgzZNrBE12jaRflitGAGGHkKShSYdoOXLE9WyMad
	 WM3g8qvnpu8zhAdJKjQN69Ua/HvwSG8dlw2hBfFhVpdOyxi/3lvWplhQMPzY3Mt5of
	 STGLUGT/1t5Iw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B10840B8C;
	Wed, 28 Jan 2026 17:22:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DC666118
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 17:21:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 37C1E60781
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 17:21:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iCAtZjP98iz1 for <buildroot@buildroot.org>;
 Wed, 28 Jan 2026 17:21:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7804660789
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7804660789
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 17:21:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7157686085; Wed, 28 Jan 2026 17:21:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Jan 2026 15:52:48 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 74a922174da93a7ac6026401490e8cdc0712e6b7
X-Git-Newrev: 79f68ee800c091d0dbd198d1ea9797fcf18a5ae8
X-Patchwork-Hint: ignore
Message-Id: <20260128172152.7157686085@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] DEVELOPERS: update
 packages for Michael Nosthoff
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

commit: https://git.buildroot.net/buildroot/commit/?id=79f68ee800c091d0dbd198d1ea9797fcf18a5ae8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

- i don't use grpc anymore and updates seem complicate to review,
  so drop me from it and its dependency re2
- add packages i'm currently using

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 796dfc2c927695b5e9a01f1df295627d4c955949)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 DEVELOPERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index f9fa952b05..2f4df82102 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2417,13 +2417,13 @@ N:	Michael Nosthoff <buildroot@heine.tech>
 F:	package/boost/
 F:	package/catch2/
 F:	package/fmt/
-F:	package/grpc/
 F:	package/gtest/
 F:	package/json-for-modern-cpp/
 F:	package/libabseil-cpp/
+F:	package/libgpiod2/
 F:	package/networkd-dispatcher/
 F:	package/protobuf/
-F:	package/re2/
+F:	package/sdbus-cpp/
 F:	package/spdlog/
 F:	package/sqlitecpp/
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
