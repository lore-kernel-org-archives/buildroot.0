Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62A23C5518F
	for <buildroot@archiver.kernel.org>; Fri, 20 Feb 2026 11:36:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00AFC83E50;
	Fri, 20 Feb 2026 11:36:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S9mhfT5qoBzR; Fri, 20 Feb 2026 11:36:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F48A83DCF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771587368;
	bh=wUpXsNq8XanGgkJXAa/xLml8ijNi66qkAfyZxV47ClM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XmPTmBvbMdHpRm0QUkJ/OWsBRXs5YmmWOh4CSruE42m4ebprGg37yqt+vVj2bOlTJ
	 rp3ADgwlwRES3agyNu/tnpHveMsu8iu7ZMquu7qQYwUYdjooyslxOWT2kYo0EHnLFS
	 mIIFRmLG7fadK6YfgbcPrzUkmCKc31RItpziPDIEG7UNhnQhmqb3gUWm7AJ+0KFpI0
	 mWlgac1goVfNPoFPoo2AayLZEuz3FLCg32R+fosyaO7Kzhwa4BmPYB0MrR9poSIsM0
	 gKSYbZb13wKsjYSsaK8tPnukfj0hgCWRPNvkBAlqGk+Mu+haqQe+Sj+5yK0Gh4196w
	 KdAP12sFSHt6A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F48A83DCF;
	Fri, 20 Feb 2026 11:36:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A2F21CE
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 11:36:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C36A40308
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 11:36:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nDZppXRQ9WFG for <buildroot@buildroot.org>;
 Fri, 20 Feb 2026 11:36:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 132EA40B9C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 132EA40B9C
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 11:36:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0113E87149; Fri, 20 Feb 2026 11:36:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 20 Feb 2026 12:34:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 47eced3d05ada115f6cfdd5797eb70488b6f3ab5
X-Git-Newrev: 07008c8f2ad9484a1d6df8a31622a109bbd86e1f
X-Patchwork-Hint: ignore
Message-Id: <20260220113602.0113E87149@busybox.osuosl.org>
Subject: [Buildroot] [git commit] CHANGES: correct 2025.11.2 release date
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/07008c8f2ad9484a1d6df8a31622a109bbd86e1f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Reported-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/CHANGES b/CHANGES
index bd984ddde5..985bb44f5b 100644
--- a/CHANGES
+++ b/CHANGES
@@ -71,7 +71,7 @@
 	- How can I make the 'en_US' locale by default?
 	  https://gitlab.com/buildroot.org/buildroot/-/issues/161
 
-2025.11.2, released February xx, 2026
+2025.11.2, released February 20, 2026
 
 	avahi: CVE-2021-3468, CVE-2023-38469, CVE-2023-38470, CVE-2023-38471,
 	  CVE-2023-38472, CVE-2023-38473, CVE-2024-52615, CVE-2024-52616,
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
