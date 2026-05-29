Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 231A7CD6E4A
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 13:44:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40B95842A4;
	Fri, 29 May 2026 13:44:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 701x09khkJn5; Fri, 29 May 2026 13:44:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F82984281
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780062243;
	bh=DEb+lcbFekBESG9KtWVd4T8C8/fL+DnFq+BbXoa94PE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QCDX3oe7cWlk6m981s9B/oeh4oPCoWVpIvLdFI2VryZ6YCq4rMvNmrYbO3DZHpXUm
	 MY3J5taQDBS2rZaZboqAzzbUpw9QeYVSNt3uzRIWuI1lxN4Mde+MtbY2q5S85MNo0b
	 Z37EJrXtR18piGtwj5dOzlfDqOuHv0SvUfRkIvp1fL2eOh3z5iMM3aoDxM4kXz3JR4
	 tznzWfHTCAfSDAH8rabMoF5+ty5u79FskogTwDO/j1lTq9uxdHJNrv8NhyTUriM5QK
	 OYRp57Ht6Kmq2JKi/epgxfGMUdNQvEzl/43Uo4JUqLZqx+sASB30GCQFaq9ZKlqWu/
	 b55FoeATVjKgA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F82984281;
	Fri, 29 May 2026 13:44:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 48D0AF4
 for <buildroot@buildroot.org>; Fri, 29 May 2026 13:44:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 45C4861412
 for <buildroot@buildroot.org>; Fri, 29 May 2026 13:44:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AXCCoZWOOsE8 for <buildroot@buildroot.org>;
 Fri, 29 May 2026 13:43:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E382D61405
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E382D61405
 for <buildroot@buildroot.org>; Fri, 29 May 2026 13:43:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 543DC815A7; Fri, 29 May 2026 13:43:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 15:36:55 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 190bb8890e2098b1362609f387a3db42eaf784db
X-Git-Newrev: 418bbf025d6054036055c0d0da7696335e603865
X-Patchwork-Hint: ignore
Message-Id: <20260529134346.543DC815A7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libudev: new virtual
 package
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/418bbf025d6054036055c0d0da7696335e603865
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/Config.in          | 1 +
 package/libudev/Config.in  | 6 ++++++
 package/libudev/libudev.mk | 7 +++++++
 3 files changed, 14 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index b7c799d9db..1c0f6d8a29 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -530,6 +530,7 @@ endmenu
 	source "package/libiec61850/Config.in"
 	source "package/libmanette/Config.in"
 	source "package/libubootenv/Config.in"
+	source "package/libudev/Config.in"
 	source "package/libuio/Config.in"
 	source "package/linux-backports/Config.in"
 	source "package/linux-serial-test/Config.in"
diff --git a/package/libudev/Config.in b/package/libudev/Config.in
new file mode 100644
index 0000000000..2dbafe4991
--- /dev/null
+++ b/package/libudev/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HAS_LIBUDEV
+	bool
+
+config BR2_PACKAGE_PROVIDES_LIBUDEV
+	string
+	depends on BR2_PACKAGE_HAS_LIBUDEV
diff --git a/package/libudev/libudev.mk b/package/libudev/libudev.mk
new file mode 100644
index 0000000000..af1b3ddb51
--- /dev/null
+++ b/package/libudev/libudev.mk
@@ -0,0 +1,7 @@
+################################################################################
+#
+# libudev
+#
+################################################################################
+
+$(eval $(virtual-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
