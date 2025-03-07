Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE857C19F32
	for <buildroot@archiver.kernel.org>; Fri,  7 Mar 2025 07:50:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8F39608BE;
	Fri,  7 Mar 2025 07:50:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ES961VpbsuPi; Fri,  7 Mar 2025 07:50:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 917B160757
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 917B160757;
	Fri,  7 Mar 2025 07:50:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B5092944
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 07:50:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 98F1480D2C
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 07:50:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IJa6EIm1F-fp for <buildroot@buildroot.org>;
 Fri,  7 Mar 2025 07:50:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=dalang@gmx.at; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 799B280D28
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 799B280D28
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 799B280D28
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 07:50:07 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([213.147.166.59]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MZkpb-1tmvqF0eWN-00JkBr; Fri, 07 Mar 2025 08:50:04 +0100
To: buildroot@buildroot.org
Cc: Etienne Carriere <etienne.carriere@foss.st.com>
Date: Fri,  7 Mar 2025 08:48:33 +0100
Message-ID: <20250307074834.895067-2-dalang@gmx.at>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:xYjiOb3UCuVxUQFjtGNKs+96DpvUE3EaEsfn91JitMklh7w5IcQ
 TF1JPeRmE/FJcf5Tayj71rW6v5JnNTyvEf7Ok1s57Jjs3M23PV7qsG2FucjxllAZvKbc2q7
 hOv1CLr7FtWlhUI/idDxlUjyxsPk/BhWiHju7kyn3fytlb/HYvlvpHccuXbgD0iAGnrMLhO
 fxBtHLcrf9vgKl9fbz4ng==
UI-OutboundReport: notjunk:1;M01:P0:xzSm5NUlRdA=;9K6q+X77uxWBFsUi/pgMhVIMV79
 +hRSizSo20hkTlWuiriNKTa0Hn0GWRNj4fTKR6iGuhDrPH2e6OsqFKNNT3zAxGmXKGTGPyNlP
 lPu/6mwhDXFMIAbvp7Q4blvJN1DgWcNGWSSBubrGwVKibzsbfqnEZPvqFSsnJQhPgFBvGfyCH
 ylmQnFGzNCo58eacRSzS/ne17cmDjH+EPa8TOWfcStjy6fXCfpij6yn008oI/nmR+3lMhOaVa
 eq2i0fYvRKGaKy/MI+3mxfhm11/IJKQ+7aqpfexs+40Wf1isZmzeqAw9oTJz4gQ1Z3VGxmJgn
 fyqL8XfyvZPPNlzbiT3DszJh/BXYhnq6uP8wQi1WWJiPR3p4PliobFxXJnUoV1l7qAmAalaOJ
 uyB9R7QcflSBkSl3phjwZ4u12v7FQll49yM9uDt9ZzgJEzhEKyxvHuH8SlYgwE0p0tdh1teYu
 rvO3cdACEM2Fkkhgfz665I53UDhtwtCciy4rXPPmpSGh0Jv+w5tsF9VPOj1YntSYXo43IY7/0
 1L2NYxBU8HvpcSBK6jm88yluOW3RDqRcJmVE7E0v6Bal7zRnEY0t1YcIGuEO1gqhUlwloiIEp
 Mm5EQQbzHdjOTl1F11wBJhIwCxw5UzbWC0b19ryJD8AtmvY0qrGL9GcCwmaXtQAGWbmTUZIsh
 qB+d06vrpoMip30RZ2yeXdZObVFMQH4KxahpAeWiYPImEhzH75piwCinJmwJgRs99v3tEBUFa
 oYp2eWn0VcFqKn4LUQ5B0Maeoce8Roh5VHADKJOkmPs/uZiJk+7FkIrXsaDMDP24SAqjrJsMe
 M/cAeRY4T4blEVFLWvcfIO/czfDLkKt/01ujei0ooajCZYaQ+QL7Lyo8VsdUu6f9r1E1dAPkS
 p3k+KBP6RYZH1DcuIPaOjNTTMz/CcgowOOnq2m1647VZhPy7YRhFtr/Dl9mJfSyZ5cOC0rwC0
 Xi2YnVezD++CJ3u54kqo3QjaXGpi77Av4eHwRnfR0CbqWpLZhbZFmQ7kZC1mT4tsAdh8dmymA
 OwRkMqPoehqUKYvvjSkZYcVnKqlil2ObXUdi7v36e466qDrAgEvho3+iuKgv+vKUVKl2pYEST
 6szTdV8HQpQuzCZUp1A0L4ZFwB1kaj8TgaO7eZvnoiQCWPeCfNxnyPf/NWnYYzv7ysZcx8AXv
 FSHidB0MOJr75oGf/jE7RFIsWeM6OIihz+VIEkl/XUS1UQTejRnNgebbXsuyP8EPuRDFM1as/
 CfCSOPvaTWrv/qv32UvTxUq1POhnLaqpX9b9lJ73CcytoKr89K8sar13hAV83KNSCFn04d/FU
 Xh3sltwOTNyoXZYjuK78BFfsju3JH601ODFTlB1Ni1GkBVwzAPBve9xn279trT0NYjmnkhWM5
 r4dTGP9PitCW/oqOD7/mhe8DEO6scwY6oN6VEGJbTluMka2T3jDIEaZLXn
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.at; 
 s=s31663417; t=1741333804; x=1741938604; i=dalang@gmx.at;
 bh=yPypeqOElLdRufqSS1Q/ome5TVR7UMUqMzdXV9jBXIw=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=ni92C4NGfhx1dhBA3Dwg7tF5gT0Z56ExFpsM/8ZECJzWqvQ0bcbF8mOnwqSt7flF
 ILuNzsoPfXn8Ab3wj2rVwMAOxT94Ph0VntkCWonu2zYaG9tGQECT0x3RZfi9zKu51
 GQyRHdMeU975nR7Q/+KtkwBn/d6Qj9csJZBmBDHV1RNfdfuNZiBzV3TMz/Nx9G5Ue
 h73uV2vXieWqRTKVPBsg2XwSZwHKsMX/6Wo4LJPgoEy9tVm3ePe1tDSE6x2IhBA5A
 2T4w27G9CnK1Rz0Ml8sxoz3hKC6HXiz2YYoDaONc1Fr2szqDslI+ZkC2/UTT2hAJQ
 +jzvcsBH2YyxNEtyPQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.at
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.at header.i=dalang@gmx.at header.a=rsa-sha256
 header.s=s31663417 header.b=ni92C4NG
Subject: [Buildroot] [PATCH] boot/optee-os: add CVE identifier
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
From: Daniel Lang via buildroot <buildroot@buildroot.org>
Reply-To: Daniel Lang <dalang@gmx.at>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:o:linaro:op-tee:4.3.0:*:*:*:*:*:*:* is a valid CVE ID.

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
 boot/optee-os/optee-os.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/boot/optee-os/optee-os.mk b/boot/optee-os/optee-os.mk
index 883f166fc1..7ee0adb1c7 100644
--- a/boot/optee-os/optee-os.mk
+++ b/boot/optee-os/optee-os.mk
@@ -10,6 +10,9 @@ ifeq ($(BR2_TARGET_OPTEE_OS_LATEST),y)
 OPTEE_OS_LICENSE_FILES = LICENSE
 endif
 
+OPTEE_OS_CPE_ID_PREFIX = cpe:2.3:o
+OPTEE_OS_CPE_ID_VENDOR = linaro
+OPTEE_OS_CPE_ID_PRODUCT = op-tee
 OPTEE_OS_INSTALL_STAGING = YES
 OPTEE_OS_INSTALL_IMAGES = YES
 
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
