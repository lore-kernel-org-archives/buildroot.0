Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64312C433F5
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 09:21:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BF40D401ED;
	Sun,  6 Feb 2022 09:21:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M2p33_RBfXke; Sun,  6 Feb 2022 09:21:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C630F40120;
	Sun,  6 Feb 2022 09:21:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E6B961BF83C
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 09:21:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CEC0C60D4D
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 09:21:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zIXEVI4Cs71a for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 09:21:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4A15660C21
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 09:21:08 +0000 (UTC)
Received: from calakmul.fritz.box ([151.61.103.53]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.17.173]) with ESMTPA (Nemesis) id
 1M1ZQT-1nDcWg30LD-0034DW; Sun, 06 Feb 2022 10:21:06 +0100
From: Pedro Aguilar <paguilar@paguilar.org>
To: buildroot@buildroot.org
Date: Sun,  6 Feb 2022 10:20:48 +0100
Message-Id: <20220206092048.1901703-1-paguilar@paguilar.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:OP7L3JFVwjn/PM+FHFA0qR2Avx1Fu/tv0FE1/T8HhYSXHWvLwDC
 aEUXRKB3ximzniTw4YbFWMMi1VKqo1iviZ0DIQAwOd4CH62/FiiMYRRnXuyVdC5FuvmeglO
 Sh1syMLHC/yaH1PgohmkINmUMCf/UD1eMSBn1mosRLveZZvSPu3JIkEaALBUcT6h5g9ELLN
 xRGgc/oQApGjwmJlGOR5Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:rRpr0AtSPIU=:Wt0xKhnG7uQC0KXyHM3Kv0
 W+35EUJMcBAYYS6A7HPdWtj4T7anYhMW5LY34NUssZLLQg6JtxWajC5jfrj1p8fyoHUaEg4a/
 /YX/ZGwaIYxio9NRFxmsKt6ErhNZIevqOM0V1HAfpH4mrcol6DxDxKD8ueBqGewYrArRgBteA
 LuH6B20LliREdp/FAe2vnlDV1ZvQ7jzQ3jeosk65HMQif3KugjiZ6/3xu1pvXZ2CKFQ76GTc1
 SK1XKHgj33xAcgSLzWjSDm+I4Tsz6lLF+cmQxEorElk95aPt/+Rb1yuNFzZhVWQr2xeiitDXJ
 1lUIpbFao9pNp8hlkaJ4sSvvLrEGjX0ymAALoCpwFVdwnk/Mh146UVI7RBvBQzWc6VTgaudFB
 F1s1JuXCztfRhCzA/S8HXiWGieyHiD5v73G5AOHcKw7UIIUalxVwsBTsKHZqXdSJyHbbgjBbC
 jaXFHNeLXT3cVTytQG2JAlYrRxxOw49agdAti4en750YEJzgqmGqMBMgfEEKCXOe7IGgAgHl0
 6KxexFYwPQzUYGk68X4IG8UT4KwDXxKLlo4/jWnWs7YIFrvuvkubun3W+U2YJXTfKRhq2yHbf
 SwDi9D//figrincrdxdxc6nNmYRD2tVsH0lc7oK2dQGUEaYG63slh539X7zPcfzqJG3EywrWM
 VJf9D9rlhftsbYTcWr+zRJYwFBXA2Lrb3V1Xaak68XKvDXNM9EWAMo3J/TPkTLPqgHZ4qizr3
 LabD3+EJ74t3efe7
Subject: [Buildroot] [PATCH v1] DEVELOPERS: Add packages guile and bdwgc to
 Pedro Aguilar
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
Cc: Pedro Aguilar <paguilar@paguilar.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
---
 DEVELOPERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index a1ec9a091e..97d264afef 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2199,6 +2199,8 @@ F:	package/umtprd/
 
 N:	Pedro Aguilar <paguilar@paguilar.org>
 F:	package/libunistring/
+F:	package/guile/
+F:	package/bdwgc/
 
 N:	Peter Korsgaard <peter@korsgaard.com>
 F:	board/arrow/avenger96/
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
