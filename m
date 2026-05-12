Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A36A2CD8C92
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:01:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50D4385526;
	Tue,  9 Jun 2026 13:01:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t7H3d-bOAvUY; Tue,  9 Jun 2026 13:01:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 583C98551D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010072;
	bh=kZht+OsvUUcScJPv/mgZFE0UB7yki+PlQqInGLEuACQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nEMYGAycOXkbYaUhe478RnLSG0HRZFk4PTVA5ypI4EcpoaSoSfnCkBoBazL+zGkyF
	 42uJ6NlD+CtlqXE+VMTUrnKQ9XWIBJX6BMZ5JEESxTGlVHyvVZLmQGWpt9bEQhsY9X
	 VFLXbYZYUORLGY46EiTUQQ/fRBaqwlD8M9QULX+32u1gGDe6p0dEn0bNKwRBIhvHan
	 itbBUHxIS83vYgNVLVP64gyf/ltxZGP+qBB/2KUgZWVxHv7q+PTcCbd+VNnj6lBVyl
	 bS26XuX3Wx6phjrXZxcktxl4Lt+aGkWAxPuJXLvIk5C3CcJEzJEsVvGclHh9XDUWE4
	 VHGx/NROdgCBw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 583C98551D;
	Tue,  9 Jun 2026 13:01:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AFA47190
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9887242552
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NDSl2EXQNT4J for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B920423C0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B920423C0
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AAFC287DE8; Tue,  9 Jun 2026 13:00:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 12 May 2026 22:22:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aba62b43fb940a71a94fb6e33da6ee5a543b0f5a
X-Git-Newrev: c6be4815e494aae813124db54f6ba2fab555a372
X-Patchwork-Hint: ignore
Message-Id: <20260609130052.AAFC287DE8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mutt: bump version to 2.3.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c6be4815e494aae813124db54f6ba2fab555a372
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

http://www.mutt.org/news.html
http://www.mutt.org/relnotes/2.3/
https://gitlab.com/muttmua/mutt/raw/stable/UPDATING

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mutt/mutt.hash | 2 +-
 package/mutt/mutt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

Patch is too large, so refusing to show it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
