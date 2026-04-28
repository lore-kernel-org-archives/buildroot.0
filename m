Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A459FF886D
	for <buildroot@archiver.kernel.org>; Tue, 28 Apr 2026 19:22:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CDCC610E3;
	Tue, 28 Apr 2026 19:22:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jxERUKj9DX04; Tue, 28 Apr 2026 19:22:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E95C610CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777404135;
	bh=ZqlbQZ4VOvcwp4q7viBLQnpgQz8gSbss82yzaHA2h1A=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Bo4HeTZb0ZzlJnE7NVT36ZWSo+uPMN+LdFToInj06Tf9iHVOAR3ewya/AhQUFBFNx
	 EQrQq1EGhIMueQhyPi00ZJfPJE6I+s9fwycwswM6Aay5jasH4tlRd/hcQ9NiEadjsL
	 wlmF/dbrOu9Ien2gQdqDOXHPJRA6uLf21rLmzIJogrqY69CPaS5cZ+0jY+BC+qFtuj
	 BiXJ5RDqCtaIOWmFR72Vjm45BrR4oL5N3jIGLsgtCGn/3zcp/u8lqMAG/jLN+QXfv7
	 Net1GjmrgDwRC+wRbQE2Nzrc349PtvjYHzJWqLACX5o17tdFA6pP6CjOerP9kiQ/L3
	 NA2+duOEBR7Zg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E95C610CE;
	Tue, 28 Apr 2026 19:22:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 491081B8
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 19:22:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3ABBE40DD5
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 19:22:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 56jUv_JsaJXc for <buildroot@buildroot.org>;
 Tue, 28 Apr 2026 19:22:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F2E040CED
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4F2E040CED
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 19:22:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 119D0839A7; Tue, 28 Apr 2026 19:22:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 28 Apr 2026 21:18:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d9e981327ce79384fe374aea284a3c64fb90228b
X-Git-Newrev: f63384539a0cd0bcca9f703b227ff757a72f15d8
X-Patchwork-Hint: ignore
Message-Id: <20260428192212.119D0839A7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tcpdump: bump to version 4.99.6
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f63384539a0cd0bcca9f703b227ff757a72f15d8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For change log, see:
https://github.com/the-tcpdump-group/tcpdump/blob/tcpdump-4.99.6/CHANGES

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[Julien: add link to change log in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/tcpdump/tcpdump.hash | 4 ++--
 package/tcpdump/tcpdump.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tcpdump/tcpdump.hash b/package/tcpdump/tcpdump.hash
index b29ac06060..f69b672be9 100644
--- a/package/tcpdump/tcpdump.hash
+++ b/package/tcpdump/tcpdump.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature at
-# https://www.tcpdump.org/release/tcpdump-4.99.5.tar.gz.sig
+# https://www.tcpdump.org/release/tcpdump-4.99.6.tar.gz.sig
 # using key 1F166A5742ABB9E0249A8D30E089DEF1D9C15D0D
-sha256  8c75856e00addeeadf70dad67c9ff3dd368536b2b8563abf6854d7c764cd3adb  tcpdump-4.99.5.tar.gz
+sha256  5839921a0f67d7d8fa3dacd9cd41e44c89ccb867e8a6db216d62628c7fd14b09  tcpdump-4.99.6.tar.gz
 sha256  8a54594d257e14a5260ac770f1633516cb51e3fc28c40136ce2697014eda7afd  LICENSE
diff --git a/package/tcpdump/tcpdump.mk b/package/tcpdump/tcpdump.mk
index f4086ef124..c3d777ca70 100644
--- a/package/tcpdump/tcpdump.mk
+++ b/package/tcpdump/tcpdump.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TCPDUMP_VERSION = 4.99.5
+TCPDUMP_VERSION = 4.99.6
 TCPDUMP_SITE = https://www.tcpdump.org/release
 TCPDUMP_LICENSE = BSD-3-Clause
 TCPDUMP_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
