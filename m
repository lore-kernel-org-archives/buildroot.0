Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6CBF606D809
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 21:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=QThswCSY
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B6884092C;
	Wed,  4 Nov 2026 21:06:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 64iDGxmurEAu; Wed,  4 Nov 2026 21:06:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7A5AF40910
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793826408;
	b=FpAuZTtFUm55oay1ixrkBx2VC6UMFvVLxYCW2HGgEh2hBtEpg49506DAJpdFzgIQr6kK
	 N1HfcjsczCDpyha+q50v4osoS+AVWLH2UcKVSqz+gb31xrmvBtbu+1EEy3kcpCqZRGpBC
	 6sPb0NvLBTSJOT/gzeNuReBavDktsiyFGbWgSkQNV6Z6sM4ifLMnIYS9Gn/up92rppfJa
	 kFr+7d+yUqOeN9wpjcXDPxSDybb17OBt/koQccTm3kOSicvttiKZQT3HqIluAWq7+TS9d
	 vV8pYDI9p6cUHMT6SRVZseGwDugKlNn2U9pIMUU1pixqBmFrmNNKtcJe8kC4YKcu6dg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793826408;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=0z7FG+cZEg4Q/ExftmH2LbuLRyYOqb4j8j2iMb8IOF4=;
	b=EdiD66l+IKKPRI14Xt+ySMfLljtioRwEGR7Bzyk3Nc1qxJJUMsXgRfayuNHqc0HaF/Sq
	 ahiApDdCzfI9WyRIqDW+o2OcNghd5FxqApbEhByMfZZXis63cLIsL3NNmWubdNwTpudBx
	 STSZsHiPo6YAVfrWSBdnQllz7DlF3t67XvjONau5VEg+4nCN11JNkwmNeG9zs2uXmR5AF
	 oZD60CuYjRl9c5qBtfROF9AQFuNeCpSSw5UzrU3v3LL1zvVCTk5zxjEczJtSx/aGp0gMB
	 7hEqjUSMP0Oa5I37JsDzQlGV3cuod/oj600sN7OXBFCLq35AYecEPXtiCiMySwIQmLQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793826408;
	bh=0z7FG+cZEg4Q/ExftmH2LbuLRyYOqb4j8j2iMb8IOF4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QThswCSYbvLbNKmaGV2/XoFQnI5STw/lKsic6t+K7yZBhVLssnyGkQyB7nszX2oPT
	 InCwkJ9SR3djDI4bSRuPdA+wgPmMQgGA5Ncu1hraJsNlA+XcC175m2lIBbbW1em3MS
	 ymCYv/Qg7Klb11QDgSdsVrMJkXWtXvTF3/xCxO+O8mZi2WJ5eZG2SvVeB8E6vdRLrQ
	 ELRbgCJ6SVI6FV6eWsD0l2rNzKE4o8jR+5Hkx65j4mmlfmDC1PDaGc06Pv/yis3ifD
	 +G1C27QfyOT1HyHtsRsPMvMj0oND+E/nlAXfRe33Z1AqJWnxOclItMMaJx/IZ/RoJK
	 N+2z/ngLnyQ+A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A5AF40910;
	Wed,  4 Nov 2026 21:06:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D36A71790
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:06:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B8E4F6078E
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:06:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NzZIFUGJymOs for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 21:06:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E0AE1607F7
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E0AE1607F7
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:06:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 144E29DE69; Wed,  4 Nov 2026 21:05:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Nov 2026 22:06:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 48a835ba2b00334518e60e7c02f4eb3c17e1fa06
X-Git-Newrev: 48053a2861fbd03da67022769d7decd03072d380
X-Patchwork-Hint: ignore
Message-Id: <20261104210504.144E29DE69@busybox.osuosl.org>
Subject: [Buildroot] [git commit] website: escape the bare ampersands
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/48053a2861fbd03da67022769d7decd03072d380
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The news and LTS pages use bare ampersands, in text and in the mailto
links of the LTS sponsorship buttons, which is not valid HTML.

Escape them as &amp;. The links are unchanged, as the browser decodes
the attribute values.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/website/lts.html  | 8 ++++----
 docs/website/news.html | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/docs/website/lts.html b/docs/website/lts.html
index 4308a37a4d..3b58cbff0f 100644
--- a/docs/website/lts.html
+++ b/docs/website/lts.html
@@ -38,7 +38,7 @@
         <span class="badge rounded-pill text-bg-primary fs-5 align-self-start">2</span>
         <div>
             <h3 class="h4 text-body-secondary">
-                Vulnerability tracking & reporting
+                Vulnerability tracking &amp; reporting
             </h3>
             <p class="mb-0">
             Tracking of the vulnerabilities affecting Buildroot
@@ -264,7 +264,7 @@
               </td>
             </tr>
             <tr>
-              <th scope="row">Analysis & commit annotation</th>
+              <th scope="row">Analysis &amp; commit annotation</th>
               <td>
                 <div class="row g-0">
                   <div class="col-6 px-1"><span class="badge text-bg-primary d-block text-truncate">&nbsp;</span></div>
@@ -401,12 +401,12 @@
     <div class="card-body">
     <p>
     Interested ? Contact us at
-    <a href="mailto:buildroot-lts@buildroot.org?subject=[buildroot-lts] Sponsorship information&body=Thanks for showing interest in the Buildroot LTS Sponsorship. We would appreciate if you could introduce yourself and your company by answering the following questions: in which products do you use Buildroot ? How are you using Buildroot ? How many different configurations do you have ? How long do you support your products ?">buildroot-lts@buildroot.org</a>
+    <a href="mailto:buildroot-lts@buildroot.org?subject=[buildroot-lts] Sponsorship information&amp;body=Thanks for showing interest in the Buildroot LTS Sponsorship. We would appreciate if you could introduce yourself and your company by answering the following questions: in which products do you use Buildroot ? How are you using Buildroot ? How many different configurations do you have ? How long do you support your products ?">buildroot-lts@buildroot.org</a>
     to learn more about the different sponsorship tiers and get all the
     details about the sponsorship.
     </p>
     <div class="text-center">
-      <a class="btn btn-success btn-lg" href="mailto:buildroot-lts@buildroot.org?subject=[buildroot-lts] Sponsorship information&body=Thanks for showing interest in the Buildroot LTS Sponsorship. We would appreciate if you could introduce yourself and your company by answering the following questions: in which products do you use Buildroot ? How are you using Buildroot ? How many different configurations do you have ? How long do you support your products ?">
+      <a class="btn btn-success btn-lg" href="mailto:buildroot-lts@buildroot.org?subject=[buildroot-lts] Sponsorship information&amp;body=Thanks for showing interest in the Buildroot LTS Sponsorship. We would appreciate if you could introduce yourself and your company by answering the following questions: in which products do you use Buildroot ? How are you using Buildroot ? How many different configurations do you have ? How long do you support your products ?">
         <span class="bi bi-envelope-fill"></span>&nbsp; Contact us</a>
     </div>
     </div>
diff --git a/docs/website/news.html b/docs/website/news.html
index d7e680e41a..be4d550505 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9787,7 +9787,7 @@
       <div class="timeline-body">
 	<p>The slides from
 	  the <a href="http://fosdem.org/2010/schedule/events/emb_cross_build">Cross
-	    Build Systems: Present & Future</a> session
+	    Build Systems: Present &amp; Future</a> session
 	  at <a href="http://fosdem.org/2010">FOSDEM</a> are
 	  now <a href="http://send-patches.org/news/20100211-1-FOSDEM-Crossdev-Workshop.pdf">online</a>.
       </div>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
