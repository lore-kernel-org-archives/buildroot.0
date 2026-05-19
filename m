Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2530CCD4F5B
	for <buildroot@archiver.kernel.org>; Tue, 19 May 2026 12:26:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BEA7581228;
	Tue, 19 May 2026 12:26:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wgptuE6OFZMW; Tue, 19 May 2026 12:26:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD7A08122B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779193573;
	bh=oPx7C6rdXSDnaAXy5dHfJtFGWYS/4nLWQxp2J65KCJs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=azqqM+UDdTNZBBv79TuvU5Bw0nMGeh7cQT/rmCxdEWg1R72Z0uR8hUodRTTiSMdDL
	 lSX7ehr+8yn+VqjiF/b9t+myXlwvmKQRKtvzUMixv2h6q2B+V0Taz4Ag99srlCPRjw
	 e50bzQF16qGDN7KyqO4vWFca/YL8kydQC0gfizo6VhhriHPgEzaCLKllsLngLdDNzk
	 WX3hj+ZxMf+/DWRG9nhqNTG+dnnFJqp0Pm9QCNKYY6yo9MOcmY+ZEwYqpNxyJRq/SN
	 poP/H6QZvKINHmgRRE3WMn9C2vT8WX8rjz5h2hGryCwe137OXvYVywwvJx7u/nYtt+
	 dgCOPRnKJeg9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD7A08122B;
	Tue, 19 May 2026 12:26:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3612C265
 for <buildroot@buildroot.org>; Tue, 19 May 2026 12:26:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 27E5A81228
 for <buildroot@buildroot.org>; Tue, 19 May 2026 12:26:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MYnfXZXWUFag for <buildroot@buildroot.org>;
 Tue, 19 May 2026 12:26:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.250.0.168;
 helo=mx.adeep.su; envelope-from=v@baodeep.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A201381223
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A201381223
Received: from mx.adeep.su (mx.adeep.su [185.250.0.168])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A201381223
 for <buildroot@buildroot.org>; Tue, 19 May 2026 12:26:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A64CEA9F6A
 for <buildroot@buildroot.org>; Tue, 19 May 2026 15:20:10 +0300 (MSK)
To: buildroot@buildroot.org
Date: Tue, 19 May 2026 15:19:46 +0300
Message-ID: <20260519121951.70289-1-v@baodeep.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baodeep.com; s=dkim; 
 t=1779193210; h=from:subject:date:message-id:to:mime-version:
 content-transfer-encoding; bh=qGtSzifnRbdm8KSIo0MYMPJqUtLWW2lw/fXdxsPi60k=;
 b=qkwC2MNd180pv9X11FBADBsvZmCHjVfnGp4Qq/rOz3Zm7axcPe8t3tS1a4RB9hHeMpPksC
 +1+N5Tjsc65sBhUWi4jOHT7Cm4Hr0Cwrb6wVfj9fVJd5d76KtWm5iKig3/59heZ777J2DV
 FJ/lkijC7Tw0Ul5LGzYJEJE8svyQ86iuFZrHYPV/5HuXRdEC/GgsGuUSM/c0aAih3AUZJz
 ipHzTpMy7euylVMskjQalyK3ogRz0sh8ZqNQq8qBxOpUVez3IdOdKGC4t/L7IUe5uekpe3
 IzY4ndRuxohCVK+jL7pqnusB3OsY6K9whEYBjPejew46Pp5vzaojnJhTVpQxvw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=baodeep.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=fail reason="signature verification failed" (2048-bit key,
 unprotected) header.d=baodeep.com header.i=@baodeep.com header.a=rsa-sha256
 header.s=dkim header.b=qkwC2MNd
Subject: [Buildroot] [PATCH] DEVELOPERS: update entry for Viacheslav Bocharov
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
From: Viacheslav Bocharov via buildroot <buildroot@buildroot.org>
Reply-To: Viacheslav Bocharov <v@baodeep.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Update email address to v@baodeep.com.
- Take over maintainership of package/amlogic-boot-fip.

Signed-off-by: Viacheslav Bocharov <v@baodeep.com>
---
 DEVELOPERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 125e7f8248..47f88a677e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3346,7 +3346,8 @@ F:	package/llvm-project/llvm/
 N:	Vanya Sergeev <vsergeev@gmail.com>
 F:	package/lua-periphery/
 
-N:	Viacheslav Bocharov <adeep@lexina.in>
+N:	Viacheslav Bocharov <v@baodeep.com>
+F:	package/amlogic-boot-fip/
 F:	package/rtl8822cs/
 
 N:	Victor Huesca <victor.huesca@bootlin.com>
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
