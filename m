Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD05EC79FB6
	for <buildroot@archiver.kernel.org>; Wed,  9 Sep 2026 18:35:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 61CD660810;
	Wed,  9 Sep 2026 18:35:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vYAnixvm-f6I; Wed,  9 Sep 2026 18:35:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 5594E60807
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788978904;
	b=QNqW2917Je1pQknYeTWU3Vyp/bv24cNW0ZK9JbDZF9/bQaoqmdu7jJdbzztC9j48Nwtc
	 WnN7TtpjcuP5mUUVoiTyZTZJeqM0wKoE92ctU2ahGezOUy5RkC9V8LGJ/WZF9mBx//jqY
	 LgP+4cPVW0h1Un6P5Mznodj0yu6+v2eV2/nmNBDWyZIdDuDrH6hgLeajPrzUM9nivucLu
	 gAdMFBILcqIuHxHT0HMVQ4/JcX0qExjvjVOHzv11icK41XRTwwqmRLvru8gZ0ZuLan/uD
	 wjxRbK7YZfkLRSogehxayvTkEJpfz00NzzofmOu68Wk1ynpxffHibQ3vh7WekPTHSIg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788978904;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:X-Greylist:Received-SPF:Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=2Q5Rmk4Uh0KVthEQRk1WALNPLGxVFnbOrDlf577sMgs=;
	b=mxQCwLyB3do96UbI4qgEH88IJdckaYOydZyCAqTN1wkAk7U52tcKryLDfTKKyHLguYNM
	 ef32MhXSs2Codx9o3e91FknuQeYC+JoC75ZoXHqHj9PRvsc/OCJc4Y4+C2drkecTXSI1z
	 IzwO6OFErfjYSSyOEkUl8AVNye3Y6QfaTWGQlEMPyhMOQvjsJm77z1ai2dHxiD6lanpQu
	 ziqmlLWLcKGexQoMNg4jtpKbZx3LeAHzWXvPv/QorHEZP7ZNB/Gu5hsKqojvlov4hSujk
	 XRZ2CXGYBWtztlM7X1Ubnj8Oz+IlLplIluckYvQ8kI1nYwMYROStnP2cbuf19/wUoKg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788978904;
	bh=2Q5Rmk4Uh0KVthEQRk1WALNPLGxVFnbOrDlf577sMgs=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=jdjUsvu1G2+cAQBQADIlTvyarj6g3TD8/bircJAcZJc4IHWtps+60vWWsCqyjWqyZ
	 EeOm+TvhVDQTOeSFAvb++Foaq/45mGFgqT7m3KWatIy2I2MomqvyUOH2zV7cGq7aFo
	 tCFWnGIVgMgMhWkUyGD1+KBbd/BPQQMFYphllIA2l0YDXDwKAnbmQhkZTHyHW24chR
	 S7eDuOQW1nTlWfYEMwcLg1g3NTTrNkIRe8qGXQvCIcrQavVa58a77UNwzAFJ3WdX+q
	 veSMCfUEtnTOBvKYUhtCt28iHBmC1QaaRDYTBHjl9LoP+0SBCHN9YC/i+SxuXxM3/m
	 TrEhZlwi/RuzA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5594E60807;
	Wed,  9 Sep 2026 18:35:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 89EE1432
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 18:35:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6EB2D80E5B
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 18:35:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pDHJsp36Tepr for <buildroot@buildroot.org>;
 Wed,  9 Sep 2026 18:35:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 7796B80E53
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788978900;
 b=Y4ns4s+tY1uAkRAXPhfWKdRpu7hX/tNViJuCOBdTYeO2asAEuikDhEa7TWWEafXh1a10
 4UDXt04fq9ZQH5BK/0qrRoRJuzN/n5ycMLclx9/KJXrcdxFDNxLZcYMg21CGfBrycM9KU
 ijIGv6p4GIuyY4pRcswGI/RjkcDXa5nX++JoMO/G2/2srk+ThloyhPxHBfFw7dby8zseN
 JAb2wvYKPj6pqXUrHOggF89eNYmTcQKjNzEDgkM+6COEXCPB4H+73/4R6vNuzYdQG5i44
 iicRABRkDe1RBsetMLwfoCdKex6+DqPEmgpwiRSNF+CeijONh1NQoFrVkMiwM8h37TQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788978900;
 h=X-Greylist:Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Last-TLS-Session-Version;
 bh=otjRfPwTuWG3zlIGZa5i4Hx7RavyMbElMlCafZj5xiE=;
 b=V/Y01uRHdXB6vVfSzO4qtPclFYUrXqJ7WJ+ALRrGNPr/T7RcshXsdXCXUXv4pKTm2s7R
 xPBp7jyWQ913CQVeUr1Dwqn3Y8sGKaE03bC9/ogXlDGsTHPF1X3+k1hxrBPpujMIqeBV1
 h0eaAn5+l7Qmo7qVZUM4QW4JmU3uFM94UjyVHWHZqhjYh4NRmvMg0VUK6H7bfzI/xFnu7
 8PthJxQNotkEKCVFkQtWSKVAiS1u1tIHBEmQ/A2nq8lGog4dMUwQ1Q60FpnyARNFpCX0b
 ZGI45x1zrUdu6GYbe0nYqu49IQ+SsNgO17GvaPCwmfDc+hBJJtgNkR9GGnuarQpFJTg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=baodeep.com; 
 dkim=fail reason="signature verification failed" header.d=baodeep.com
 header.i=@baodeep.com header.a=rsa-sha256 header.s=dkim header.b=JHE8emoG; 
 arc=none smtp.remote-ip=185.250.0.168
