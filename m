Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5E6710F2865
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 20:25:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5949381E5C;
	Fri, 27 Mar 2026 20:25:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 32LMWLUsX3bd; Fri, 27 Mar 2026 20:25:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6983C81BFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774643141;
	bh=i1GMR6LGoT5vwrx9QwNtQ61LoHjUi9BkI1grc/i5UXA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Nv8ffAsyiMqmKHH+vKo7mJbzJcdEkZbAIeuzZps9EhmvaisLAtPrwJuYWGaIbnzEB
	 qtbRTUd9QPcni1ObDq3nJxupbsPcaBv0lMmuTE5NzPZOgjSjy3rd/weCzaBqoNroUX
	 z35giJpvMrO5Q1qWF/IJrzdEm/VhkICDVs1bnA9uEvgLP3w6NvBM/EhDDxTyCbudw4
	 OuHhaAFWG7oUnJk+OOQ5/sAsa2TWV0wLNEOTVC+NEeT41nMBK6tfB7OW3BdUcGc+Wt
	 +sZL4VjUForLd5VfbjE4DOqOBfc21WNbrINg7ULxoWZbbVsjabdNNF/P04v4JYds4M
	 q3NYlT4xUFAdA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6983C81BFA;
	Fri, 27 Mar 2026 20:25:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0BF122AA
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 20:25:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F1C4260EFC
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 20:25:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h9TDk0jY59O4 for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 20:25:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CF4B60EF2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4CF4B60EF2
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 20:25:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 943E87FBED; Fri, 27 Mar 2026 20:25:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 27 Mar 2026 21:20:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6e4a136363260458a1a15c487f1903f233e80795
X-Git-Newrev: 6bac6a1a639b510ab25b2a8af3a898a1791cf813
X-Patchwork-Hint: ignore
Message-Id: <20260327202538.943E87FBED@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: add Shubham Chakraborty as
 ccache maintainer
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6bac6a1a639b510ab25b2a8af3a898a1791cf813
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
[Julien: add trailing slash]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 6de9ec3927..66d00b929f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3056,6 +3056,9 @@ F:	package/tunctl/
 F:	package/ubus/
 F:	package/wolfssl/
 
+N:	Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+F:	package/ccache/
+
 N:	Simon Dawson <spdawson@gmail.com>
 F:	boot/at91bootstrap3/
 F:	package/cppzmq/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
