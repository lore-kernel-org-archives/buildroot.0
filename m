Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04DFCC4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 07:08:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C6D9161375;
	Wed,  7 Feb 2024 07:08:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MhSxztaF1MDy; Wed,  7 Feb 2024 07:08:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DEE9F61376
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DEE9F61376;
	Wed,  7 Feb 2024 07:08:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F1A4C1BF836
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 07:08:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DE9A761383
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 07:08:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nEWIxLAGYH93 for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 07:08:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:868:100:600::216; helo=shout01.mail.de;
 envelope-from=kilian.zinnecker@mail.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2FBE361382
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2FBE361382
Received: from shout01.mail.de (shout01.mail.de [IPv6:2001:868:100:600::216])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2FBE361382
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 07:08:16 +0000 (UTC)
Received: from postfix02.mail.de (postfix02.bt.mail.de [10.0.121.126])
 by shout01.mail.de (Postfix) with ESMTP id 51900241119;
 Wed,  7 Feb 2024 08:08:14 +0100 (CET)
Received: from smtp01.mail.de (smtp01.bt.mail.de [10.0.121.211])
 by postfix02.mail.de (Postfix) with ESMTP id 34E2EA00E2;
 Wed,  7 Feb 2024 08:08:14 +0100 (CET)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id 42A6C240CB8;
 Wed,  7 Feb 2024 08:08:13 +0100 (CET)
To: buildroot@buildroot.org
Date: Wed,  7 Feb 2024 08:08:05 +0100
Message-Id: <20240207070806.7331-1-kilian.zinnecker@mail.de>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 496
X-purgate-ID: 154282::1707289694-FCDBC670-E8C0C971/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1707289694;
 bh=70AG46JVIMZna+k/6MXvEGC6KG+vY9Q/lvkzIaQ+J4E=;
 h=From:To:Cc:Subject:Date:Message-Id:From:To:CC:Subject:Reply-To;
 b=sZkT8bfH3aBXhJ/h0kV8mvAnWr/e9DwHE71TrA8+8WMRgMNJykCncjj3+cDUD49Lr
 qM9XCpjEE4ntoaVoK0zKcN/rUz5n9og8Y3rK9RxtsMJPyG+SxqMlvKqQlpwiA5iUS/
 eTXHK8emBDwBh8WfV7MRPjpgBpfe+MLNOQ3Hq+MVRG3aIgcqpUOV210317X/ZvPfWk
 +ytOf6rjErey02IsNxV6LJXrwt10SlSxTHigCP/ZbSZNn2SQMh6CO8FIp0bC94a8mM
 u0eNAeDq2O6OP509EJfFAs7g2DhFB0Mb4lNvMwl8cwibKZ/XdhbceE0ZRiNMsMoBfx
 k345iunwwgC2A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mail.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mail.de header.i=@mail.de header.a=rsa-sha256
 header.s=mailde202009 header.b=sZkT8bfH
Subject: [Buildroot] [PATCH 0/1] Fix alphabetical order of DEVELOPERS file
 entry
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Reply-To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Kilian Zinnecker <kilian.zinnecker@mail.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The files in my own entry in the DEVELOPERS file are not in
alphabetical order. I currently have two further board supports
submitted. I was asked to fix that seperately, and this makes sense,
because else the patches of the two board supports can easily become
non compatible, if they both try to fix the DEVELOPERS file.

Kilian Zinnecker (1):
  Fix alphabetical order of DEVELOPER's file entry

 DEVELOPERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
