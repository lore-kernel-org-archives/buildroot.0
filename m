Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4545AC021A9
	for <buildroot@archiver.kernel.org>; Mon, 17 Feb 2025 15:32:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17A2860EB1;
	Mon, 17 Feb 2025 15:32:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kPB4zj4_OWpZ; Mon, 17 Feb 2025 15:32:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 198F260EB3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 198F260EB3;
	Mon, 17 Feb 2025 15:32:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A3EF3DE
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 15:31:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 87E5C40BE3
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 15:31:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Bd8F3zRPo-n for <buildroot@buildroot.org>;
 Mon, 17 Feb 2025 15:31:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 310DE40328
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 310DE40328
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 310DE40328
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 15:31:54 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.115.144]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MhD2Y-1t61Jp1EI6-00neKZ; Mon, 17
 Feb 2025 16:31:47 +0100
To: buildroot@buildroot.org
Date: Mon, 17 Feb 2025 16:31:27 +0100
Message-ID: <20250217153127.1363472-7-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250217153127.1363472-1-fiona.klute@gmx.de>
References: <20250217153127.1363472-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:FU0pDle5B6iCoKQxCdRfUPsUaNhqGonkvA2MZd9koUVdk2xzNfv
 LS+LdWnHdKyYUZTGuw2i8Fc0n1LbZpDXVNb81jChqFOGeDrvaRRhi6AY/Ar19BlzFbHV24e
 hcwJaydjZAePsZmv0ykYUMrd8skYXQ3df6wm4MNVtOHmkiMK3HgVSzp+0NXL/NQbehpjJ2U
 RoI/xdji9uHfBFjhQLaGQ==
UI-OutboundReport: notjunk:1;M01:P0:92/u6sIC7U4=;ApcM6kPXO7cH2nQR54Jye41mBKl
 RYpPiPFCaXwXCcjREzuKAH9QHRLUvi4C391uQSb+8MvPftR+0vHpXjznO4MY/J8sOjra7Q0tU
 /1QBOkoeIsk+nnMjIRIImHLVjC3A96PLgYYf8+6WByFESVR/YiMguiJbCR2lmCpQyJKMvmSzZ
 CZnB7vNe34biGBmWfUTcvdHoWBExWtt43kdXKJg+MpiysCGZS10MpKJzPT4loiPBRAzifylvi
 u0laQ8Pj0g29vYuQ35cjUmI8boHGRMlR54yDmWVfjv7ZW3McUFxm6tEZr63yayKTqJ10gydjS
 CJdMoUYrXnmy39Cv9oeQeW4orABu0fW7SvQ0MN8QrzfnPplbfcKNVx+2WJnnCqMMriNE7iPd1
 1Y2fiB8IHAlSPbYYPWi6tqcLupfAW5gp3IJCtA1X30zojC7BCLvOHClrz7sA0xHN0b3NJCrhY
 WC43WF0sIs0rEtgocDf7ygD/L8WliW5ZZa7ZaQsFwLb/mHVPKer2MEXcG/pnGR1VEDwMHmSKU
 dwdBlZw/tbcbx+ODFxF4sj8stADJtQNQ9tZfMclkHZEBBep8mfINtxwidB5rRqJ18NLFxdUbn
 IO5c/K8xh2XRSl5+iY0UWRyKq50HYJ/LM67wFS/u1XuG63zPCq/4JkTMmnYBZxCiYRxvTzNxw
 Gfb6VlPAj3ZaOU4wyPVgrxR2oXKcLGdWVA3AXD/3fjdjUOjfCZW4VmPQPb5IExMHzTr8BgQ7t
 lLxMMlDikZbyr+5MV917+A4lC0rV6cAiRIWilUtcMIJh0qSaRLH8ciiPh6iCNPJxqwExuqCI3
 u4jxJGHFXZh57bQMHeqXnHYl9wewFiPsWAkJS4HFOm99fJzBrp7zRbtnJhbJHBVO0MkRG41ag
 ALNSSPug2/l2jB3WhJug/Y4T3X/7CdPiUHH6kkMPBtnAS/fPXZps4PN0VR++PHPyVNEKZJ3q7
 qE8d9mMhLNCk1TnLp4/Wu3jPv7jEXmC4m0FM8/NRgBqV/EB/K/arJ07/OuMkv0VLj5nlmnHvV
 i5OdL0r/9bkvkoYRJNjqZ49kcMKMoRm4li+VamWdIRItlj7HNwfTDjkuO3CSl6+8TrXC1+1PT
 Zc/svgpG8Z58A/U7n0OCxWrNO0Hfp39EZKt9CO9KYWFmh25yzO7EfgTufZFyO4OE5HO0iojkY
 yEBzSjuKVwPjYvhF+qz7UkK8q7pER+x+JySG9Lv8IhAtWKe5rOkI6v/KA/GDpbhh3u9kl9O+K
 J/nFyPXCiwHmD7d6FRoo4qujXtfdxtrk0J9ecDxuKINBN88DJfwLA0SfTwGZfw2JvWwyIN3tG
 Bdr/mx6uIlmHXgWrHWqsmVs2nqvD/W5XwNuHxXISu44L3QHvQD5RABLxx4I+Ygw4tFEaQ9zB7
 XMUSgWnrbaHjnd7Pu/SIIoDQCYIn7uCqo3Hl2LpxrzlHRo6Dq/svBdFifelKWY/CQNAtSzJX4
 pz71dpA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1739806307; x=1740411107; i=fiona.klute@gmx.de;
 bh=CscfpqyWRRn6JbOpHbu4E3PLzZwZ5KZEnebFbTPEQdo=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=MIOFpjKjUPJG6fInTsXTBGumbjbpZL16K78j5NLfy3IviWNH3DzDEhkZIGbqWxg+
 8qOKrSqQLuxBIVgKUeDZJxKqy/eg26k/ZOWIot1zbyzqT3LjtEK9OrvgbgMFv0DHV
 dL/+iDwH44y7RylGRuTMqirbzy6v4YecYK2scbyT7IHguBw8W8VGijaP/ScwwuFeO
 NCdXnsRRYh2Mqj6XHPwIXicUx5u2ClwHm6zQgf2rDhRBz3q9FZ1wjJyH9uScj5qqc
 MuiumyUeLd4XQnn58zm74OD8J6oEdalpOYbc2Gm61bfpbiIRxyV8Q/iKTp1iqBUlN
 r+pn0pgvJbgEQmtmmw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=MIOFpjKj
Subject: [Buildroot] [PATCH v6 6/6] support/testing: fix MyPy warnings about
 BRConfigTest
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Julien Olivain <ju.o@free.fr>, Fiona Klute <fiona.klute@gmx.de>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

This removes warnings in editors/IDEs with MyPy typechecking
integration. Test classes override "config" with strings (different
type than None).

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
I haven't seen any other type annotations in the testing code, if
they're not welcome please just drop this patch from the
series. Personally I think they're good to avoid bugs.

 support/testing/infra/basetest.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/testing/infra/basetest.py b/support/testing/infra/basetest.py
index 1ae6232da8..4f020e8a93 100644
--- a/support/testing/infra/basetest.py
+++ b/support/testing/infra/basetest.py
@@ -24,8 +24,8 @@ MINIMAL_CONFIG = \
 
 class BRConfigTest(unittest.TestCase):
     """Test up to the configure stage."""
-    config = None
-    br2_external = list()
+    config: str
+    br2_external: list[str] = list()
     downloaddir = None
     outputdir = None
     logtofile = True
-- 
2.47.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
