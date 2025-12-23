Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB181E6F086
	for <buildroot@archiver.kernel.org>; Tue, 23 Dec 2025 17:47:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46F2160D4B;
	Tue, 23 Dec 2025 17:47:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9-EWqTeRpAwR; Tue, 23 Dec 2025 17:47:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 570AD60C12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766512032;
	bh=z856rw4uPCZ30ApNoVs+dSVNKyddEAt6UisOu8AOMAA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=AYVMjXBNARrDSevEQa12oCnyLXdpOCAZXUBeWzDqRYTmZ8LRr3jJ0/iqkF5ktFmVE
	 lKHDCTKWlxs2SURjdttKSNZUg9UzeoHEMAfR+MO96G0Kw6PRgcVirqEBtlz7mTY14y
	 gJ0fvL7kywrAUtQAXoYN80qQ0tr0S4xbP1YqPTMipW7OLjf36kVrtaYQv/r+toLOnM
	 2rHwXUzlTEAw8mho8Bb9KvI5b6WEb8fBxLEo7Q8O9nbbCd2wsMnhUrn7mbRAK7EPk7
	 83mpOGgjvKG3MqV1FDNhJpOBLywfWik02uZMcHMvmp+v8JcTz0pgiDh02NK2cJSlMr
	 9YCpDDd8wYbEg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 570AD60C12;
	Tue, 23 Dec 2025 17:47:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EBEB4119
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 17:47:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D2A9D405BA
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 17:47:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cZHIOKxOHdre for <buildroot@buildroot.org>;
 Tue, 23 Dec 2025 17:47:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC11F405B9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DC11F405B9
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 17:47:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CA97B875E3; Tue, 23 Dec 2025 17:47:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 23 Dec 2025 18:39:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e9786cbb7b50302ae071a83ffaa18958c092290f
X-Git-Newrev: 57395ccf91bc383770e7ba8e15cc3765c0a5fabd
X-Patchwork-Hint: ignore
Message-Id: <20251223174709.CA97B875E3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl8822cs bump driver version to
 latest with support kernel 6.18
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

commit: https://git.buildroot.net/buildroot/commit/?id=57395ccf91bc383770e7ba8e15cc3765c0a5fabd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update rtl8822cs driver for Kernel 6.17/6.18
Fixes: https://autobuild.buildroot.org/results/bafd5af112e49359201580ece3a12bc8724914fe/

Signed-off-by: Viacheslav Bocharov <adeep@lexina.in>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/rtl8822cs/rtl8822cs.hash | 2 +-
 package/rtl8822cs/rtl8822cs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8822cs/rtl8822cs.hash b/package/rtl8822cs/rtl8822cs.hash
index 2a649fe493..ff2e5d3eaa 100644
--- a/package/rtl8822cs/rtl8822cs.hash
+++ b/package/rtl8822cs/rtl8822cs.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  12bf44c0dbce921440f5800a98e877fadda2d656824cca546c2b9e0e99e6a489  rtl8822cs-0ef9ddd619d2a386df90fd7c32b65958b0d675ed.tar.gz
+sha256  71d1d29d1f04a9decaba4e23df0b213fb454c4cf15f6305133d2821188b588b0  rtl8822cs-2519c0b865e31d93daa65fc5b1168722f6ec7526.tar.gz
diff --git a/package/rtl8822cs/rtl8822cs.mk b/package/rtl8822cs/rtl8822cs.mk
index d10388c2e1..c6a541dd99 100644
--- a/package/rtl8822cs/rtl8822cs.mk
+++ b/package/rtl8822cs/rtl8822cs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8822CS_VERSION = 0ef9ddd619d2a386df90fd7c32b65958b0d675ed
+RTL8822CS_VERSION = 2519c0b865e31d93daa65fc5b1168722f6ec7526
 RTL8822CS_SITE = $(call github,jethome-iot,rtl88x2cs,$(RTL8822CS_VERSION))
 RTL8822CS_LICENSE = GPL-2.0
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
