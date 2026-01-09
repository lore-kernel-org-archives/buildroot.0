Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83A15D2F35C
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:42:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08A7684095;
	Tue, 13 Jan 2026 19:42:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7zdruC650GAS; Tue, 13 Jan 2026 19:42:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D7C784026
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333322;
	bh=g6Q0MAAGDVb5W2hNQVg0TZBl+BbW4zHct5AvdjqBaIg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nrJ8Ecl1MmQ3V+AkpXF6k6Ki50CocZdGZDOm2GXUjAyrPhTPXjv/q2tGvYNs2zpe8
	 qirTExu8KxeFH1eE0iiYg1xKXAAvvdpwP3WJYjyVL0GI+mOzrfTuBu4j84I45/OO46
	 fifWSnHvBdF+Zk2DPJHYFBNHMYDZum6jP2oYDJ9hpwxx3qfpFpHDlWwSM9Fn+7p+Oe
	 IEBOxitieoZl4XhmYEYHMr66q8OyPWG8C8en5guwIw3kObRIKx/2ZCkSAALmz/vRVD
	 ijmpvu+vFzl4p9NVaFitZwq6uHZ1xCa1SMG/uiel1kUPZhWLsXVjOv6IMab7co9GM7
	 2BmDQ1jCm2s1A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D7C784026;
	Tue, 13 Jan 2026 19:42:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 30A2E1C3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:41:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 269C1406E2
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hHiIN6gwU79J for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:40:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E756A406F6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E756A406F6
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E516080840; Tue, 13 Jan 2026 19:40:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 18:22:29 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 311a9a8d89220348bf0a56eeeb3be22662072f2d
X-Git-Newrev: 0744d70e27732e566a9ead628e9d6c7305630cf1
X-Patchwork-Hint: ignore
Message-Id: <20260113194034.E516080840@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/opencv4-contrib:
 fix Config.in comments
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

commit: https://git.buildroot.net/buildroot/commit/?id=0744d70e27732e566a9ead628e9d6c7305630cf1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

The comments saying that dnn_objdetect and dnn_superres need a glibc
or musl toolchain should be shown when a uClibc toolchain is selected,
not when a toolchain NOT using uClibc is selected (as this is exactly
what's needed).

Fixes: a2e01b23fc441a4be4416e68d91e331e00db3bbd ("package/opencv-contrib: propagate opencv4 dependencies")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 3b84ec3ee24d0000be339b66b1f1f93735d8757f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/opencv4-contrib/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/opencv4-contrib/Config.in b/package/opencv4-contrib/Config.in
index d992c6d1ac..ad61c3fbe8 100644
--- a/package/opencv4-contrib/Config.in
+++ b/package/opencv4-contrib/Config.in
@@ -84,7 +84,7 @@ config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_DNN_OBJDETECT
 
 comment "dnn_objdetect needs a glibc or musl toolchain"
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_USES_UCLIBC
+	depends on BR2_TOOLCHAIN_USES_UCLIBC
 
 config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_DNN_SUPERRES
 	bool "dnn_superres"
@@ -97,7 +97,7 @@ config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_DNN_SUPERRES
 
 comment "dnn_superres needs a glibc or musl toolchain"
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_USES_UCLIBC
+	depends on BR2_TOOLCHAIN_USES_UCLIBC
 
 config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_DNNS_EASILY_FOOLED
 	bool "dnns_easily_fooled"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
