Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE341FCC068
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 19:52:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E0F161451;
	Fri,  6 Mar 2026 19:52:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HosYe2TUcFwW; Fri,  6 Mar 2026 19:52:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C582561454
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772826764;
	bh=renTNb/7cryGax/2jSWN5nykhl7Uw83BZOSeSJ8468I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=e9Gmpo33DRc1bTiOrMGQbAmCFIesrH2y77aIa0lMojlahA2z+yFJijqnYpFWBle5n
	 GczMEtxdWFHDga6SzO5CFQNEJ2Cxdk0AzReu8PO41nL5Ku5E4QaPRHm8z3yBRPqq/4
	 /aCD7dHj1WXZ6zjCMy8PbHO3yHpm9NYLRZoVKwGoueXvzUsKziEg1mzgBPD3DRESN6
	 smtalCfsqJYlogN7vc/nhwL+lHbRHwFKJ1Ez+iMv82JKZM9pVPE3ihy6bM8tMfsh01
	 ET0Mebju5aEQggSduUVuxWhnvjuSJXBmUkyHLmzegSH3OvkZt4yG+rd0vv8oD7vLC9
	 FmVuUWniRDitQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C582561454;
	Fri,  6 Mar 2026 19:52:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2FC1E223
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:52:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 246FE81E88
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:52:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kdhE4ay4mgJJ for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 19:52:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7212182668
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7212182668
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:52:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8782E7FB67; Fri,  6 Mar 2026 19:52:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Mar 2026 14:15:10 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: c68c55964c688ee0d4eff4dd48569059d373262e
X-Git-Newrev: f05d9ba5c998d778a2c6afe484d35f7516641914
X-Patchwork-Hint: ignore
Message-Id: <20260306195223.8782E7FB67@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/freerdp: add
 CVE-2024-32662 to IGNORE_CVES
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f05d9ba5c998d778a2c6afe484d35f7516641914
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The CVE-2024-32662 was Introduced in v3.0.0-beta1.
For more information see [1].

[1] https://security-tracker.debian.org/tracker/CVE-2024-32662

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit a3329fd4923b7f1451560b589f101091574cb4dc)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/freerdp/freerdp.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index 07b9d36339..f240d789dd 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -13,6 +13,10 @@ FREERDP_LICENSE = Apache-2.0
 FREERDP_LICENSE_FILES = LICENSE
 FREERDP_CPE_ID_VENDOR = freerdp
 
+# Introduced in v3.0.0-beta1
+# https://security-tracker.debian.org/tracker/CVE-2024-32662
+FREERDP_IGNORE_CVES += CVE-2024-32662
+
 FREERDP_INSTALL_STAGING = YES
 
 FREERDP_CONF_OPTS = -DWITH_MANPAGES=OFF -Wno-dev -DWITH_GSTREAMER_0_10=OFF
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
