Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E107606D4D5
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 21:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Djh8Y2Dj
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDE0660850;
	Wed,  4 Nov 2026 21:06:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MRfpVCLaimVI; Wed,  4 Nov 2026 21:06:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0CECE60833
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793826407;
	b=IEOaJKoRLrN2EXOB4JZR9D8+MESFNDGr8LEMwQTy6FjcCQNgSPXwAVF2y5FhAOauyINB
	 kDvSgZYXkv5KVgFXq2sXmQsz+cisHjLZBb3X+QOJL+Ty1YWhqg2mrpHBSHCg2ybsZZVBW
	 dba1HOIYl9JxSklLK8vdT8KH1j47XONCb4Ma+Iha+tFCORilYuU0BeNH3OwQY2y3W8Hnf
	 18WahQ/FGSoWi1Xa95kfynRpRhmUFzGuNK0m6LPwbBBBFLCHlwYzA+Epg1v3rKVta7xnN
	 lMSfM+c8+SQg5LWTvEgN3GgICooBIeT/knFSm0t/bhbiFD/SwSHeXdjFAXb3y3NyG7g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793826407;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=L9L/PJQ5BhD3cHw4AurIidSf8hhtviRaC0+/KK/sLv8=;
	b=tajAmak+EJzLhyXlXXxg0lbCFVv1hP87XJyxDR94pLR+qOnsqVPhfhrNS15owqCotVD8
	 EJ0Z0nIpvxxOPUECb4D3j/P8pp/TTg1bDSFCVtF0RAlBz+AXCPEPnhVrKo6829LyAXHXZ
	 MxyKdRdKR0NhpREW1ckcI7eP4/gKb5OhbRbvO/u2qW5d4NGVRcZ160EZotaaHWhXHnZRP
	 tXwx7kawj1zJs/83yUrHVhaWzuXekDVKgnIQvFHH+1IiHljCiqWnzZq/1KjI6yrOEdqXQ
	 ed3RsayZGZeu3XaJ0fIqYaLxVIhqSwOppnAof3sfxvBGPlMSCW/kN7Dp7vyptUX19tA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793826407;
	bh=L9L/PJQ5BhD3cHw4AurIidSf8hhtviRaC0+/KK/sLv8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Djh8Y2DjN5kQada44rUdeaxEglfR77D9L4IXwx3UGucDMCv3k5txMgO92QZmBU1dO
	 nYbrdCgJ8G0lIswQYLNQb+pDLUfoO42gcZn0O0QByBr6aRFcGN+pCrIPY7zZ8QnAYQ
	 HRaa4ePrfHol9/NobLJjt1bLfT9OcJQmt2hTAFwKHzpXdwbMGJI5vrduPud6WKYSfT
	 2BTOzonhfNEXORFryxhwh20teEd7SvSvCfDY6oD/EQQqzhpqZc4C1CYabBPt6pOBEp
	 RNTkOl1zWZ1/xGp9dA6/WPZlF4sxMoZ+XFS7KIdYmWQAZAGYs8TKzYJDvMQN31wmc3
	 cdmWLxwf5mNmQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CECE60833;
	Wed,  4 Nov 2026 21:06:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A6F85178D
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:06:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 997D8408A1
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:06:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9y93vQDIVeue for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 21:06:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C26D9408A5
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C26D9408A5
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:06:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DB9639DE96; Wed,  4 Nov 2026 21:05:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Nov 2026 22:05:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3e8018f8b22ca6f27126e97606ec8ca667d42d1a
X-Git-Newrev: 477c13365ca80a294088a666917a0a1830509ee3
X-Patchwork-Hint: ignore
Message-Id: <20261104210503.DB9639DE96@busybox.osuosl.org>
Subject: [Buildroot] [git commit] website/download: fix the git clone box on
 phones
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/477c13365ca80a294088a666917a0a1830509ee3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The git clone command is shown in a single line input, which cuts it
on narrow screens, without any hint that it continues.

Show it in a span styled as the input instead, truncated with an
ellipsis when it doesn't fit. The copy button still copies the whole
command, as clipboard.js copies the text of the element.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/website/download.html | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/docs/website/download.html b/docs/website/download.html
index 0a47106921..2482c0a26a 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -141,8 +141,7 @@
       <p>To grab a copy of the repository use</p>
 
       <div class="input-group">
-	<input class="form-control" id="giturl"
-	       value="git clone https://gitlab.com/buildroot.org/buildroot.git" type="text" readonly>
+	<span class="form-control text-truncate" id="giturl">git clone https://gitlab.com/buildroot.org/buildroot.git</span>
 	<button class="btn btn-secondary" type="button" data-clipboard-target="#giturl"
 		data-bs-toggle="tooltip" data-bs-placement="bottom" data-bs-trigger="manual" data-bs-title="Copied!">
 	  <img class="clippy" src="images/clippy.svg" alt="Copy to clipboard" width="13">
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
