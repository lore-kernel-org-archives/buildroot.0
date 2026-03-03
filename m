Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA2E4EB362F
	for <buildroot@archiver.kernel.org>; Tue,  3 Mar 2026 17:33:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 833A940D0D;
	Tue,  3 Mar 2026 17:33:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q6YwbzFWVhgJ; Tue,  3 Mar 2026 17:33:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9CDB240DC8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772559216;
	bh=qFd4W4RyDy4KlMQpnpLRF8gL5BRkLXUnzw/3huMNH6o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bi38x4ByPusJoIELRV1Wey3Tfk7SyGw9YmNJUeuE16ZvEJuVR+6NceWUH02n0uYsK
	 19jta7vUcfp4+ZFCwVDrjUeMCut6mrVP+yD7KpAoKqfwA4mSAf8o0K1mRj4Nqawjsj
	 ymz0215iIcU8Z/DIRNEw4ZTxuz4vIP0suJNFShNIEHpeHVvXKxGOOC5Fp/nDZYdvkv
	 8leerFMDWzLDU3qwU41uSxjnO+Djh5+qIcmCCSlhV0M6ZNjcLQK0g8QpuhyOl3vsZf
	 xt40sxrzyiSdS+GqxIE9zcE//JREHupoJjUGPk1o8YIH31wS8RyX4sLynPUIFy/gDJ
	 t78eeU4sSCRZA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9CDB240DC8;
	Tue,  3 Mar 2026 17:33:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EBBB12F2
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 17:33:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DE31B6062B
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 17:33:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jbgbj5htI6gp for <buildroot@buildroot.org>;
 Tue,  3 Mar 2026 17:33:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C17F60629
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3C17F60629
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 17:33:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3436886084; Tue,  3 Mar 2026 17:33:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Mar 2026 18:30:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b55fd37919e40c700251d0b8e9e10c73be048d5d
X-Git-Newrev: 5c03ddb28637404ab37ce3eb4a0851c8135b4251
X-Patchwork-Hint: ignore
Message-Id: <20260303173334.3436886084@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/graphicsmagick: add CVE-2007-0770
 to IGNORE_CVES
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5c03ddb28637404ab37ce3eb4a0851c8135b4251
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This vulnerability match on every version of graphicsmagick [1].
It was issued because of an incomplete patch for CVE-2006-5456 and has
been since remediated [2].

Since it's really old it's unlikely it will be updated and is thus added
to IGNORE_CVES.

[1] https://nvd.nist.gov//vuln/detail/CVE-2007-0770
[2] https://bugzilla.redhat.com/show_bug.cgi?id=210921#c5

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/graphicsmagick/graphicsmagick.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/graphicsmagick/graphicsmagick.mk b/package/graphicsmagick/graphicsmagick.mk
index 40107b3aae..6c2885b7d8 100644
--- a/package/graphicsmagick/graphicsmagick.mk
+++ b/package/graphicsmagick/graphicsmagick.mk
@@ -15,6 +15,11 @@ GRAPHICSMAGICK_CPE_ID_VENDOR = graphicsmagick
 # Fixed in version 1.2.3
 GRAPHICSMAGICK_IGNORE_CVES += CVE-2008-6621
 
+# Wrong NVD annotations englobbing all versions
+# Wrong patch for CVE-2006-5456 later updated
+# https://bugzilla.redhat.com/show_bug.cgi?id=210921#c5
+GRAPHICSMAGICK_IGNORE_CVES += CVE-2007-0770
+
 # 0001-ReadJXLImage-Apply-image-dimension-resource-limits.patch
 GRAPHICSMAGICK_IGNORE_CVES += CVE-2025-27795
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
