Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B145FA3729
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 15:25:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 093E780F7B;
	Fri,  2 Jan 2026 15:25:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C05tV8afvqo2; Fri,  2 Jan 2026 15:25:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E25E8102D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767367540;
	bh=c+4zxEHIbA0+SCn6cLxJr5Uu36TX+PvWAoagNBcADOk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZKJQBShP+u4GuDS1nGu7mDuQV2R9IAcrlzPqRUb9/pq4x4If1cGkme7TsWqh2cRMj
	 XgPkNP3D03Z5TArtjBHYHxIeG0wuz4cU8xzlhj0vDVF5jwyoocfdpJMnf/SFP4lH5J
	 7On9vDidfCQBTthtav3Y+/D9/xQyTFWb6vNK475NXhjzFA1Vub491QcfQPhvnJuCxK
	 I6QUan+PtW8+Pumn3HZ5nK0DEdAufKPCWdDgGayijiAP0+fN8stL5w5cBKNEvLtnBe
	 BG3XaTlBmeltv9A5WPsY9Q+Ind6iP0t9c3Ci/x/Yb0juGWAxvrxf2CWPa9CR85y1pw
	 QI8cxlms269Ow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E25E8102D;
	Fri,  2 Jan 2026 15:25:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 99CB1D7
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:25:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F6B96080F
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:25:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id txZbuzHnG-g0 for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 15:25:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A2948607FD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A2948607FD
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:25:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 944EA87F4B; Fri,  2 Jan 2026 15:25:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Jan 2026 16:24:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9d334c4abf4dadfab73d6bc7cdc171bca1ad5dcc
X-Git-Newrev: f1817255457486e31f3aa0553ceccc747c2636a0
X-Patchwork-Hint: ignore
Message-Id: <20260102152538.944EA87F4B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ncurses: bump to version
 6.6-20251231
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

commit: https://git.buildroot.net/buildroot/commit/?id=f1817255457486e31f3aa0553ceccc747c2636a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/ThomasDickey/ncurses-snapshots/blob/v6_6_20251231/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ncurses/ncurses.hash | 2 +-
 package/ncurses/ncurses.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ncurses/ncurses.hash b/package/ncurses/ncurses.hash
index 7369e3cd64..fe9bdbe915 100644
--- a/package/ncurses/ncurses.hash
+++ b/package/ncurses/ncurses.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  fc3871f051e941a637488c07c81d984f731003e65c0f78353606e18296011aac  ncurses-6.5-20250720.tar.gz
+sha256  9796dfb0e790bac2a994a86df83adddc1a96021cbc02c44c4f2ea886069bd91d  ncurses-6.6-20251231.tar.gz
 # Locally computed
 sha256  708999f95527e1ffa670c6fce288c6c600cb477dd04afcc1171422b3dd4ee226  COPYING
diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index 864f62b57c..5e2077500a 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 # When there is no snapshost yet for a new version, set it to the empty string
-NCURSES_VERSION_MAJOR = 6.5
-NCURSES_SNAPSHOT_DATE = 20250720
+NCURSES_VERSION_MAJOR = 6.6
+NCURSES_SNAPSHOT_DATE = 20251231
 NCURSES_VERSION = $(NCURSES_VERSION_MAJOR)$(if $(NCURSES_SNAPSHOT_DATE),-$(NCURSES_SNAPSHOT_DATE))
 NCURSES_VERSION_GIT = $(subst .,_,$(subst -,_,$(NCURSES_VERSION)))
 NCURSES_SITE = $(call github,ThomasDickey,ncurses-snapshots,v$(NCURSES_VERSION_GIT))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
