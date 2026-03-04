Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 381C7EFCE42
	for <buildroot@archiver.kernel.org>; Wed,  4 Mar 2026 20:32:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D92FA406DF;
	Wed,  4 Mar 2026 20:32:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id psKkrEwCt3DA; Wed,  4 Mar 2026 20:32:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F25E7406E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772656348;
	bh=koBhj7wNzb4nN3/1Hic5Z14WwwpCOeXnJS6yamZzE0g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LsAtxReBDEcXPY8g66HgnTw/Es+UaBjA4vtPiPLX3ZptUP0noM2GzI/WRyk1ThMbd
	 m8sPrmq9+EjO7R+uLxWyVYvaD2hjxQMOGDoozxU61Zxx7DI/PYhO+k3XIIghz7e7wL
	 UbEHPVK4xbZUlx9v/o3qFgji+ezONFObkXwTd3ingjP3BXz1MUcuWaUAYghKnTgNL3
	 n6s9Z0qR3P2NgtPyNIFcBdBNDzvUej9+6bc60RMVk4IlSojxIJSUSJZODWQcYSfOJ2
	 NqgYK0YVSxCU0612UmxgL6R4+5IWcSkl9QF6ja6dmCqtId5ARcndCtfM5xnO3ELJJl
	 O4twTe3JjNvfg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F25E7406E1;
	Wed,  4 Mar 2026 20:32:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0634C223
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 20:32:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E085C814E2
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 20:32:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5TBClbNzzt0e for <buildroot@buildroot.org>;
 Wed,  4 Mar 2026 20:32:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED350814DD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED350814DD
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 20:32:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 00EC5861D0; Wed,  4 Mar 2026 20:32:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Mar 2026 21:18:57 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: aee709bd45d90fb12577530d1e37ace4e198c778
X-Git-Newrev: 1822a98827b1f1f500548cf9a9bc8f7bdb838c24
X-Patchwork-Hint: ignore
Message-Id: <20260304203225.00EC5861D0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] DEVELOPERS: Add Chen Pei to
 iniparser
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1822a98827b1f1f500548cf9a9bc8f7bdb838c24
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 88a684d9ac..2673a59824 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -611,6 +611,9 @@ F:	package/alsa-plugins/
 N:	Changming Huang <jerry.huang@nxp.com>
 F:	package/qoriq-cadence-dp-firmware/
 
+N:	Chen Pei <cp0613@linux.alibaba.com>
+F:	package/iniparser/
+
 N:	Chris Packham <judge.packham@gmail.com>
 F:	package/coremark/
 F:	package/coremark-pro/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