X-Greylist: delayed 461 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 09 Sep 2026 18:34:58 UTC
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.250.0.168;
 helo=mx.adeep.su; envelope-from=v@baodeep.com; receiver=<UNKNOWN> 
Received: from mx.adeep.su (mx.adeep.su [185.250.0.168])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7796B80E53
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 18:34:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BAD1C35CEA; Wed, 09 Sep 2026 21:27:14 +0300 (MSK)
To: buildroot@buildroot.org
Cc: Viacheslav Bocharov <v@baodeep.com>
Date: Wed,  9 Sep 2026 21:26:48 +0300
Message-ID: <20260909182653.1968270-1-v@baodeep.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH] package/rtl8822cs: bump driver version to
 latest with support kernel 7.2+
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
From: Viacheslav Bocharov via buildroot <buildroot@buildroot.org>
Reply-To: Viacheslav Bocharov <v@baodeep.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update rtl8822cs driver to latest of the jethome-iot/rtl88x2cs.

Fixes:
  http://autobuild.buildroot.org/results/d4705d1a933528bad1f4afdf8f621c71bda8eada

Signed-off-by: Viacheslav Bocharov <v@baodeep.com>
---
 package/rtl8822cs/rtl8822cs.hash | 2 +-
 package/rtl8822cs/rtl8822cs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8822cs/rtl8822cs.hash b/package/rtl8822cs/rtl8822cs.hash
index fa5c9b1f89..e62ecdfbfe 100644
--- a/package/rtl8822cs/rtl8822cs.hash
+++ b/package/rtl8822cs/rtl8822cs.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  eecd40ef41e3dabd7263f48330d35a138092637063c5d5d4cc3936939502df82  rtl8822cs-55971663534233fd8d80363ddcb2fec1c01c473c.tar.gz
+sha256  31985c1180b337bc0e89c73dccc37c86d9bec08e983eabbfa2d5bf464d1a8557  rtl8822cs-f4263fc6ecd11465bf60ce142aa76e2e85e2cbf3.tar.gz
diff --git a/package/rtl8822cs/rtl8822cs.mk b/package/rtl8822cs/rtl8822cs.mk
index 531a07e60d..348b208a19 100644
--- a/package/rtl8822cs/rtl8822cs.mk
+++ b/package/rtl8822cs/rtl8822cs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8822CS_VERSION = 55971663534233fd8d80363ddcb2fec1c01c473c
+RTL8822CS_VERSION = f4263fc6ecd11465bf60ce142aa76e2e85e2cbf3
 RTL8822CS_SITE = $(call github,jethome-iot,rtl88x2cs,$(RTL8822CS_VERSION))
 RTL8822CS_LICENSE = GPL-2.0
 
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
