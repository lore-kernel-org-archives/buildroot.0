Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 988FE10ED64F
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 09:59:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4971C612A0;
	Fri, 27 Mar 2026 09:59:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YewFPWmVMIzW; Fri, 27 Mar 2026 09:59:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59743612A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774605559;
	bh=h/cerzTogAGLKE3n23BHffNzYIn/nQpc3I0hVub4L/4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DhxiQ+TgxjmkSGA1fc7J3B4XbIm8i8pG7scOtnC9TzclGZrgkTM5Ami++o3AMxDId
	 ARZJVS5W/uPnVsXmleJbdna/4S5oCYfnG1K+c2BYihU+gJMUcuLqnlXRXopg1wx6HE
	 ZgUn2aoos8nVf/08kAcRKknLuz6G/okt0/IjP7xzALJ7Orhst40v8RzvHU0WvsQk+l
	 7TnrsR9HkYUCSE6Mr4anoUlanBga79RTspxeWino8WZHuXFk9OwoXLwUvPdHM6BIGV
	 WFcHzip1mPFamJFTODsUmApzZbDXRbwyB25gTucul8f1dezgEOoVsFrv34t3Oxg0EK
	 Yd62Qp70nB0CQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59743612A8;
	Fri, 27 Mar 2026 09:59:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 43D8F249
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 09:59:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3603E416B0
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 09:59:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MyqDwl5AzR7o for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 09:59:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D08E41699
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4D08E41699
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 09:59:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A0B597FB68; Fri, 27 Mar 2026 09:59:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 27 Mar 2026 10:57:29 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: e034a325c4b678116cfa60d2e42d176086128319
X-Git-Newrev: 2a63b8d8c538c08c07364d6b6ead2b73a3001317
X-Patchwork-Hint: ignore
Message-Id: <20260327095916.A0B597FB68@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] DEVELOPERS: add Manuel
 Diener to several packages
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2a63b8d8c538c08c07364d6b6ead2b73a3001317
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Add myself to packages recently orphaned which I am going to continue.

Signed-off-by: Manuel Diener <manuel.diener@oss.othermo.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit de7bd5034b38b69c631b1d1a3299942513051267)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 DEVELOPERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 8ed693a5d2..89dcafbb8b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2156,6 +2156,17 @@ F:	package/mpv/
 F:	package/rpi-firmware/
 F:	package/rpi-userland/
 
+N:	Manuel Diener <manuel.diener@oss.othermo.de>
+F:	package/pico-sdk/
+F:	package/picotool/
+F:	package/python-django/
+F:	package/python-immutabledict/
+F:	package/python-jc/
+F:	package/python-pydantic/
+F:	package/python-pydantic-core/
+F:	package/python-pydantic-settings/
+F:	package/python-waitress/
+
 N:	Marcin Bis <marcin@bis.org.pl>
 F:	package/bluez5_utils/
 F:	package/cc-tool/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
