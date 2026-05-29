Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB79DCD4F54
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 21:53:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B821E61B83;
	Fri, 29 May 2026 21:53:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ya4go_1Kyddo; Fri, 29 May 2026 21:53:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96C0361609
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780091625;
	bh=9SgGolneKY94L7WRrzRbk2slLZ5q/TXCjdbADVnHGGU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Odji/6mHyeuuseQomNmkclsHJP9aiXai7UVTsR6q/xSDiGvaQgrTIJ7NWgFXQ4euW
	 UzQjQ8gFi1H2x1QN5X4eqtuIX2qCp/CV94iT12+qCVNCT+0XHtmuZcsTls17SyTdEi
	 bABdpj+WSl/Jp4LcSGb+yTmUjrrtMCudTsdIgOeAe0K4ITU2Hz1IlcA7W6RwMSyVPr
	 EnUMmInWvoVtoIZsehklsGTeQ8Vu5EGJrGaYp/m98Vupco0AWQppY0+sHnvHNeEU0P
	 dH9YboHa5y7SWcQv5lSKArIQDnIrNUpmtZip70yjP4w3T+tuAwd4sSgtzxiHi1zdkI
	 bENVIY8B4H7Kw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96C0361609;
	Fri, 29 May 2026 21:53:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 77ECFF4
 for <buildroot@buildroot.org>; Fri, 29 May 2026 21:53:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4113C84AC5
 for <buildroot@buildroot.org>; Fri, 29 May 2026 21:53:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SFMZx2p-NwOt for <buildroot@buildroot.org>;
 Fri, 29 May 2026 21:53:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C39A84ACA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9C39A84ACA
 for <buildroot@buildroot.org>; Fri, 29 May 2026 21:53:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E99C0874B2; Fri, 29 May 2026 21:53:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 23:52:12 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ce1394ee0ed07c2d06223dc5b1bbf73482316896
X-Git-Newrev: abcaada9fd31abf697253d37e645485cd220cadb
X-Patchwork-Hint: ignore
Message-Id: <20260529215326.E99C0874B2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] DEVELOPERS: add Shubham
 Chakraborty for libenca
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/abcaada9fd31abf697253d37e645485cd220cadb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 28fe821a6a..0d67faa0e2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3053,6 +3053,7 @@ N:	Shubham Chakraborty <chakrabortyshubham66@gmail.com>
 F:	package/ccache/
 F:	package/dos2unix/
 F:	package/hyperfine/
+F:	package/libenca/
 F:	package/pv/
 
 N:	Simon Dawson <spdawson@gmail.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
