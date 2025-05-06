Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 934D3C3ABBF
	for <buildroot@archiver.kernel.org>; Tue,  6 May 2025 21:03:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4863B606A9;
	Tue,  6 May 2025 21:03:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dCcFMF1MgsGw; Tue,  6 May 2025 21:03:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 672B960A9D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 672B960A9D;
	Tue,  6 May 2025 21:03:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 54ED120F8
 for <buildroot@buildroot.org>; Tue,  6 May 2025 21:03:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3B28240527
 for <buildroot@buildroot.org>; Tue,  6 May 2025 21:03:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JnBJBr1ktlR0 for <buildroot@buildroot.org>;
 Tue,  6 May 2025 21:03:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 93B3740B2C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 93B3740B2C
 for <buildroot@buildroot.org>; Tue,  6 May 2025 21:03:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 843A38649A; Tue,  6 May 2025 21:03:02 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 6 May 2025 22:48:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 64e8683f14c4392485de15e7b34642abce6ff88a
X-Git-Newrev: a8b7e28c812ebca65f8284b5931ade44d1b5e645
X-Patchwork-Hint: ignore
Message-Id: <20250506210302.843A38649A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl8189fs: bump to version
 2025-02-24
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a8b7e28c812ebca65f8284b5931ade44d1b5e645
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With this version we can build with Linux 6.14 and support for
cfg80211_rtw_get_txpower() has been added.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/rtl8189fs/rtl8189fs.hash | 2 +-
 package/rtl8189fs/rtl8189fs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8189fs/rtl8189fs.hash b/package/rtl8189fs/rtl8189fs.hash
index cca58ee3cc..eedbb46bea 100644
--- a/package/rtl8189fs/rtl8189fs.hash
+++ b/package/rtl8189fs/rtl8189fs.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  a621c0df9372d952449a06abb82f1edb806ad3200f9b1dd54fa9beab08d81b92  rtl8189fs-94cc959d56c1425fbca4f6e49e949cf58ec5dc8d.tar.gz
+sha256  40a0890d3ea2d6d2b58748a9e05e20a14942c0f7652a0178e7466e8279106345  rtl8189fs-3f34f380715b88e4a3ef049b3a60e2fc69ccc9bd.tar.gz
diff --git a/package/rtl8189fs/rtl8189fs.mk b/package/rtl8189fs/rtl8189fs.mk
index 33afb011e1..800956a927 100644
--- a/package/rtl8189fs/rtl8189fs.mk
+++ b/package/rtl8189fs/rtl8189fs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8189FS_VERSION = 94cc959d56c1425fbca4f6e49e949cf58ec5dc8d
+RTL8189FS_VERSION = 3f34f380715b88e4a3ef049b3a60e2fc69ccc9bd
 RTL8189FS_SITE = $(call github,jwrdegoede,rtl8189ES_linux,$(RTL8189FS_VERSION))
 RTL8189FS_LICENSE = GPL-2.0
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
