Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 519FDD2F32D
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:41:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 280D540B25;
	Tue, 13 Jan 2026 19:41:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hOXvXgyPTj5O; Tue, 13 Jan 2026 19:41:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E68A40B4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333294;
	bh=/ijno2k4N/KjFCe/zkDFqSgWRK7H0zqHVy0/RnUSEpY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DUg7EZItC1Re1yz/fhOiZKl1kGQ+mBkakDXWPht5DURwr59C1B905dMaxOoZ1/Eqf
	 4MNgEKiyddoo2J8LHYA7xcN6QWKxyxDGDuUlLuSxBMNr1IQaPWD/Z34cg6fMvuIa6o
	 De4htx8R4KVwpPtV4+GOQHICQ8kLRmnhy4hbPVEw17RzPTzm6Sabw0NPNwNvevEe9C
	 KBq1vLmIOPp0glshTmmxizlvFRiQpTlTqzf4vVfhDxCqn7v1so3ZqB/tVbJfeCQm6z
	 Pa975smXoGpo1sEl6Mz+RUM8jXC8Es5JKGkdCdqw4LlVcdEppxjPCk3u2O9R73FoYI
	 zh/iaS4J7zoGQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E68A40B4B;
	Tue, 13 Jan 2026 19:41:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AC34A231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 961DC40373
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tbC9459K1tXO for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:40:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A33E406D5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7A33E406D5
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 787C286E70; Tue, 13 Jan 2026 19:40:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 16:23:42 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: ba8965f72dc59bbcff6695e0a8fd0f0afe2bf30f
X-Git-Newrev: 828152362c9341b7dfe7b4bdb8e01584c424fa95
X-Patchwork-Hint: ignore
Message-Id: <20260113194033.787C286E70@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] DEVELOPERS: add Giulio
 Benetti to Putty package
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

commit: https://git.buildroot.net/buildroot/commit/?id=828152362c9341b7dfe7b4bdb8e01584c424fa95
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 5c6552cd60b82cbfac6918de296772b2f37c35a1)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 91378c36e3..76e140000c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1312,6 +1312,7 @@ F:	package/minicom/
 F:	package/mongoose/
 F:	package/mmc-utils/
 F:	package/nfs-utils/
+F:	package/putty/
 F:	package/python-libconf/
 F:	package/python-uvloop/
 F:	package/qt5/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
