Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD330C433EF
	for <buildroot@archiver.kernel.org>; Fri,  4 Feb 2022 15:48:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71D1880BAA;
	Fri,  4 Feb 2022 15:48:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fln4QM4mJeYu; Fri,  4 Feb 2022 15:48:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B08D580BA3;
	Fri,  4 Feb 2022 15:48:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 54CBA1BF2A6
 for <buildroot@lists.busybox.net>; Fri,  4 Feb 2022 15:46:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3EE4E41779
 for <buildroot@lists.busybox.net>; Fri,  4 Feb 2022 15:46:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bOrQXHGvvXJW for <buildroot@lists.busybox.net>;
 Fri,  4 Feb 2022 15:46:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0DE8B41773
 for <buildroot@buildroot.org>; Fri,  4 Feb 2022 15:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643989594;
 bh=kwABoeIyhAhH0TC7Ue2v2I6ie4UJdqEcENqa0IWzUhM=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=MsHy+74+QpJqYEmMEX8XOrQFQMKi5s3A/8P/KGl7301CsrDRpQM0ua2i5g9jo4Clm
 CHaYVBWgKZ13vwRRo1b5uOWDBM4uvgvqAYtmz0Uzz6MWyLw2ZJmk+EWdHQ9KUnxrPk
 309jL+sbYe4qeCh2OKzJd5IouwUVb6HNBhYAS67c=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.201]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MAwXh-1n4lSV0Mif-00BKV0 for <buildroot@buildroot.org>; Fri, 04 Feb 2022
 16:46:34 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Fri,  4 Feb 2022 16:46:30 +0100
Message-Id: <20220204154631.17814-12-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220204154631.17814-1-ps.report@gmx.net>
References: <20220204154631.17814-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:v8qeP0/Ggsdm4qdVsHElo3wLX2VaQhHXxsuNrfJK5EkPtox4k5f
 z+92fYqoUyBcZQ+nRAS6YMY+FmW1CewkDT8+UpdrPbvnrpeoIpd4Meoo2HwMm3GkIMc5wQU
 Zuf4C4M0HK+we7dfAnA6oAwAr+Xxt4sR0T71EBpvcL6vi9qVx9sDsygTk/Ha0sNZIIF+JWS
 BkN5zvX15vuc5/JuwoB9A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:GFfGINYYGyI=:HOX6p56FXdJBNrPOpbImKG
 v2gr/9nWPAJkTf+X9kON9hCn8k/NWYN9HeElJTnMaAN7HlfsZhBTDBKGq1+flBq7MLJurPYL+
 ZLjZo2O4KPaHIKKdeXRUHwW+yfwRjzuacYghx8tdLWNGK0Ak5fjawXHxUXWAtjXnnzuQBFkSK
 lRmEiADTwVe6hB+r6mTHlF1hXN6JlsAra5e8r1mCo9BB99Bf5W9G9QdaNTflOoWeglSTRDyJC
 tJLxU8dPGFOKVXXYqsT1pWILi/+PPu2xr0zauI+tC+Ht/AbRVkCwSQrnbhxR779MHokWITT6P
 eVA7tCPp9E2ULX++zz1P2ZK91w+eRfkyszCNumHRP3kAWZ/LeZtccMKANiNcfpl71brv8aaLN
 /YPTH+Rr3oLAnYoevIqxiG5j2JKqh9jjLx7/EhJrbSW6BbpgAKLhXUSYrtBdG4FGR6myxcfD8
 oLt74mdqUN26Bqq7orTBgdcIgJdzPD5Wyrzs7jC4xGLfJBU1rdUfswpGdX2LIH40PZY4sFhLK
 ii3U7b/dDqZFIl3b1T06GPjqknIFy6esPpjF4fIZjq5fYX8/8/kjFLA2EZ6XH7b7qgzTpPBBG
 uevj5+2lyplFW6EOtT+Dt5oMmj4ePclCWK/ZtO6F/ppMP3nofjLP58aCTPXD9RCbYowYVnkb/
 MhLEN2QZnVN+TBe/alaINg4wjWm0Sj10a1aGSCG/WiSSGfK3mJ2nf5nAR0Za9/fedk6RHq4G9
 tHNK8bjHGsIoZQP28zVgXakN+HcncAzWp4shxb1ilBb2z6KBL5IOj3rzVzJho6Ger2+KDIJ0R
 IkdF78KJEW/6u3UJAQJk1wxA3ptPVIlaALuUa958xW7qxRUTFnlUB/MILg/GknfdhoqB23805
 OwY/+aK3PZFnW26L32RVmG3wnDts31K870f/Iu8AM0+aoSNtrGSzZ+4DmJ3dMh53QoPXDOm5G
 AvHK4zcie21RQm33OAHlJji5FRUaWdVo/43LPYGj4O6XKsEBWnVyrcRW91LX/ohTZqca6Q0/b
 Yy+k3yeUbZxcmU0QwbwtlvW84BD94Gn01dTcnqbivYKiK0M9VkvFkFbzzhQdfnzrDEcfmrx0E
 MFiswU/rl2K3MM=
Subject: [Buildroot] [PATCH v1 11/12] package/gst-omx: bump version to 1.18.6
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

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/gstreamer1/gst-omx/gst-omx.hash | 4 ++--
 package/gstreamer1/gst-omx/gst-omx.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst-omx/gst-omx.hash b/package/gstreamer1/gst-omx/gst-omx.hash
index 9040393506..47f7cb5893 100644
--- a/package/gstreamer1/gst-omx/gst-omx.hash
+++ b/package/gstreamer1/gst-omx/gst-omx.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.18.5.tar.xz.sha256sum
-sha256  2cd457c1e8deb1a9b39608048fb36a44f6c9a864a6b6115b1453a32e7be93b42  gst-omx-1.18.5.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.18.6.tar.xz.sha256sum
+sha256  b5281c938e959fd2418e989cfb6065fdd9fe5f6f87ee86236c9427166e708163  gst-omx-1.18.6.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/gstreamer1/gst-omx/gst-omx.mk b/package/gstreamer1/gst-omx/gst-omx.mk
index f7be1d59ef..dc65509244 100644
--- a/package/gstreamer1/gst-omx/gst-omx.mk
+++ b/package/gstreamer1/gst-omx/gst-omx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST_OMX_VERSION = 1.18.5
+GST_OMX_VERSION = 1.18.6
 GST_OMX_SOURCE = gst-omx-$(GST_OMX_VERSION).tar.xz
 GST_OMX_SITE = https://gstreamer.freedesktop.org/src/gst-omx
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
