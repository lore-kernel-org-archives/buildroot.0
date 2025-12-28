Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B51BDE9272A
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 22:07:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8080C4055B;
	Sun, 28 Dec 2025 22:07:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gU1tMicasscm; Sun, 28 Dec 2025 22:07:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91F8A407A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766959633;
	bh=JGKNWke+WYAs3DCn6EdvxkHauL6B+eKYvGh5mQKGL00=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Sz3p80DaaAkbWk2W3T6OQKY4AGlKEFFlyO2Mj2ngiDVcXTqzFH4BrINjFUQH7lhJI
	 v9R2V9yE+2N7xAiPfHu1St8oGzlEO2HYZB9WUTT0UZj1ps9mDFWqTVBlaRTFgLgT++
	 bIu8ee26n9JYR2vBANnZ+0Ji6hQtVFqEwUB2n5e+N9iHg+Cp3mAp+rX7CSiu5OLP0Q
	 PmeVcqVuOUMlLaIKqnhIShV9QSoD9HSAnxPSp0El41L57Fr4W7vo1xzK9VBmk9zpO9
	 nweTCXw5wZX4Zy5hsEvARP6/Ijq5rgzw+MqA8OsF3R5HdylpFBWnV2IiuAIdBU5UbN
	 QhcjdTYiHHFmQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91F8A407A6;
	Sun, 28 Dec 2025 22:07:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1FE511E1
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:06:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C169D401FF
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:06:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Bakk_hZSDKp for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 22:06:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC037403FB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC037403FB
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:06:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EAD4E8781C; Sun, 28 Dec 2025 22:06:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 28 Dec 2025 23:02:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d2fbbecf94d02a9ebb284b60bd243e0f9452c0e8
X-Git-Newrev: 50922517f7c3f8c35f1683aab10c33e95f79fe29
X-Patchwork-Hint: ignore
Message-Id: <20251228220645.EAD4E8781C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pynacl: fix sort order of
 dependencies in Config.in
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

commit: https://git.buildroot.net/buildroot/commit/?id=50922517f7c3f8c35f1683aab10c33e95f79fe29
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Updated package as computed by scanpypi.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pynacl/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-pynacl/Config.in b/package/python-pynacl/Config.in
index 0553d82ce9..51623a0a70 100644
--- a/package/python-pynacl/Config.in
+++ b/package/python-pynacl/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_PYTHON_PYNACL
 	bool "python-pynacl"
-	select BR2_PACKAGE_LIBSODIUM
 	select BR2_PACKAGE_PYTHON_CFFI # runtime
+	select BR2_PACKAGE_LIBSODIUM
 	help
 	  Python binding to the Networking and Cryptography (NaCl)
 	  library.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
