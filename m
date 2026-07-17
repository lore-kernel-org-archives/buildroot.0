Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62267C4451B
	for <buildroot@archiver.kernel.org>; Fri, 17 Jul 2026 15:45:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9F1740A81;
	Fri, 17 Jul 2026 15:45:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2chacD9EMAcN; Fri, 17 Jul 2026 15:45:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F8AD40A27
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784303149;
	bh=CUaNAap3tkJAdmA0Figuh1ooXLYVc8IGNB7gxyhKSEM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gJiOE5gejF2fFbDNOqIADTSz8pWX8AT4kQlr/Dc4VFVwcmHK2c87IkEXvHglssk58
	 Xy8on1oB5couM8f4P0+I7evJoXofi7pKptRjSP5xG3PrMY/nI4HkgBHEgoIH3fClUq
	 WcuhymcWPcFAXIQZU9j2iNqva57GvY2iSDlw2K86jE5qbKujuP+Wa0nFKZSnXqff5S
	 S5nnv4XoBGKiNRmcoQmSj8fVtRJvm/T0lJfv1AMN6mEBKUZuDrdeD4SETgusavRnXV
	 DaaCHZy6kzQJKRSpv0dxl5R9hak+5HkiVMFYBCAOo31ANg/c1JNMfcj0HGqnm0CuxM
	 wZzlzkDKBAYlw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F8AD40A27;
	Fri, 17 Jul 2026 15:45:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BA37D1F6
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:45:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A099140A70
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:45:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hQi57KwLsAY1 for <buildroot@buildroot.org>;
 Fri, 17 Jul 2026 15:45:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C30B6408F1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C30B6408F1
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:45:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 838C888E52; Fri, 17 Jul 2026 15:45:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 17 Jul 2026 10:50:53 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 095117c40d33a3db241eb3cca7a0dff63aa7a7c6
X-Git-Newrev: b75d130294ff6a555a0cd2d2dbb1e88396b4476e
X-Patchwork-Hint: ignore
Message-Id: <20260717154510.838C888E52@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/mosquitto: host
 variant also needs cmake >= 4.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b75d130294ff6a555a0cd2d2dbb1e88396b4476e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

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
(cherry picked from commit b8d6e76897c28e3252dc93b49161c4685d2ab75f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
