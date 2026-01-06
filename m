Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A674FD0D155
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:01:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E01E82ACA;
	Wed,  7 Jan 2026 18:01:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jYZC7GxqdLBN; Wed,  7 Jan 2026 18:01:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB68A8291A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808907;
	bh=gyB3ydd6mxAb6huFkdmJ3mbFQvaJmK+JAU3i7+Lsn4Y=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CHjePLyCIV7rKi5pTI87kKCdNBFG6w1jPU9ldtV6WTUVIFjT85Rxnlsrc0ylrBVYu
	 qGtq1zfkA9uyC39gkgQrc66kce7IKOdUZhCRA3bN/5Wes2eouj1Ow8m2xDK0rJvWhs
	 e4tYNe0NDrrb50F3E9s/OHD+CI6axIPEf7+vasmuEzRJJn/wkVkuIah39nFtKtt7Br
	 m7MKYQY/hREQZ6KHpbYVRvrWLIwxjnBeZsmPrJ0RZA1ceyMsuklfQUz8tX1hmcil5j
	 rZ/tie7AmaGoel3unx26joUhXvMHDDKPwNYk2OjfyiHn9rN8NMkxvdlI9a8NJ2e+fB
	 +MOoG5RZh52AQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB68A8291A;
	Wed,  7 Jan 2026 18:01:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D8C7A58
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B608A40A49
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S6rvcsNFrcHh for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0915A40A00
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0915A40A00
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0810882200; Wed,  7 Jan 2026 18:01:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 08:39:41 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: d362a9c2f6d0f83ad1dbc89d7470705b1adceac2
X-Git-Newrev: 980ee4e02fa50bcc0b3055d5a2740c951783b078
X-Patchwork-Hint: ignore
Message-Id: <20260107180112.0810882200@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] DEVELOPERS: add Giulio
 Benetti to vim
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

commit: https://git.buildroot.net/buildroot/commit/?id=980ee4e02fa50bcc0b3055d5a2740c951783b078
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit edf4a89aaf9d7af884149a431a141a4b80c524bc)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 3760bb6659..c9f1e1961d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1332,6 +1332,7 @@ F:	package/tmux/
 F:	package/trace-cmd/
 F:	package/udisks/
 F:	package/util-linux/
+F:	package/vim/
 F:	package/wilc-driver/
 F:	toolchain/
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
