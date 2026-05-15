Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BAF9CD4F25
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 17:45:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53C8241D2D;
	Fri, 15 May 2026 17:45:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xpDeQ5tV8FiM; Fri, 15 May 2026 17:45:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8ADDB41D26
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778867106;
	bh=MQprKzHWE4Nf7dUCBeLVhQno9ueGMFowW1FOG4kdDvY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=c6et0Bi0N7WI9VvE4hPbrkuOLbvPiDHXMulqb0fxrxFNefOBPde1DFRCYnnjfvk7v
	 3KB2rjmmg6R64w9Y11fvD5/AUZi1RotszEtum19VeQG+JwMzq3eayrGrccFR1IAYZm
	 fcE4VEErtSIqfYM5AEF0NkRFpC/2dahkUuqd4G4vc3ZmI+7Vd2cYP2wyXgzQybarv2
	 l50L2D7qaOWmppqhCK9TMU/uSmBpGXyAP6JS7zJ4jOgCxytsmZQTdqP6aAJFwW0Aan
	 KnusoZDAKU3HdhTjIhfBImpvNElZg366DExYBvDO7plRf+n3PmvwqmY4pXAfeipksj
	 PayQxtpfB/aEA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8ADDB41D26;
	Fri, 15 May 2026 17:45:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B1E623F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:44:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0B8DE4027F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:44:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DeA4tCJTFFCD for <buildroot@buildroot.org>;
 Fri, 15 May 2026 17:44:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CFFDC40F92
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CFFDC40F92
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:44:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 19BC2863D5; Fri, 15 May 2026 17:44:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 May 2026 16:59:11 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: f1167baf9e36bbf59919ad0fb8c6e79c73e3f50a
X-Git-Newrev: bca59419d984ea64b0495169020907e45dd5de66
X-Patchwork-Hint: ignore
Message-Id: <20260515174449.19BC2863D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] DEVELOPERS: remove Martin
 Kepplinger from x11vnc
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
Content-Type: multipart/mixed; boundary="===============4880961021143015908=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4880961021143015908==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bca59419d984ea64b0495169020907e45dd5de66
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

I don't use maintain x11vnc in buildroot anymore and can't easily test.

Signed-off-by: Martin Kepplinger-Novaković <martink@posteo.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 81e72115a05fb9b32ccb9e613c1d5c4151980426)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 DEVELOPERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 711c973494..e7d89f6ace 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2274,7 +2274,6 @@ F:	package/python-webargs/
 N:	Martin Kepplinger <martink@posteo.de>
 F:	package/tslib/
 F:	package/x11r7/xdriver_xf86-input-tslib/
-F:	package/x11vnc/
 
 N:	Martin Povišer <povik+lin@cutebit.org>
 F:	package/python-construct/

--===============4880961021143015908==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4880961021143015908==--
