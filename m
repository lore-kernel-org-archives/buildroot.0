Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37B3DECAAD8
	for <buildroot@archiver.kernel.org>; Wed, 21 Sep 2022 18:51:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 840D88284B;
	Wed, 21 Sep 2022 18:51:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 840D88284B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p6O2XMQdCQwg; Wed, 21 Sep 2022 18:51:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6B30828F7;
	Wed, 21 Sep 2022 18:51:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6B30828F7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 743C71BF3FC
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 18:51:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5C29881DCB
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 18:51:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C29881DCB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id npN5HduNwZxd for <buildroot@lists.busybox.net>;
 Wed, 21 Sep 2022 18:51:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1400E81CEF
Received: from smtpcmd02101.aruba.it (smtpcmd02101.aruba.it [62.149.158.101])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1400E81CEF
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 18:51:00 +0000 (UTC)
Received: from localhost.localdomain ([146.241.95.233])
 by Aruba Outgoing Smtp  with ESMTPSA
 id b4oDoAuDblHojb4oDoFXFI; Wed, 21 Sep 2022 20:50:58 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed, 21 Sep 2022 20:50:56 +0200
Message-Id: <20220921185056.172702-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfG40xcPkyIgzCwa4Th3s129MFWsOkASukV5Vr53DFd0OW2vTuyHMvNqsxPZigs/0W3tByu7ooT9/TlPckgsU8GLsGpQJvfkYgQsYEbpaZAlt6IQZD5Lb
 ofD2M4iHQe4v1f9xXVbXyU/DP93WCJA34tpa4y1mjtcSPFOFN8L51oyvkMFkeNzp7cdApRO9RcUGxWPUWcp5lQmoqqQjHjYboIlUniqLa0lr6xh8Fn/tQBBN
 N7H9pUEr5jJJwINdURr1qTmQPKc846qRDRrfXBkIr3zJIzj8Yah1IVpBY2gWakjxwCGPM6YfFHbdeiHdqbwdbwPgqCfB07JQsXp0Isp7KDw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1663786258; bh=NPtmUAOfhTFUjsJ+jOMnPeKyR2E98JrT/+UtxfWByyQ=;
 h=From:To:Subject:Date:MIME-Version;
 b=UE4/V5zpR5/oY2OaGpP9rEHoMyGR/ogQtZDcycVLdUMyXXVWXJ+BpM2SUezdQzIEZ
 mLc1DwGtygDxOKidVzlgax4mQX2W5JXcgIbgW33SPlUkxpqS9GZs9/D8gF98u/v2DW
 G2elhRWo8ISMpO5cd6FZ+uveJgnG2c92D0r/itZ4EQ/dqn5daaIBItaw1QQcd6oes5
 sRqYw81yEyzF6baAmY1NqCMe1lGwkhs74zHxdzQjv5dDKzrlG/Q2pIbyBUkyN7xMqO
 adAVXYuUGvWAxkzfnXpf8JXZ1ZfXwvtUl69e4VMqmZ15jXkca7I5qnFltWsPTH0aA8
 UvdguzbHxknvw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=UE4/V5zp
Subject: [Buildroot] [PATCH] package/rtl8723ds: add missing hash file
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8723ds/rtl8723ds.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/rtl8723ds/rtl8723ds.hash

diff --git a/package/rtl8723ds/rtl8723ds.hash b/package/rtl8723ds/rtl8723ds.hash
new file mode 100644
index 0000000000..440ce75ef4
--- /dev/null
+++ b/package/rtl8723ds/rtl8723ds.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  cc5dcf9d17cefabfeba3e68671367c7d69091936e40f71dc5e1165c61195a9fb  rtl8723ds-76146e85847beb2427b1d4958fa275822f2b04ab.tar.gz
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
