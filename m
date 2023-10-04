Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C3DAE7B616
	for <buildroot@archiver.kernel.org>; Wed,  4 Oct 2023 13:37:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DACE760B0B;
	Wed,  4 Oct 2023 13:37:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DACE760B0B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h9-xLrEuG-I7; Wed,  4 Oct 2023 13:37:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2EC3260E71;
	Wed,  4 Oct 2023 13:37:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2EC3260E71
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7E7051BF3D2
 for <buildroot@lists.busybox.net>; Wed,  4 Oct 2023 13:37:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 57A4260E71
 for <buildroot@lists.busybox.net>; Wed,  4 Oct 2023 13:37:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57A4260E71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FlZMllK2q5VM for <buildroot@lists.busybox.net>;
 Wed,  4 Oct 2023 13:37:28 +0000 (UTC)
X-Greylist: delayed 557 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 04 Oct 2023 13:37:27 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3F9560B0B
Received: from mx.msync.work (mx.msync.work [62.182.159.68])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C3F9560B0B
 for <buildroot@buildroot.org>; Wed,  4 Oct 2023 13:37:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1A563FEE4A; Wed,  4 Oct 2023 13:28:07 +0000 (UTC)
To: buildroot@buildroot.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed,  4 Oct 2023 16:27:56 +0300
Message-Id: <20231004132756.548326-1-adeep@lexina.in>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lexina.in; s=dkim; 
 t=1696426087; h=from:subject:date:message-id:to:mime-version:
 content-transfer-encoding; bh=nwYD4YDXGON5Cl3Ak5FdYzvdoaRP9jwUqAzHk5xAAtY=;
 b=O5VeAJB6PMW53gF13lX7iQl9hwHCSqZDqD/B+JaSzkmeq7JLyj75YcaBlrs0xQw0ukZFGo
 ZRLF5wYWZLysvbu8QRaSCXFqGbSBFEAPTIZsAUVw7Tm+I4Hvd3xrS5kJIx2WbYCIXybQXz
 IItSJizIFi0D1kNwhFLfuMdddkynz22bDT0HF4VwRyb3wnQ8ql6lIN6TB7vJPl2JFCBWo8
 Rwl5A4SS1joD9K0H0J682JBVy9CqOG/D+rA1+i+93NYwZSei2aKZNbmF6Gjr5N47wZbXku
 NusTs33zOfMo72Uzg9tHodHi3Ili704vLHrfUYOmbu708k76Eg8r9kMDhP0gVw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=lexina.in header.i=@lexina.in
 header.a=rsa-sha256 header.s=dkim header.b=O5VeAJB6
Subject: [Buildroot] [PATCH] package/rtl8822cs: Bump driver version
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
From: Viacheslav Bocharov via buildroot <buildroot@buildroot.org>
Reply-To: Viacheslav Bocharov <adeep@lexina.in>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump driver version. Fix build failures:
 powerpc64 http://autobuild.buildroot.net/results/3600153fa9d7bb267c835ef896e35cd11458163e

Signed-off-by: Viacheslav Bocharov <adeep@lexina.in>
---
 package/rtl8822cs/rtl8822cs.hash | 2 +-
 package/rtl8822cs/rtl8822cs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8822cs/rtl8822cs.hash b/package/rtl8822cs/rtl8822cs.hash
index aa3c86ce80..4b44512913 100644
--- a/package/rtl8822cs/rtl8822cs.hash
+++ b/package/rtl8822cs/rtl8822cs.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  666b5312c372664b115d29fc2b2974244b0512db27ffa1c810fae30d1c714063  rtl8822cs-758d861bfa4d18d39e4297c550fd684c9817eb0d.tar.gz
+sha256  b3b8543ff6d6d602ffaf60342969830edc8205917b96d004f84ed79524894dc7  rtl8822cs-2e4e99ae1502b173a938357dc1087e49475b26ed.tar.gz
diff --git a/package/rtl8822cs/rtl8822cs.mk b/package/rtl8822cs/rtl8822cs.mk
index 2db769aa69..6036acb864 100644
--- a/package/rtl8822cs/rtl8822cs.mk
+++ b/package/rtl8822cs/rtl8822cs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8822CS_VERSION = 758d861bfa4d18d39e4297c550fd684c9817eb0d
+RTL8822CS_VERSION = 2e4e99ae1502b173a938357dc1087e49475b26ed
 RTL8822CS_SITE = $(call github,jethome-ru,rtl88x2cs,$(RTL8822CS_VERSION))
 RTL8822CS_LICENSE = GPL-2.0
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
