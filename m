Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61614CD8C92
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:01:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0547A8558B;
	Tue,  9 Jun 2026 13:01:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ugApesM5VVNn; Tue,  9 Jun 2026 13:01:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A82885555
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010086;
	bh=RDlfdluFp1i1Wam3+ZW1iafTEsJ3N4zlJctxCLDH9/w=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Mqhh7Kvxo+EgGv/FKQDz4AqV5wr+QaONLyOPo78hQ1iP2TyvNhMPivz7LMLDatGXB
	 Dp7NQonT21VcAyDhcZDKI3aIHqGGtIyhVps3uoOKXgaBcIClt4otUjW6KtPIpQHzU4
	 WO3vBpD4C+qX6EL5SYUjqnz3zwGtPW/OfRQU4n4HHc/r7TAsGum2+VumFg5dJTlE4A
	 FQAED57dQ2AI4yZ63rEjvxXn8RpbBKFePLgpNsyNR6gNM74Zn83UFhcJjhiYxk/tv7
	 m1vBYLasLvHbPCEDfvCJYB7mq6EOeQjZSqYgIQWdOAifW+3l2BYysLjsQij8ewhQyK
	 WPj2IPCH3wShQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A82885555;
	Tue,  9 Jun 2026 13:01:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E0F9190
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3F1F7423C1
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sgDfTMrQCBhS for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 548D2423C0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 548D2423C0
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8FA9887E7E; Tue,  9 Jun 2026 13:00:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 14 May 2026 15:44:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a9b08e522c6641cc9bf18d054a88c9641fbd41b6
X-Git-Newrev: 9f8505151975a69b721ab7a75af8f7aa2125c22d
X-Patchwork-Hint: ignore
Message-Id: <20260609130058.8FA9887E7E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libsemanage: bump version to 3.10
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9f8505151975a69b721ab7a75af8f7aa2125c22d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/SELinuxProject/selinux/releases/tag/3.10

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libsemanage/libsemanage.hash | 2 +-
 package/libsemanage/libsemanage.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libsemanage/libsemanage.hash b/package/libsemanage/libsemanage.hash
index 1fd5a8019b..ce4bb1fc76 100644
--- a/package/libsemanage/libsemanage.hash
+++ b/package/libsemanage/libsemanage.hash
@@ -1,5 +1,5 @@
 # From: https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256  ec05850aef48bfb8e02135a7f4f3f7edba3670f63d5e67f2708d4bd80b9a4634  libsemanage-3.9.tar.gz
+sha256  1978894c414769ad77438d26886eaae3fb7bb74578ef2a5ad3130c89cb5cb1fe  libsemanage-3.10.tar.gz
 
 # Hash for license file
 sha256  e1c0890440efe31b6cd2ee2abf895eb917c787799f079133f5809414d90d5d60  LICENSE
diff --git a/package/libsemanage/libsemanage.mk b/package/libsemanage/libsemanage.mk
index 12e378f045..b0b20aec7a 100644
--- a/package/libsemanage/libsemanage.mk
+++ b/package/libsemanage/libsemanage.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSEMANAGE_VERSION = 3.9
+LIBSEMANAGE_VERSION = 3.10
 LIBSEMANAGE_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(LIBSEMANAGE_VERSION)
 LIBSEMANAGE_LICENSE = LGPL-2.1+
 LIBSEMANAGE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
