Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61D26C25B75
	for <buildroot@archiver.kernel.org>; Sun, 19 May 2024 13:35:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16C418135F;
	Sun, 19 May 2024 13:35:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Iz3AhhBLSoca; Sun, 19 May 2024 13:35:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B06C81BCF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B06C81BCF;
	Sun, 19 May 2024 13:35:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5582D1C3E77
 for <buildroot@lists.busybox.net>; Sun, 19 May 2024 13:35:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4FCD681B60
 for <buildroot@lists.busybox.net>; Sun, 19 May 2024 13:35:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s37R5W82g2d9 for <buildroot@lists.busybox.net>;
 Sun, 19 May 2024 13:35:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CAB8B8135F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CAB8B8135F
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CAB8B8135F
 for <buildroot@busybox.net>; Sun, 19 May 2024 13:35:39 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([82.135.81.11]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MZkpb-1s5F0B2pFP-00WoSK; Sun, 19
 May 2024 15:35:36 +0200
To: buildroot@busybox.net
Date: Sun, 19 May 2024 15:35:36 +0200
Message-ID: <20240519133536.21349-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:/6UtB+Hk1TaOldEGIbqlp5MJ+ke3X9uq9sUNGcd/y1vvCqCbLSz
 5IrvLejXys3PlF+Kx3x8OXBWjUSAte7j7CGyQezVHjZS2lefH68IBEapzLG4z0Rdo/ZwyL2
 bYtJE4sEPXXNvHRwSextTrJl2XB9g1HBDgloPhoj0DuEJLOI66axifRjwRebvVNqtag0eCJ
 1LyDw5f+XcJ9/cUHVMkhQ==
UI-OutboundReport: notjunk:1;M01:P0:2NZMt7ljrlY=;5zheHcUBNeb2C71SUU6JICieWg9
 enec5TuZ/3LN6VGejUaTXXa9XjsSIce89ZLdAhZ7WN1IrWclYIc0peq87HWEssMd7Te9Ios2y
 GBJjTA8E4oSxh8lGuHk3Ju0y2n4X8FAxBjvvgsvTi3KkCK5iCIevRxDLr8tw7tobHipUHfryh
 0su0K7UOVFcKqyVRuHEDVIU0hHAivCDJVtyHue4JjcZBbYItv7pvd5u7nQleS8B351KsbjpX1
 Mjh6HvGDCl+MJ/xabRhIzfE1YyLhNDlISXnZIGyQvOM14laLyz4HOOgX1nRIAuDuwcMToT0k0
 pfy8tWVex6n/oDXoI+Nmps4vDz/gQhJUcpxv14ASbYsuWiXbEJVzIr8DoKr+pYoePLolxI1ul
 sXd9MqZmLhGV15veWRipLpOzNTgZBKbIQdxSv9bm4Oxu1xHp3ZAOUtTA4iKCcKHQmEczN6jIL
 JSaM3CJetmA8zyp9fPzTvgd706nTCzx8cqRolbmlP+gu3+ZLm7hs8L9EQLUBUdJtq3H7x0vKN
 fJkKGj2/ibjyKuplapaaxPU93aK+BNkQjRLzvWX1z15QbaWuNMz+jmYNB5LYGjtS7PctFYY3a
 s1fMQDYJ/e6fCo8qpKv7MWjf1HU1yby8aPZXGliTSdDMh48AHV1EPStaakb0ndkjPtMuoOVDK
 ry0+N3PsCULqQDYaJQqWqSW9Yy3BPYSknlrWlfBeQZbz+H/MLbGEc7M00om98/kWcF2SZdBTL
 HlqlalimlqdMI0OCgihSK68bWicdOd+nMasXPCPbs3g97HRTufcjMO8WXFSDOsG1ps0GaqdGR
 HecLt/D/eQ3teyh7ASGpGDwag/gLaOU1J/K6WKH7NP7Wo=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1716125736; x=1716730536; i=ps.report@gmx.net;
 bh=yrpjyFlqGuOwwT/hGGGByfaYEPTwgIon/SdMts0I82I=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=r/wwki19NG82qDrBW63MZfi2QxBsyAcF6WoJ2zptoZ21Hnc+qnbLkYwVIJRtRPE1
 hlfblfISbr5YT5BdKaN3A7cSuCw4ebV8NeDjiJ3avifwVxVKPm46cGOihkUFWAj2W
 fzd93xRbCYu5V/C+3HW2bvAy5ivozSKimLn9tRegDcMKCrgQrwfTGy69MABYywATf
 mVXf3Z6oCa0dafqyfvNdPLeTf/oGygXwbrs4L8L8w+LOpwIiPMwqd940bxs9uS9qv
 tvcZb7eDN4dnHu4EVH5d/I7Xg53dwK9BZG6tcAzzwpAtnprKphLqO/YhTptrNbY0Y
 v81waOTCUdkM1xgvzg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=r/wwki19
Subject: [Buildroot] [PATCH v1] package/git: security bump version to 2.45.1
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
Cc: Bagas Sanjaya <bagasdotme@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes CVE-2024-32002, CVE-2024-32004, CVE-2024-32020 and CVE-2024-32021
(for details see [1]).

[1] https://lore.kernel.org/lkml/xmqqv83g4937.fsf@gitster.g/

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/git/git.hash | 2 +-
 package/git/git.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/git/git.hash b/package/git/git.hash
index 2e54945a40..7dbeec714b 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,5 +1,5 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256  0aac200bd06476e7df1ff026eb123c6827bc10fe69d2823b4bf2ebebe5953429  git-2.45.0.tar.xz
+sha256  e64d340a8e627ae22cfb8bcc651cca0b497cf1e9fdf523735544ff4a732f12bf  git-2.45.1.tar.xz
 # Locally calculated
 sha256  5b2198d1645f767585e8a88ac0499b04472164c0d2da22e75ecf97ef443ab32e  COPYING
 sha256  1922f45d2c49e390032c9c0ba6d7cac904087f7cec51af30c2b2ad022ce0e76a  LGPL-2.1
diff --git a/package/git/git.mk b/package/git/git.mk
index b6a7ec0cbb..04f489e038 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.45.0
+GIT_VERSION = 2.45.1
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
 GIT_LICENSE = GPL-2.0, LGPL-2.1+
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
