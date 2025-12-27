Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D88BFE8FDCD
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 15:57:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD32160670;
	Sat, 27 Dec 2025 15:57:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cApQ67iu6KJq; Sat, 27 Dec 2025 15:57:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5066606CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766851059;
	bh=lseYk0JTf5Zx/g5GSEjGKUjhiRvlSk4jswUmffpVR1w=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UWgPnsTsk2ohn74O1dNC4rpahptj5xleTfYCLiM7SheKOg3aAargJHd4gCcTIJSEm
	 JbBwtao6Q60yE7Njn+XKq3ccCUSNBKHo+tXKhrzS4k1h8p9+MCTt4AmUYhB3O/WXe+
	 LtVXF+DP7SsBpp06cyWuQsNcMEO3f49xLG0OuQMOUmH9MghPnzdKkV+n3A2lQ8Kib3
	 Rg5wYiuF403K0P9Ohf0sf/HDfDnEFt1Ln3txXrcNl8wEqX6g3AuyIvP0ftmzNSvFGj
	 o9U8T5VYIPk/0i27NouQ4oLM7mrKaO2y2PEqjhphIE9h79+F6YGCrMRDKJzBLUySVz
	 LyZJO7PFmr62A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5066606CC;
	Sat, 27 Dec 2025 15:57:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C932D8
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 15:57:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 79B69606CC
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 15:57:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zTd27-S9-8x2 for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 15:57:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 986A760670
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 986A760670
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 15:57:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8535F87794; Sat, 27 Dec 2025 15:57:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 27 Dec 2025 16:57:27 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 61966c213322b192a62cc19200902934f9f432d7
X-Git-Newrev: a4cdb412f15f3b6abad2028c955aa3bda7b486df
X-Patchwork-Hint: ignore
Message-Id: <20251227155737.8535F87794@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-can: remove msgpack
 dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=a4cdb412f15f3b6abad2028c955aa3bda7b486df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Dependency was made optional in 4.6.0 release here:
https://github.com/hardbyte/python-can/commit/6058ab9dfe8b3ba5d23cbff670c0fe767147390a

python-can has a lot of optional dependencies, most of which are not
represented in buildroot. As msgpack is used for the virtual multicast
udp can interface[1], which does seem like a bit of a niche usecase,
just drop the mandatory dependency without introducing a user-visible
config option to enable it.

[1] https://python-can.readthedocs.io/en/4.0.0/interfaces/udp_multicast.html

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-can/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/python-can/Config.in b/package/python-can/Config.in
index 34ba35bad2..e3f47813af 100644
--- a/package/python-can/Config.in
+++ b/package/python-can/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_PYTHON_CAN
 	bool "python-can"
 	select BR2_PACKAGE_PYTHON3_SQLITE # runtime
 	select BR2_PACKAGE_PYTHON3_ZLIB # runtime
-	select BR2_PACKAGE_PYTHON_MSGPACK # runtime
 	select BR2_PACKAGE_PYTHON_PACKAGING # runtime
 	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
 	select BR2_PACKAGE_PYTHON_WRAPT # runtime
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
