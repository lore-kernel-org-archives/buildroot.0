Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C7FC79F80
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 16:22:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5563A81097;
	Fri,  4 Sep 2026 16:22:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tad2wbxHgPur; Fri,  4 Sep 2026 16:22:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 3C72480F9F
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788538931;
	b=G5GYBkf8QizQQ0nQDV/DeuEwS3Vf+CCT7q/TmqEcIXBxqkfouQisNQcZIU+Zr4xWwX3Z
	 QwjKJAU4j2KQLqc7OoCqfKbj/4td+Q7WmVqE0fQr4UsvrVlkDPzmLiBlabR6SQ6J6Q+xs
	 829qhy1q2IjgAQFJqFnMD+ZQJsduBIBQD+B2HZP6W2dBc1OeQ2sfuK5O+ymR45QsrYjSE
	 HsHYlXEtysWENzvQG+XslrNYD5JokLocNNHs0Y/ly6rB6IEgV00AvAGxy+tGvqozYw/xk
	 jG/6ODfAKM8MwZjSHYOmddNHZkwlrfnxDWQ7WVZQicMIUn9WhXLvBAjV89Z9vEK6goA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788538931;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=LrmK4Y/8nsAty75B1BTpMhVyHlY2ih+9xiZ4fZQihKs=;
	b=G2m1VG1swRSN/Y3yGI7tGtEhUUmIXMjM+MEzGFmTwaSY4JnPpp+pQdJkYMxWxzw7bAum
	 TarjhfR3YpPj73nQcL+a4AdyrEXbR9bgi1l8c6urUbztEiaqj6wa5jvagtyOgHQK3/vqu
	 j8o2ppzX31sPj8PMBhX81s1jTWSkyYUr2kae0+8JUSFOJq7V4ijIT00Wn7iEIKUKve01I
	 8dyMllKX5J28HMVRYL0iu0ssR2jrQcTKcsELg2+zNHk1pHlso+DlIoM2p4OqZMMRp/dZY
	 PIJWeixlD4Iw+G1CB6g8OP4CpKmhOsn9F3bUxP1XRknFqfk0zLWLVvvYzQ5kA7QtJ6Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788538931;
	bh=LrmK4Y/8nsAty75B1BTpMhVyHlY2ih+9xiZ4fZQihKs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Eq5W8EdFJsj0skefWt6XNY5uvOhct8ySjJYgMQmql7nSwP986/xYAt6SvHNH4REUE
	 RQyre117iOEAMXNoFvp4I2DXV5nlUd44/EsBvOdYS/noBhs4d7oXmY/aj5Y+kRXoEI
	 XG1q+5fYOPlwnF65I2PdM06HkqA+2veWrbN34S8dwds9wuJHTBEcGcmcjF/k39qesQ
	 /K7N2egOLTFOIBwEQhaYl9rxN9BkYim0THDO46IZu511JaY6/nf2Dc5FpDHSk17nXd
	 f/gowu7yf+j+yyG5aSEZJBH6vZTv4G0QTZUjgMfL/UvNugFZdUCPSAm6h1F3E2kbMi
	 fnkXFROrQzEzA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C72480F9F;
	Fri,  4 Sep 2026 16:22:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 01FCDB2C
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:22:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E80686069C
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:22:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nPpE56agFgET for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 16:22:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org F2D76606A7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788538927;
 b=HRQqEGjMAQ6KP6F2p2s9FmYtQ1qZ+xe5yRsbBvMtqTiLyasOOf8iLOkmMmmxNJ43Y+nV
 ise3kD2h0XBGBuCf0VkROGJocU4/VlhvDbQpEoOiJMzz1vGgqhUEWeEIeJlrSBOv+nRLH
 VmSNuZCnTi681AsLUiLsfnSe7gYEQI75A9los07bP33Swe+8wMeqr8NJgtKn+aJjYWZIR
 94zfeIdcn5QxfWffT5e+DBUAV9DxrmCm42PBtci2lfvQLF4UC4isZKuHsnCVK/O6aq3AR
 JdtHWO7Ul7kEzeL7VwQoA6zTcZDCJf9sZIs65f9J6whz0UR45l5i2Y1emvXbcJdXHhg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788538927;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=hjiHXw+QQl15fRheqwQAUuZQc+PCTLmVGkTivI9aEpg=;
 b=sNhmGfbT2ANFQDesHtmjm+7i1te4jUdkvgN9Pgv/JYLaMBX41MqJsnQUzpSRDFojuuyI
 7c090Odky5Zq5p4YEVefUy5mNbDWyxzjwkXt9ZRDLRbxsIcrV2H1xGFvdTF/CREqwo0g9
 CBXdrWdH/asT4kAtCFTBOTaouDfVBV0cYN4l8Kj1frSG0fSdVKf0nzKsTJMRsiuaVgMxT
 3v/IMHRPV4KQxnyM1S8GFVBuDf4Za+oRzzvz6PiudXjLl/F/oWXFgOkZyvjuz4E/dYKYC
 Wo9l+GTKUBJVv/CyFIZOVGPq539KZbkpQkUDoGe2MibKZrkDwVl962AWgakkXyDJY0A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F2D76606A7
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:22:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6109B94CDC; Fri,  4 Sep 2026 16:21:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 22 Aug 2026 13:14:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bdd74f011f88fd1a3d7dc4c2a93a54ed7ce7286b
X-Git-Newrev: 43cbd2b46ad88c6a88b732caaf621acd20344139
X-Patchwork-Hint: ignore
Message-Id: <20260904162106.6109B94CDC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zfs: bump version to 2.4.4
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
Content-Type: multipart/mixed; boundary="===============7795903067045740051=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7795903067045740051==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/43cbd2b46ad88c6a88b732caaf621acd20344139
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For release note, see:
https://github.com/openzfs/zfs/releases/tag/zfs-2.4.4

Signed-off-by: José Luis Salvador Rufo <salvador.joseluis@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/zfs/zfs.hash | 4 ++--
 package/zfs/zfs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/zfs/zfs.hash b/package/zfs/zfs.hash
index aa8af8b8c3..e5c50ad141 100644
--- a/package/zfs/zfs.hash
+++ b/package/zfs/zfs.hash
@@ -1,5 +1,5 @@
-# From https://github.com/openzfs/zfs/releases/download/zfs-2.4.3/zfs-2.4.3.sha256.asc
-sha256  1f08f2d154f5189b5f1382848a32667b3d34066145b474c49cd3d41a5fba59a7  zfs-2.4.3.tar.gz
+# From https://github.com/openzfs/zfs/releases/download/zfs-2.4.4/zfs-2.4.4.sha256.asc
+sha256  2a3c70d55a37cc71618a95a60e81ad66530201eb118d37741dc92efcf848c8b1  zfs-2.4.4.tar.gz
 
 # Hash for license files:
 sha256  1ffb70c33c4f79f04e947facc5c7851f289609256aacb47fc115f700427d9520  LICENSE
diff --git a/package/zfs/zfs.mk b/package/zfs/zfs.mk
index 2cde68307d..071557bf3e 100644
--- a/package/zfs/zfs.mk
+++ b/package/zfs/zfs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZFS_VERSION = 2.4.3
+ZFS_VERSION = 2.4.4
 ZFS_SITE = https://github.com/openzfs/zfs/releases/download/zfs-$(ZFS_VERSION)
 ZFS_SELINUX_MODULES = zfs
 ZFS_LICENSE = CDDL

--===============7795903067045740051==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7795903067045740051==--
