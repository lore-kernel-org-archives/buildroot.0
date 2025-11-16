Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FF71CCD19A
	for <buildroot@archiver.kernel.org>; Sun, 16 Nov 2025 20:21:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53D388228E;
	Sun, 16 Nov 2025 20:21:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1kxAjB7kNdP3; Sun, 16 Nov 2025 20:21:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88B6A822E5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88B6A822E5;
	Sun, 16 Nov 2025 20:21:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2CBDB223
 for <buildroot@buildroot.org>; Sun, 16 Nov 2025 20:21:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1F556401DF
 for <buildroot@buildroot.org>; Sun, 16 Nov 2025 20:21:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pWyw2Jl3Z7z5 for <buildroot@buildroot.org>;
 Sun, 16 Nov 2025 20:21:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 37807400F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 37807400F8
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 37807400F8
 for <buildroot@buildroot.org>; Sun, 16 Nov 2025 20:21:20 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.18.38]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MhlKy-1vpeDF3fCS-00nTp6; Sun, 16
 Nov 2025 21:21:18 +0100
To: buildroot@buildroot.org
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Julien Olivain <ju.o@free.fr>, Fiona Klute <fiona.klute@gmx.de>
Date: Sun, 16 Nov 2025 21:20:52 +0100
Message-ID: <20251116202053.3276072-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251116202053.3276072-1-fiona.klute@gmx.de>
References: <20251116202053.3276072-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:i+xcqfJtbCW6J7e2tXQzSaph56WiIrN2EBObBb5B+WeX5J3IazV
 AHELJ0IzCRoCSZmygddheva6Ulw1RR2KB3sl1PCOgB6wCULpBjTOvwZtomoP7JgQ+P8Td2j
 tF9aCg6oqoi/h8cYRC2Q+UK78+kYLaEj+WlsEiKGPJcRNhNyVrlm6utEO/3na7CgTB1qETX
 YTLerBfL1yz3XQAYScNyQ==
UI-OutboundReport: notjunk:1;M01:P0:MSI5s3nbyOk=;M9j/GgCc4B3PJ7xT0BCOUwihWUs
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1763324478; x=1763929278; i=fiona.klute@gmx.de;
 bh=V8RlV/yZrXOYXLPinkMqP129oNZufta8N/Z7SQ2omik=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=KcRhqK73tbK4Be2TFp53Y5bdct/Tp7uuR9dapbUXQcEpCmG5p9ieEfc8YXa8eMqb
 Orlz4L8TmB6I+4KKfQ7OOEtg+obreX2bMndR/L+UQSximuaQXRDxoIQmeKy0Uq/AJ
 lD5crFPlLiV2xpVAsBJFye0C2o6u5IIzO1JStfQ8PQ80lgnrsr1lk0KfrQ/2nw+4F
 SRKQwoeXbCT5pb0B3qGkIa/ipptkIDh34p774fn1bw6PaOOXlgJ/h7A01TbFJkRsr
 blHJ18yr84oi3nVyMs9wvrm9Agej50+Ysby6s4BkZt6bwHf0JKGFeLmS/xjNdt303
 1+5TtWAIWExDe1CLuw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=KcRhqK73
Subject: [Buildroot] [PATCH 2/3] support/testing: infra: add host bin dir to
 PATH when running host command
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Some host commands need to call other host commands: For example,
"mkimage" from host-uboot-tools needs to run "dtc". This would fail or
call system commands without adding the host bin dir to PATH.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
I guess this could be configurable, but I don't see why you wouldn't
want PATH to include the host bin dir when running a host command.

 support/testing/infra/__init__.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/support/testing/infra/__init__.py b/support/testing/infra/__init__.py
index 52308395a3..9edbc8ff2b 100644
--- a/support/testing/infra/__init__.py
+++ b/support/testing/infra/__init__.py
@@ -62,7 +62,11 @@ def run_cmd_on_host(builddir, cmd):
     try:
         out = subprocess.check_output(cmd,
                                       cwd=builddir,
-                                      env={"LANG": "C"},
+                                      env={
+                                          "LANG": "C",
+                                          "PATH": "{}/host/bin:{}".format(
+                                              builddir, os.environ["PATH"]),
+                                      },
                                       stderr=subprocess.STDOUT,
                                       text=True,
                                       universal_newlines=True)
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
