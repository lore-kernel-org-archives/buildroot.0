Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 862B9C982FE
	for <buildroot@archiver.kernel.org>; Fri, 16 Jan 2026 21:04:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D7E0615DE;
	Fri, 16 Jan 2026 21:04:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7N4y6P6259Vh; Fri, 16 Jan 2026 21:04:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 75C43615CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768597487;
	bh=VIpjZghOgvFEdeFqrXSRE2VvP03mFns4MjFdcyrcdbI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jdB/0i3pE4y7C1zXtIdJ92KrEnxaXLFv3y4Q+TuCy9h/pWkB/84R84mMWStI6NOAe
	 KRhqeGZZgJ7+hvtpiJr1r2idAaWtv6hUIDkzpph1N2j4JPRm7xkghpKA37KclMf4wx
	 lh8CILnXR3W5tiJ6Pr+6NMcqsVrFv/CLn8Jk8eoOl+I10iUJcM+0ZLvSunGMUC5M9y
	 30bGjZ8am7PYr2R/iS3Wu/O+aGsbgYKroFWr3BfspqP19xFS08deAL9LdpKpbVqFYJ
	 82KZNs3iVPaBplEZHN1SUHegugmc7Wne7sg90aDvTLrcQKcqTFluGyVBVRtXTbW+Rv
	 lieSR0sey129w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75C43615CE;
	Fri, 16 Jan 2026 21:04:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E92EB160
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 21:04:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E579881095
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 21:04:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0oWwrK4FuKUe for <buildroot@buildroot.org>;
 Fri, 16 Jan 2026 21:04:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 167C18104F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 167C18104F
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 21:04:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0190D8278F; Fri, 16 Jan 2026 21:04:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Jan 2026 22:03:25 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e4d075975f2ce0409a56902b0ef92fb34cdac167
X-Git-Newrev: 796dfc2c927695b5e9a01f1df295627d4c955949
X-Patchwork-Hint: ignore
Message-Id: <20260116210445.0190D8278F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: update packages for Michael
 Nosthoff
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=796dfc2c927695b5e9a01f1df295627d4c955949
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- i don't use grpc anymore and updates seem complicate to review,
  so drop me from it and its dependency re2
- add packages i'm currently using

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 2005ef8f4d..9ed4bdb0a0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2423,13 +2423,13 @@ N:	Michael Nosthoff <buildroot@heine.tech>
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
