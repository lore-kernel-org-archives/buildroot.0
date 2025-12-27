Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D4AE92722
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 23:40:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21B09607D5;
	Sat, 27 Dec 2025 23:39:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vfZUuM_eMfQU; Sat, 27 Dec 2025 23:39:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2ADE3607BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766878797;
	bh=vtb5ZQSN0109Y2W1RtyTOONXeOfhcIgxGtanBMKPVIU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=h5gIehOFurjC9DEPAYv9YsOKBLA1Q/oGY+baLIBH200/1osCp+1olpH3I2CMyej5O
	 Pp7LEKUNG65P7GAhqELgIE/1WzcDDbzXruk3QULW0uiwVUB1rarhntTbHY8rouuoCe
	 tXURSn3z01Q2QwtN47sjtZ/pm27v6sj9VlrQ4AA6JnN0N4bsGzYRCBKOZTo1d8B5dU
	 B2HJwCeCEjI062ESveojqvY/wucqXxtfIBHCpMfCQ6CMTK0fz5OJtVLID8eFVwmcV4
	 QvknAcKMyrVa2w5dK1M2UDJbpS2d8Z1CFbUv8MMepqyN/YXhV4nW3EAcTMBoHrF272
	 4pgxxYFkd6Pog==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2ADE3607BE;
	Sat, 27 Dec 2025 23:39:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 02A6430D
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 23:39:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E7B4480FB2
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 23:39:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T6dOjOItLwqe for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 23:39:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40B8080F54
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 40B8080F54
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 23:39:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2AAB687900; Sat, 27 Dec 2025 23:39:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 28 Dec 2025 00:15:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4b33839f12c4638ea148c4ac7ae2e85adf79f936
X-Git-Newrev: c687f2fcf50b5aedfc91f6b2c042405235e58396
X-Patchwork-Hint: ignore
Message-Id: <20251227233954.2AAB687900@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/matchbox-fakekey: switch to gz
 tarball
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

commit: https://git.buildroot.net/buildroot/commit/?id=c687f2fcf50b5aedfc91f6b2c042405235e58396
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switched _SOURCE to .gz, upstream does not provide bz2 tarballs anymore.

No autobuild errors recorded due to previous download error with
matchbox-lib.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/matchbox-fakekey/matchbox-fakekey.hash | 2 +-
 package/matchbox-fakekey/matchbox-fakekey.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/matchbox-fakekey/matchbox-fakekey.hash b/package/matchbox-fakekey/matchbox-fakekey.hash
index 3627b13913..03fcfef6d3 100644
--- a/package/matchbox-fakekey/matchbox-fakekey.hash
+++ b/package/matchbox-fakekey/matchbox-fakekey.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4e2fdc9bc20df469d53885c40e104122140131e06d4c184902070ec0b0f2ca9f  libfakekey-0.3.tar.bz2
+sha256  d282fa6481a5b85f71e36e8bad4cfa938cc8eaac4c42ffa27f9203ac634813f4  libfakekey-0.3.tar.gz
 sha256  3271662131760e9b30dd92495a0ea0b598fc457798cc67948947365299dd607d  src/libfakekey.c
diff --git a/package/matchbox-fakekey/matchbox-fakekey.mk b/package/matchbox-fakekey/matchbox-fakekey.mk
index 99921ef8e7..4f32cd9378 100644
--- a/package/matchbox-fakekey/matchbox-fakekey.mk
+++ b/package/matchbox-fakekey/matchbox-fakekey.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MATCHBOX_FAKEKEY_VERSION = 0.3
-MATCHBOX_FAKEKEY_SOURCE = libfakekey-$(MATCHBOX_FAKEKEY_VERSION).tar.bz2
+MATCHBOX_FAKEKEY_SOURCE = libfakekey-$(MATCHBOX_FAKEKEY_VERSION).tar.gz
 MATCHBOX_FAKEKEY_SITE = \
 	http://git.yoctoproject.org/cgit/cgit.cgi/libfakekey/snapshot
 MATCHBOX_FAKEKEY_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
