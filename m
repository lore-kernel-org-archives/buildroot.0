Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6794CCD80CA
	for <buildroot@archiver.kernel.org>; Tue, 10 Oct 2023 13:14:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB34841B49;
	Tue, 10 Oct 2023 13:14:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB34841B49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CCZYV5FoRG1N; Tue, 10 Oct 2023 13:14:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2A394194D;
	Tue, 10 Oct 2023 13:14:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2A394194D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A34F41BF3DF
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 13:14:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C44E60B77
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 13:14:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C44E60B77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pRamVk-OZNud for <buildroot@lists.busybox.net>;
 Tue, 10 Oct 2023 13:14:20 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D65CE60B5D
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 13:14:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D65CE60B5D
Received: from houde.tangerine ([185.213.154.234]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.168]) with ESMTPSA (Nemesis) id
 1N4hex-1rXTLS1WtT-011kvv; Tue, 10 Oct 2023 15:14:17 +0200
From: Thomas Claveirole <thomas.claveirole@green-communications.fr>
To: buildroot@buildroot.org
Date: Tue, 10 Oct 2023 15:13:27 +0200
Message-ID: <20231010131327.1128307-1-thomas.claveirole@green-communications.fr>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:4JjK0TEPv7zMvaPi8HqhDCI/twDBQRlsQYtqpiL9U8W0e/pgUr+
 BwTqM5YWzY2asb+0SOJ2RNU5jcTboUJVPvzlrHocEmj6OpAL7FCpBbVBsloJFNTEKse3So/
 wAG4drjC/c/wLiNX69kHTQw49xLPC/wjbRljXoOLDLdP92zLP+g23yXkrsCXEC5p6aYHADb
 ADgEmnq8C+9LUkWxvn4EA==
UI-OutboundReport: notjunk:1;M01:P0:vGj45n/53HQ=;OM4c61REqukhrvdKgsmQmVdIYhq
 53SJ89eA7ZgplsRV6GAblY/5KUlzsYb82tASKkdIqNC/DyO8zLHi/EEjfoq26GxUl25KlpPcX
 /rfffP/pLPDKAg1h/tdXC3366HksLhb3hCSsy3TINHy4SENXFEPc1YEW95BqfnJsjKDlAYWuf
 yYl+EBEFGZN3uFLRFUCVNTCJydgrWXHdwiyMKupRtljjR5J8fvvCbkjNmmRYFzpaenkPC/BKx
 SbTezqSnIJKlNZajX3wHULzrB5zZVYo/tJ6hFgJ6iveS1rrwnciETeFIviV/y8rCr6tiAjnH0
 BCdm/xWRN9Me4zcV4wcgwLJkc1lwXoWrtoxcPaANmL/dA2T7qK7rJCBrPaHc7Sjexy3bjUti7
 zABA2JUlgYjyse0xczpustp7VNwFWM1Ckqj8c7MgOvDZ1n3vfFCSH0tJZRdhCusabfJ6s8f2v
 yCOyji22oiPTydkiBBDDpq+uch8DFAlq1VpBmU7kwuNuf+E7i9mbhRegHRT6QOFHBWpgwk00H
 M0HaxGeuoUVVQ9V5FekPJV/cQ0eZagJpx08Ux4HmuMUUVl9J3ob6KPehO96bBdWJ98hUXJcXa
 0w5hg7j8v/GGQwqb/jBoCwQgQYqxbsyfJgZ683oOFQP+xrkNyTeAVrm83saVdU8hQfUA5Qy7u
 pQq5rSbBzfiDtWebEfANS6SrmAG3T+deCsrHIuAV+TrRScl871PA7/WXlAiARvIDNWg0s0iUq
 E6wolVT6Yo+hMMXZcdGOndSC6d9accgKtYo37Rn3Mcp2bThLILniWN3QRHSnYZx3sHJqu0yfx
 zBCat+tt7nsRzm2DHdLJ2fooC51Aaj78sRBUjkFQHFaKwszn+sAdDVNhTWvMYPjRlQw5ZFx8C
 Gwpl3kfEi1uvt9meYdJgIYNDHXvHNCPQbkng=
Subject: [Buildroot] [PATCH 1/1] package/openlayers: bump to version 8.1.0
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
Cc: Thomas Claveirole <thomas.claveirole@green-communications.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
---
 package/openlayers/openlayers.hash | 2 +-
 package/openlayers/openlayers.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openlayers/openlayers.hash b/package/openlayers/openlayers.hash
index 61fe8aea2a..af9087ede2 100644
--- a/package/openlayers/openlayers.hash
+++ b/package/openlayers/openlayers.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  5d89c7017ca85b53bea6402a1222909dc49a061ffa351d3d1e0ac40b94dd2d38  v7.3.0-package.zip
+sha256  867778afdd66cd29fe0f14ac4ed316a0ab393f5dccfd2219450848cd0347f1d6  v8.1.0-package.zip
 sha256  6c4347b83a8c9feef18d57b18e3b6c44cf901b3c344a4a1fbd837e421555ab8e  LICENSE.md
diff --git a/package/openlayers/openlayers.mk b/package/openlayers/openlayers.mk
index 37e530220a..fde83d6e84 100644
--- a/package/openlayers/openlayers.mk
+++ b/package/openlayers/openlayers.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENLAYERS_VERSION = 7.3.0
+OPENLAYERS_VERSION = 8.1.0
 OPENLAYERS_SOURCE = v$(OPENLAYERS_VERSION)-package.zip
 OPENLAYERS_SITE = https://github.com/openlayers/openlayers/releases/download/v$(OPENLAYERS_VERSION)
 OPENLAYERS_LICENSE = BSD-2-Clause
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
