Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24E24FCC066
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 19:51:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ECE3F41E4F;
	Fri,  6 Mar 2026 19:51:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s_uFLQHwyE4s; Fri,  6 Mar 2026 19:51:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21AAF41EEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772826683;
	bh=DSd9YSangh+j6v4bETdwYjHi6Wa1FUOt4/DbZlRhh30=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ChOBAYCjmoj4npiAM+ZpfPmWNz6OsppvBtxP4Ipb0IlBJdJscfJajgKu0lQ6G+VpH
	 l0EGN38WNUXr+66yalrF1otNf3PVPH6RsU/hF3Ohvv6gdJKmkUmhFSsvs0bjJbjKvR
	 Llsa2SBAu2iJPctL81A++21T5ho9upXrH2i/qu/V/2QKyFXMyENsWoiB8e7AT44WIU
	 ClQHg8XP05bw3WtxeHH04KcokMq4eVmuoFbhG92GFcXu4hSj7HCrWzxXyTCyN9fMwV
	 zRlrqFbyiTCmv7A00WmaD/Wz/IXnYlDDOJzPgKzTNi0fT4cSsgshS0oGnwow7Rytqi
	 OwywsE/uBQDpA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21AAF41EEA;
	Fri,  6 Mar 2026 19:51:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E53F25B
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:51:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5EC1E613DB
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:50:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aVdV3e5Xhkhj for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 19:50:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E2E7613F1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5E2E7613F1
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:50:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7394180090; Fri,  6 Mar 2026 19:50:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Mar 2026 14:16:04 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 6c04bdf56d217d25db72877682da370756084ace
X-Git-Newrev: 44c0deba937fc42181caaf37a83dd9f2916117cc
X-Patchwork-Hint: ignore
Message-Id: <20260306195051.7394180090@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/graphicsmagick:
 add CVE-2007-0770 to IGNORE_CVES
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/44c0deba937fc42181caaf37a83dd9f2916117cc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

This vulnerability match on every version of graphicsmagick [1].
It was issued because of an incomplete patch for CVE-2006-5456 and has
been since remediated [2].

Since it's really old it's unlikely it will be updated and is thus added
to IGNORE_CVES.

[1] https://nvd.nist.gov//vuln/detail/CVE-2007-0770
[2] https://bugzilla.redhat.com/show_bug.cgi?id=210921#c5

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 5c03ddb28637404ab37ce3eb4a0851c8135b4251)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
