Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA02606A326
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 22:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=hL0Le5ri
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 78DAF80D8A;
	Sun,  1 Nov 2026 22:45:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B1gdE7jJGCF0; Sun,  1 Nov 2026 22:45:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A0DAF80C47
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793573129;
	b=IQ3CiORjzZ9zGRK/dutwNkfASYlWsk6S0S12/6v3hfCem3/SWnX6qvbT05lrSpo9+VLK
	 WOxpedbr041uoDGy00UriS144HN/xB1pnJ3KnhPRy6B6WGyvl7LOov5xKwsx4o6jPY/HS
	 MS0ysV9S4ajB2AB4Vyo94DEmHX7s14AdEeApqffdqMpoFCYTUhbBgVkB6xoUzMiqgnH5+
	 Ah1k7tPgQ31BuIBNoFtMWuMP5VPpLnmH7ZwxWkD3TQvBdACaBWPHeWLypIqtFnd437sn6
	 STrA3EbUIBH6kC5rZwPX6Fki53bJOgIcFKKz+XpGu9BdLndaJhFEkE5jg2ZwmvZrk8g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793573129;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=XyAuzLS2SPO+KvTznEFQAWsIFfrrBEiNsyQSlvyjptQ=;
	b=OkDT25MeURcaCIwvTAzmJoO9vApprY9orEOw5ldwGevJ1eC+0lXYgWQK4TRVT1OeDqzN
	 bq9DHyH/uuoIunp73kB1Ji5RYrG9Ps2i+Hf0E+gnJTotepu+cAhu8y3Y2ds5WTutdHh5w
	 lpJdr3MeOk7PpWlbYl9+RAE9SZo9X2qYX2vJhge6pfI69gly2Boyef5BMsti5eHUIDLhn
	 y00sT+7FniN0XHtVEBfGm4JNUJt+WiNB45vWu00sE9Heb0J7AbArzi8tFDW8anjRDrFVg
	 9JxG+ghga1yh9nk4thVdIrQNz2eQ/Gb2XosZLQGNk74gJddyqAPWp1syrue55y1HnFw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793573129;
	bh=XyAuzLS2SPO+KvTznEFQAWsIFfrrBEiNsyQSlvyjptQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hL0Le5ri2oGkCXX2yoOnV278nIzX8tvKr0NX7xjeuJX5nnYMVETv9S85iibhUQQeR
	 spliZLOuGR1zEk1MdxuCr3zFshU6b4aN0UUSsDq26ygYtTmiIpP5WnhkXqlJI5vW4C
	 JfjrU2Qhojbz+O3SQP3wF4YUQWUQwWHtv9+E6jIuhpmbNMKO75nkqrzDTdr+Fr3qe5
	 a7p25fFotFTs4zTM/ayHwKaFwxqRrL7OEQSDW9oeA6nQ1KWIhb4WjfsPEeV7eNeZZa
	 GUrePZclfmuROVvuwQc89hc7TKt++HcpjzJzrmQlm4lIRGSC05riY6X8H7RE06dKuf
	 CK5uT67x+0XOw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0DAF80C47;
	Sun,  1 Nov 2026 22:45:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E27D156
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 22:45:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 537EF80C47
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 22:45:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wS3hCfHz4Cqt for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 22:45:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9EA6C80C46
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793573127;
 b=L24GGrsWt1IvX/Wzgu3SPYW0O8Ma64r5WpN/KqfVvqtJnrO5UasBhsXJCGCrH1MBSCKL
 HkGPJNZexjRjp8WyT1FfJy1S06nfdQbfAtaEQi0dqUUh16kMmzJzTl72xoHbXtLbKuqFX
 T8xJT8rnzDCXUkpHQXT5f5GAXXh41/+SJ4AW0rCRTcORRv6vpAofpwcmsdMC7HICm/CP1
 BOV/yzhLLBdtMwITqsrVL1ba8pyR9Z63eWllo29Z8MmP9478AI5fysJvVQpodFP9fvM35
 Amb4D3XOzpSDX20AVR2hILK2b2Fl/pwM2n1iEpRJBWSHERY0pTGrhCmkxTqdcA7/nZw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793573127;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=uxzFxZzDuaImvpN3mrQ2DKaHZmyvkviPMN8SvKayrNA=;
 b=NjsgdkgNaDTeykRTo8E4af1KsuAvU4Ty1yEdcHFjJLpwSmHc8OSPEtOkioP0CCRoxi1I
 MVx4HksFtZpvjwS7xTscttI53B1vYrdiZFANIRuhwDAk4GtDq0Itsx0bupDQTjqTQ6a7+
 4Z0xmq/va6hjyBfsSgL37gm4JbZkK6qqvByv2CpMYq6o0lbj4FVNMDJuKccPWTOk9P/VZ
 whE+mlpKj+D6Ynr6JxGnw6gwdvKjk0/C3UMJ5RpbynPR0ALxHJxCRezieSznZM2tej7XI
 Gla+r96BXd9HDWPti7EHstcKTI5GP0xuPfiac2zvGhMe9/mVL6mG1z6efgEE8KWLeWg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9EA6C80C46
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 22:45:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 48A119D5C7; Sun,  1 Nov 2026 22:43:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Nov 2026 23:45:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d2f3cd8cbe3316484d6953f73db4a31277adcf7d
X-Git-Newrev: c17458af094891cc6e20444a9636dad1795a05dd
X-Patchwork-Hint: ignore
Message-Id: <20261101224358.48A119D5C7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] website: fix HTML markup errors
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c17458af094891cc6e20444a9636dad1795a05dd
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

