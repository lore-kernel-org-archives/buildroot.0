Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B0D3FEE4EF
	for <buildroot@archiver.kernel.org>; Sat, 28 Feb 2026 16:05:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C65B4183E;
	Sat, 28 Feb 2026 16:05:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rXLNWXNscRrN; Sat, 28 Feb 2026 16:05:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08DA0417DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772294736;
	bh=RhNj9BIqKYn2vPqsLq6nybaSFZ3TGffrjcGdK//Q6y4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=j0D/sjuSj958SlIRG0wbXsy+yejAehcP+moLP35xYofNGwzpAgBEL/Z+PaHgw+YFE
	 KIcMv9CrAczPaghjPX7zEpzYXQYqhZwWpGqDrfH9T/rOK60j30SWey7N2+8R5pkCEh
	 +cuuEHdkqgUoKcvuX45yCG0MZ47VfhxHbD+0QWsnMBOihgcfXicJ0zkxBOmx47NHWB
	 1XE4Uwe4P7kU3B5mjcprWjSLD6lXa1Pb4Z+l1r3xMoR04woB/e8YJWV2lanYcybw4S
	 lpvh4E1L9HEaw5V2YJCwV3f1CdYTxESX9l0O78lgWlYuzbq2tKy2MvnYXWQTLVgE6M
	 fEJlbqD/eWEKg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08DA0417DE;
	Sat, 28 Feb 2026 16:05:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EAF591EB
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 16:05:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E8820417DE
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 16:05:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ubqgi-wmqIcA for <buildroot@buildroot.org>;
 Sat, 28 Feb 2026 16:05:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 329C4417CE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 329C4417CE
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 16:05:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 27B6D85C2F; Sat, 28 Feb 2026 16:05:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 28 Feb 2026 16:38:07 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 359a92df2964f9af2f01b770c38bcdc7f9cba641
X-Git-Newrev: eba0a3e68302a6c971035879fb6acb56744f85d7
X-Patchwork-Hint: ignore
Message-Id: <20260228160533.27B6D85C2F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libbytesize: bump
 version to 2.12
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/eba0a3e68302a6c971035879fb6acb56744f85d7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

https://github.com/storaged-project/libbytesize/blob/2.12/NEWS.rst

Added tarball hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libbytesize/libbytesize.hash | 3 ++-
 package/libbytesize/libbytesize.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libbytesize/libbytesize.hash b/package/libbytesize/libbytesize.hash
index c3962d7bbd..3697afd982 100644
--- a/package/libbytesize/libbytesize.hash
+++ b/package/libbytesize/libbytesize.hash
@@ -1,3 +1,4 @@
+# From https://github.com/storaged-project/libbytesize/releases/tag/2.12
+sha256  8356bac2cafd2f31f39bf1ad373cef8448cab08b817aeaee5c526d54e81c3c5a  libbytesize-2.12.tar.gz
 # Locally calculated
-sha256  1f6ce157750ed1201ce83edd3c23d997a615c7da30f9a0e5bb44635f66768d81  libbytesize-2.11.tar.gz
 sha256  97bdc721d875501b6243a456333fdfdb1ab64d31c4da2554de845caf4674b946  LICENSE
diff --git a/package/libbytesize/libbytesize.mk b/package/libbytesize/libbytesize.mk
index f163b9ad21..c786105118 100644
--- a/package/libbytesize/libbytesize.mk
+++ b/package/libbytesize/libbytesize.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBBYTESIZE_VERSION = 2.11
+LIBBYTESIZE_VERSION = 2.12
 LIBBYTESIZE_SITE = https://github.com/storaged-project/libbytesize/releases/download/$(LIBBYTESIZE_VERSION)
 LIBBYTESIZE_LICENSE = LGPL-2.1+
 LIBBYTESIZE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
