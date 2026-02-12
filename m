Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 617EEEF99D1
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:36:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 251668466C;
	Fri, 13 Feb 2026 19:36:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U3LuG_naxgkR; Fri, 13 Feb 2026 19:36:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 406D184663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011399;
	bh=NfpZbtw3P2HfTkcuUk8crXX2WAUVUQr01Z77l9zq9RQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Hc+nfBGbUwpg5RSuYIMtsFNFjqAYeEQ/UCtnyl6UpPVxTv96vD5WFb9KAQlc49FCy
	 mhpnW4TfK2jPO9SBCHUo61HCP3m/EBawVcQpO3GgclaJ0DLDJ6ebnB1FyodoLR7mfg
	 1K9JzO5JEmijl974e3rtKkQcvasOhaHcM/JOND0zo8lMXjrxl3HiOVP8GnBINU5L5Z
	 7HcLQJhYNgTtTs0BLeyTaNiiO3Na93lZtiNUM3sU24D4c7PK/XmqJzCzlUT/aK4tF/
	 eDrVMg/0l17Gtu8wxGz/YX1jd6Xw1xKn3ZuX48650e/ynu6QMqM1bKAzeHdFLb5cxf
	 OifyZK8/3eDZw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 406D184663;
	Fri, 13 Feb 2026 19:36:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 12A5731F
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C5700844BE
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LSin0KTgnKMA for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:35:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7618384550
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7618384550
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6B9CE8268D; Fri, 13 Feb 2026 19:35:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 15:00:51 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 417c6b2a11f1a137d0407ba37e49d4ecff91373e
X-Git-Newrev: b8c1921d6016f1b1c4ddc46f6e270b7ae5e59dd8
X-Patchwork-Hint: ignore
Message-Id: <20260213193528.6B9CE8268D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/igmpproxy: add CPE
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b8c1921d6016f1b1c4ddc46f6e270b7ae5e59dd8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The CPE `pali:igmpproxy` is a valid CPE for the package igmpproxy.

See the latest CVE: CVE-2025-50681 [1] that reference the upstream
repository.

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-50681

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 7ed80ecec1cf2653803e5bbbec48daaeb6e6c056)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/igmpproxy/igmpproxy.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/igmpproxy/igmpproxy.mk b/package/igmpproxy/igmpproxy.mk
index 357c9087e0..f2c32939ff 100644
--- a/package/igmpproxy/igmpproxy.mk
+++ b/package/igmpproxy/igmpproxy.mk
@@ -11,4 +11,6 @@ IGMPPROXY_AUTORECONF = YES
 IGMPPROXY_LICENSE = GPL-2.0+, BSD-3-Clause (mrouted)
 IGMPPROXY_LICENSE_FILES = COPYING GPL.txt Stanford.txt
 
+IGMPPROXY_CPE_ID_VENDOR = pali
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
