Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9181ECD4F47
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:28:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54BE884276;
	Fri, 15 May 2026 13:28:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tgaJBtp7EuOZ; Fri, 15 May 2026 13:28:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2920F84262
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778851733;
	bh=RyR2jJtoklGpI5cvFEsOJOwkIH4ngWkshz8dx7hDHB4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mHFbqa5IZYh1qog/8PCVkvCKF42SU6g+VgX96ZawAR4+OZwuyEDf2QbFRzKjfaeRF
	 9RcPtGdtMvvHHAoN+jL4i+S9gXmKJ1sKCucvVdQ4z1CCxx4JlOY5oESGc0Ze4j7LcS
	 +7+wVkV5zKLU/v4GayGrH2q8BA04oQPTMKqMIDeC4v29jiMVX+ncaA45zp4Lc/9lqv
	 MOh8sgAz5i8PpIQymxRMG7APj8rxMnuT9G08bACS7k8t1S8Pj1b8ujc006FfYvDpJt
	 XLW8slonYPZEuhtfC5TEYpHYEc8cNMXlXncLTaSw4hZRpRMq2U2tT4RZsRHuANFNO0
	 MA0f+tlP8MpQA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2920F84262;
	Fri, 15 May 2026 13:28:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 044CE36E
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:28:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1286C61545
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:28:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id clhj4q6agWsw for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:28:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2198A61568
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2198A61568
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:28:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7429286356; Fri, 15 May 2026 13:28:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 May 2026 14:27:37 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 35aaa01cfa813cce78f299fb7f04040dece815c6
X-Git-Newrev: 9dace9acd583c473557c78dc0305cbbab7269cf8
X-Patchwork-Hint: ignore
Message-Id: <20260515132817.7429286356@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libinput: ignore
 CVE-2026-3509{3, 4}
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9dace9acd583c473557c78dc0305cbbab7269cf8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The vulnerable code was introduced starting version 1.29.901 & 1.30.0
[1] and thus doesn't affect 2025.02.x version 1.27.0.

For more information, see the NVD entry [2].

[1] https://gitlab.freedesktop.org/libinput/libinput/-/commit/9e37bc0cfa4d975291e5a2899e148fb83526d4a2
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-35093

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libinput/libinput.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index ee15b781e6..1930a8cea5 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -15,6 +15,10 @@ LIBINPUT_CPE_ID_VENDOR = freedesktop
 # Tests need fork, so just disable them everywhere.
 LIBINPUT_CONF_OPTS = -Dtests=false -Dlibwacom=false -Ddocumentation=false
 
+# Code not present in 1.27.0, see
+# https://gitlab.freedesktop.org/libinput/libinput/-/commit/9e37bc0cfa4d975291e5a2899e148fb83526d4a2
+LIBINPUT_IGNORE_CVES += CVE-2026-35093 CVE-2026-35094
+
 ifeq ($(BR2_PACKAGE_LIBGTK3),y)
 LIBINPUT_CONF_OPTS += -Ddebug-gui=true
 LIBINPUT_DEPENDENCIES += libgtk3
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
