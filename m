Return-Path: <SRS0=sHoS=NS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B9B3C432BE
	for <buildroot@archiver.kernel.org>; Fri, 27 Aug 2021 18:23:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9E9860E97
	for <buildroot@archiver.kernel.org>; Fri, 27 Aug 2021 18:23:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D9E9860E97
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=grenoble.cnrs.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F79B83BEE;
	Fri, 27 Aug 2021 18:23:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O9DuTf4lWFOO; Fri, 27 Aug 2021 18:23:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1554283E3E;
	Fri, 27 Aug 2021 18:23:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BE7881BF28C
 for <buildroot@lists.busybox.net>; Fri, 27 Aug 2021 18:23:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE17D83DC9
 for <buildroot@lists.busybox.net>; Fri, 27 Aug 2021 18:23:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lJ1ah2dI-8tk for <buildroot@lists.busybox.net>;
 Fri, 27 Aug 2021 18:22:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [IPv6:2001:660:530d:201::44])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F1A2683BEE
 for <buildroot@busybox.net>; Fri, 27 Aug 2021 18:22:57 +0000 (UTC)
Received: from [IPv6:2a01:e0a:947:6e20:5844:15d0:9ad4:fc3b] (unknown
 [IPv6:2a01:e0a:947:6e20:5844:15d0:9ad4:fc3b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id EDB5DBFEBF;
 Fri, 27 Aug 2021 20:22:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grenoble.cnrs.fr;
 s=202106-grenoble.cnrs.fr; t=1630088574;
 bh=FC3ZsvzyvTQ+1l5q78C6sWdDStx0R/ugfkyb443e1LQ=;
 h=To:Cc:From:Subject:Date:From;
 b=gy6Nx3rhW2A7X/GTjSMrK4nju2xw6XSiFzk++KGqelw36Y/4SlWNgNRgyBjohgOpK
 95JbfkjK5mbutIFTLjrrzBJWIXRIJL7bv0VvJomqCe/xb0ym0nHXRUD4vj6TPk2k5n
 U6Xaja7XGlQqtRZB3Tmsg4J5DUHkwwmI0sNdyCXuEw/4ASnAvA4LcJtN6kqEjF1J4x
 TFUXALy7r/KoNAwEUMbAH6odYiF9LcNOXoVIjLg9ecvUFb7GNy5mz1G27bu7zLFiax
 tVMgJMhmy0B0iHI3zjB+bR8Suib6ZT9i6Jo83YIxy2KRUwXSIl6YnhU+qjwmcipD/4
 an8av7zLfQQdw==
To: buildroot mailing list <buildroot@busybox.net>
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
Message-ID: <46c6bccb-adc0-1e0b-3d2e-5e86ad5f40a1@grenoble.cnrs.fr>
Date: Fri, 27 Aug 2021 20:22:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Buildroot] [PATCH 1/1] board/acmesystems/{aria,
 arietta}-g25: fix genimage.cfg
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Biagio Montaruli <biagio.hkr@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On the Aria and the Arietta AT91Bootstrap builds, the file name of the
bootloader embeds its version number, and the genimage configuration
needs this filename in order to build the boot filesystem image. Commit
0614f435a09e99c33f418a646eaa7647944c2f4c bumped the AT91Bootstrap
version of all acmesystems' boards but failed to update genimage.cfg
accordingly, which broke the builds. The Acqua board is not affected
by this issue.

Update the affected genimage.cfg with the correct filenames.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/1515521690
https://gitlab.com/buildroot.org/buildroot/-/jobs/1515521691
https://gitlab.com/buildroot.org/buildroot/-/jobs/1515521692
https://gitlab.com/buildroot.org/buildroot/-/jobs/1515521694

Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
---
 board/acmesystems/aria-g25/genimage.cfg    | 2 +-
 board/acmesystems/arietta-g25/genimage.cfg | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

Note: I tested the builds but did not test the generated images, for
lack of the appropriate hardware.

diff --git a/board/acmesystems/aria-g25/genimage.cfg b/board/acmesystems/aria-g25/genimage.cfg
index b40ad9edf3..fd7b9557c6 100644
--- a/board/acmesystems/aria-g25/genimage.cfg
+++ b/board/acmesystems/aria-g25/genimage.cfg
@@ -11,7 +11,7 @@ image boot.vfat {
 		}
 
 		file boot.bin {
-			image = "at91sam9x5_aria-sdcardboot-linux-zimage-dt-3.8.13.bin"
+			image = "at91sam9x5_aria-sdcardboot-linux-zimage-dt-3.10.3.bin"
 		}
 	}
 	size = 16M
diff --git a/board/acmesystems/arietta-g25/genimage.cfg b/board/acmesystems/arietta-g25/genimage.cfg
index 7c3112dd56..9ab8a6aff5 100644
--- a/board/acmesystems/arietta-g25/genimage.cfg
+++ b/board/acmesystems/arietta-g25/genimage.cfg
@@ -11,7 +11,7 @@ image boot.vfat {
 		}
 		
 		file boot.bin {
-			image = "at91sam9x5_arietta-sdcardboot-linux-zimage-dt-3.8.13.bin"
+			image = "at91sam9x5_arietta-sdcardboot-linux-zimage-dt-3.10.3.bin"
 		} 
 	}
 	size = 16M
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
