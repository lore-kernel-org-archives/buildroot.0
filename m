Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A26BC79F82
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 16:48:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E64E180F5D;
	Fri,  4 Sep 2026 16:48:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 189AOOU3RI99; Fri,  4 Sep 2026 16:48:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 21FB680F71
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788540525;
	b=JNoFqHyhkP27ngRanuCeOPmsysbf9GExgwLjoznqzTBYX7eUpHopSWhpE3Fyy6sxJPm4
	 WpJrWJIyE522UWPuT7m98G7yMy3piCzl0Pc54e5TKXpWuSt01nxK3vjrdcpK/tVP8pXqS
	 voiYdIzKMEeGYF0HuWLH7FMaSX56/iNzhqqNe7D5RXoWaufW8mD9mQsXrhNfeBx6pu8i/
	 h+ousaOQ+xE7BWPj4LNu+b0dRPqNjoUNjyH47WeYfxRxrKO/v/LnzZdh/2luDCBqvd5hG
	 bMIQLdiFFAybFbaoZ2tDfqvdf1yYkUIEz1olbjFBDjMCCBab1qKMqBKSrS9R1AnNNJw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788540525;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=CN4X/NTnfS2WrkmpPz4g2Thb/fO0WGTcOx03ziLrthU=;
	b=it8prJdWxarG+/t+qlW3MyhNtols9Wig1kCm3fj+RK8odG+hkpiwZNFYgki2Tqu2bRfP
	 45QxS4uF7MBiNENhxtO8D1YaFRyBkbAd4G2lUEgTUWYp5Mtr900GG/B9j30jvbNlMSqsr
	 LhpPYKA0UpK/P3t68cIFn+t5PP8nW/BqtWFyeu8Kzo9jg1RC8pmqZMhkjNVmdC/Kvkxdf
	 fcl5nniOJRNnqP73VMGNtAEcm9dkRBLwT82xmChPpE/MYdjVMbU42NyRmAIQAHypZKIm9
	 3lfi15Hos9TBhe+7nrlTYhBcVr2RrSW8pOnAaNO7qAvwcyl+hBKxXCkmvzsTZwlLLew==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788540525;
	bh=CN4X/NTnfS2WrkmpPz4g2Thb/fO0WGTcOx03ziLrthU=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YSQPVOV9MKtf0weipvWrLRQgLR1mtrouHt0N7hmSRbTO/JV8z58r2kdpYb4KeWs7O
	 d/mTzeaFAJNlJSfNM3/3lXMf1uxx/i3aoM538i/6wG7Xf9M1z8IoC22cenINdvWYxD
	 3vwfXAhZPS5yxfcRF58SWFMgZDQJXbWt9qcXN2Aw9PNe5LIDFf3pYAklB7f8htGt3l
	 AVAZfuhPu+h7F6LHcbL/hYBoMMBenlLbwgh8l2rc2t68i/o59k9r7ro2PwAkGmjneQ
	 1J16H0EPEOA2t0s3aChxrhTdkzG9LH0ft3vK5/El6UPTnae7txZc/q4lMK5BlU53UG
	 EDd/BRnocL4Dw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21FB680F71;
	Fri,  4 Sep 2026 16:48:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D5B77388
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:48:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C767740AA0
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:48:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9QoTSV5jmC0C for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 16:48:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org BC93540A9D
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788540523;
 b=Fk0yL/Z/+wfoZotQAwWVxP+FtKGJcpuUxGYmNmB3a0X9FfN68x9eiRrJXMeKmwvg8hmW
 PKVbo8Pq5sTvSM094Xz1H97cDQFOgyhl5d14yVU3j1ZiQxsYywjqzrpodGiCCO1IZ6YaN
 VbotgnycZVt2XO1l1s8UqmJNkDwENmLoVFpW7LFkn8yvVO8wJKgQ+BXS6MpZdotTLA7zM
 u4GnMce/hb0QkSwndX22ukEh6v5p1nMBw9MGKnE2cIIqaE6zqRGKaqcDvmwM8oQRXEmyy
 vQNUIwN9q4ikhF9FyY7pfZ+A8cCgvOgb2JIsy3YBb1SdcNTz87cjUaKrHH5UkfGIG6A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788540523;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Spam-Score:X-Spamd-Bar;
 bh=33oakdVDGNOFApCOh0mMhiXxC+e7E7tMCOPwwJKcmZM=;
 b=kuENxehf28tqJnGNpk90riHMmU7hFY5DPVAcScSDMP4j0G6JH4G6iSsaGfXFCtOQVHEL
 OFGHgk8h+eGY8S13ZDiBxGVqXByB+oIveKpt019f5DHBO6X3PNQvirCLYm8SlOTAOmY8/
 dNoKuvph4d/HOB9M2tOn1Ml1qnRcYfhwsVDM3SlJ8/ceJdgMycQS/7HlWpHB2Rr9S6T5D
 8WmucuT1Ri0oNmzLFE6eohLef42nDHdK8G73/WRy7vn8OwQ408Ejaeo2a3/d5EBF7xZaM
 PXktYUsRoA7NlRMO8OGTW1p8TvuSd80Tfg1gfbZK9fqFytJe+/KDQaOr5rzpXfTgKKw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=CyYX1HkJ; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=CyYX1HkJ
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BC93540A9D
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788540520;
 bh=33oakdVDGNOFApCOh0mMhiXxC+e7E7tMCOPwwJKcmZM=;
 h=From:To:Cc:Subject:Date:From;
 b=CyYX1HkJX6ARNWduRRkT0+5L9L7zKzXfdTrr1giqQE7tduHo8UOKZ7+7fyIVqskrY
 ruLGH6ZAbUzl7/aziM4onASTNBrSZFO41N5HygFV5k4Sx+ouCbqEoOi/OOgDFRDHxp
 01NYOWTaqEbfJALmkDaPgZ9fQD6IUYnAlHYaymAdjbP55CcSs3HbqTPK5wywI0Yce9
 RyRMVUMO25sCsnMHabXBfHPP8Bbrnfi9g426MlHHc4aLZmSuHBmH7/eaUJaOIEerXo
 VQJGeM7lKsBZwBhP6IwSoU1uwlkZTm8Z9vvLgVABlAXzWLuLayAOdA9ITSMAAwVNuy
 sPAQ4yTtGza9Q==
