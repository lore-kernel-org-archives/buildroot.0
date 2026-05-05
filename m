Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22EE6CD3427
	for <buildroot@archiver.kernel.org>; Tue,  5 May 2026 18:56:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE4A940B95;
	Tue,  5 May 2026 18:56:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YmV3R1Y9BUyj; Tue,  5 May 2026 18:56:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4C3D40B8A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778007379;
	bh=kR8HfqK6O7PGfy/oLeHnmHCghk8zbfFPR7Ba7cnmR5E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=k8tC8294BzBHLzcuaVEgBz6OkCpHOZoPtN2SwqZZ5lnqck5E6UygBygG0nrTeWCIh
	 o+uv7R0OS7zwcb8Jq/3lHDWoSxmlHkUJJEL/UPvNMcKgqnsKsUBnFR+DADcOYI3D9u
	 pT49jEY3NroxTPZdI6wyDpRrP2tUFw5PE2emCFzPP2clTAt/la04JDbEYoDJ5BfGrJ
	 L5AufmOvbZYPGIz6ntu9N/TTGI+hvNbgxIpD1ZR6TqQSTW65vpsAk99h8tagbH7PhR
	 u7PjSkcwXYUHzUZfBp2bSJj1clJbps2UvARJpQuPA91lMku9iOKuEt/81+GCPb3q+z
	 5Fj2hVYj+9JJA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4C3D40B8A;
	Tue,  5 May 2026 18:56:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2BBBE315
 for <buildroot@buildroot.org>; Tue,  5 May 2026 18:56:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 104B9819C8
 for <buildroot@buildroot.org>; Tue,  5 May 2026 18:56:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yl36JjvDTeYS for <buildroot@buildroot.org>;
 Tue,  5 May 2026 18:56:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36C6A81992
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 36C6A81992
 for <buildroot@buildroot.org>; Tue,  5 May 2026 18:56:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5165B84578; Tue,  5 May 2026 18:56:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 5 May 2026 20:54:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 26dfdcfbbc9f5f1dcf7ffa57273f7fe2c5f6847a
X-Git-Newrev: 81e72115a05fb9b32ccb9e613c1d5c4151980426
X-Patchwork-Hint: ignore
Message-Id: <20260505185616.5165B84578@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: remove Martin Kepplinger from
 x11vnc
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
Content-Type: multipart/mixed; boundary="===============4322145918829438152=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4322145918829438152==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/81e72115a05fb9b32ccb9e613c1d5c4151980426
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

I don't use maintain x11vnc in buildroot anymore and can't easily test.

Signed-off-by: Martin Kepplinger-Novaković <martink@posteo.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 179cdf50f6..d849fa828a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2353,7 +2353,6 @@ F:	package/python-webargs/
 N:	Martin Kepplinger <martink@posteo.de>
 F:	package/tslib/
 F:	package/x11r7/xdriver_xf86-input-tslib/
-F:	package/x11vnc/
 
 N:	Martin Povišer <povik+lin@cutebit.org>
 F:	package/python-construct/

--===============4322145918829438152==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4322145918829438152==--
