Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D709EDA6BE
	for <buildroot@archiver.kernel.org>; Tue,  3 Mar 2026 17:26:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 087FB613A9;
	Tue,  3 Mar 2026 17:26:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3NPCRH-P4A-M; Tue,  3 Mar 2026 17:26:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 74E036063F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772558817;
	bh=ckuyJHjfzNVV/iw0q5DdMtVsGyPevq2mb/Ma7w3cbYw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TGKQOtH/tutyWhJq7HiyXb7VgaCmv2ak3j0pYf/GLmuomcoaeSOiReCy77XsjdM/B
	 UJuUqsuQtddw8fd79dXCQem/7l+NDeisi3ctRIQTk912dMZKPSC9CI6S3iW6NKnS7G
	 SAYbvD3uvZVchXFDsjy5+aIBcLgkzCTZpeZb6rtXoeTg0hUdW2jrNXvKrMrLENa7FL
	 5AWcvtGTV8tCaTbIQHuDYM43NPA0uRLyAbS3azsxb06REqvpnydHMKE2lXjKYr8/cb
	 BhMpJNl36q81wP7VdnDrGGIKOihPK53CqCTCVGZf7JXw4KcZvxhysIfByEIcETsjE6
	 GR19Q7FSNH4tQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74E036063F;
	Tue,  3 Mar 2026 17:26:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B49C25B
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 17:26:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 06FA7605E4
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 17:26:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6L95x5FYuq-8 for <buildroot@buildroot.org>;
 Tue,  3 Mar 2026 17:26:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44D7C607BC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 44D7C607BC
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 17:26:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3E4C285FD1; Tue,  3 Mar 2026 17:26:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Mar 2026 18:25:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a3329fd4923b7f1451560b589f101091574cb4dc
X-Git-Newrev: dc8fc4b80367a64eaa36712d67e1795df3baa415
X-Patchwork-Hint: ignore
Message-Id: <20260303172652.3E4C285FD1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freerdp: add CVE-2025-68118 to
 IGNORE_CVES
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/dc8fc4b80367a64eaa36712d67e1795df3baa415
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Only affects Windows platform. See [1] for more information.

[1] https://security-tracker.debian.org/tracker/CVE-2025-68118

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/freerdp/freerdp.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index 889c6035f3..4017caa277 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -17,6 +17,10 @@ FREERDP_CPE_ID_VENDOR = freerdp
 # https://security-tracker.debian.org/tracker/CVE-2024-32662
 FREERDP_IGNORE_CVES += CVE-2024-32662
 
+# Windows only
+# https://security-tracker.debian.org/tracker/CVE-2025-68118
+FREERDP_IGNORE_CVES += CVE-2025-68118
+
 FREERDP_INSTALL_STAGING = YES
 
 FREERDP_CONF_OPTS = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
