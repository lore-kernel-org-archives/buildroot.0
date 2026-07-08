Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3730C43458
	for <buildroot@archiver.kernel.org>; Wed,  8 Jul 2026 21:01:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A07B6085D;
	Wed,  8 Jul 2026 21:01:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SZEP8FRnC6nU; Wed,  8 Jul 2026 21:01:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5AB060760
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783544468;
	bh=9tIXzatpErFPFfsmav2aWNPOR+91Ieo6sL7y58ZhOf8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=V9Ob/UmQ+SJIDWDxn/CYMPFeWDDgJmm2/UMLNW0YV6pfC6DFC17Xz/pOuqFFLXuYH
	 eVQV5M2UbQEIZukB+vnYMY17u/ptO8h3khCJhMlnF1ImNYl+0h9gbHk6otJ/QQbuTl
	 XUJU1Tvo7fs89bJTBsXuTtwD48yemSCV+N/EMNdVhz5u8GdNiJjWQd/d+Wkhn47ou9
	 j+xUvtZZJlShBEcb5YElWLpSu4YpKilwWOlXNdYLlhotcwKu3bQpk248yIjZ5kiOFa
	 j7jGa9Dx2QexfF7emjKp2xPmgTpPFAr28fpsfBZbOLD3vOvQUPnlf6sOxfrPxFqfBJ
	 T9Xba303VWxxw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5AB060760;
	Wed,  8 Jul 2026 21:01:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 846353A8
 for <buildroot@buildroot.org>; Wed,  8 Jul 2026 21:01:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6A78981145
 for <buildroot@buildroot.org>; Wed,  8 Jul 2026 21:01:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dSz4bxrFVOpI for <buildroot@buildroot.org>;
 Wed,  8 Jul 2026 21:01:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CADA681139
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CADA681139
 for <buildroot@buildroot.org>; Wed,  8 Jul 2026 21:01:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CE45988572; Wed,  8 Jul 2026 21:00:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 Jul 2026 22:58:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6854ee9aa3826d5036a7d3cc19056d43c0452320
X-Git-Newrev: b8d6e76897c28e3252dc93b49161c4685d2ab75f
X-Patchwork-Hint: ignore
Message-Id: <20260708210034.CE45988572@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mosquitto: host variant also needs
 cmake >= 4.3
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b8d6e76897c28e3252dc93b49161c4685d2ab75f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Commit da9dcddff15a (package/mosquitto: requires cmake >= 4.3) added
a requirement against cmake 4.3 for the target variant, but forgot
to add the same requirement to the host variant.

Do so, for the same reasons as reported for the target variant in
da9dcddff15a.

Fixes: da9dcddff15af3e99cbc20297f4a3d25e89c66e1

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/mosquitto/Config.in.host | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mosquitto/Config.in.host b/package/mosquitto/Config.in.host
index 39e287ee89..7b94003fae 100644
--- a/package/mosquitto/Config.in.host
+++ b/package/mosquitto/Config.in.host
@@ -1,4 +1,5 @@
 config BR2_PACKAGE_HOST_MOSQUITTO
 	bool "host mosquitto (mosquitto_passwd)"
+	select BR2_HOST_CMAKE_AT_LEAST_4_3
 	help
 	  Only installs mosquitto_passwd.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
