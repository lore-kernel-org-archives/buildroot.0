Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77955C55184
	for <buildroot@archiver.kernel.org>; Sun,  2 Aug 2026 20:25:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE3CD80C8D;
	Sun,  2 Aug 2026 20:25:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gw6kFOXCjann; Sun,  2 Aug 2026 20:25:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E41B680C68
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785702306;
	bh=++FO/pzZSjAY5bAjryT3dpxoHRFGw4rfm53MrktEEmM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sk565t19psNKU4VEx+6MVsYdMxgukHnoSYy+R2dRv5f3sRxPPKlAfdHtIYBVK8LoG
	 hQGlI6lnMa0IGWEvJSnwbEcfRLeQXYA/sr7f9ejtG8IdF2orW5ck79XbfJf8jywkhp
	 xFX3fiD1Cm8vWg26CRXxzSVCUS9fNv/3UpJ9VAF7vTuJZVYaS44jRVlJsxuF4Ifc+F
	 t2jeHEQ2G6Gbm1V5AKTzuVLjwM6oPVdGQwiv0ggdq6ZrcT1nWi6LOEqOD6EfgtAwuQ
	 A4IV/9BIbPbrxqlaBHmmzuB0pPnD5rxFZoA182UqP6HDl+PmEHIAORz0foqxadz7vj
	 hITkEggnT73iQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E41B680C68;
	Sun,  2 Aug 2026 20:25:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 93D951295
 for <buildroot@buildroot.org>; Sun,  2 Aug 2026 20:25:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 75ADD405AB
 for <buildroot@buildroot.org>; Sun,  2 Aug 2026 20:25:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hlh435eUeN55 for <buildroot@buildroot.org>;
 Sun,  2 Aug 2026 20:24:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0F3B40595
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B0F3B40595
 for <buildroot@buildroot.org>; Sun,  2 Aug 2026 20:24:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6A38F8B846; Sun,  2 Aug 2026 20:24:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 2 Aug 2026 21:50:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 29c988c7fc4f4916f023e08e939e1326056ebf2f
X-Git-Newrev: dc6ff71ee369ecadd768bf4605c175398a8e6e49
X-Patchwork-Hint: ignore
Message-Id: <20260802202415.6A38F8B846@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pydal: needs python xml
 module at runtime
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/dc6ff71ee369ecadd768bf4605c175398a8e6e49
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

pyDAL is using xmlrpc at runtime. See:
https://github.com/web2py/pydal/blob/v20260313.1/pydal/_compat.py#L114

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pydal/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-pydal/Config.in b/package/python-pydal/Config.in
index 204b47a09a..4ed2b934ac 100644
--- a/package/python-pydal/Config.in
+++ b/package/python-pydal/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_PYDAL
 	bool "python-pydal"
+	select BR2_PACKAGE_PYTHON3_PYEXPAT # runtime
 	help
 	  pyDAL is a pure Python Database Abstraction Layer.  It
 	  dynamically generates the SQL in real time using the
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
