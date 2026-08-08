Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12192C5AC67
	for <buildroot@archiver.kernel.org>; Sat,  8 Aug 2026 14:16:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41A4F80EB0;
	Sat,  8 Aug 2026 14:16:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K1mAmL575OEv; Sat,  8 Aug 2026 14:16:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F7D780EA2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786198610;
	bh=YgDM9GBKk2BAxOfQHdgyy5Jb4Svteojp3BZjC1xaKlQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=L7SOmhBlC3KCqyVJq21eyYfky39Zo7F48AHSY8lwwiUJGBkkeKAFyDRJVGnXdpMmu
	 RiSKf/oaCbH35/PttJ0OEVZipfaDgs4XxLZrZ4Sf7zUeAurRqUjI1qikG3cdAuH35m
	 t4DyWxGSd/26L7M59fn/XZzH0f4uzu49cqhbxTYSuxKhujIKcs0QXuBWY9t7g1b/34
	 Zgn2J//oz1+tozJQiedZ8EWjwEnGD5WJPATUv5whuXp9y37tOdMXT5pX1GHCgwD1kr
	 nk5emxN1qX6RiwurlFLljQQTjzmjxe9mE0mzBPcFl0oITps1R3IHXcCxr8qD5EoM+S
	 vJrJ9tAZnukyQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F7D780EA2;
	Sat,  8 Aug 2026 14:16:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 21E2910E
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 14:16:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 085D0400A0
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 14:16:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LuET4sz3RQbd for <buildroot@buildroot.org>;
 Sat,  8 Aug 2026 14:16:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 506FC400A9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 506FC400A9
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 14:16:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 416708CA06; Sat,  8 Aug 2026 14:16:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 8 Aug 2026 16:08:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a96a0a758fa6b0d0e1f645b21a4f1aa749225580
X-Git-Newrev: 6ceb2a8b06abadea8fbc162f9aff77dd9f11e22e
X-Patchwork-Hint: ignore
Message-Id: <20260808141601.416708CA06@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyudev: depend on libudev
 instead of udev
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6ceb2a8b06abadea8fbc162f9aff77dd9f11e22e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Commit 3f24135c56f6aa8f0524307b7339512fecfa6f92 ("package/libinput:
only needs libudev, not udev daemon") changed libinput to depend on
libudev instead of udev.

However, BR2_PACKAGE_LIBINPUT_PYTHON_TOOLS selects
BR2_PACKAGE_PYTHON_PYUDEV, which depends on udev, causing a broken
dependency chain:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_PYTHON_PYUDEV
  Depends on [n]: BR2_PACKAGE_PYTHON3 [=y] && BR2_PACKAGE_HAS_UDEV [=n]
  Selected by [y]:
  - BR2_PACKAGE_LIBINPUT_PYTHON_TOOLS [=y] && BR2_PACKAGE_LIBINPUT [=y] && BR2_PACKAGE_PYTHON3 [=y]

Turns out that after experimenting, the majority of the pyudev
functionality works fine with just libudev. Only pyudev.udev_version()
has been detected as not working as it calls into udevadm. But the
actual features to enumerate devices and get their characteristics
just fine.

So, to fix the issue, we change the dependency of python-pyudev to
just libudev instead of udev.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pyudev/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-pyudev/Config.in b/package/python-pyudev/Config.in
index aa98c2cc61..1e61228a34 100644
--- a/package/python-pyudev/Config.in
+++ b/package/python-pyudev/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PYTHON_PYUDEV
 	bool "python-pyudev"
-	depends on BR2_PACKAGE_HAS_UDEV
+	depends on BR2_PACKAGE_HAS_LIBUDEV
 	select BR2_PACKAGE_PYTHON3_ZLIB # runtime
 	help
 	  pyudev is a LGPL licenced, pure Python 2/3 binding to
@@ -9,5 +9,5 @@ config BR2_PACKAGE_PYTHON_PYUDEV
 
 	  https://github.com/pyudev/pyudev
 
-comment "python-pyudev needs udev /dev management"
-	depends on !BR2_PACKAGE_HAS_UDEV
+comment "python-pyudev needs libudev"
+	depends on !BR2_PACKAGE_HAS_LIBUDEV
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
