Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9C3A109C057
	for <buildroot@archiver.kernel.org>; Wed, 25 Mar 2026 19:40:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8587C60D7F;
	Wed, 25 Mar 2026 19:40:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dY1a6Xt2p4wc; Wed, 25 Mar 2026 19:40:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A769260D56
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774467626;
	bh=SidM4K6Q2FG7l8dPpbWyiJ4xOUVwcHT8XKPbga+99xE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sHnl8VgdWJ30gefzizwonvh8PuodTqRwdww7gUXSlCY6US0m2Tfc6ENoYMJI0HPFj
	 5/UceHYkIk0707oxH/nsUNp7J455EYWVCUXTt8iNfQjTggaNef9Hib+H7EFHNCvcX2
	 eyonVE6P6/LfKomtjPYM3UoD3m8en0TbQjpSlvswM1SL22LT8hoMWIpF/dUb73MlHV
	 0FCH3/sW79esu9hkbYEVbChckbk7FZJNh+vA8fJxdVlx9PWexd8PuJ19ahlymq/UnG
	 21MOGVA3I324klcMvH0nsx8Q2UH4MjOq5aQR47Sk0CmOzK36I2Ik0ZFVtCINfc8AoD
	 v3t8Px4eNU51A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A769260D56;
	Wed, 25 Mar 2026 19:40:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5DB3A353
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 19:40:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 991BC60D57
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 19:40:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eHDnkPKz1HMY for <buildroot@buildroot.org>;
 Wed, 25 Mar 2026 19:40:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED33760D7F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED33760D7F
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 19:40:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3D888848AE; Tue, 24 Mar 2026 21:22:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 24 Mar 2026 22:14:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b4889d8b1cfcf4ec79487787c61e8033fb74df2c
X-Git-Newrev: e656b8b6394231e26d18cd9567d25893ffe2868b
X-Patchwork-Hint: ignore
Message-Id: <20260324212247.3D888848AE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] website/lts: fix section on small screens
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e656b8b6394231e26d18cd9567d25893ffe2868b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Make the section header take the whole screen size for device with a
small screen (mobile phones).

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 docs/website/css/lts.css | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/docs/website/css/lts.css b/docs/website/css/lts.css
index 5f05288188..c1e9b198a8 100644
--- a/docs/website/css/lts.css
+++ b/docs/website/css/lts.css
@@ -145,6 +145,12 @@
     scroll-margin-top: 20px; /* Offset for jump to anchor */
 }
 
+@media screen and (max-width: 768px) {
+  .br-lts-section-header {
+    width: 100%;
+  }
+}
+
 .br-lts-section-header:hover {
     border: 2px solid var(--br-blue);
     box-shadow: 6px 6px 0 var(--br-blue);
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
