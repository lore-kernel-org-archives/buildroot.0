Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD6EC55162
	for <buildroot@archiver.kernel.org>; Sun,  2 Aug 2026 19:48:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA78E60618;
	Sun,  2 Aug 2026 19:48:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9ccEZBeHqa41; Sun,  2 Aug 2026 19:48:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0ED7F6061D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785700124;
	bh=3qn6NyZOBdPffnm8RO8MoLfSplif/nLBp7PDNloBqLo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CS29+D1t6x+w85xtwupw5rIyS+EAtIGdpsgjEQhNokJhqRNrTvqTNwBSTKOQ6tGFz
	 zpgxRhriUUhhgku1KdLSclBkoiq09KtCiRUeanZCMxts7PPsRIylEYvpwgQnW0cWGf
	 iADPMnc+Xwikbxox+ojPH2YhFNfwyEHCaofhkUynDI3wc4ouVb3okXtg+I1rOoHlGF
	 CqRf5FWu0TQ30CiEJv/eAM+hS11a386aQIm8mz8aJieVZg2+k10ZUH8A8YN/rp0AX8
	 tnmJnpazc1w6kr+HZ45HzmIP5dw0I1nsOYRZg6wJWt6IbUC+u3mmp353L9LQwbtVEN
	 94lf0ohe95WjA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0ED7F6061D;
	Sun,  2 Aug 2026 19:48:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 177333A6
 for <buildroot@buildroot.org>; Sun,  2 Aug 2026 19:48:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E92A6405E7
 for <buildroot@buildroot.org>; Sun,  2 Aug 2026 19:48:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6OUHf1vKhiqZ for <buildroot@buildroot.org>;
 Sun,  2 Aug 2026 19:48:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE120405D9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE120405D9
 for <buildroot@buildroot.org>; Sun,  2 Aug 2026 19:48:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AF9708B833; Sun,  2 Aug 2026 19:47:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 2 Aug 2026 21:09:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 59f9c25d705aaadeb36db42320ff25b04ddbaf22
X-Git-Newrev: e14a4b9fb4e965a712d309216c7ef228cbf7ab82
X-Patchwork-Hint: ignore
Message-Id: <20260802194757.AF9708B833@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/z3: bump to version 4.16.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e14a4b9fb4e965a712d309216c7ef228cbf7ab82
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For change log since 4.15.2, see:
https://github.com/Z3Prover/z3/blob/z3-4.16.0/RELEASE_NOTES.md#version-4160

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/z3/z3.hash | 2 +-
 package/z3/z3.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/z3/z3.hash b/package/z3/z3.hash
index a9d1da901a..a73d7f460d 100644
--- a/package/z3/z3.hash
+++ b/package/z3/z3.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3486bf5b35b185981cab0b0a81f870547648a1ca433085aa79afd17c44959751  z3-4.15.2.tar.gz
+sha256  c68c3e5e4810b16126b8cb4c47eee85c1ac3e24a81914c8e371b40de9dd33ac7  z3-4.16.0.tar.gz
 sha256  e617cad2ab9347e3129c2b171e87909332174e17961c5c3412d0799469111337  LICENSE.txt
diff --git a/package/z3/z3.mk b/package/z3/z3.mk
index fe52167e1e..ef84fd8021 100644
--- a/package/z3/z3.mk
+++ b/package/z3/z3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-Z3_VERSION = 4.15.2
+Z3_VERSION = 4.16.0
 Z3_SITE = $(call github,Z3Prover,z3,z3-$(Z3_VERSION))
 Z3_LICENSE = MIT
 Z3_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
