Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5119FEF99D1
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:39:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1ED376142A;
	Fri, 13 Feb 2026 19:39:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wKE-wuZUtR30; Fri, 13 Feb 2026 19:39:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5217C616AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011545;
	bh=NP5KROAnKKEr620hFlJzIwNoSZ+h/qJztonv/EvMdbk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KjLeKBRyiURSXWYn2CAcGwabOOS6vH4cjs3zNIi+qKUPK26wcK9UtrbEH5SNJq1oe
	 DtJpeV/3nbH5jbP3dXuVd8ksxhm2NkFDubuS5mpMafDD40N/wBdKXsTY31xj1yOwvp
	 wEmdqhh1T7N6PvbMQn7UwZq3vvW61o0xgJ+1ntjzJSLW00b7m4yYP8MANiQ5p2B1/R
	 W6J2a3jWEI/hY4YJFZ+D1BfRwRkEnlsdKqv6WQFsvl2iBqyU2XKexTiTjEFEyFo0h9
	 C6L7RjdK6QZwfrvvcJdPHH7Mhq3+5xpTgVCUqKt4QvLRE5+yGNWGXrU/pvL7JIFVG4
	 8VNHb7MMIU67g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5217C616AF;
	Fri, 13 Feb 2026 19:39:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A74B869
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E8EFD4131F
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oYrQrJYutWx5 for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E003E4132C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E003E4132C
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D5828825CC; Fri, 13 Feb 2026 19:37:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 15:01:48 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: b5812f25dbe8a992c5783770f12c35830dcdd6eb
X-Git-Newrev: 65f79ccea296127aa56b4847c9c946dce4f5148e
X-Patchwork-Hint: ignore
Message-Id: <20260213193703.D5828825CC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/bitcoin: drop
 dependencies on Boost Libraries
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/65f79ccea296127aa56b4847c9c946dce4f5148e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

The dependencies on Boost.System, Boost.Filesystem were removed in
v23.0 [0][1] and Boost.Thread in v21.99 [2].

This was never reflected in the Buildroot package so do it now.

[0] https://github.com/bitcoin/bitcoin/commit/07269321f38e46e9e02f16d7cd135ea90692638d
[1] https://github.com/bitcoin/bitcoin/commit/b87f9c5edf3895df9650131fcf8551c3ad1d7301
[2] https://github.com/bitcoin/bitcoin/commit/06e1d7d81d5a56d136c6fc88f09a2b0654a164f9

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9171d2982b72f93b973bce6887bd87a91f5c3e1a)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/bitcoin/Config.in | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/bitcoin/Config.in b/package/bitcoin/Config.in
index eedb0897a5..66c8ebbfda 100644
--- a/package/bitcoin/Config.in
+++ b/package/bitcoin/Config.in
@@ -21,9 +21,6 @@ config BR2_PACKAGE_BITCOIN
 	depends on BR2_USE_WCHAR
 	select BR2_HOST_CMAKE_AT_LEAST_3_22
 	select BR2_PACKAGE_BOOST
-	select BR2_PACKAGE_BOOST_SYSTEM
-	select BR2_PACKAGE_BOOST_FILESYSTEM
-	select BR2_PACKAGE_BOOST_THREAD
 	select BR2_PACKAGE_LIBEVENT
 	help
 	  Bitcoin Core is an open source project which maintains and
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
