Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA19C10F16
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 14:46:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDD0E6087A;
	Mon,  6 May 2024 14:46:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bhwvwRAZk1PQ; Mon,  6 May 2024 14:46:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E321960883
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E321960883;
	Mon,  6 May 2024 14:46:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9152B1BF59D
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 14:45:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A8BC8202B
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 14:45:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BOh9L_ulXihq for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 14:45:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5B69C81B01
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B69C81B01
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5B69C81B01
 for <buildroot@busybox.net>; Mon,  6 May 2024 14:45:58 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([82.135.81.65]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mkpav-1sTvsx1teh-00mGsH
 for <buildroot@busybox.net>; Mon, 06 May 2024 16:45:56 +0200
To: buildroot@busybox.net
Date: Mon,  6 May 2024 16:45:47 +0200
Message-ID: <20240506144555.31709-5-ps.report@gmx.net>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240506144555.31709-1-ps.report@gmx.net>
References: <20240506144555.31709-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:LbKppcwEFQud6JOqQgeQAw+bzaY2h/dve1V2Vrfsu80TfwsyyDg
 roLvpk1NLBXGPaDjHNSp8oqh8SqsXOGIMdErVFh37NFyiZys1j0c5J2HtuvXCTOXeNAX85t
 pU680+nADlJgrL1Yh2yTx8f03RaaPRjl4EiG0U8E7+PefVjIhJXEdN9gCm6FBu2E4YV8aVo
 i47m1g2tvR+Zh5PeMX7SQ==
UI-OutboundReport: notjunk:1;M01:P0:+RP3Dh982tI=;kGY9B/xgodB7GjrWJJ7562xKNNA
 VjO1vrPyCu9pVYJLvNfCCzfBjixpYy4C8naY7OE2GqTpz7uFdMwVt0GNGGDc9pEnJpQlPt32b
 CcOVoHCXz1Vtxy1I5YdRH2Fs2Zg4DNivnj+oTO/oNH6EGeS9FtQbcW9pK/yMUj/udAS0Wy/bN
 B28lzAvzSBC4spF4lIF+tNCvaPcuHQV+3++eth0+zdH709ooUNkJTxsbEF8dQr2IGTHnAcwE6
 S6wlB1RGWhUm5rH/fSJ6P/4xaRCIeB5mF2tpQXqbvrYz12uYrBR3FK5GSDFsrtItQEqvMAmn8
 hS6CAl+nKXQp3nzXK/fVvUTGSmImCZ5C6fvb2CKWRca0m+nun/HBv0iX1FIkkDneGjSinZVB7
 sMmzWKph0tWF52cMBufzXJHeERkpBYtWM7FUjE4ZmKsZ85wGlhPk0lR6KuQQrB8ML7q96rKKG
 UlSzPjNE0Hv3sFBgjxxwTHkor0qmOVNO/5ZhPHL662DpW8OvvGFrejKdtfvuqHQdKpJq4kXeJ
 e/MC/pot7MLu2hwI1z8GM1gadAUy4zD4ksrwqTENKJPCvblG6tLhdOcsMCdMMbLtitLvOBfK5
 AxR5uKWWirzT8Lyw7xJVGX5fZX9Rfo8nJpZEbLTcZb9ThJ8Qp+xLu3CyWPNQQ9CEpNWcZ1Mue
 QQ/5xItBLebnalmZ3Cq0YFdp73kXSyqkzRm9pTaGapYiyAX1FDyLOExmPmmmvtQAMqVP93fTz
 JE49KkRn8g/jaOqR4G6aLayzoaRF+iTwcj4eaXc4aqc90IJ/xPSSRWbKnxSGUDscWacG1pDEb
 8V3x9R21qGLmqQ3NOtP90ATVKdrr/oKBtWrPqjS9dkIXU=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1715006756; x=1715611556; i=ps.report@gmx.net;
 bh=uvrid6M3gNXMqC7eBjn0XgtsAeKYQa3nwW/3op5Jk4g=;
 h=X-UI-Sender-Class:From:To:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=TNUHd8P7bAnfNWr3AmMO1gm4E4sE46mrNrHQ/3zSvYyPTnoAoC/hyMyVzV6eA4fG
 o/N7tNknzqkoAlJBodlp0xNIHFigpywRwKqYaYlREoFoohLjXjOlo0d2gFyEs8NEE
 4L481r3AiLVG1rTyogYotYs7zwbVmPnE75GtlHld3+eJlF4FqsUB4vmBWonGF7z9Z
 dhZQuOJNzbP266xfXurP3CmdcUshz2AtXaIjPdO4+9eST2gCtQIhe7pvDxneCkyCy
 TMK0ioLjDw6g9h1cg1BILkWHMW/LHIi2j4RmHn1CTkVcvTBiVUSMza86072NXGA7v
 RmX/kiJVcwAce3kurw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=ps.report@gmx.net header.a=rsa-sha256
 header.s=s31663417 header.b=TNUHd8P7
Subject: [Buildroot] [PATCH v1 4/8] package/python-pydal/Config.in: bool
 argument needs quotation marks
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following error/warnings with kconfig from linux-6.9-rc5:

  package/python-pydal/Config.in:2: syntax error
  package/python-pydal/Config.in:2: invalid statement
  package/python-pydal/Config.in:3: invalid statement
  [...]

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/python-pydal/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-pydal/Config.in b/package/python-pydal/Config.in
index f1c97f91a0..204b47a09a 100644
--- a/package/python-pydal/Config.in
+++ b/package/python-pydal/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_PYTHON_PYDAL
-	bool python-pydal
+	bool "python-pydal"
 	help
 	  pyDAL is a pure Python Database Abstraction Layer.  It
 	  dynamically generates the SQL in real time using the
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
