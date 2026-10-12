Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D998CA9ED5
	for <buildroot@archiver.kernel.org>; Mon, 12 Oct 2026 07:18:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09EC860626;
	Mon, 12 Oct 2026 07:18:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gz_lrNIBDLpC; Mon, 12 Oct 2026 07:18:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 21416605EF
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791789489;
	b=BwEKH1sDssMc3Cgy+rd83nk5Y2Xwg+vaI0N0hUh7QrGMFQKrqRH1qMvuH3skAsQ0QXhv
	 w2rJ2XuP1XyJ4W99/KILHB9o7NGae6FPA1hTbO+0Q1p/IPlXopNnxNbGljqO8AOYKKxP3
	 QdHL/KU2trwtUfNOY9f4WoUim5Koso/TsCYaoruejsiIkV/86DeOYMsWhEEgSY+gBw9/m
	 4oKtvvWAFajy5+bKjSvDcrMdBq2Wrg+JHezBvHIFgAioG5oiTuGUMNpQ18osr3hc1rWW0
	 7r/Aqmnvi21FCwgfxVsCxa1vOyGIoeY80JpIS/C4w1YPaJt72cWAeEp24CrBPecAp9A==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791789489;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:X-Greylist:Received-SPF:Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Feedback-ID:
	 X-Zoho-CM-AccountID:X-ZohoMailClient:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=/IwdnwhC/72vbOmrpTE5RhYO33BCA5CBW7e8LZd1DF8=;
	b=KhB33BobkvazmhWA1ovwD2vqhBRGfWTC/HXGBds89fV878JS3qmr666ntA9xFcaq3X0L
	 xRESY6fAtGnQ/hynwaqGZmcKBSK+RZzwj6Mp51d73w+dxYa8OtYgIZgloO3fx4lXdPuh0
	 vah5Eiepl/wLDOR53Fg9k4MbDk98Qa3bQconcLjKjpW7qGx2sR02/hzXXev5SlH1qIuyc
	 z0rd6BmdqlnB11yXt3HolEeJ8mbXDTG2ddIjKbhdFhee/O03U4l56UceQf1rfNop6zboN
	 n9Rxi/PEPQOp3lvPqSP2ssKzeQ5QFP2QZdYUiRCqUNlzi8SoSKxJUuDpSqKHSxQbomA==
ARC-Authentication-Results: i=3; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791789489;
	bh=/IwdnwhC/72vbOmrpTE5RhYO33BCA5CBW7e8LZd1DF8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=Soe7w23l/TqPoIoMlQJaPEo8I0906h0zF8LKPnQYGcIhLtGCn/VUySSmQRmoEhX4v
	 87T2F50Hkwn5d46qTiMJQ1JMkoe28MdnM5WoC8JaZvVdEWZbQQVXznd0o5Fdtd8HNS
	 yeIidArcHjRMCOvpY4VqtxXkc8RAlPiV4W2P38kvvBfH5NXb6PiSoefl0rgMaTCnPz
	 +LhX6yiTGSqJ6YAzZKCI+UFZArAMH8bYGvk5kt19jwr90R5pMleXHkmGMMv0N/c4rO
	 wsCf0t4E+0Alseg8CZS57xL012eM12S6znVFGLlWR0Ssk+8bGiWXzP0oLZCFWa1eBK
	 aj+dGxgkjaOAg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21416605EF;
	Mon, 12 Oct 2026 07:18:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 358FA9DF
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 07:18:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B82280A58
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 07:18:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X3OQNga60Hnp for <buildroot@buildroot.org>;
 Mon, 12 Oct 2026 07:18:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 13520808D1
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1791789487;
 b=N3WrZxu5EG1tfNxEJWx6ofwG/griXn0yCjVDliuhmV2bb3/2qKIw8gw8b2iSp7OWHsyW
 kpTUop+EmGknfEUC89kgx92rFYn3zYoOqSNxNjZpeKs+PxUQx9ghPwSeCF0jF4C+hEO71
 SBosYduMCPXr25WYU2QUKBHrBvbfJPt8Fnd8iGf34m5cuESkaDAoY2sOmZtTyPG7Z2TLj
 ns6VU020OUJ0cVJUgodTZeb1QSSuGM2EjLagObALaVWMWzLz2ztgIWsDMhlBPFh9TyMtq
 My7D/vVcv2eG8rTBq1L3WKFlZgJMwJ1ycMd1tlQD5EEX40wE8t9s02eM46HBxq1PpUg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791789487;
 h=X-Greylist:Received-SPF:DKIM-Signature:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 Feedback-ID:X-Zoho-CM-AccountID:X-ZohoMailClient;
 bh=sn8maXa6S56zNjBZfvDGhHGsYHajkot3/0cBgu07T/o=;
 b=Zd1rDgn9dhGYoFqihcEQYieD21WMN3R5CZD+lsjp2/QaDbjpxQdU9NDfjikU0/zHXKSj
 pRcTOXeF5uyOqSmMt9+0QwGfA0gDOwv1Pu8Di6vRbP70iy87x0zYQJL4sxraWA3MMK7Lh
 q7uwOpBYKQYiXlHD9s5kJyvR9HQj/1Zftb5VA8QOK9xMFz51IriTnTd5mm4RWBQraRRD7
 8A1xQwL+AkfwWQP1MKl7K8fIv4Vm0WSLorXxcBNALD7RANfC2YicaObMRQTtS6ku6wrRv
 oZ5O/E4cV1XZqfQFgKXOcXJXWJpcAJJauGysttldmicEi6HFFJOdPlYCch5DX3TdgxQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
 dmarc=pass header.from=zohomail.com;
 dkim=pass header.d=zohomail.com header.i=kingxukai@zohomail.com
 header.a=rsa-sha256 header.s=zm2022 header.b=ByhfvOdQ; 
 arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.94
