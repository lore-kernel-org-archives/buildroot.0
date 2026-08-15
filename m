Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31149C5DF6D
	for <buildroot@archiver.kernel.org>; Sat, 15 Aug 2026 09:21:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E599D60B3E;
	Sat, 15 Aug 2026 09:21:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id veTqzOuAyB4o; Sat, 15 Aug 2026 09:21:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B75960E41
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786785677;
	bh=FRiRNH2aSaIfMp1XMUd6UKGoItJRdloy5suoeBR42Io=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=AnjQhsyfUEX1wuDuflNzJ975wbvBcGq9VzWCB0J1v3PEPqgeJ0JynkaW843o7sgn2
	 hyVxtJaw5Exrg2YfrcmrXFnBmp6AQbl2Siyf0PYtYsrrI2rjPPQ0jonXcsku4C+G8r
	 QVHNIRvTCOGexWxwtd21GPdj5tW3af3SnNrY5a5VnfZ2/vMzjDHFVIZEOM18UBqJnR
	 2GSrXZ6aBXxvWFpqSc42FhLN9fY17GjEV67V3Xiywinzp/vu5I6lHVwMj1rmtWZbDU
	 FXCBGaQGHuTXuXPTHAZiWPmbkZVh0l5K+NLihKJC0gcDvZwRmnBeItb2yqErLXJhfs
	 YJfgWQzPlYrbQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B75960E41;
	Sat, 15 Aug 2026 09:21:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B9C87139D
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 09:21:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B7A5D409A0
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 09:21:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hCafdV5BV8q4 for <buildroot@buildroot.org>;
 Sat, 15 Aug 2026 09:21:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB66D409CA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB66D409CA
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 09:21:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8975D883DC; Sat, 15 Aug 2026 09:20:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 15 Aug 2026 11:16:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9a7cd39c5d8ec804711a9485f9c360317060e2b8
X-Git-Newrev: 949063f92b3b492e731f856cd513fb9251c60ddf
X-Patchwork-Hint: ignore
Message-Id: <20260815092010.8975D883DC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rygel: update project URL
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/949063f92b3b492e731f856cd513fb9251c60ddf
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

wiki.gnome.org has a big deprecation warning saying "All information
on this site is out of date and should not be used." Point at the
project website instead.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/rygel/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rygel/Config.in b/package/rygel/Config.in
index a3c2bd29da..1a5c1493ea 100644
--- a/package/rygel/Config.in
+++ b/package/rygel/Config.in
@@ -34,7 +34,7 @@ config BR2_PACKAGE_RYGEL
 	  Most Rygel functionality is implemented through a plug-in
 	  mechanism.
 
-	  https://wiki.gnome.org/Projects/Rygel
+	  https://rygel-project.org/
 
 if BR2_PACKAGE_RYGEL
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
