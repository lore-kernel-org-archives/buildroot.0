Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9950FC3DA70
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 13:40:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 670326084E;
	Tue, 23 Jul 2024 13:40:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VPrCIbVPbVcV; Tue, 23 Jul 2024 13:40:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4437460880
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4437460880;
	Tue, 23 Jul 2024 13:40:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0A9981BF2F5
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 13:40:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 058096081A
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 13:40:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wNxGcZrD6ma5 for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 13:40:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D6A6A607FD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6A6A607FD
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D6A6A607FD
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 13:40:20 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.125.116]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1ML9uK-1snMvX0OrC-00Tu9v; Tue, 23
 Jul 2024 15:40:13 +0200
To: buildroot@buildroot.org
Date: Tue, 23 Jul 2024 15:39:48 +0200
Message-ID: <20240723133951.3542206-7-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240723133951.3542206-1-fiona.klute@gmx.de>
References: <20240723133951.3542206-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:TDn7bLyEKwqr+ql3CRT1HoC1FrgmdZFpLm0X3RH4qUSqzKEQBjN
 ZNMfiwiw8boXezZOF6k2ZDqDCL/rdX/v+L1CNgW5iqnpBKy39/JjEyElIi+jeX4wEEFBxvc
 JHFb7gnGbsSCNYVyKXoYzhu8OPFpps3Yb+q2ZGUNGPHzqZBbYRVEvc3yVivLTxfqS2q7TrC
 1VGuQbKbdCi0UAJ+kmrzA==
UI-OutboundReport: notjunk:1;M01:P0:KsgBv/PEAyo=;y6LeJM1oVtu2jDaw8WJazcwp0n/
 7SVllVuDzD34e88UP/VAi7x+OZwqE/NiVlLt8nRqblT1+cdDiq6GuAvFiJvpcGnpIOVVJ/OeX
 RoRPC8wusGBNc4U4iNxIjlxLpAw54RZv6iDFFkSxeURg5UV7SVQx7e1SNUCEX6qEFeeOFB92l
 0m297HzJH1WQkJGZhQVyOQfMTcYm61jcSYf3nLQVfd402vi+qyaAV9mv56jN2xfzsQswWQCZd
 l2dwKOAMjGuZvGx+8FZJbqneYwwU+oSuZps54/XD0u4Xna+OLRcMDpnTc5/oFsXI+RC+kozoF
 wUfEyuzCpsA6edagnfXB+dtc+gan+OZeV++/TtoaiFde/fbWIQ7MwGozval8qiUMzG4Y2uJv4
 NV3V+eOgw/qpbjj7jv/i2zN3J40/SumwGG0oDkDft92oyKPcTAfm4dUS8PIErz2pBsuB+wNjG
 pUfMhN3S2P8BpqLS9HdWsYPyo6aUFYEIQ2W5jArKK/Y3nR1i3EcLDiFTBD4H4Zl8Ei6pdJrBk
 sUBOgATdoSAbSZiit0/zF76WrTZjSRllvq/R8X14utT5e8ueeN8/xyB18tVXhH/h7lrpC0+w2
 TkWJpOpcDgJ4AltFGXGW5yXaGgjjVIjrWicDGZkxblj7guBkuCfgxDG4yVDWIzONLDOY6sVT0
 DEnMkZNF4cgaKvL6GBqTjm6qwAqHO6eRvjzExVLaetdJsueuKxQArbol+OMCG2eS19Olz/Qy0
 QW7zXu/BYAwSjOV851mklx4HmZYpu2cogtPo6CfiVDBxY3SLeLgcjWzR3VcTh8Vd7U7E7FlPS
 xO2codKfK4d9He4+i/m+qCig==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1721742013; x=1722346813; i=fiona.klute@gmx.de;
 bh=QTbawq7YN9vk2UMCjZtdMo7/fUd64zxOa2Tpry5bhlo=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=Oy/5+Pm4Kb9PrnErPGFxJFCk8RUW+1OQ6oLbrX9ZsrIrmVkUeEoOvPmUj8onqvXF
 s+YXSLxAamqn/VLTTUqgtcKqDsP+jWPidFHjgcFNeUfy04QzElnaNQs+POH+BA6Pa
 Zu3KKR+CSVYOEPleQm4BNz4/t+v4oqcL1M5TXqB/MrXj7Gryp3GeXdloHyXWqrLn0
 yRexGyhC/1WFczDtT5d1Z3nlmAa1Hm8ij0+dW+R+9LYQjVWZSjR1xJI6wrqucCm30
 I4jJbCEnoohicT4IDCKhRbSA/PsgcUOZYmYN63hPwa71+NffAd7tOhaf7eraiwbKD
 MGAIyxX1lXCi/foWjg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=Oy/5+Pm4
Subject: [Buildroot] [PATCH v3 6/6] support/testing: fix MyPy warnings about
 BRConfigTest
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
index 12d96415da..9fb9dffc53 100644
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
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
