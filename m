Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52ACED3B98F
	for <buildroot@archiver.kernel.org>; Tue,  9 Dec 2025 18:28:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F286484365;
	Tue,  9 Dec 2025 18:28:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DFMNxyO5UQQ3; Tue,  9 Dec 2025 18:28:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 320D884372
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765304901;
	bh=RXwGvpiXKu8ecxgSwW/tt0OPwaCc6JOwnn8U3y6m6QM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mz2AOlGudBL9jq8QwS8tG9g4KdOKZOq2TnkQ5eoabRAgtUrLUHuQ4Z98pQAzdONJ/
	 TbgQnXeQhjeIsAkmx5ZvOWtp8UBruAhTvHvF2x48MooXVce6a5zpynSuUbFTnxjaFv
	 sZB6vdvvGrE9nemrJbCfqOqGL4rW2lLjR/nv9Ipxsu3sGGPzzQdEYejuhSWVmn0Rzs
	 f5ovGLmIGTerUwzMMG5hj2HxkTDVZPfhwsuKAtb9U65wYmYhiRW5Z0O2brM/nMmWTf
	 bts/3wG1rsaTUVYThiQoNBGfpkzRVpocjbenPBJBTYF4SdWutwhd7gedWJXScu66dW
	 C9Z42XlNY0mag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 320D884372;
	Tue,  9 Dec 2025 18:28:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A91C02C1
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 18:28:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F21760A35
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 18:28:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dqTlvIeLeGuc for <buildroot@buildroot.org>;
 Tue,  9 Dec 2025 18:28:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE3CE608EE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DE3CE608EE
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 18:28:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DC44186967; Tue,  9 Dec 2025 18:28:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 9 Dec 2025 19:24:58 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: db72d16ca1d781f7237dfb0fe6cacd52aeeda6b4
X-Git-Newrev: b6565f494eda8edcf6dd9d38b857fafd35de2384
X-Patchwork-Hint: ignore
Message-Id: <20251209182817.DC44186967@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/ubus: bump version to
 git 3cc98db1a
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b6565f494eda8edcf6dd9d38b857fafd35de2384
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

For change log, see:
https://git.openwrt.org/?p=project/ubus.git;a=shortlog;h=3cc98db1a422dcf560f2d6347fd410f17565a89d

This bump includes a patch which adds cmake4 compatibility.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/ubus/ubus.hash | 2 +-
 package/ubus/ubus.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ubus/ubus.hash b/package/ubus/ubus.hash
index e35f37b03d..3d8206b974 100644
--- a/package/ubus/ubus.hash
+++ b/package/ubus/ubus.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ba7602c660cb2c15c0e04942414e4cf3d96622622406c5fc3b88895694aebb9f  ubus-afa57cce0aff82f4a7a0e509d4387ebc23dd3be7-git4.tar.gz
+sha256  f625bda868133e28749b9eed64f9c3a838c75594e46a6a536e7e3582fe4da8e3  ubus-3cc98db1a422dcf560f2d6347fd410f17565a89d-git4.tar.gz
 sha256  a3caa6c0e90c87b7c97c2ac3d0c0d416082ef777215faec2e9b24ea6e68f6988  ubusd_acl.h
diff --git a/package/ubus/ubus.mk b/package/ubus/ubus.mk
index 913c0e3e39..c0f0264065 100644
--- a/package/ubus/ubus.mk
+++ b/package/ubus/ubus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UBUS_VERSION = afa57cce0aff82f4a7a0e509d4387ebc23dd3be7
+UBUS_VERSION = 3cc98db1a422dcf560f2d6347fd410f17565a89d
 UBUS_SITE = https://git.openwrt.org/project/ubus.git
 UBUS_SITE_METHOD = git
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
