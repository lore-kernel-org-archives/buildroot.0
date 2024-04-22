Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1AF4C4345F
	for <buildroot@archiver.kernel.org>; Mon, 22 Apr 2024 07:35:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88CDC81E34;
	Mon, 22 Apr 2024 07:35:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id db61xP0JVwIA; Mon, 22 Apr 2024 07:35:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 55C5681CA5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55C5681CA5;
	Mon, 22 Apr 2024 07:35:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 61C2D1BF2EC
 for <buildroot@lists.busybox.net>; Mon, 22 Apr 2024 07:35:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4DCC98196A
 for <buildroot@lists.busybox.net>; Mon, 22 Apr 2024 07:35:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LbliHB8zgVg8 for <buildroot@lists.busybox.net>;
 Mon, 22 Apr 2024 07:35:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F0D4681749
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0D4681749
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F0D4681749
 for <buildroot@busybox.net>; Mon, 22 Apr 2024 07:35:07 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([212.114.183.37]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1M2wGs-1rzvCH4A04-003KWQ for <buildroot@busybox.net>; Mon, 22 Apr 2024
 09:35:06 +0200
To: buildroot@busybox.net
Date: Mon, 22 Apr 2024 09:35:05 +0200
Message-ID: <20240422073505.12139-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:29XZYqqf14R+NDGA8neaM3r0N1PPGjzcNDRy/+KxCNdq0/58Evo
 lKvNiolMo3tpXtdS42ydU0yYhYUjtS3QNzI23HynjLMgjY7ZmLcUJPflbJ8/LXGo6UiNCzy
 FDk1WYk4KvSGRvSDfQf75jSEHubFjjYO8d3d9gSW6ysM9+wC2D22Q+PTKHTjpi32e7AVL7A
 HMAMZaqhM0Xsc28+1SOUw==
UI-OutboundReport: notjunk:1;M01:P0:Db5RA0mLbW8=;YbzYMe+WXegE53growGtKu6YKSJ
 wC0DH5CpUhJZ2Uv0YhK35wCFTHHdHHlbQ9AP+N6JoeYh6eJOg93ApxKH/XHAmqXlAd85x+O+y
 /WnGiztK+623J/cK5T6tQjcS4Gt8bLxSvdgCtYZ3qblxKi+oMjnk7vBbU3qpY2oV3PPPCDvRK
 inz5mSJV/SMJ+PkHINQJPtsPc2g1JjtSWRMYfKkgqTGHvxXah0DU2c4ZmOP7DIIVBU3LsqJ9P
 YYHNBrsC2GQIjxQkwDN9UZI96F9RhSSPkl27OzLlcIGxbWDnE3QW8OLYMJx/PvMKt/VU8en4B
 3lEc3NPmD/bKNqsOlbLqCt78Je23GofMHOjPs36Sr4ny6qi5hXJqGqPSMyxOpQVw2w+7nzn++
 zNDS2UcdCX9OlyjT56/PpClRrNc6KF8GuxUH1avMbimjgO1La9rZv6TJ0DtkIbCDTVMFWhFpu
 qpuEvwNi/BXTZp/A60oL2cyjcI0bYaMtmx4Vep4tgxbLW0qGEypAJn35t4diDG8/YMBbKCicQ
 Cb/qVM1wYgrYK+ks5eNAJtIa0Im/oQHDrU2gKtwwK+pL41j5I/8qxWv0WB8j5qxfuptGg+don
 U6RiZ9MSxFidxjPa+i5PCydUUk1AVsz877XC+M1ZJbBiI9UAiQl1BU+dyvSEFU+o2bb1AjGbP
 iN+lwKYI8dqY17rUg3Mf/KJhpvUjRqSj9Ifeh5tuVuBGnWt5HLkSkiFq4WgP04dhIY1YVmsYs
 81eGvA8FeSA+Xh3fO3Uq7KKknkBr7IXRgmqjDyqeDInY5MPqEHY97SSWJO9mkJCn9GFGRRrSM
 kn+cRATyRFgk5tldEb7prhGy8cXwxWA2n4ppf6nvLqfYk=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1713771306; x=1714376106; i=ps.report@gmx.net;
 bh=nShn/FirWmyp9Tdx6uFQT5JQvV67rYppwqLCLadJLho=;
 h=X-UI-Sender-Class:From:To:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=VFQwxosgnMzbiJVXKc+HJP27Gg8uTRbYWw0U5db0pMq6rtagnXp2doClnsSVjIQJ
 z5MgCIF1Cwenm9l+OgFNy/gExMlKh4gLMyXSGCYNkAhfygmTGux7cT+hMBm8OoitD
 zoHRNAQMX2GpZpVDmWiMIE9rfIcK0xMjYjtHJyjkNB/jkreIPlZU8WNT8ozcekGAO
 2PlnEDgsguad4ZhjmZBBlcQDCGbOA2kU5Ddz1D1meHA42bSatod2QegNAB0q39bTq
 W174T7WW3m9w7xwptr8U34rpDUp+7+dDSMZqvvpPIciluBUVD+CViyxVgLVhSXnP+
 JM7jgFCn+yepKBc94w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=VFQwxosg
Subject: [Buildroot] [PATCH v1] package/fft-eval: bump version to 777749c
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Only one commit since last version:

- 777749c fft_eval: ignore spectral data containing zero noise floor values
  (see [1])

[1] https://github.com/simonwunderlich/FFT_eval/commit/777749c5c7cc0af1fe5a74e3c589581eabcf0f1e

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/fft-eval/fft-eval.hash | 2 +-
 package/fft-eval/fft-eval.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fft-eval/fft-eval.hash b/package/fft-eval/fft-eval.hash
index 1ffa854be3..a88bd0d73f 100644
--- a/package/fft-eval/fft-eval.hash
+++ b/package/fft-eval/fft-eval.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  154f99c3567835bbbbc9ec4c58bc79961f9fa5342effb6f0bc41475fc9a6d11f  fft-eval-6a82b383ce79afc4c1ba26ffcf34b15d3e95894b.tar.gz
+sha256  2ab485df3489f82aee810794f154565a09fbb8c8ef22ee1c7b08ad8bce89bd51  fft-eval-777749c5c7cc0af1fe5a74e3c589581eabcf0f1e.tar.gz
 sha256  6a573fb2f9082662978cf21fb153096df0a1981deaea7dbc10a11046fe005d9f  LICENSES/CC0-1.0.txt
 sha256  d1cf0896da7045d841fe45b0991cf35540bac1a17b5d11f4afcf8fcb950246b5  LICENSES/GPL-2.0-only.txt
 sha256  797832eda5ff4360a10fee3be94a3250995e76423b79675c9c44204c37ca492d  LICENSES/OFL-1.1.txt
diff --git a/package/fft-eval/fft-eval.mk b/package/fft-eval/fft-eval.mk
index 5f913391e3..a79cbe3e0a 100644
--- a/package/fft-eval/fft-eval.mk
+++ b/package/fft-eval/fft-eval.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FFT_EVAL_VERSION = 6a82b383ce79afc4c1ba26ffcf34b15d3e95894b
+FFT_EVAL_VERSION = 777749c5c7cc0af1fe5a74e3c589581eabcf0f1e
 FFT_EVAL_SITE = $(call github,simonwunderlich,FFT_eval,$(FFT_EVAL_VERSION))
 FFT_EVAL_LICENSE = CC0-1.0 (doc), GPL-2.0, OFL-1.1 (LiberationSans-Regular.ttf)
 FFT_EVAL_LICENSE_FILES = \
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
