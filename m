Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70F15C4321E
	for <buildroot@archiver.kernel.org>; Thu,  1 Dec 2022 00:45:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 145C88135B;
	Thu,  1 Dec 2022 00:45:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 145C88135B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a1qi2H0YGAsE; Thu,  1 Dec 2022 00:45:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BF728132F;
	Thu,  1 Dec 2022 00:45:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BF728132F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D0AE41BF968
 for <buildroot@lists.busybox.net>; Thu,  1 Dec 2022 00:45:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AC34D8132F
 for <buildroot@lists.busybox.net>; Thu,  1 Dec 2022 00:45:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC34D8132F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lR2UKyu56SOZ for <buildroot@lists.busybox.net>;
 Thu,  1 Dec 2022 00:45:19 +0000 (UTC)
X-Greylist: delayed 11:25:16 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A45988132C
Received: from zg8tmja2lje4os4yms4ymjma.icoremail.net
 (zg8tmja2lje4os4yms4ymjma.icoremail.net [206.189.21.223])
 by smtp1.osuosl.org (Postfix) with SMTP id A45988132C
 for <buildroot@buildroot.org>; Thu,  1 Dec 2022 00:45:18 +0000 (UTC)
Received: from E0005128LT.eswin.cn (unknown [10.12.98.229])
 by app2 (Coremail) with SMTP id EggMCgA3CS4M+YdjFmgUAA--.62444S4;
 Thu, 01 Dec 2022 08:45:01 +0800 (CST)
From: Zikui Zhao <zhaozikui@eswincomputing.com>
To: buildroot@buildroot.org
Date: Thu,  1 Dec 2022 08:44:57 +0800
Message-Id: <20221201004458.673-1-zhaozikui@eswincomputing.com>
X-Mailer: git-send-email 2.31.1.windows.1
MIME-Version: 1.0
X-CM-TRANSID: EggMCgA3CS4M+YdjFmgUAA--.62444S4
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
 VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY07AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E
 6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28Cjx
 kF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8I
 cVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z2
 80aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAK
 zVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx
 8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIF
 xwCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxV
 Aqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r12
 6r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6x
 kF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AK
 xVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0J
 UdHUDUUUUU=
X-CM-SenderInfo: p2kd06plnxxqphvzx0xfrp13pwlqwhhfrp/
Subject: [Buildroot] [PATCH 0/1] fixed some spelling mistakes
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
Cc: Titouan Christophe <titouanchristophe@gmail.com>,
 Zikui Zhao <zhaozikui@eswincomputing.com>,
 Bilal Wasim <bilalwasim676@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixed some spelling mistakes of countable nouns.

Zikui Zhao (1):
  BUILDROOT: fixed some spelling mistakes

 board/chromebook/elm/readme.txt               | 2 +-
 board/chromebook/snow/readme.txt              | 2 +-
 docs/manual/customize-directory-structure.txt | 4 ++--
 docs/manual/writing-rules.txt                 | 4 ++--
 support/kconfig/menu.c                        | 2 +-
 support/kconfig/streamline_config.pl          | 2 +-
 support/kconfig/zconf.lex.c_shipped           | 4 ++--
 support/testing/tests/package/test_crudini.py | 2 +-
 8 files changed, 11 insertions(+), 11 deletions(-)

-- 
2.17.1


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
