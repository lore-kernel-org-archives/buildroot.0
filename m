Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B45EEE7FF4
	for <buildroot@archiver.kernel.org>; Mon, 11 Sep 2023 04:00:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CFEC4405B7;
	Mon, 11 Sep 2023 04:00:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CFEC4405B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FOu1hcxpDLQd; Mon, 11 Sep 2023 04:00:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3395940580;
	Mon, 11 Sep 2023 04:00:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3395940580
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 551751BF2BD
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 04:00:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E72F60D76
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 04:00:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E72F60D76
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hSL-pqRpxDMB for <buildroot@lists.busybox.net>;
 Mon, 11 Sep 2023 04:00:47 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2234460C05
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 04:00:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2234460C05
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([213.147.164.5]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MQvD5-1qIEay3XvT-00O20K for <buildroot@buildroot.org>; Mon, 11 Sep 2023
 06:00:44 +0200
From: Daniel Lang <dalang@gmx.at>
To: buildroot@buildroot.org
Date: Mon, 11 Sep 2023 05:59:44 +0200
Message-ID: <20230911035944.52216-2-dalang@gmx.at>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:RGWRFP4Amf23p+9XcW00ZOzfgRsELRzV62gD9o4ccXqN2rzyjOK
 UMDgY4dOqW+QCiXI7Fe+lc70dzvqPeONLRnG7VXLAnK5iMJiWH9IvvfGt7YCv+gVcFa81bZ
 +VyyYDXfAB/YjHgqyvI39d9TfRTtr8xO1rVNNxaveVeKT67yN2AHHOrKJ57LlQumMonsOXW
 Ti7zrlyE5OP/wwJu+vetw==
UI-OutboundReport: notjunk:1;M01:P0:19oz11zzZFQ=;H4ZgLorIWEEeFiPadTj+rlsGPxT
 TmiQ8Q6xD+ZknkoiA+7Gejf8Ma0Yuj6/DTHOt5QCTnBAGtCrqE8nUGZg2E/FGoNeC7Z9rYdi2
 i2ax6oWVq55pWCeZtWcCETc8KQispS2w3gSyE7E/dv1vuK1Q2DFPomne5+qc5//4uL8BtHbTd
 gyNeG98qZX6Oc2199FDZnm8mhetlCYGegbF0IdNZGkZjmuTCFsA20cfFp19qfyvf2RmgHK57L
 V0VAPNpY+b7VWHf7MRtdU+9vCqLSVEPP8Mj0ezDwMHPtK1Wtd59OSk4rTEYIj2cLp7W7s9MYR
 t4PAFtGqOkNnP0Ga9Dypev6I/JAP0Q4gc+Fjt0pNuu165ItUSZKIr2InF/fYTPv83Z+Ers6B1
 6NaUb3liJMwWq1xRvSdfQpAxhAq7HithUz/TIyMKexlGUphvVPr8hFwBpDwNNbetUqo1v/9Vo
 WGxAebCtDj+1q0U1391z+o7DpqP9vPYeHKJ8eZogYFuNELs9HVm9tW8rtO05a/lpShYXbZ6Lm
 FlcoASCNWw+yhsKJsjlgNVOUcYC45xg3O2GLC/rWF2flGNObhw605SI6SoAUu/e4aZtmcXJln
 nP7grhUpNJMAPBo4dfO0Avvm4XbyIoJnND5VSjEuiMdc3k+bgMfXyOD3WlVBcPzfJsyjC9BP+
 sArfeGldWol3N05FQzp6P79oJPdKja0F2IGFMcM30d0fJ0zhH4oBLEzp2G3PsoOb0TxThW+nR
 7++qo5aE6DaKZK4kIpLg46YdMH1I922pHMJEweM0XwTFuRRCBkRNgN3XXfGb2p47BASuhVObo
 uApJOfXhaPwB+2Cbm/2slul8pMza5hIO6qcCNpEjnIBUH9a8dQxh6K1TtGYxpGxm0X72cQ0SG
 7z7s1ly4/s853fYjMvOsOsbQuHiknxd+EU6urcfh9JkFMrWROegaJGSM/9A4PmZeVgBqebvAc
 m5gAQKjYdELutdV9HPgs3MMeIUk=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; 
 s=s31663417; t=1694404844; x=1695009644; i=dalang@gmx.at;
 bh=eW2ifXJlAZTYYxw0rVdXkZl+Q+oZuHqAR9I3gx1vo2o=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=oga3l800JwBA/mx1HrG2LKauQk9Jg+1HfQXhIgJDrpFCyHenN2vBlgCMta6JSJW2cyMe5CU
 qn7aLgUKS+ifLed3IZWCbGQ/sl0FPXq9vKZbqKdIWcg8AFIT3Os8NfvnXy39qOY/0a29LDtni
 hZ1LMAiV3CWct8TAl+nW6i49bfs5DHm5jnSZtHHl8QbrRkolYnNeNEhACu+mSap7ZWjTN1/Fa
 oEzGRLn466TEj6XKugC708UYgNgwS5PO8xVLUcVAmD+L49BgYraNSBI17ka5gA+10w0YYa0a7
 ufC5kOoVKz6PqpU02M2Qb4rdStY8GnwzfhRJQ3A18OdP0E3CYxxg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=oga3l800
Subject: [Buildroot] [PATCH] utils/getdeveloperlib.py: handle file removal
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

If a patch only removes files, it is ignored. Meaning, that the
registered developer isn't automatically picked up when calling
get-developer.
Fix this by also checking if the line starts with ---, as a patch
removing a file has a line starting with --- with the name of the
removed file and one started with +++ /dev/null.
A set is used to store the changed files, which doesn't allow
duplicates. Therefore normal patches aren't affected by this change.

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
 utils/getdeveloperlib.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/getdeveloperlib.py b/utils/getdeveloperlib.py
index e7d0d23e49..469360b801 100644
--- a/utils/getdeveloperlib.py
+++ b/utils/getdeveloperlib.py
@@ -25,7 +25,7 @@ def analyze_patch(patch):
         m = FIND_INFRA_IN_PATCH.match(line)
         if m:
             infras.add(m.group(2))
-        if not line.startswith("+++ "):
+        if not line.startswith("+++ ") and not line.startswith("--- "):
             continue
         line.strip()
         fname = line[line.find("/") + 1:].strip()
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
