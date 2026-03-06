Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF64DFCC062
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 19:51:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B15826143E;
	Fri,  6 Mar 2026 19:51:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rWfEFf8-Pqv1; Fri,  6 Mar 2026 19:51:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06EEC6141A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772826689;
	bh=wYH66ugcL8BZWRy9lJ5IDoGX/btFfJFE0h8avGw8CtE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fJG+aqW8CsoJjMtEC8IylF69AowOl+01iGhjIvrf3Hi1YEMtcg8FZv5rO30hKoq9M
	 ezXJHM7Bdu8X4Y66DPjJByb2bAcsTbX6eU+IpLNH/PoMjxdEBt9PdgGztwrfCc65gM
	 4GKJcKKsPC2OWw+DDuLa21WwaesPSaELkEI8XAM6GeLYg1ntsaHOcZaSmfVrZ5xve4
	 /pe40OtmT9omz+LYC3LerEQr43TpxuB/Chrkae0ZC+3SSLce3xOEBBJs2Jea2rR0N/
	 SkZyMNuBxmAdRLUZnCAWHWSyK8c24vauBHIuzD2yTZGJheUTu92Zhhi1Zy9VvEMXlB
	 owM+qfOrMxarQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06EEC6141A;
	Fri,  6 Mar 2026 19:51:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 031EF223
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:51:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2AF7D613E8
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:50:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RQiWswfHqJl2 for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 19:50:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53461613F0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 53461613F0
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:50:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 695BB8469D; Fri,  6 Mar 2026 19:50:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Mar 2026 14:15:38 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 7099bade8970d4631e777b0b11e9dae44baf5095
X-Git-Newrev: 6c04bdf56d217d25db72877682da370756084ace
X-Patchwork-Hint: ignore
Message-Id: <20260306195051.695BB8469D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/graphicsmagick:
 add CVE-2008-6621 to IGNORE_CVES
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6c04bdf56d217d25db72877682da370756084ace
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

This vulnerability match on every version of graphicsmagick. Since it's
really old it's unlikely it will be updated and is thus added to
IGNORE_CVES. See [1].

[1] https://nvd.nist.gov//vuln/detail/CVE-2008-6621

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit b55fd37919e40c700251d0b8e9e10c73be048d5d)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/graphicsmagick/graphicsmagick.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/graphicsmagick/graphicsmagick.mk b/package/graphicsmagick/graphicsmagick.mk
index 4b9f3bd23c..40107b3aae 100644
--- a/package/graphicsmagick/graphicsmagick.mk
+++ b/package/graphicsmagick/graphicsmagick.mk
@@ -11,6 +11,10 @@ GRAPHICSMAGICK_LICENSE = MIT
 GRAPHICSMAGICK_LICENSE_FILES = Copyright.txt
 GRAPHICSMAGICK_CPE_ID_VENDOR = graphicsmagick
 
+# Wrong NVD annotations
+# Fixed in version 1.2.3
+GRAPHICSMAGICK_IGNORE_CVES += CVE-2008-6621
+
 # 0001-ReadJXLImage-Apply-image-dimension-resource-limits.patch
 GRAPHICSMAGICK_IGNORE_CVES += CVE-2025-27795
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