X-Greylist: delayed 2709 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 12 Oct 2026 07:18:07 UTC
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=165.173.182.94;
 helo=sender5-pp-o94.zoho.com; envelope-from=kingxukai@zohomail.com;
 receiver=<UNKNOWN> 
Received: from sender5-pp-o94.zoho.com (sender5-pp-o94.zoho.com
 [165.173.182.94])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 13520808D1
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 07:18:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1791786759; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=IHjnWmQfguG3kitp9xq5Ff6WGecM1MllEsDMcK4eOgBLVyGNFogkXiH16k/5BwnExviIvFP18eeF8ISlhPxL6RiWj2Nl0KWfBL9xjJsros2yZpYYPjU5jhNlKh8tr9HYxmuUWNNP6nqreCCpBgftlFK2JSA+O2tM/wHZCBYmuEg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1791786759;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=sn8maXa6S56zNjBZfvDGhHGsYHajkot3/0cBgu07T/o=; 
 b=VV24NfycUY0W0YhGExIIQeV6h2hVS3upC+VcCE7joubpRxSm2yWn3K8VNgCVHZgqYRfVzxupjLCODW5z7LuI4oa3FsqClDk1GRJVUCIMph8WXkQt9PTc2U0Mxx/UkwoDiXf+BojhezH+ZYq5ALEpiediJLSgnz+gUYJ5NTmHuH0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=zohomail.com;
 spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
 dmarc=pass header.from=<kingxukai@zohomail.com>
Received: by smtp.zohomail.com with SMTPS id 1791786756925959.9025746884531;
 Sun, 11 Oct 2026 23:32:36 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon, 12 Oct 2026 14:31:52 +0800
Message-Id: <20261012063152.153325-1-kingxukai@zohomail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Feedback-ID: zu0801122729f7e9cd96077ab4003ed18900008826f8b1bd0f4bdd0bf89d4a371ccb27e8cb0487f1a9ed5d5a:ZohoMail
X-Zoho-CM-AccountID: 2ee5dd3c83366259b2ba1e9826250ffebed1ef2dd213857d649ad25aba73b429
X-ZohoMailClient: External
Subject: [Buildroot] [PATCH] package/python-gymnasium: bump version to 1.4.0
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
From: Xukai Wang via buildroot <buildroot@buildroot.org>
Reply-To: Xukai Wang <kingxukai@zohomail.com>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Xukai Wang <kingxukai@zohomail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/Farama-Foundation/Gymnasium/releases/tag/v1.4.0

Signed-off-by: Xukai Wang <kingxukai@zohomail.com>
---
 package/python-gymnasium/python-gymnasium.hash | 4 ++--
 package/python-gymnasium/python-gymnasium.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-gymnasium/python-gymnasium.hash b/package/python-gymnasium/python-gymnasium.hash
index 9a3b598346..03734cfe51 100644
--- a/package/python-gymnasium/python-gymnasium.hash
+++ b/package/python-gymnasium/python-gymnasium.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/gymnasium/json
-md5  e401a13a7c39201ec6e55c2dac1f91f2  gymnasium-1.3.0.tar.gz
-sha256  6939e86e835d6b71b6ba6bfd360487420876deafc79bfb7bacba83a7c446bcf3  gymnasium-1.3.0.tar.gz
+md5  39c1de8f59c47ae3a5f062ef708c159f  gymnasium-1.4.0.tar.gz
+sha256  9754f630a32abfdbb76386abe1bc1e706c982db2d62dfa119c9952eb2de7697d  gymnasium-1.4.0.tar.gz
 # Locally computed sha256 checksums
 sha256  7dacaa9772e856aee6943b32ef663d3634d91d72ec7bbc74d136943673f91e18  LICENSE
diff --git a/package/python-gymnasium/python-gymnasium.mk b/package/python-gymnasium/python-gymnasium.mk
index dd5ca59f30..dcff08ed61 100644
--- a/package/python-gymnasium/python-gymnasium.mk
+++ b/package/python-gymnasium/python-gymnasium.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GYMNASIUM_VERSION = 1.3.0
+PYTHON_GYMNASIUM_VERSION = 1.4.0
 PYTHON_GYMNASIUM_SOURCE = gymnasium-$(PYTHON_GYMNASIUM_VERSION).tar.gz
-PYTHON_GYMNASIUM_SITE = https://files.pythonhosted.org/packages/4d/ff/14b6880d703dfaca204490979d3254ccd280c99550798993319902873658
+PYTHON_GYMNASIUM_SITE = https://files.pythonhosted.org/packages/fb/3a/6713c8a92c259fd7619dc93ff19e6e435463f20d3d7b180b14ce99074c10
 PYTHON_GYMNASIUM_SETUP_TYPE = setuptools
 PYTHON_GYMNASIUM_LICENSE = MIT
 PYTHON_GYMNASIUM_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
