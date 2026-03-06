Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F9F0FCC067
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 19:51:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4252C41ED8;
	Fri,  6 Mar 2026 19:51:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x7h8g-zeSoFb; Fri,  6 Mar 2026 19:51:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 661EF41ED2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772826679;
	bh=isubNgZOeF9tlf/7k3jEbFjWop8NGb1gvBn8FjwWQhc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SBhG3P9yMJPLoIxHaYO/inrYuOohGBwyslTAAS5nilYcIbarwAfA+1NTZkCyXJZim
	 lWHMN6xF7GxGBgZzewl9fjX3J8LkQ1iUqnqnIVrRe0avYJBeEm4m87SCkipqYnTYkP
	 Q5o25ek2SSaChPn67Q2+FoHWlZ2NI1i83TM0pNeQ8eTnE+XdFdXLk/9LOg4Ky+BULx
	 9ThOlrpeg9Sc3W/RB+VmKsQAUyzaVgop5mWbDOMnagyXxVKVZtyRI83r9o39+fR9j0
	 4eBXi1pg+Tu6WqW7GpVkOm7poBJoKF7atDVsfGDWMEv6v3+oFIwBQgNe4z8QY4krA3
	 aFek2Q7yQHu6w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 661EF41ED2;
	Fri,  6 Mar 2026 19:51:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 10718223
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:51:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 158E4613EA
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:50:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sqgWXVxwVaTB for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 19:50:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A0D160DFE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3A0D160DFE
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:50:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4E264855F0; Fri,  6 Mar 2026 19:50:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Mar 2026 14:15:21 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 507b3aff7a18bd611fb0be2067ae77d8c345f326
X-Git-Newrev: af7262d3be9bf736b6431c9a9da7c89c76141898
X-Patchwork-Hint: ignore
Message-Id: <20260306195051.4E264855F0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/freerdp: add
 CVE-2025-68118 to IGNORE_CVES
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/af7262d3be9bf736b6431c9a9da7c89c76141898
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

Only affects Windows platform. See [1] for more information.

[1] https://security-tracker.debian.org/tracker/CVE-2025-68118

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit dc8fc4b80367a64eaa36712d67e1795df3baa415)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/freerdp/freerdp.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index f240d789dd..a043557828 100644
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
 
 FREERDP_CONF_OPTS = -DWITH_MANPAGES=OFF -Wno-dev -DWITH_GSTREAMER_0_10=OFF
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
