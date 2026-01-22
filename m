Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65814D3F09D
	for <buildroot@archiver.kernel.org>; Wed, 28 Jan 2026 17:21:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2221540AA3;
	Wed, 28 Jan 2026 17:21:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a2ecR-mixR2g; Wed, 28 Jan 2026 17:20:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCE9C40A7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769620857;
	bh=p3GaP2AWGeEXBZKEvDWP579T6Z3TrjMaTwEpdEDXiL0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=benCNHzTIjlZPXXNTp/7ErIc8LDD/NQBPGxBV7rZ6r1ien47KTXAOGQwr5XG/bJuV
	 pcK67FSdzplj1wn8o2G9+wRux1S16sOtZClqhJDX7W2MoxQjxqVCuLmRpCDSY9Y5LV
	 8f9qguyq9P34i7vjmxskC9+wpdoGepouAc4mpPJGbgwG1OA6vI9yM5kXqzMDtIG7Yz
	 CLIp/1PWNnN9kKfDi/tcpWmPTBD/yCAcKc1hFMuiiut8DcGvib6qOVPIM3ACc7GdCY
	 7z8f6AQbubo/fYU4sED80kM1FCua3oHDoeFg39ZwwKv2kcSbtFenIU0tGWwwZdgKRt
	 VAXghKfg3ZKUA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCE9C40A7D;
	Wed, 28 Jan 2026 17:20:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8EE5B1AD
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 17:20:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D29760781
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 17:20:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vxal3YvmQFBD for <buildroot@buildroot.org>;
 Wed, 28 Jan 2026 17:20:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4AFB60785
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E4AFB60785
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 17:20:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DD73380749; Wed, 28 Jan 2026 17:20:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Jan 2026 15:52:45 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 4b059f2200a6548dd634a26dbefb4e760de469fa
X-Git-Newrev: 24050693384ee32ada824e7f076883201945faef
X-Patchwork-Hint: ignore
Message-Id: <20260128172037.DD73380749@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] DEVELOPERS: update
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

commit: https://git.buildroot.net/buildroot/commit/?id=24050693384ee32ada824e7f076883201945faef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

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
index 56b47ca168..eba18334e0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2354,13 +2354,13 @@ N:	Michael Nosthoff <buildroot@heine.tech>
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
