Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E7C6F9D0ED
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 17:48:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C06E84DB4;
	Tue, 14 Apr 2026 17:48:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OoClVtKjWHqV; Tue, 14 Apr 2026 17:48:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E53F84322
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776188936;
	bh=KxURzqIpo7MrPy+4UF2n4ZtSH+Zi2MIh2BjRI23hM64=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UWPjMdXz3ipdmdz9kiBAsz6u7BdyX1gq7exWUrX1yp/0F6tz9QMFDLtMrjtomQ+sD
	 THktGUGI34RJoivaPlUyHPgOEjiOAcE0iBH45SnxlcW8lj3UNVr1ubDiGb40cetLuf
	 PhlLpz28JuDugrFf5aEmE1wMmwYSJOYmZ9yzFgYK3Fw5tEDuhtbl3a386INJJAGkkv
	 b7cK1ma3Uh3zOJGZJxEK6j9WOgq2QVy//Py8nM7WVTM0lDbnacjsA19WMsl7NGB/IR
	 HWcBAtHGp3Iik5SAGn586rNK7cbxv2VyEgs1DIWAt+0wceVprtN/t8LrLTU7ukgS7W
	 JTUj+6cxX/1SQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E53F84322;
	Tue, 14 Apr 2026 17:48:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1CC94375
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 17:48:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D8D274004E
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 17:48:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ISyU9zoj0GS8 for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 17:48:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3ABF14041A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3ABF14041A
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 17:48:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D09CD7FB24; Tue, 14 Apr 2026 17:48:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Apr 2026 19:12:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 081c27aea5516e4657b690d80a7f6105456e4b20
X-Git-Newrev: 073a8c5d27e259d74c6eb2ffab6f43c4cd0602d1
X-Patchwork-Hint: ignore
Message-Id: <20260414174849.D09CD7FB24@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kismet: remove optional support
 for pcre, keep pcre2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/073a8c5d27e259d74c6eb2ffab6f43c4cd0602d1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/kismet/kismet.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/kismet/kismet.mk b/package/kismet/kismet.mk
index f182fbe328..a65a4a4510 100644
--- a/package/kismet/kismet.mk
+++ b/package/kismet/kismet.mk
@@ -74,9 +74,6 @@ endif
 ifeq ($(BR2_PACKAGE_PCRE2),y)
 KISMET_DEPENDENCIES += pcre2
 KISMET_CONF_OPTS += --enable-pcre --enable-require-pcre2
-else ifeq ($(BR2_PACKAGE_PCRE),y)
-KISMET_DEPENDENCIES += pcre
-KISMET_CONF_OPTS += --enable-pcre --disable-require-pcre2
 else
 KISMET_CONF_OPTS += --disable-pcre
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
