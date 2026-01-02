Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D05AAFA3755
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 21:50:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81F5B81158;
	Fri,  2 Jan 2026 21:50:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zNayrev1h5BH; Fri,  2 Jan 2026 21:50:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB97E8117E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767390630;
	bh=4HMcfXtdoVpP4KOWhj9P01f/eThL+2F3tXV5AboAhf4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qJ6/bfzPETIUmRE5nf54Izwf1Rv9Y4u1sV0vQ6WPolqR1toQmz/rw0Csb8rXGPj+M
	 0+AD4KTJYZfv1sV/1q1ec1vD8OMohUk6vTVkA99rd0VBAYZYdBaEXqZhVvDOYIlbAP
	 VZb1jZ4OiYf6T/Vm4q96gquwpL12HAbcZaymKqqozRZuB5nVUOEMAd7QKPSOTOenk3
	 jxcIxvKOmwlR7PzUn8rWkJrtrJzYTdh15Tfuyjmb5tQFoepoDkdK2kA9hISd6EcHBT
	 +ARxr0LPny/jXbkvVm/u2jW0qKcG0G5xdGiaAFA5SFzrZIbCzjIlDk1uBBKDUiJnhH
	 rkA7qZQ93Ue3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB97E8117E;
	Fri,  2 Jan 2026 21:50:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 95418249
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 21:50:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7B80F8117E
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 21:50:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AwBbjvo8UqbU for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 21:50:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A08C881158
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A08C881158
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 21:50:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8F5BB80503; Fri,  2 Jan 2026 21:50:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Jan 2026 22:49:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 15764ad78e6495a0c1d940b83aab26c7bcde475f
X-Git-Newrev: f16475f3773dbb910356c1b9dbb8a663266a55b0
X-Patchwork-Hint: ignore
Message-Id: <20260102215028.8F5BB80503@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mender: ignore mender CVE because
 it doesn't affect the client package
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

commit: https://git.buildroot.net/buildroot/commit/?id=f16475f3773dbb910356c1b9dbb8a663266a55b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

CVE-2024-46948 only affects the device management and update server part
of Mender, and not the client running on the devices

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mender/mender.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/mender/mender.mk b/package/mender/mender.mk
index 770589390f..76dc28d547 100644
--- a/package/mender/mender.mk
+++ b/package/mender/mender.mk
@@ -8,6 +8,8 @@ MENDER_VERSION = 3.5.3
 MENDER_SITE = $(call github,mendersoftware,mender,$(MENDER_VERSION))
 MENDER_LICENSE = Apache-2.0, BSD-2-Clause, BSD-3-Clause, ISC, MIT, OLDAP-2.8
 MENDER_CPE_ID_VENDOR = northern.tech
+# CVE-2024-46948 only affects mender-server
+MENDER_IGNORE_CVES = CVE-2024-46948
 
 # Vendor license paths generated with:
 #    awk '{print $2}' LIC_FILES_CHKSUM.sha256 | grep vendor
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
