Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8AB2EF99D4
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:36:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA4A561464;
	Fri, 13 Feb 2026 19:36:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WALHYR0CjsSa; Fri, 13 Feb 2026 19:36:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0B93614F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011382;
	bh=H3sDzSc9T/f31kToiig7L4/1tqi6uPvxdyRjDuVYB4Y=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=K54JFCSQkeT2CLh1MBiA14RRRa2Y2G7Nas02qhh7X82ePlgcrkD7RlHw7L+wsgkgr
	 CKSzjhA6DJMn8LjGqJINY8vglOBK8GJn/60f9gkAakcyutjX5/s4hG5uzH8W3fJdoc
	 Q89EHq6Qa5I514PzpTZq/dtAwkkjdXlk6vX+O/BMlz/oEMRWjDxO98qv3V+RFupNq9
	 ldQx+hwVCUSYUOiaS35xBqJ/CNBaf2TSc+P1Yi9P9T6+/t7LXs+a1zQsMQ3/5Sbx+w
	 50/hvseRL60WZldZjKhE1S1oxVPWDhadmxHrSOoq/p3eQ5gNN8ZcGCKVLdrULBFCbh
	 4xePXJNsXnXsA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0B93614F3;
	Fri, 13 Feb 2026 19:36:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 07D6E283
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3EA9041E54
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8yjnUEebJPUM for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:35:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3929441E3A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3929441E3A
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2DE6283545; Fri, 13 Feb 2026 19:35:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:31:47 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 0f7d6cfc45c4773d5c8ef9b4e5e97ce6431c84cd
X-Git-Newrev: 1ceb4e858d40258868128aed8a2409abd81ea185
X-Patchwork-Hint: ignore
Message-Id: <20260213193529.2DE6283545@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libite: add
 dependency on MMU, requires fork()
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1ceb4e858d40258868128aed8a2409abd81ea185
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Unfortunately, parts of the library is not very no-MMU friendly atm.
The below check fails due to runbg.c requiring fork().

$ ./utils/test-pkg -c libite.config -p libite
                    bootlin-armv5-uclibc [1/6]: OK
                     bootlin-armv7-glibc [2/6]: OK
                   bootlin-armv7m-uclibc [3/6]: FAILED
                     bootlin-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: OK
                             arm-aarch64 [6/6]: OK

The dependency was introduced in libite v2.6.0, so this patch should
be backported to v2025.02.x.

Fixes:

 https://autobuild.buildroot.net/results/6c6fd2ae410a82c44da54ee13a09a38a7ab220c1/

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e0b129e36e6d6b45de473bb59795001fddfcc0cc)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libite/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libite/Config.in b/package/libite/Config.in
index 80d29791db..516d1bff98 100644
--- a/package/libite/Config.in
+++ b/package/libite/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBITE
 	bool "libite"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Libite is a lightweight library of frog DNA. It can be used
 	  to fill the gaps in any dinosaur project. It holds useful
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
