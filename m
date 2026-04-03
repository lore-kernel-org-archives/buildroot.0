Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E6A9E7E367
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 10:27:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4AF82608AF;
	Fri,  3 Apr 2026 10:27:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1dLCQVzOWepT; Fri,  3 Apr 2026 10:26:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF07F60891
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775212019;
	bh=q7Gia2hkUUXXNKktZ0BwHMshwcMfVzsmhr0SXfsi3aM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PsLzwWi4WlYSGGIB6dRFPqaNQa3OR13LeCIF36z1Vcgv24PaB8P16Wrs4OBvQRNDk
	 0DpUHoPleKkCBMFezKMVfj7bGkTjgXEDaku6AzFcmyzrR6bN6Nj3P9vvkNCAgWfqIh
	 LJiQS++Xxxxo2ppjtZyHFepC5XyOIYsNYa1weoFYUCPLeERrOn5xMTMbGDumI5Vs+a
	 mIBZcs2yRCZ5t/P1ipTKffEZG9QkZmx+nnnYOLEAjbVJJaq/chAXQzffdZ8Su0PpNU
	 ajnwe72L9v9KLcIpFFc9XdKJtaNTVmvBZG4cF6fFEbBhJjqbyb0bL5S+H2961C0W1j
	 HpSPIlTGjxSsA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF07F60891;
	Fri,  3 Apr 2026 10:26:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6EE401A9
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:26:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5785540287
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:26:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W9KcQ3lRLu0C for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 10:26:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D06D40055
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4D06D40055
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:26:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BDFF07FFAA; Fri,  3 Apr 2026 10:26:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 3 Apr 2026 12:21:31 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: a0f011cac71f7a0cf96e1a6b2c31e6e8cdf0a602
X-Git-Newrev: 317fa104f15501227b22bad2dfb5925c0ef7f1b1
X-Patchwork-Hint: ignore
Message-Id: <20260403102656.BDFF07FFAA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] DEVELOPERS: remove
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/317fa104f15501227b22bad2dfb5925c0ef7f1b1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

I am no longer interested in zabbix.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 83386ecb9c45daa73fc768894a2eb01de51fcccf)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 DEVELOPERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 89dcafbb8b..7b77183902 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3321,7 +3321,6 @@ F:	package/mksh/
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
