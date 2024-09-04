Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E062ECD37B4
	for <buildroot@archiver.kernel.org>; Wed,  4 Sep 2024 12:44:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0D20605AA;
	Wed,  4 Sep 2024 12:44:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ugeBD20zsHzA; Wed,  4 Sep 2024 12:44:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B508160604
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B508160604;
	Wed,  4 Sep 2024 12:44:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 34F731BF373
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 12:44:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 221494025E
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 12:44:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M4gpXIdRcqez for <buildroot@lists.busybox.net>;
 Wed,  4 Sep 2024 12:44:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.126.130;
 helo=mout.kundenserver.de;
 envelope-from=nicolas.cavallari@green-communications.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D042940129
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D042940129
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D042940129
 for <buildroot@buildroot.org>; Wed,  4 Sep 2024 12:44:27 +0000 (UTC)
Received: from evilbit.green-communications.fr ([88.171.60.104]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis)
 id 1MuV3i-1rveG329FC-00tSz8; Wed, 04 Sep 2024 14:44:25 +0200
From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
To: buildroot@buildroot.org
Date: Wed,  4 Sep 2024 14:42:45 +0200
Message-ID: <20240904124343.25805-1-nicolas.cavallari@green-communications.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:ZljldMgeAtXF7tjz9bzSDONtlRffGz87I+CTI6m3a3SL6ldUAzN
 L4DwIoq7TNUG0Jne9BVUpLHwBPilX2EGRcxc3bh3p/tv8lyiFomnEElzfB+tX56bOQn+aox
 cHDXpeVTCbJNGpYzJuaZTK9kgu/XTc/ATKAhDmAvAlUTSGqoyrlwbWNYaGopViDq7nTkEMH
 MXSo3Fklqlg1cgtdcszdQ==
UI-OutboundReport: notjunk:1;M01:P0:L40P7t/qIXI=;GThAON4x08EtViD0nT1Evr1A9Xi
 2aZGV8xotvAiCpg0Y3Q6V1TAHCu9FTicvQmeE6sXo1IFD5f3UlWdHBMQ35QgQkuuSFt8sI87I
 sdVfHtUPjzkFukzGCuL1jQ98lnslO+R8E6kAImFQHTO59LhKWvIAmVglNmEExANnkoFzZTBzt
 1wWH4k+X9NK240n/wZjppdHfozh7dy19ocLDYnZpyNB/vUk6Qo7fpWRLjNYP+NPsgozU3fiE2
 tPlN1ao83A5j5k3E0qcec5EitNTMrs9UpOwt8u3BuTzAyuwHJTgxT+CDGEjNIHkAA82IXz5AU
 DbBtLnJ+aK/SbJCRvVTV99EMOM6WJIwL1SnRWZ+MD2aOALUXeN3/XhoMXTJdjayY3hoGnBxNL
 MgtgORb/3HQaXNgGXrEkO0GPtGTD3DoCPICMEcmHMwkaPVzICBRjKcoCvHy/jrHs7QyMMGBKb
 PsXDrRWqtgNhjb2rp8p4DKzdQNh3uC6nojS3J+qhq1eNSt1QgxLqpoWEjzJIMof8cHs+Kqkvu
 BfL16aSg13wGNTMEq0fYBjgxuDKMGGk0rpZKL8+F7ayoTmxt3noK+rNYKk040n1M3x1pbUoaY
 jftyHbfrR6G3832/mhksjba0kd7LlgQ8RPnpmhYvVgbSBYX61gj6UctjOIZbkD6s9d6Pcfelz
 CQl78CmhqEjnEqy0vz6VrFuF2GUjxS/vSOE4HfRSBAfKqmtJlCQPvQCOmsd8bEpI73B317SI5
 RJvYy87DNEo7WvgiqEY6BT3rZUOK06FwA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=green-communications.fr
Subject: [Buildroot] [PATCH v3 1/2] DEVELOPERS: add bluez-alsa to myself
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
---
v3: fix package sort order
v2: add sob
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 570f4ff115..e820f9b09a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2475,6 +2475,7 @@ F:	support/testing/tests/package/test_python_git.py
 F:	support/testing/tests/package/test_python_unittest_xml_reporting.py
 
 N:	Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
+F:	package/bluez-alsa/
 F:	package/libgit2/
 
 N:	Nicolas Serafini <nicolas.serafini@ik.me>
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
