Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F74BD0D155
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:02:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7997C82ED2;
	Wed,  7 Jan 2026 18:02:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X4gv7aMHLWHu; Wed,  7 Jan 2026 18:02:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0BF582EF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808933;
	bh=G8I0eMMhdu7UZCmgaZGN5ySTpiU4rvNe1KXxqcsO7kI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dn+Clvnwt5bq07hvRboiK3v1Z0IEX8s9h6mHkhnH6kP8XmTBQSwxvceCbkyLObtyS
	 OYoUA8dwkZVA4ZCb6Pr9EtqXC2VxYRU318dWCz77ZDb4SmuSBoVuTDqIZIUnALnZol
	 1vgC88Upz2U1e7ooh3JJMWqZqe5Q9qmjAqHHHKUb3PeINbGwEE+2Jdxrie6lLC3Vc1
	 LoaTWk0vocLOPqCzcl7XN1ne6mdNSSIrDKv0AX7OiuXfrYEcp4bsAYpr1J0qyfq08Y
	 jkxM0q5+hk/Rzjr9tdxgVGRQsKJQTrDB/lxJklh5A5Eis9O8EAMHKvTP2rMxsKmqDg
	 4MkvOLpHoQ8bA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0BF582EF0;
	Wed,  7 Jan 2026 18:02:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8524325B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5BCF6608B7
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3nxb0pzFzIUU for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 736D360891
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 736D360891
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7139A811C5; Wed,  7 Jan 2026 18:01:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 09:06:39 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 7405e400234e9199dfa527fb3378d005273b95b7
X-Git-Newrev: e071e4dd0f61bb6886d2fce60cfe30c5c65f047f
X-Patchwork-Hint: ignore
Message-Id: <20260107180115.7139A811C5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/opusfile: add CVE
 trailer in patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=e071e4dd0f61bb6886d2fce60cfe30c5c65f047f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Since Buildroot commit [1] the patches that fixes a security
vulnerability needs to reference the fixed vulnerability.

This patch adds the relevant information to the patch header.

[1] 1167d0ff3d docs/manual: mention CVE trailer

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 0b76139aa90828b3d58adc5853e1fddbe102b2a7)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../0001-Propagate-allocation-failure-from-ogg_sync_buffer.patch         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/opusfile/0001-Propagate-allocation-failure-from-ogg_sync_buffer.patch b/package/opusfile/0001-Propagate-allocation-failure-from-ogg_sync_buffer.patch
index 2ef08502ab..8e3be36cdf 100644
--- a/package/opusfile/0001-Propagate-allocation-failure-from-ogg_sync_buffer.patch
+++ b/package/opusfile/0001-Propagate-allocation-failure-from-ogg_sync_buffer.patch
@@ -15,6 +15,7 @@ Thanks to https://github.com/xiph/opusfile/issues/36 for reporting.
 Signed-off-by: Timothy B. Terriberry <tterribe@xiph.org>
 Signed-off-by: Mark Harris <mark.hsj@gmail.com>
 
+CVE: CVE-2022-47021
 [Retrieved from:
 https://github.com/xiph/opusfile/commit/0a4cd796df5b030cb866f3f4a5e41a4b92caddf5]
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
