Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DF58E77170
	for <buildroot@archiver.kernel.org>; Wed,  4 Dec 2024 18:29:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0807060B2E;
	Wed,  4 Dec 2024 18:29:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ilyB9bkL49Ph; Wed,  4 Dec 2024 18:29:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0F36608A5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0F36608A5;
	Wed,  4 Dec 2024 18:29:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D49D41DD1
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 18:29:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B68AB84440
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 18:29:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 46Tr1QaZNImi for <buildroot@buildroot.org>;
 Wed,  4 Dec 2024 18:29:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 90DFE84437
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90DFE84437
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 90DFE84437
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 18:29:31 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.124.249]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MNKhs-1szhFu2oZe-00YjJl; Wed, 04
 Dec 2024 19:29:24 +0100
To: buildroot@buildroot.org
Date: Wed,  4 Dec 2024 19:29:13 +0100
Message-ID: <20241204182913.4085670-7-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241204182913.4085670-1-fiona.klute@gmx.de>
References: <20241204182913.4085670-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:qX67tEQZYXYbdsJ0wfb5Ep4BpyVlvV4xqzdByH+ZKM6McXik1MN
 wmVh9w4A10GdfYFklDUtMHO4+gHniCn2vDpkJUsVTTaWzwoKOp7dyHpfg45ePqxYc0AP1m3
 cY8dN4nVhsjj6ftuSk2hhwor82UCZ67JccB8lrZDEzmD5+tpVDoV0dWQk8TqOJbCU3Z5cRx
 f9ZErL8734x8jdPl3wf9Q==
UI-OutboundReport: notjunk:1;M01:P0:AWjK9GSDfJ4=;mzoTznsgRjj/eclGBlDNDNAEj30
 g+R4n3RcuRtAVFhyCmPoQrBiFAQs4NNjl02t7k9UI8x5dA+XnSMj2w7qlXpik+VXOCCKsLgVx
 4iWp7A8nCT0lLLuENaDNyHXY8zhLmELO5lHczJw9/AkbhJ8Y200cz/G6ANTBhLej5Skw5q0+V
 SM/8eCdH0x1Oa/BDS+kRtyiSimpa9J5zEo6t/8E3BX6yimZQ7scO0O6SzmmR4LG9FhC41EbKv
 GI3xmSc5qjBJ3Rik8+l4kBLBtUIXzvYSgX1YMLxszp7bFhpaCc8NG1uwAlUPbE5N6hsI12CPU
 YYEr09ezOQwacRWBequeqjBb3EQceO67Y2rXWV1MXz00VKZVHLo/W3VSBxi1ioFwhJPs7Htwk
 jACZqzIjasOPjyvLUpzmtwu3nu6oIMak4hLC0w9fg65x71OdCSvSN4y/tA4B2bV1fePSDdwt6
 OfnoBLVUaRrU4+04771TxEKbzUM83Rqhc06+puWNd+D3919K3lXLahYXg8GvzgOU7VfhhFkp4
 RLnlkA6lKwdGahfuxIbrFOTljL8Owt9SIs1KGX2SAcVxQKSLuIxyqpWd+1uXDAce9UnPH349Z
 TDDAyIf1yGNWlZds5k9ejuOBo2ygDAE0JsjWwEZHFxo0aUrw4BvSafX/IYizzbt2C6Ad7ef8v
 /dUkaGHa3jjZ961MrNXMMQ/b2zSFODNMKPM6nV1At0tyl5AqwifYHeo4+GWdEpfi6PGPI5SvN
 xjLx4slVmg7F2BwmW5DIMeQSGt4aDSTntzU3jOI6AJZmwkkomNLdhOOlpLIhLN+E2j1QrhsR2
 eXLtp/i96GoR3ID4c7yupYgVzafGswtqtDuhdAhKdTRhTjYk29dCXmYIL8bNRFnSoLhKCW/i0
 +M8D5GSMp7KmaOHQKtsQ4TLfchL9zjT6hTMPC9dTA9vZOI4VCtVkvDBB/nzHLNFnq1OrAF3SM
 Y33TPjcCUj/zDNy6aG0yiDMnYFa0QLEXXWHW6yoEB/TEoJxeoB3l5FBhZReqEo1RwuLvjafVP
 SAfmJMbmgig7DY1vkqnQ0IVU7d9oqKAMfLSnnqFVHo1myLOXUeXCey8IrbPOneec/QK47JNNf
 mlHuhWdFr78I4yLQq1ph78CR7SG7Yz
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1733336964; x=1733941764; i=fiona.klute@gmx.de;
 bh=mQN83VIy5NdC1eMw45hZxdwCVw/EQHm1OzSG+gjkAGE=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=Yk0kNvouitV+C1EI3nHs8ypV/EC1C46ttAbwqZhHdkx4Y73LPmt33camAZrytOEb
 TvSXIp6N5AfPieVdmo6s7WJZaafolPLgCr4jYsnCNjHqeEwrRqYoRJ4ma9KiRUT4C
 r81Hx9r9dhyR2WHxen9xqSTGd1PdGg+3B8ey/8u16pp1yq8p7qN/LSSVh07rV/Gww
 OScRlzLPjpVr8vWrljE5VXuakPWVMbA74oGE5l1kMp6/huoKRwhav/xruzQNrHulx
 HxmiY5xPDZlRncGVr7P9no6888B+H5yE9UXgKKDrPSFEUAGLUu+5UwQKjPv9bP9HW
 bC7q0wVWuoIFrhzd0A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=Yk0kNvou
Subject: [Buildroot] [PATCH v5 6/6] support/testing: fix MyPy warnings about
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
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
