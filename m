Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7A58C021B2
	for <buildroot@archiver.kernel.org>; Tue, 25 Feb 2025 22:01:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 875444034C;
	Tue, 25 Feb 2025 22:01:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5dU6QUaUDD0y; Tue, 25 Feb 2025 22:01:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3DF5F4035D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3DF5F4035D;
	Tue, 25 Feb 2025 22:01:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DF4172292
 for <buildroot@buildroot.org>; Tue, 25 Feb 2025 22:01:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF18180A49
 for <buildroot@buildroot.org>; Tue, 25 Feb 2025 22:01:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n-TCKGJMo_3q for <buildroot@buildroot.org>;
 Tue, 25 Feb 2025 22:01:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8023D81310
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8023D81310
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8023D81310
 for <buildroot@buildroot.org>; Tue, 25 Feb 2025 22:01:30 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.122.173]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MGQjH-1tWl22084b-00Am3y; Tue, 25
 Feb 2025 23:01:27 +0100
To: buildroot@buildroot.org
Date: Tue, 25 Feb 2025 23:01:00 +0100
Message-ID: <20250225220100.3076207-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250225220100.3076207-1-fiona.klute@gmx.de>
References: <20250225220100.3076207-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:IdjxywxmuGcbd2TF6T43aMq3LgPfzfBgHFDNuS/msnS6M3l0AgY
 nSNgN8swGDrh59uqlHPdzLZ9NEM75E/dGTTaVS14ya2TWNSpcfgSPfSZ0Tq8fq8FBwW9xgW
 ZdJ9ObDV4zrDpNQQb3IWrtkYisRTyEpyAIz/hsvwR8k00p3WGOl6nazZUtBMI9A45WdCNRs
 I294G/0QQJYEcVuab2oCA==
UI-OutboundReport: notjunk:1;M01:P0:TWr4lvu8uRM=;Zx7BxjceZerxu8sCb1e+unuVXY/
 y+ezgwamnXazoeYoriRbdxqbhbryCnfraQkqxiCeKGxI3RC/XSSmTcpJIgpjPpUQDIjrxHpkm
 tGKgIMaQVboIsENbgBHQnfrbW9wptYyUZfobakIzdqLPOW4AG6oUk8wLFYGb+jSRskxYk/Gr0
 f6l1GCnGGdWmli3KRI/YSGixwY7Jcotd3si92TDtnueyw+z17iPDNe+wAF1B3J6El/C3OR9qY
 27meh1UIABs9yId5vhCukeq/9vI2NRfpsoxZucdu//ATOXA5Zfj7QUklhRyzbpF6WoHohILPB
 YeoGrzuaJBFoIukx6TugY2faaJit+shH4Z6GGUu/Zh6CKKB5H9laU+Y8zKMThl8v111kgKvWD
 TfCBnlXF8LD1RXGKlGLDtvIt5LVpNWPtif72mbCbSbo64aHYshe4FAzNezb/8IeoxBey/C0PM
 Xid6M+g4cjcKvZ6G5w7ijD3eNZ92DKl2gYv6PJjYAoRALg+g7Q4J4i0GdHD1F9kn0uu0ehywK
 SD0qFo7V53fk5At4+5qcq9ZvhS37NUWt9s03WT/+mitsv1rG5+hgck9J514pUy4djaUF0vCox
 tJAGRAdxIbhijHJ+5zYXBOd9JydGXVN9h4X2lgcZ5VuVD59l3JCTX852Ly/+jfGiBu3Ci2oth
 Kr9b78Aw4Qv034Egp96DQ2F+IDj2YXYl8rWANsOUmdC3kxLBwmN4r2E4yIEDxxcZ+FJjwpq8R
 ptZvUvgp5py+qMbitd3kKSH8CK29oCIFk0EPmLwVZ7hJRvYUxqHgFyFiWXLW2DWWiyEu32jWi
 EdsEWYIhDZeBRDHd8LhmAPBC9qQC49fGO4UAYRDv2MF6E7KnpS3gVAplAjJ7dZu32bQhnQ3Sh
 eTW5xZa32De6iq8Hi1dvi4HUhoNqtHZHqOX3dPwChy6DUXt601AKrZUagua/pWuhVEkBVf0mR
 MFI6Hzd4Lk+zYkLwd21BCi+rLVXNKJm+Eo3HKC1CiDb/fUJUBOS+Q99zaY89qp3rGClP5QDIT
 8qX+Mk+74CPiNbFO4ovk2RrnKfctQ/AKGqtRGWhz0bFhjIui5QNW25xbrWlk6ATBPlOAo4Jg+
 bVFKEgycV8fjPS+7XbnLiD4MUA5zPrSsFypHOSEiB8rzwo3hRZlYQL8XmFxM4ZCjoifzRd5bC
 Acsnwymi7AQR//NNDBFS03fMeh9+MLj4gvYzBaX4nYQVFocLPdakPmsr7ZWHd3pRj25lIJoaA
 GbMQTc/cOZs9JnjJWYur3dgg/NzsHXBzXG/KTZk/g/6wbIngy/Hh7Tzn0/1GQfV4DMSzusiZT
 Iadj10dLK3T8DpHgfkIzyAFv81DjEygWOkhXhiduwB82o6dA2z5VP56TU3TAvg1RCfn/iUTQ2
 mIOnEbylnmVKI5u8AVHVjIk6Kd5BWT14GEFc55R+salCDh0fGwN5R3LNo+OQ0QVlQed3/i0Ir
 XTH5k655timTB/9uGNuDBJEV7aMLxgUw8oS2zx30SMR4bz9fW
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1740520887; x=1741125687; i=fiona.klute@gmx.de;
 bh=GH36ifE3e7jzJGAWOVmIRzKQITnzRyjjGPJyQyNXylQ=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=C1Lxx5UOYKfcS451o/1BBebf91XDEW8E4pPL3lds1+iL+hX0ip/53RRrAtQ1d8gG
 /AURGWsstzxXHTWTB05L453koxu9W/dzBrHHIhsrmVa4itAWNkd0TbL/TqXQWV7wx
 wG6iaIrEA2WOmnwIVk/K9ZHeDoMHYyHWIp9yTfQ94qFpMC7Qf7d0iUCtlgzPhTr9L
 meIp9HcVrxd2JwscG5ak/HLzD8o9LuJUFzFC/WsWF8IruUavFVfUbg3qPMzc304wy
 aHWNnl4MMVSXvw4oxFwuUGxkRLfuy2MEW4gBgxpdygxm+w0It7JJK239mOJ16Ikve
 tcSpRFLGJwRA+wCYug==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=C1Lxx5UO
Subject: [Buildroot] [PATCH 2/2] package/python-typing-extensions: update
 homepage link in help
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

Typing-extensions has moved to a separate repository, the previous
link now leads to a 404 page. The top level README in the previous
repository points at the new one, see:
https://github.com/python/typing/blob/fafcdeb724ac22ace877bee4485ed3b4c3edbbd8/README.md#repository-content

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
 package/python-typing-extensions/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-typing-extensions/Config.in b/package/python-typing-extensions/Config.in
index b59693282f..35b88f34f1 100644
--- a/package/python-typing-extensions/Config.in
+++ b/package/python-typing-extensions/Config.in
@@ -3,4 +3,4 @@ config BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS
 	help
 	  Backported and Experimental Type Hints for Python 3.5+.
 
-	  https://github.com/python/typing/blob/master/typing_extensions/README.rst
+	  https://github.com/python/typing_extensions
-- 
2.47.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
