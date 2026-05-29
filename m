Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0187CCD4F54
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 13:15:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A916D82909;
	Fri, 29 May 2026 13:15:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bsytpnEe8uVT; Fri, 29 May 2026 13:15:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D76D5828DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780060548;
	bh=aiKE3jvpjdq2g8C1M+Pmm77Vo+4H1owHMjQSIbzBtNk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MJZqaXzLPUmveneOBf1cLhqymD2USPiatcoLhyEo4hR5PqSBl5wGbGBgvtYGyF/TS
	 iv49375UsFT2go/tGwvtGNbMZrecxqXsppTtV7h5yJhHN2JqLehJX3Qc/1OrAtCPx5
	 znDa4Bt0xdbZpYDSof0cUB5lNTtwk0UC0Epn68k5RglEDMovYh6Q9GPUtw70UqQ1ba
	 0HyhO97UV0TA/cXZ0GKevDfrPiojTZQro73LTDHe0z0T8xtTaCzaWywBCbH3YuB8rV
	 LN3qGSa8Co4k1SAlQkRGaOw1gx6Ntb8OvFL3GhnOn3BD0QU3ZVViUaEBmlMkHLsyDV
	 xmddAJFS1hdnQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D76D5828DE;
	Fri, 29 May 2026 13:15:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 62FA1288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 13:15:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3E28F41E66
 for <buildroot@buildroot.org>; Fri, 29 May 2026 13:15:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZIZt4iaKAtb6 for <buildroot@buildroot.org>;
 Fri, 29 May 2026 13:15:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 40CBF4073F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 40CBF4073F
 for <buildroot@buildroot.org>; Fri, 29 May 2026 13:15:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A9247873CD; Fri, 29 May 2026 13:15:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 15:03:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c0b3d919a1ce366fe21d525f69d08924920527ac
X-Git-Newrev: 31c1147bfdf5be700c1764056a1669b0992f16b5
X-Patchwork-Hint: ignore
Message-Id: <20260529131533.A9247873CD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/Config.in: remove zeek
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/31c1147bfdf5be700c1764056a1669b0992f16b5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Buildroot commit 948f819d955cce4917c12a4d65ccc55c29f5e501 removed the
zeek package but forgot to remove its package/Config.in entry.

Fixes error:

  package/Config.in:2675: can't open file "package/zeek/Config.in"

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/Config.in b/package/Config.in
index f32fcd8723..b2305ca019 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2672,7 +2672,6 @@ endif
 	source "package/xl2tp/Config.in"
 	source "package/xtables-addons/Config.in"
 	source "package/zabbix/Config.in"
-	source "package/zeek/Config.in"
 	source "package/znc/Config.in"
 
 endmenu
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