Received: from fli4l.lan.fli4l (p5b3a03a0.dip0.t-ipconnect.de [91.58.3.160])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8BE79A4C0370;
 Fri,  4 Sep 2026 18:48:40 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45404)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x2X5k-000000000pC-1Cz7;
 Fri, 04 Sep 2026 16:48:40 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  4 Sep 2026 18:48:40 +0200
Message-ID: <20260904164840.187804-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 1/1] package/libcap-ng: bump version to 0.9.5
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/stevegrubb/libcap-ng/blob/v0.9.5/ChangeLog

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/7e4b08f5c9d0e1ee454b2588388ca0b0f6deecb3

 package/libcap-ng/libcap-ng.hash | 2 +-
 package/libcap-ng/libcap-ng.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcap-ng/libcap-ng.hash b/package/libcap-ng/libcap-ng.hash
index d79ef54d07..a39cbf142c 100644
--- a/package/libcap-ng/libcap-ng.hash
+++ b/package/libcap-ng/libcap-ng.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  fe11ebbb55904763b3532f19069f13ec319042634620180a03bd4653d301563e  libcap-ng-0.9.3.tar.gz
+sha256  a2b4211f59b231d607c61ea2a13e9ecb38f446fe769b44e12da939d5af6d978a  libcap-ng-0.9.5.tar.gz
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
 sha256  f18a0811fa0e220ccbc42f661545e77f0388631e209585ed582a1c693029c6aa  COPYING.LIB
diff --git a/package/libcap-ng/libcap-ng.mk b/package/libcap-ng/libcap-ng.mk
index 31e0ff8d64..9d29350b2b 100644
--- a/package/libcap-ng/libcap-ng.mk
+++ b/package/libcap-ng/libcap-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCAP_NG_VERSION = 0.9.3
+LIBCAP_NG_VERSION = 0.9.5
 LIBCAP_NG_SITE = $(call github,stevegrubb,libcap-ng,v$(LIBCAP_NG_VERSION))
 LIBCAP_NG_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (library)
 LIBCAP_NG_LICENSE_FILES = COPYING COPYING.LIB
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
