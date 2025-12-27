Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A9DDE8FDCD
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 15:53:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35D094043A;
	Sat, 27 Dec 2025 15:53:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9yeY97ERgoBf; Sat, 27 Dec 2025 15:53:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 789C94043B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766850813;
	bh=oBHUbIjTjKxuMU7pndJ++ac0Ubpb2wXrj2e4H2K98hE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Ma448xHp4m5AkhXZ0/ot6czOkm5YH95u8MH7P7wH00l/ygJ+NRw1FhK/tlrqCFFJs
	 iZXKC8jbQjAg17EN5w/HWiPnmRZTFKt7bAD8HD+Us2Mcv9Rh9rUHmucsfW16eYUONh
	 RossC7GrT0lTwgMzzAtrKMzsm0r+6wloOR3Km5QjIYIxEAzbBDyqymW2Dcv3rHdSnn
	 XWD19P/8HkEcK8J1fZtSPm22esFQG7fqN+NeWwdRxDfL8u4zmXYvc4y5cF1l0VfbkK
	 uChgJqyO4PC1XvFjapknNCIZBzZ1aN+4PiRGW6erIxOD4DCyOkQL4ZhuigdRBnkvhz
	 NNfMKQqWf5q6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 789C94043B;
	Sat, 27 Dec 2025 15:53:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 15BFB30D
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 15:53:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ED7B040298
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 15:53:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FXrqoHCy_t2T for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 15:53:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 37ADF4026D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 37ADF4026D
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 15:53:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 295B187791; Sat, 27 Dec 2025 15:53:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 27 Dec 2025 16:53:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fe917c36719de4916bfa4be0397d8c838b0d021d
X-Git-Newrev: 29e9566a001e7eb42e3bd2aefd54d7fc67a4cb21
X-Patchwork-Hint: ignore
Message-Id: <20251227155330.295B187791@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/open-lldp: bump version to 1.1.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=29e9566a001e7eb42e3bd2aefd54d7fc67a4cb21
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/intel/openlldp/blob/v1.1.1/ChangeLog

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/open-lldp/open-lldp.hash | 2 +-
 package/open-lldp/open-lldp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/open-lldp/open-lldp.hash b/package/open-lldp/open-lldp.hash
index 1fbd8dd0ca..8bbba470aa 100644
--- a/package/open-lldp/open-lldp.hash
+++ b/package/open-lldp/open-lldp.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  13e0890527192a6289e6dac82056c447a1e2624ff93b0b6bbd8a42d15b2cbc8c  open-lldp-1.1.tar.gz
+sha256  2faa9db57f8426db9f394bd2bab87237a350ae43437b16faf6569250cda25a69  open-lldp-1.1.1.tar.gz
 sha256  67af5abeb092213cd9c53781503320f635ba28b641e0c3f24d367e8e93a9839b  COPYING
diff --git a/package/open-lldp/open-lldp.mk b/package/open-lldp/open-lldp.mk
index d42dbcc5c3..0b84b6773e 100644
--- a/package/open-lldp/open-lldp.mk
+++ b/package/open-lldp/open-lldp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPEN_LLDP_VERSION = 1.1
+OPEN_LLDP_VERSION = 1.1.1
 OPEN_LLDP_SITE = $(call github,intel,openlldp,v$(OPEN_LLDP_VERSION))
 OPEN_LLDP_DEPENDENCIES = readline libnl libconfig host-pkgconf
 OPEN_LLDP_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