- news: the title of the "New logo" entry was written as a broken
  "<new Logo/h4>" tag, so the entry was displayed without a title
- news: add the missing paragraph tags in the 2010.08-rc2 entry
- download: close the "Downloads" header cell with </th>
- sponsors: add the missing closing tags for the row and container

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/website/download.html | 2 +-
 docs/website/news.html     | 6 +++---
 docs/website/sponsors.html | 2 ++
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/docs/website/download.html b/docs/website/download.html
index 3089b1ad03..c51d58444e 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -14,7 +14,7 @@
           <th>End of Life</th>
           <th>Latest release</th>
           <th>Latest release date</th>
-          <th colspan="2">Downloads</td>
+          <th colspan="2">Downloads</th>
         </tr>
 <!--
         <tr>
diff --git a/docs/website/news.html b/docs/website/news.html
index 9ce4ff5427..b1c948e097 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9658,7 +9658,7 @@
       <div class="timeline-body">
 	<p>RC2 is out with more cleanups and bugfixes, see
 	  the <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2010.08_rc2/CHANGES">CHANGES</a>
-	  file for details.
+	  file for details.</p>
 
 	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
 	  <a href="/downloads/buildroot-2010.08-rc2.tar.bz2">2010.08-rc2
@@ -9666,7 +9666,7 @@
 	  the <a href="support.html">mailing list</a>
 	  or <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
 
-	This is very much expected to be the final release candidate,
+	<p>This is very much expected to be the final release candidate,
 	so give it a good test and expect a final 2010.08 release
 	before September unless critical issues are found.</p>
       </div>
@@ -10165,7 +10165,7 @@
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
       <div class="timeline-heading">
-	<h4 class="timeline-title"><new Logo/h4>
+	<h4 class="timeline-title">New logo</h4>
 	    <p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>27 March 2009</small></p>
       </div>
       <div class="timeline-body">
diff --git a/docs/website/sponsors.html b/docs/website/sponsors.html
index 5e27166b77..5d203fac92 100644
--- a/docs/website/sponsors.html
+++ b/docs/website/sponsors.html
@@ -521,5 +521,7 @@
     </div>
   </div>
 </div>
+</div>
+</div>
 
 <!--#include file="footer.html" -->
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
