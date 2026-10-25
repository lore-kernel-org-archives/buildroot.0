Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27DC1606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 17:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=gFQnpbfG
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3D9460607;
	Sun, 25 Oct 2026 17:04:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MZ2ijptFSwMo; Sun, 25 Oct 2026 17:04:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9BB446060D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792947848;
	b=RNelakDwpWvdCRZChWMR9rvXcLChzR5LAfG+BlTJzPKLsovs0Jz8s2rskISJqIyC6Xgr
	 Q/PxnSb0xR/LPq+LojErqcFFKNZVddgBVqUqlh7fuoSE6E5sq0W922K9QodrfKliTYsoa
	 V9pCKmNb1l9XOasuEy4H+ccXSrRimTBPM480KdmqsNSIYIGuGZ9xKMkF9nPgLY5sL056/
	 Qf5F56NwGgPEZnB4gSdTgAyAhDf37jLmK0S/UA6iy7XhOdf7GnriOM0TKza+Gf6e5KeZn
	 A7wSfhT1oteMkGvrdphWGmseKO4pu1k7umGm8AZGYjlhFntQovoCOGH3lX1PxLlKpkw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792947848;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:From:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=engCpYZwoOJ/+lzCf+e6/VGBLiIuJW9gANVkJBekHTg=;
	b=CU4PeXC4/IZQGpc6HSSOQlwY1tVwD5DDEOQ5lkn6tDmueH59HRfjAubOtUmeSUHdTXb1
	 gNsU7kD0SsGwdnDV751Fpxn2RPVKE7l4XnntZGa79Q40F9akkokH4hLY47YF353kVBKXo
	 A0+fP0q4Best/aX06T35S+rVuY9c34gMXVekNhIU7DmwYpCQXo0YI7njiKl0Kfe5QAUFE
	 NPL91pm/wSfFCJM5wafGQ520bjbWyFeBxdqiHZqRMcVsGrxBy+LnxD7hPsAWiKAU6nxpX
	 ShWSM9XOi7rU2aF6fsKUbxH4S7DM/f1OH3I4fLThnF9aUPjoLo+aCvDzxxK15I0b1CQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792947848;
	bh=engCpYZwoOJ/+lzCf+e6/VGBLiIuJW9gANVkJBekHTg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gFQnpbfGYp4a+KVFuUa40lZbm6whXJIHcBJu8ykEyerC6kKYGv6IUE0j7Y6dm9NFW
	 BrnGwdP3G3tOWrrAMSou2LqV6Pm/u/TSY9aB9QqrJ2Jvaa1FM/l/arho3HyFCX+Rt8
	 +KFzo6VPH5wVcVy2dJ5bLp2dp/iQXlgg1Xpt2kJM0abLtdfggtctVXYPm5SYT+X0r1
	 jbOimeboMlBeX6Yks0+mlOcPQCst3k76tAND56UO7oVXZtWoE+Kpv59JKsRiPXaJrF
	 fve7BLcIa4C7Ah0YXYzt8SSI7NZBqSc7JxG6G7eNBnuFilLKK7y0UE2MTSgAHpIPN+
	 VSnS7JfvnuFew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BB446060D;
	Sun, 25 Oct 2026 17:04:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 62BC34D1
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 17:04:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 549E54009C
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 17:04:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I2hYZo8awzyd for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 17:04:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 3ED1340057
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792947845;
 b=LdPzVtmPPRkHts+0diEdhrc1/ubXB2rLesnII2j7JzHdWGsgfhMWgRfOAgYvRYb1Szu+
 G6yeItkQEsz5yXbrLwVd7iXyWlL0NQHlFSiMlLW7tt02eXqW9x/7KjLUIpRx+xJ0RLBD6
 7TvkCUADxsJJqaOl4Yupsrh2iuRyt/aUnTNcpiwXNV9OlxiqGuz2li4ENvgiGpiMbQLB/
 a/7YiZ9xuV+J0cd1ecfLDnJNW/Px/r95YfaxVHVaiVQXruJnZ7G7Gr5YY/udYTBrsrw8j
 hgpAIHTPVOiS7Yfp0zp5gS6JU72ASATDGAZ8/2lCsF0gLsGPG+zjSgidZIAfYflqi9A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792947845;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=jz/5Apq+KE6XbkBOldcDf+HfoBJVnObK11TThcrxIlY=;
 b=Db+byRMkBilMb3C/KcqF0LJl6FF9jULF62FgOkeyfzMkyxjOk86c2KfdK6vy8cNr9IoY
 0kFLQ6fyEZUi8GQfZPwvQf9VrdiiMMHIYS708+sAnTE2lKr+HYKMmPXg+f0/Db4YqjM/P
 gSA7JqIaN+7W+R9yZROK0JCPhP8BepVRsCPi01QotCqAQrv9gdOC0rZcvGn55/eYQNTir
 WgXREOY0gE5U5z4MhMWbZMCBPYCZf224vbzz41sNofXUAM1Qe80iCJLd4v+WZtwni3kYu
 FLlxjlN9aarzZDJr9UMIQqEOBrHJvrTJLABD+ZRann3ziyb3gSevV0zmFeB8w0YGH2Q==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3ED1340057
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 17:04:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AB346960BB; Sun, 25 Oct 2026 17:02:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 25 Oct 2026 18:01:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4cbc360c77e339fafe9dba9c4dab3625d0a26c25
X-Git-Newrev: fa220dff4d73c5b48948de37eec20bf10b4a8e1f
X-Patchwork-Hint: ignore
Message-Id: <20261025170239.AB346960BB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libuv: bump version to 1.53.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fa220dff4d73c5b48948de37eec20bf10b4a8e1f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/libuv/libuv/blob/v1.53.0/ChangeLog
https://github.com/libuv/libuv/releases/tag/v1.53.0

There's no newer release of uvw, and the current version of uvw
continues to build with libuv 1.53.0.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libuv/libuv.hash | 2 +-
 package/libuv/libuv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libuv/libuv.hash b/package/libuv/libuv.hash
index 366296fcdd..73b08e9111 100644
--- a/package/libuv/libuv.hash
+++ b/package/libuv/libuv.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  c5f14915e2fa7b83b6111c3bc477920559499e10d95f852707420c8725b82d6a  libuv-v1.52.1-dist.tar.gz
+sha256  21425fa398be98b51181a1885df31428092d5435c4373a396351e427322e5f1b  libuv-v1.53.0-dist.tar.gz
 sha256  16de0c32b265cb7d46a6d3bd614f259dd4d693a5e26b3407b04aae8d73041f0c  LICENSE
 sha256  262c44bd2cdba037e6d2a82fba15f5800d292bc993a6f5d6b6ea487744d02836  LICENSE-extra
diff --git a/package/libuv/libuv.mk b/package/libuv/libuv.mk
index b0a538c625..6bfe0779df 100644
--- a/package/libuv/libuv.mk
+++ b/package/libuv/libuv.mk
@@ -6,7 +6,7 @@
 
 # When bumping libuv, check if a new version of uvw is available
 # and bump it too.
-LIBUV_VERSION = 1.52.1
+LIBUV_VERSION = 1.53.0
 LIBUV_SOURCE = libuv-v$(LIBUV_VERSION)-dist.tar.gz
 LIBUV_SITE = https://dist.libuv.org/dist/v$(LIBUV_VERSION)
 LIBUV_DEPENDENCIES = host-pkgconf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
