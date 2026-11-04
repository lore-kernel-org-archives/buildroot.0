Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8EEE606D809
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 21:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=GZzN+Fkq
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AEC86408FC;
	Wed,  4 Nov 2026 21:06:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BnBDZqJSF82u; Wed,  4 Nov 2026 21:06:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7452940908
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793826405;
	b=k80lRlxHnweJCCcltx+zA3v7ExV7IN1PLserwDaYJv5Tg7NbwJDSiQ98R+6yPb5pabDD
	 Bh6TkZRVuTXZc+2zA8ZyALjl0WUrhyxYlGVi+sAHmA1KjoIXkBmfzalO5KU2BZdsXyzfj
	 wf9yQLF8ZrXs+Oy1s9Zl1SPABLhENsmhjD17oWMJYt4kN+ukBHSp7z3Xg7yIlGXruV4r1
	 6j7/pxJVQ4czIn0D6R0Q+v7tbEmifAS9dxPwv6PuT8pNH/xUrKpUUB8FY5hXDQDRy4+Bk
	 KmPongPLHLPb67eEYol4QGru5F0DwVca5NMOeRP53Qn/HY+cnPiYhj/QCHQHk6lpS6A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793826405;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=wn06ZCOneUqW17zQnyCw2BEDliowooqCIEvtpl2iqIU=;
	b=Hzd94OiGkctNHAs6CUtKTrktbMr7W9wbKkLmPlEsDyNutjOffY+DvGOaaMtDI2dGNIis
	 WAx3H8brAmr70XptNqTx+qtR+7OSOpRl52oWvXryHAP7MyzuzB5A4Y7Dk0zi4cuHZgowt
	 dC3da2hRSAFbkxxE9u4IM43LW+9HDcgAhbxQXpcBDS1fZWUcBrW+JQh+7JcPawrc0VFuD
	 l7sXCh7rFpIJ8KOVg6oukHD9nxSq9P5luScJWdXSrPgigRy2QgjruJOWEuwSTBCOyYElD
	 6e7bf6gGN6yG57Vs/PyCPQy36rQGfmmhaa86ltzWpuog+Ol1iDH+/EqwqGa9R6LIZrw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793826404;
	bh=wn06ZCOneUqW17zQnyCw2BEDliowooqCIEvtpl2iqIU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GZzN+FkqgU4PY9uMohol6VdnaUCpxobwwSeDfoPNWHZAkk8QyxD2pPByEacZypq6l
	 On9WgLETxJBBbqia+wneQWisjq6FK3df5j2D+Ic+su3+9gJjPKo6gaPAP123RXqtn1
	 TBluYRfW0GoCB9aQ1FmeB9MhThFhZkzOmj7qA/0y/sDvn9V+MZZc1A5kMg5mLblQQa
	 hx5agrOxzvyR6l2dMbypSVt5y+hjjFYb+PdS1xeIdOHAPfsxpCnkvytrUJEBNVZop1
	 JpY+eZe7KMyMZu3AmALpKwYow9VLEiec56/G5hIvjmMaOsGwptGghN4/bdgzFJ309g
	 WACfoMTb45QSw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7452940908;
	Wed,  4 Nov 2026 21:06:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A8803178E
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:06:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 92058812EE
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:06:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3ix9vyx8RV_r for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 21:06:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D7011812D9
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D7011812D9
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:06:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F1DE29DE7B; Wed,  4 Nov 2026 21:05:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Nov 2026 22:06:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 477c13365ca80a294088a666917a0a1830509ee3
X-Git-Newrev: 48a835ba2b00334518e60e7c02f4eb3c17e1fa06
X-Patchwork-Hint: ignore
Message-Id: <20261104210503.F1DE29DE7B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] website/news: fix an unbalanced paragraph
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/48a835ba2b00334518e60e7c02f4eb3c17e1fa06
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

In the "Moved to git" entry, a <pre> block is nested in a paragraph.
A <pre> can't be part of a paragraph, so the browser closes the
paragraph before it, and the </p> that follows is left unmatched.

Close the paragraph before the <pre> block, and put the following
sentence in its own paragraph.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/website/news.html | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/docs/website/news.html b/docs/website/news.html
index 2295abbf57..d7e680e41a 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -10153,10 +10153,9 @@
 	  to <a href="http://git-scm.org">Git</a>. You can browse the
 	  repo online
 	  <a href="http://git.buildroot.net/buildroot">here</a>, and clone
-	  the repo using:
-	  <pre>git clone git://git.buildroot.net/buildroot</pre>
-	  See the <a href="/git.html">Git Access</a> page for more details.
-	</p>
+	  the repo using:</p>
+	<pre>git clone git://git.buildroot.net/buildroot</pre>
+	<p>See the <a href="/git.html">Git Access</a> page for more details.</p>
       </div>
     </div>
   </li>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
