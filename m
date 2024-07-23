Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8940C3DA63
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 10:29:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA8F681255;
	Tue, 23 Jul 2024 10:29:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M3fUP-8g9x36; Tue, 23 Jul 2024 10:29:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A76EB81272
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A76EB81272;
	Tue, 23 Jul 2024 10:29:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E451C1BF20F
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 10:29:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DEE45607F6
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 10:29:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XVmIX4kARZQS for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 10:29:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B51AC607E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B51AC607E9
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B51AC607E9
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 10:29:01 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.125.116]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MiJVG-1rqpnt2bP4-00j9QK; Tue, 23
 Jul 2024 12:28:55 +0200
To: buildroot@buildroot.org
Date: Tue, 23 Jul 2024 12:28:31 +0200
Message-ID: <20240723102832.2522307-7-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240723102832.2522307-1-fiona.klute@gmx.de>
References: <20240723102832.2522307-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:XdrUWZX0HOiHXg6QTDPcB0ZB17RcGve3JVd3LdYTrvqFvzD8Y5o
 slMwvvpiF0hQJq7mD5WZIddv9aklUiXMOSiwzERHIUiTJVB1kOFwQyIjiYjfFQ0IyTZciqc
 tHRIyAnD/0c5lK1eKiFw9zvCb5ZQzIzfDFeql2zJ+fclcu7dNg97K1zFKR9PA8mBjihzetE
 +fA5LwRR8KUXVgzFVb6kQ==
UI-OutboundReport: notjunk:1;M01:P0:TRREG+UbEQ8=;4Ef4gpaBLIHkzMbesYs7omqM2zf
 ZJ12TAJUvoCBXxU7kOuhx5FH9zrqo4v/o0PhsvaVPxnYYV3BSmnKy8ew+GbOrGExt71p6Y/93
 rf4HQJOeQm4tx8xrqtUx/TDayjSm8b7qnBUKnqxtB3xxwKdP4zlZd8dShLerheCb2uXl70Kjm
 QqT5cpN+okczgCVzJ3EBduijgxBy5CXZ4lgK3hyHbq10spvZA+rnkZ4tn7w4ym7v8Jgyw3Ae5
 5fXeMi3CKb/KQiNRshtICqQihRS+ZXQmCLDOdQjMuDRMphqv/HYnXr7tr/6bP4CKGAlSxKTNM
 84iMBGkfTqEKUt6Jtepyt7hdcJ1o523hR2kQCACBZqAX9fvABVGF/gglS9YkAk89X/YAkGn7Q
 eB1UMgtZAGDMeJlZv/NZxQRD6yoCLxd79kl76kHqWQ5J7A6yq9/YESKaUYhPLzDCk2j4K93K/
 GiD6JNTraPDxltoct92ew8ZvsKKbDkJMoCCdg4tsRQW212D4be3L9QzpvjvuBbOAmMkFu88Zv
 sfXLLrP5tE0mQCfeVvbqS+1FkxUadw2JlHnDT0bMKbFaBCA289G7vkM0xkyruZ4Ck/ABByzg8
 BCdZC5hOlmdIkdlp0NE6VMyy17IodC1Wh66tIYtpwFFn344w/kSKekKi8Fdwv2eL2y1fOSMHU
 JuoEfYy4XlUobBBnDB1ATmccX+YusC2+XvlQrsPk70W4JXCX5qcd0vaj4W7xG7yMkGs1LB78O
 R/2fq92TpJiUgV7zb31f+KSTCmQYJmnjC4557hNnTnhorH7u5UVY2UcIngkiy4B3HqJrnn5BT
 hZ/13QZ/bDCMtWIsHpJ2HUfQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1721730535; x=1722335335; i=fiona.klute@gmx.de;
 bh=QTbawq7YN9vk2UMCjZtdMo7/fUd64zxOa2Tpry5bhlo=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=E105kev3N/p575sQ7YAyP92WDxqV63wAmdRk+n3eM5oemSFbLgtqsSxTR437rB/p
 0qe/Pp5m/85T2VluSFeA+B33WvL1XKswsbm4OI2FWWhoDJ5uVWDCQ+vAJL/wnLjCp
 uvjRJdYlw0p/ybjpXXYA2DvYIJIc/hZkJGRgSkY7irN91R6ruPssjktr3C3DHUiMb
 r8On9/jn1bLAE995cBWFpHPXMBMKijAME2LMQ+/YrVITDBe9+/7sqf8pKoyWeaNwY
 T1JEJTw+ncuG2ehirCdTKCKS6o1Rs1+8Xt/UFKGMcKqmQ9ZrkOYck/FA0n2VsW+4l
 X0LDVEWnBUptnr/UQw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=E105kev3
Subject: [Buildroot] [PATCH v2 6/6] support/testing: fix MyPy warnings about
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
