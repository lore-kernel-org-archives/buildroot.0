Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 678E1E7E369
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 10:28:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1EF9B6113F;
	Fri,  3 Apr 2026 10:28:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id swqqwtZlRZZd; Fri,  3 Apr 2026 10:28:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17A7461127
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775212123;
	bh=SldSh1O4QSeIynHvnoyw+NG0M8ccD1WsvwOtZpdA61c=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dWR4NekzK4+aN5EQG0qjjaxrTwLnEzI1i8sDS22ANq8WejY69alYPgENyilOvNosc
	 uC+FHv6AJIWx9Ki/n/vRRjscOAJB5s/iBo/ApOBA8JbqwasiohE6/sKM8yB7bpEk/p
	 +4CvC31bV83vjIfurTuUXw8t6NtcQlsMSgStd3QlhsY7atw56lDXZ/Ud2AtT023h4v
	 Py0+jdKkh3sh9QQJbJWaqlCjdmEGnnqjMZw2cQqlDQbcuXGHU2KSqIPqR5Pg/nRPfm
	 YoxG+hRTQaahdmrE22v8ccwC4yLNxbxuKvO2HOH2dOioo5h3Px/Z5Xx81yA1wvf5X2
	 nXP0S5lwcTSCQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17A7461127;
	Fri,  3 Apr 2026 10:28:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C8814399
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:28:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AC3D44020D
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:28:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eBWBuI-jthBq for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 10:28:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E84E540055
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E84E540055
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:28:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 64FDB7FFF8; Fri,  3 Apr 2026 10:28:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 3 Apr 2026 11:52:57 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 03ef4770e4131b77b4fa5c286805972aa670f4d5
X-Git-Newrev: 8b6b54245ef496fe764f3fff57a8883d1ed44b3b
X-Patchwork-Hint: ignore
Message-Id: <20260403102836.64FDB7FFF8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] DEVELOPERS: remove
 Waldemar Brodkorb from zabbix
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8b6b54245ef496fe764f3fff57a8883d1ed44b3b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

I am no longer interested in zabbix.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 83386ecb9c45daa73fc768894a2eb01de51fcccf)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 DEVELOPERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 2c96a612e9..1df183ae0a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3424,7 +3424,6 @@ F:	package/mksh/
 F:	package/ruby/
 F:	package/uclibc/
 F:	package/uclibc-ng-test/
-F:	package/zabbix/
 F:	support/testing/tests/package/test_ruby.py
 
 N:	Will Newton <will.newton@gmail.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
