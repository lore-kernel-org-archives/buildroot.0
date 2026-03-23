Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1823F483EE
	for <buildroot@archiver.kernel.org>; Mon, 23 Mar 2026 20:01:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0051821EC;
	Mon, 23 Mar 2026 20:01:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z_RZ7yCvNpwV; Mon, 23 Mar 2026 20:01:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9497821D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774296081;
	bh=+IfaAkCYscqjEb7W+LwmwncO4SCeN11b5JUc7qSsUzk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nzITBxfq9JYdxzQmWZfsXeG7fVC7ks/8Ny5YewU5TckewuNH0uAHD+Bx78H9IWj4/
	 9SXJz0n0+6eg9Oeezeepn3YyXlbfT9hz6PT6/JV445J4jlzHhkvCMx/tctMpySdDVX
	 HXcAYhces3LitmKPg1iie9fskYMcEHdHKt2B7hnW7aPCcXI9VT+hFAwHabyG3zB0AQ
	 RcDk5NyhvoFHa//15P106XYu1xQXvsbWjKGirzpgVucqsi2T2qzifP4ch6sHPLCnsZ
	 J0FCpDgC+2+AZZ+pY4vE1nVLPl6bofXwhQfQSwJVCHClGrEYnPj3/H0OILjCmCUvbC
	 vRtTNFl3qMkag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9497821D0;
	Mon, 23 Mar 2026 20:01:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3580A353
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 20:01:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 26ADD40BB1
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 20:01:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G9n_7n9_vrbe for <buildroot@buildroot.org>;
 Mon, 23 Mar 2026 20:01:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 436A640B7F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 436A640B7F
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 20:01:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 70FAC83DEE; Mon, 23 Mar 2026 20:01:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 23 Mar 2026 21:00:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 84ece21e8482c98fc4d21f3a791cb516118bc169
X-Git-Newrev: 83386ecb9c45daa73fc768894a2eb01de51fcccf
X-Patchwork-Hint: ignore
Message-Id: <20260323200118.70FAC83DEE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: remove Waldemar Brodkorb from
 zabbix
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/83386ecb9c45daa73fc768894a2eb01de51fcccf
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

I am no longer interested in zabbix.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 26f093fa39..87310f595c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3435,7 +3435,6 @@ F:	package/mksh/
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
