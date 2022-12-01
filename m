Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AFC8C4321E
	for <buildroot@archiver.kernel.org>; Thu,  1 Dec 2022 13:55:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8A6B6109E;
	Thu,  1 Dec 2022 13:55:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C8A6B6109E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c1BOa5f1M8qm; Thu,  1 Dec 2022 13:55:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 194CC6109B;
	Thu,  1 Dec 2022 13:55:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 194CC6109B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 568731BF3A7
 for <buildroot@lists.busybox.net>; Thu,  1 Dec 2022 13:55:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3F94640577
 for <buildroot@lists.busybox.net>; Thu,  1 Dec 2022 13:55:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F94640577
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g5W5s1FwjU6P for <buildroot@lists.busybox.net>;
 Thu,  1 Dec 2022 13:55:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4996540185
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4996540185
 for <buildroot@buildroot.org>; Thu,  1 Dec 2022 13:55:31 +0000 (UTC)
Received: from harderbit ([92.154.77.116]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.184]) with ESMTPSA (Nemesis) id
 1M3DBb-1ozvXM25bJ-003dWy; Thu, 01 Dec 2022 14:50:21 +0100
From: Thomas Claveirole <thomas.claveirole@green-communications.fr>
To: buildroot@buildroot.org
Date: Thu,  1 Dec 2022 14:48:40 +0100
Message-Id: <20221201134840.18838-3-thomas.claveirole@green-communications.fr>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221201134840.18838-1-thomas.claveirole@green-communications.fr>
References: <20221201134840.18838-1-thomas.claveirole@green-communications.fr>
MIME-Version: 1.0
X-Provags-ID: V03:K1:wmanccpvwZXhlMaIuFmMPTSXPFqaCn8TJiB0JvCvIuixZipL4XC
 OiQ9gbKHq7oG+aIojRMMaX8UyRfj0WNwTIf8bNJ83LO260l8QWGDE4HDWrxQnvRPupk3UUs
 y/JBUHdROwXClTYyodGWpn8oLvMC6fLsl7FZ2wikevWpmK8Qfi0JLBbghh3Z1Km4rK9S2iF
 t+A7BxtPsR0dlmQmDG77Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5YBw3AehkAo=:lnEgXw7IU/p4793pigH0AJ
 efj2y62zHg4Vg0XIBGhjqCwtg+9wDUzj7VG0dkoCJ3DYOobSONBBSJNt0594LaB0OzUDfmqdR
 qPKlmJ8kafkqCvWVv9161CZmqV3VcBza4Agqq6ruYDFalQOwOAUxpM1bszR6jYABkl2EuwzJk
 OU97eFKdKcUxLmDDoMWMxHowm0T9z4FgyX9frgbiIbNdYW4jX4Mfu/FW7SyX/G1FwNKUdsaCr
 1ZjQap9eMz6p01gDVbgs2lZutzufqgUKeihW+mD7UufSziCGA9NLYzov0cQsSZK6pNZ4a7lCb
 olWZUXb11rwh1T17bYX54KCCgHkP5eb+LyI5GcW42U0g7zb9NWZSUcglqm+juBns3M0j7WpN7
 JSB+W/c3wHEcv9IP/dWF383eOKw11GLmiwAkzWpkZFVrx0olK+c0CZcPIEeYcjldFa2/QQJv8
 68rhY+sFxMRFfH80bNCqEVvLmwZaQFksooXbKZ38xscGs44de6gFXt2LRVPSKIufDCNnSkiS+
 OeWy3qEFreWdLkWtgnUZ5/hgGd2Wkh128LgXdvo8AB1NR71TBuj0Lfp2cwXMNkD+53c6fqI0i
 5fADa2fXOH93JnZHL66j4Sz06zGuC4kJVLdLutdAoOvavKuAnObIuWK18tam1B1L3eZkNKonG
 XA6U84KcFP0dkagFLv1k6825IJa8XDz9COCweCQK2s42xaX2ubsihr5ncseGLZFCvzmXuM6Gy
 BYEgGVsOfViW5or3M+6LRNYMdt+zwT9EFy5sxOHjyaY0aKpAt3/6uIVGQuYIuYIXaiIs+p6bt
 BOxtH0pGxNa5FdYRAi1gNUkuIHG9k09eSse2yU95QE9hXKviUI=
Subject: [Buildroot] [PATCH 3/3] DEVELOPERS: add Thomas Claveirole to
 package vuejs
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
Cc: Thomas Claveirole <thomas.claveirole@green-communications.fr>,
 Johan Oudinet <johan.oudinet@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index ab9cfe5ee9..c6b27b941f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2815,6 +2815,7 @@ F:	package/x265/
 N:	Thomas Claveirole <thomas.claveirole@green-communications.fr>
 F:	package/fcgiwrap/
 F:	package/openlayers/
+F:	package/vuejs/
 F:	package/vuejs-router/
 
 N:	Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
